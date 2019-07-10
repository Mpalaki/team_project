/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Pm;
import com.team.project.model.User;
import com.team.project.repos.PmRepo;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Makis
 */
@Controller
public class PmController {
    
    @Autowired
    UserRepo ur;
    @Autowired
    PostRepo pr;
    @Autowired
    PmRepo pmr;

    @RequestMapping(value = "pm", method = RequestMethod.POST)
    public String sendPm(@RequestParam("idsender") int idesender, @RequestParam("idreceiver") int idreceiver,
            @RequestParam("title") String title, @RequestParam("text") String text, ModelMap mm) {
        User sender = ur.findByIduser(idesender);
        User receiver = ur.findByIduser(idreceiver);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        Pm pm = new Pm(date,title,text,receiver,sender);
        pmr.save(pm);
        mm.addAttribute("user", receiver);
        List posts = pr.findByIduser(receiver);
        mm.addAttribute("posts", posts);
        return "profile";
    }

}
