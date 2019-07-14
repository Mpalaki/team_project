/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Pm;
import com.team.project.model.User;
import com.team.project.repos.FriendshipRepo;
import com.team.project.repos.PmRepo;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import com.team.project.service.FriendshipService;
import com.team.project.utils.EncryptUtils;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    FriendshipRepo fr;
    @Autowired
    FriendshipService fs;

    @RequestMapping(value = "pm", method = RequestMethod.POST)
    public String sendPm(@RequestParam("idsender") User idsender, @RequestParam("idreceiver") User idreceiver,
            @RequestParam("title") String title, @RequestParam("text") String text, ModelMap mm) {
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        Pm pm = new Pm(date, title, text, idreceiver, idsender);
        pmr.save(pm);
        mm.addAttribute("user", idreceiver);
        List posts = pr.findByIduser(idreceiver);
        List pms = pmr.getCommentsByIdreceiver(idreceiver);
        List friends = fr.getFriends(idreceiver);
        List friendRequestedList = fs.usersNotEligibleToSendFriendRequest(idreceiver); // returns all the ids of the users that are either friends or a friend request is pending with the profile ownwer
        mm.addAttribute("posts", posts);
        mm.addAttribute("friendRequestedList", friendRequestedList);
        mm.addAttribute("friends", friends);
        mm.addAttribute("pms", pms);
        return "profile";
    }
    @RequestMapping(value = "reply", method = RequestMethod.POST)
    public String replyToPm(@RequestParam("idsender") User idsender, @RequestParam("idreceiver") User idreceiver,
            @RequestParam("title") String title, @RequestParam("text") String text, ModelMap mm) {
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        Pm pm = new Pm(date, title, text, idreceiver, idsender);
        pmr.save(pm);
        mm.addAttribute("user", idsender);
        List posts = pr.findByIduser(idsender);
        List pms = pmr.getCommentsByIdreceiver(idsender);
        mm.addAttribute("posts", posts);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping(value = "deletepm", method = RequestMethod.GET)
    public String deletePost(HttpServletRequest req, @RequestParam("idreceiver") int idreceiver, ModelMap mm) {
        User receiver = ur.findByIduser(idreceiver);
        String pw = EncryptUtils.decrypt(req.getParameter("idpm"));
        int idpm = Integer.parseInt(pw);
        Pm pm = pmr.findByIdpm(idpm);
        pmr.delete(pm);
        mm.addAttribute("user", receiver);
        List posts = pr.findByIduser(receiver);
        List pms = pmr.getCommentsByIdreceiver(receiver);
        List frs = fr.getAllFriendRequests(receiver);
        List friends = fr.getFriends(receiver);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

}
