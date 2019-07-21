/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
import com.team.project.repos.FriendshipRepo;
import com.team.project.repos.PmRepo;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import com.team.project.service.FriendshipService;
import com.team.project.utils.EncryptUtils;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    PmRepo pmr;
    @Autowired
    FriendshipRepo fr;
    @Autowired
    FriendshipService fs;

    // TODO: pairnei ton user ap to session opote an kanei update photo den fainetai sto profile an den kanei logout kai login pali
    @RequestMapping("myProfile")
    public String redirectToProfile(HttpSession session, ModelMap mm) {
        User user = (User) session.getAttribute("user");
        // Mpaloma
        User u = ur.findByIduser(user.getIduser());
        mm.addAttribute("user", u);
        mm.addAttribute("user", u);
        List posts = pr.findByIduser(u);
        List pms = pmr.getCommentsByIdreceiver(user);
        List frs = fr.getAllFriendRequests(user);
        List friends = fr.getFriends(user);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping("profile")
    public String viewOtherProfile(HttpSession session, ModelMap mm, @RequestParam("unartist") String unartist) {
//        User onlineUser = (User) session.getAttribute("user");
        User artist = ur.findByUsername(unartist);
        mm.addAttribute("user", artist);
        List posts = pr.findByIduser(artist);
        List pms = pmr.getCommentsByIdreceiver(artist);
        List frs = fr.getAllFriendRequests(artist);
        List friends = fr.getFriends(artist);
        List friendRequestedList = fs.usersNotEligibleToSendFriendRequest(artist); // returns all the ids of the users that are either friends or a friend request is pending with the profile ownwer
        mm.addAttribute("posts", posts);
        mm.addAttribute("friendRequestedList", friendRequestedList);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping("viewArtists")
    public String showArtists(HttpSession session, ModelMap mm) {
        List<User> artists = ur.getUsersWherePostsNoGreaterThanZero();
        mm.addAttribute("artists", artists);
        return "artists";
    }

    @RequestMapping(value = "updatephoto", method = RequestMethod.POST)
    public String updateAvatar(HttpServletRequest request, ModelMap mm, @RequestParam("iduser") int iduser, @RequestParam("avatar") MultipartFile avatar) throws IOException {
        User user = ur.findByIduser(iduser);
        String fileName2 = request.getSession().getServletContext().getRealPath("/");// returns url NetBeansProjects\project\target\project-0.0.1-SNAPSHOT
        String saveDirectory = fileName2 + "../../src/main/webapp/resources/avatars/";// goes back to NetBeansProjects\project and the enters src/main...
        String fileName = avatar.getOriginalFilename();
        String fileUrl = "resources/avatars/" + fileName;
        avatar.transferTo(new File(saveDirectory + fileName));
        user.setStringAvatar(fileUrl);

        ur.save(user);
        mm.addAttribute("user", user);
        List posts = pr.findByIduser(user);
        List pms = pmr.getCommentsByIdreceiver(user);
        List frs = fr.getAllFriendRequests(user);
        List friends = fr.getFriends(user);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping(value = "updateprofile", method = RequestMethod.POST)
    public String updateProfile(ModelMap mm, HttpSession session, @RequestParam("firstName") String firstname,
            @RequestParam("lastName") String lastname, @RequestParam("email") String email,
            @RequestParam("facebook") String facebook, @RequestParam("instagram") String instagram, @RequestParam("twitter") String twitter,
            @RequestParam("aboutme") String aboutme) {
        User u = (User) session.getAttribute("user");
        // Mpaloma
        User user = ur.findByIduser(u.getIduser());
        user.setAboutme(aboutme);
        user.setEmail(email);
        user.setFacebook(facebook);
        user.setInstagram(instagram);
        user.setTwitter(twitter);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        ur.save(user);
        mm.addAttribute("user", user);
        List posts = pr.findByIduser(user);
        List pms = pmr.getCommentsByIdreceiver(user);
        List frs = fr.getAllFriendRequests(user);
        List friends = fr.getFriends(user);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping(value = "deleteme", method = RequestMethod.GET)
    public String deleteUser(HttpServletRequest req, ModelMap mm) {
        String pw = EncryptUtils.decrypt(req.getParameter("iduser"));
        int iduser = Integer.parseInt(pw);
        User angryUser = ur.findByIduser(iduser);
        ur.delete(angryUser);
        return "welcome";
    }

    @RequestMapping(value = "setAsAdmin", method = RequestMethod.GET)
    public String setAsAdmin(HttpServletRequest req, ModelMap mm) {
        String pw = EncryptUtils.decrypt(req.getParameter("iduser"));
        int iduser = Integer.parseInt(pw);
        User newAdmin = ur.findByIduser(iduser);
        newAdmin.setRole(1);
        ur.save(newAdmin);
        return "welcome";
    }

}
