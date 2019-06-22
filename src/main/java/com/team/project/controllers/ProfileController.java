/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
import com.team.project.repos.UserRepo;
import java.util.List;
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
public class ProfileController {

    @Autowired
    UserRepo ur;

    @RequestMapping("redirectToProfile")
    public String redirectToProfile(HttpSession session, ModelMap mm) {
        User u = (User) session.getAttribute("user");
        mm.addAttribute("user", u);
        return "profile";
    }

    @RequestMapping("viewArtists")
    public String showArtists(ModelMap mm) {
        List<User> artists = ur.getUsersWherePostsNoGreaterThanZero();
        mm.addAttribute("artists", artists);
        return "welcome";
    }

}
