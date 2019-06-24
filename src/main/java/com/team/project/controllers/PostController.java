/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Post;
import com.team.project.model.User;
import com.team.project.repos.PostRepo;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
        mm.addAttribute("username",username);
        session.setAttribute("user", u);
        session.setAttribute("username", username);
        pr.save(post);
        return "welcome";
    }

    @RequestMapping("getLastPosts")
    public String getLastPosts(ModelMap mm) {
        List<Post> posts = pr.getLastPosts();
        mm.addAttribute("posts", posts);

        return "welcome";
    }
    @RequestMapping("/")
    public String index(ModelMap mm) {
        List<Post> posts = pr.getLastPosts();
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
        return "postpage";
    }

}
