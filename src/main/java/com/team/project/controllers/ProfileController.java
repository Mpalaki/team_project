/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
import com.team.project.repos.UserRepo;
import java.util.Base64;
import java.util.List;
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
public class ProfileController {

    @Autowired
    UserRepo ur;

    @RequestMapping("redirectToProfile")
    public String redirectToProfile(HttpSession session, ModelMap mm) {
        User u = (User) session.getAttribute("user");
        mm.addAttribute("user", u);
        session.setAttribute("user", u);
        session.setAttribute("username", u.getUsername());
        return "profile";
    }
    @RequestMapping("profile")
    public String viewOtherProfile(HttpSession session, ModelMap mm, @RequestParam ("unartist") String unartist) { 
        User artist = ur.findByUsername(unartist);
        byte[] avatar = artist.getAvatar();
        String avat = Base64.getEncoder().encodeToString(avatar);
        artist.setBase64Avatar(avat);
        mm.addAttribute("user", artist);        
        return "profile";
    }

    @RequestMapping("viewArtists")
    public String showArtists(HttpSession session, ModelMap mm) {
        List<User> artists = ur.getUsersWherePostsNoGreaterThanZero();
        for (int i = 0; i < artists.size(); i++) {
            byte imageBytes[] = artists.get(i).getAvatar();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            artists.get(i).setBase64Avatar(base64Image);
        }
//        User u = (User) session.getAttribute("user");
//        session.setAttribute("username", u.getUsername());
        mm.addAttribute("artists", artists);
        return "welcome";
    }

}
