/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Makis
 */
@Controller
public class ProfileController {

    @Autowired
    UserRepo ur;
    @Autowired
    PostRepo pr;

    
    // TODO: pairnei ton user ap to session opote an kanei update photo den fainetai sto profile an den kanei logout kai login pali
    @RequestMapping("redirectToProfile")
    public String redirectToProfile(HttpSession session, ModelMap mm) {
        User user = (User) session.getAttribute("user");
        // Mpaloma
        User u = ur.findByIduser(user.getIduser());
        mm.addAttribute("user", u);
        byte[] avatar = u.getAvatar();
        String avat = Base64.getEncoder().encodeToString(avatar);
        u.setBase64Avatar(avat);
        mm.addAttribute("user", u);
        List posts = pr.findByIduser(u);
        mm.addAttribute("posts", posts);
        return "profile";
    }

    @RequestMapping("profile")
    public String viewOtherProfile(HttpSession session, ModelMap mm, @RequestParam("unartist") String unartist) {
//        User onlineUser = (User) session.getAttribute("user");
        User artist = ur.findByUsername(unartist);
        byte[] avatar = artist.getAvatar();
        String avat = Base64.getEncoder().encodeToString(avatar);
        artist.setBase64Avatar(avat);
        mm.addAttribute("user", artist);
        List posts = pr.findByIduser(artist);
        mm.addAttribute("posts", posts);
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

    @RequestMapping(value = "updatephoto", method = RequestMethod.POST)
    public String updateAvatar(ModelMap mm, @RequestParam("iduser") int iduser, @RequestParam("avatar") MultipartFile avatar ) throws IOException {
        User user = ur.findByIduser(iduser);
        byte [] image = avatar.getBytes();
        user.setAvatar(image);
        ur.save(user);
        mm.addAttribute("user", user);
        List posts = pr.findByIduser(user);
        mm.addAttribute("posts", posts);
        return "profile";
    }

}
