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
import com.team.project.repos.PostRepo;
import com.team.project.service.PostService;
import com.team.project.utils.EncryptUtils;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

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
        byte[] img = image.getBytes();
        post.setPhoto(img);
        post.setIduser(u);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        post.setDate(date);
        mm.addAttribute(post);
        mm.addAttribute("username", username);
        session.setAttribute("user", u);
        session.setAttribute("username", username);
        pr.save(post);
        return "welcome";
    }

    @RequestMapping("getLastPosts")
    public String getLastPosts(ModelMap mm) {
        List<Post> posts = ps.getTenLastsPosts();
        for (int i = 0; i < posts.size(); i++) {
            byte imageBytes[] = posts.get(i).getPhoto();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            posts.get(i).setBase64Photo(base64Image);
        }
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("2")
    public String get11to20Posts(ModelMap mm) {
        List<Post> posts = ps.get11to20Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("3")
    public String get21to30Posts(ModelMap mm) {
        List<Post> posts = ps.get21to30Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("4")
    public String get31to40Posts(ModelMap mm) {
        List<Post> posts = ps.get31to40Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("5")
    public String get41to50Posts(ModelMap mm) {
        List<Post> posts = ps.get41to50Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("6")
    public String get51to60Posts(ModelMap mm) {
        List<Post> posts = ps.get51to60Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("7")
    public String get61to70Posts(ModelMap mm) {
        List<Post> posts = ps.get61to70Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("8")
    public String get71to80Posts(ModelMap mm) {
        List<Post> posts = ps.get71to80Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("9")
    public String get81to90Posts(ModelMap mm) {
        List<Post> posts = ps.get81to90Posts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }

    @RequestMapping("/")
    public String index(ModelMap mm) {
        List<Post> posts = ps.getTenLastsPosts();
        mm.addAttribute("posts", posts);

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
        mm.addAttribute("comments", comments);
        return "postpage";
    }

    @RequestMapping(value = "deletepost", method = RequestMethod.GET)
    public String deletePost(HttpServletRequest req, ModelMap mm) {
        String pw = EncryptUtils.decrypt(req.getParameter("idpost"));
        int idpost = Integer.parseInt(pw);
        Post p = pr.getPostByIdpost(idpost);
        pr.delete(p);
        List<Post> posts = ps.getTenLastsPosts();
        mm.addAttribute("posts", posts);
        return "welcome";
    }

    @RequestMapping(value = "editpost", method = RequestMethod.GET)
    public String editPost(HttpServletRequest req, ModelMap mm) {
        String pw = EncryptUtils.decrypt(req.getParameter("idpost"));
        int idpost = Integer.parseInt(pw);
        Post p = pr.getPostByIdpost(idpost);
        mm.addAttribute("post", p);
        return "editpostform";
    }

    @RequestMapping(value = "updatepost", method = RequestMethod.POST)
    public String updatePost(HttpServletRequest request, Post post, @RequestParam("idpost") int idpost, ModelMap mm, @RequestParam("photo1") MultipartFile image) throws IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String username = u.getUsername();
        byte[] img = image.getBytes();
        post.setPhoto(img);
        post.setIduser(u);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        post.setDate(date);
        post.setIdpost(idpost);
        mm.addAttribute(post);
        mm.addAttribute("username", username);
        session.setAttribute("user", u);
        session.setAttribute("username", username);
        pr.save(post);
        List<Post> posts = ps.getTenLastsPosts();
        mm.addAttribute("posts", posts);
        return "welcome";
    }

}
