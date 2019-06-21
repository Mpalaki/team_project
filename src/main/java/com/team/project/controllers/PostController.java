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
    public String register(HttpSession session, Post post, ModelMap mm, @RequestParam("photo1") MultipartFile image) throws IOException {
        User u = (User) session.getAttribute("user");
        byte[] img = image.getBytes();
        post.setPhoto(img);
        post.setIduser(u);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        post.setDate(date);
        mm.addAttribute(post);
        pr.save(post);
        return "welcome";
    }
}
