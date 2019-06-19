/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Post;
import com.team.project.model.User;
import com.team.project.repos.PostRepo;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("insertpost")
    public String register(HttpSession session, Post post) {
        User u = (User) session.getAttribute("user");
        post.setIduser(u);
        pr.save(post);
        return "welcome";
    }
}
