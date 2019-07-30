/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;
import com.team.project.model.Comment;
import com.team.project.model.Post;
import com.team.project.model.User;
import com.team.project.repos.CommentRepo;
import com.team.project.repos.LikeRepo;
import com.team.project.repos.PostRepo;
import com.team.project.service.PostService;
import com.team.project.utils.EncryptUtils;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
/**
 *
 * @author Makis
 */
@Controller
public class PostController {
    @Autowired
    PostRepo pr;
    @Autowired
    PostService ps;
    @Autowired
    CommentRepo cr;
    @Autowired
    LikeRepo lr;
    @RequestMapping("addpost")
    public String redirectToInsertPostForm(HttpSession session, ModelMap mm) {
        mm.addAttribute("session", session);
        return "postform";
    }
///////////// EHO VALEI TRIGGERS STIN VASI AFTER INSERT KAI DELETE NA THYMITHO NA TOUS ELEGKSO. EHO TSEKAREI MONO GIA AFTER INSERT POST//////////////
    @RequestMapping("insertpost")
    public String addPost(HttpServletRequest request, Post post, ModelMap mm, @RequestParam("photo1") MultipartFile image) throws IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String username = u.getUsername();
//        byte[] img = image.getBytes();
//        post.setPhoto(img);
        String fileName2 = request.getSession().getServletContext().getRealPath("/");// returns url NetBeansProjects\project\target\project-0.0.1-SNAPSHOT
        String saveDirectory = fileName2 + "../../src/main/webapp/resources/posts/";// goes back to NetBeansProjects\project and the enters src/main...
        String fileName = image.getOriginalFilename();
        String fileUrl = "resources/posts/" + fileName;
        image.transferTo(new File(saveDirectory + fileName));
        post.setUrlImage(fileUrl);
        post.setIduser(u);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        post.setDate(date);
        pr.save(post);
        return "redirect:/";
    }
    @RequestMapping("getLastPosts")
    public String getLastPosts(ModelMap mm) {        
        return "redirect:/";
    }
    @RequestMapping("/")
    public String listPostPages(
            Model model,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(6);
        Page<Post> postsPage = ps.findPaginated(PageRequest.of(currentPage - 1, pageSize));
        model.addAttribute("postsPage", postsPage);
        int totalPages = postsPage.getTotalPages();
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "welcome";
    }
// TODO: below i bring from jsp only the idpost and inside the method i create the post and then pass it to other jsp.
// should check if there is a way to pass str8 the post from first jsp...(with session it didnt work)
    @RequestMapping("viewPost")
    public String viewPost(HttpServletRequest req, ModelMap mm) {
        int idpost = Integer.parseInt(req.getParameter("idpost"));
        Post post = pr.getPostByIdpost(idpost);
        mm.addAttribute("post", post);
        List<Comment> comments = cr.getCommentsByIdpost(post);
        long likes = lr.countLikes(post);
        List<User> likers = lr.usersThatHaveLikedThePost(post);
        mm.addAttribute("post",post);
        mm.addAttribute("likers",likers);
        mm.addAttribute("likes",likes);
        mm.addAttribute("comments", comments);
        return "postpage";
    }
    @RequestMapping(value = "deletepost", method = RequestMethod.GET)
    public String deletePost(HttpServletRequest req, ModelMap mm) {
        String pw = EncryptUtils.decrypt(req.getParameter("idpost"));
        int idpost = Integer.parseInt(pw);
        Post p = pr.getPostByIdpost(idpost);
        pr.delete(p);
        return "redirect:/";
    }
    @RequestMapping(value = "editpost", method = RequestMethod.GET)
    public String editPost(HttpServletRequest req, ModelMap mm) {
        String pw = EncryptUtils.decrypt(req.getParameter("idpost"));
        int idpost = Integer.parseInt(pw);
        Post p = pr.getPostByIdpost(idpost);
        mm.addAttribute("post", p);
        return "editpostform";
    }
    @RequestMapping(value = "updatepost")
    public String updatePost(HttpServletRequest request, @RequestParam("idpost") int idpost,
            @RequestParam("description") String description,
            @RequestParam("title") String title, ModelMap mm,
            @RequestParam("photo1") MultipartFile image) throws IOException {
        Post post = pr.getPostByIdpost(idpost);
        Date initialdate = post.getDate();
//        byte[] img = image.getBytes();
//        post.setPhoto(img);
        String fileName2 = request.getSession().getServletContext().getRealPath("/");// returns url NetBeansProjects\project\target\project-0.0.1-SNAPSHOT
        String saveDirectory = fileName2 + "../../src/main/webapp/resources/posts/";// goes back to NetBeansProjects\project and the enters src/main...
        String fileName = image.getOriginalFilename();
        String fileUrl = "resources/posts/" + fileName;
        image.transferTo(new File(saveDirectory + fileName));
        post.setUrlImage(fileUrl);
        java.sql.Timestamp editdate = new java.sql.Timestamp(new java.util.Date().getTime());
        post.setDate(initialdate);
        post.setEditdate(editdate);
        post.setIdpost(idpost);
        post.setDescription(description);
        post.setTitle(title);
        pr.save(post);
        return "redirect:/";
    }
}