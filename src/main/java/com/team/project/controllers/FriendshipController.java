/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Friendship;
import com.team.project.model.FriendshipPK;
import com.team.project.model.User;
import com.team.project.repos.FriendshipRepo;
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
public class FriendshipController {

    @Autowired
    FriendshipRepo fr;
    @Autowired
    UserRepo ur;
    @Autowired
    PostRepo pr;

    @RequestMapping(value = "friendrequest", method = RequestMethod.POST)
    public String sendFriendRequest(@RequestParam("idfriend1") int idfriend1, @RequestParam("idfriend2") int idfriend2, ModelMap mm) {
        FriendshipPK fpk = new FriendshipPK(idfriend1, idfriend2);
        User friend1 = ur.findByIduser(idfriend1);
        User friend2 = ur.findByIduser(idfriend2);
        Friendship friensdhip = new Friendship(fpk,1, 0, friend1, friend2);
        fr.save(friensdhip);
        mm.addAttribute("user", friend2);
        List posts = pr.findByIduser(friend2);
        mm.addAttribute("posts", posts);
        return "profile";
    }

}
