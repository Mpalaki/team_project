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

    // den douleuei...
    
    @RequestMapping("insertcomment")
    public String insertComment(HttpSession session, ModelMap mm, HttpServletRequest req, Comment comment, @RequestParam("description") String description) {
        Post p = (Post) req.getAttribute("idpost");
        User u = (User) session.getAttribute("user");
//        mm.addAttribute("iduser",iduser);
//        mm.addAttribute("idpost",idpost);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        comment.setDate(date);
        comment.setIdpost(p);
        comment.setIduser(u);
        comment.setKeimeno(description);
        cr.save(comment);
        return "postpage";
    }

}
