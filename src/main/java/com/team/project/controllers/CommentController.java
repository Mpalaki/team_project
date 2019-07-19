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
import com.team.project.repos.UserRepo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Makis
 */
@Controller
public class CommentController {

    @Autowired
    CommentRepo cr;
    
    @Autowired
    PostRepo pr;
    
    @Autowired
    UserRepo ur;
    
    
    
    @RequestMapping("insertcomment")
    public String insertComment(ModelMap mm, HttpServletRequest req, Comment comment, @RequestParam("description") 
            String description, @RequestParam("idpost") int idpost) {
        HttpSession session = req.getSession();
        Post post = pr.getPostByIdpost(idpost);
        User user = (User) session.getAttribute("user");
//        mm.addAttribute("iduser",iduser);
//        mm.addAttribute("idpost",idpost);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        comment.setDate(date);
        comment.setIdpost(post);
        comment.setIduser(user);
        comment.setKeimeno(description);
        cr.save(comment);
        List<Comment> comments = cr.getCommentsByIdpost(post);
        post = pr.getPostByIdpost(idpost);
        mm.addAttribute("post",post);
        mm.addAttribute("comments",comments);
        return "postpage";
    }

//    @RequestMapping("insertpost")
//    public String addPost(HttpServletRequest request, Post post, ModelMap mm, @RequestParam("photo1") MultipartFile image) throws IOException {
//        HttpSession session = request.getSession();
//        User u = (User) session.getAttribute("user");
//        String username = u.getUsername();
//        byte[] img = image.getBytes();
//        post.setPhoto(img);
//        post.setIduser(u);
//        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
//        post.setDate(date);
//        mm.addAttribute(post);
//        mm.addAttribute("username", username);
//        session.setAttribute("user", u);
//        session.setAttribute("username", username);
//        pr.save(post);
//        return "welcome";
//    }
}
