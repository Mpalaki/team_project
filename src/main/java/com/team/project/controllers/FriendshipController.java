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
public class FriendshipController {

    @Autowired
    FriendshipRepo fr;
    @Autowired
    FriendshipService fs;
    @Autowired
    UserRepo ur;
    @Autowired
    PostRepo pr;
    @Autowired
    PmRepo pmr;

    @RequestMapping(value = "friendrequest", method = RequestMethod.POST)
    public String sendFriendRequest(@RequestParam("idfriend1") int idfriend1, @RequestParam("idfriend2") int idfriend2, ModelMap mm) {
        FriendshipPK fpk = new FriendshipPK(idfriend1, idfriend2);
        User friend1 = ur.findByIduser(idfriend1);
        User friend2 = ur.findByIduser(idfriend2);
        Friendship friensdhip = new Friendship(fpk, 1, 0, friend1, friend2);
        fr.save(friensdhip);
        mm.addAttribute("user", friend2);
        List posts = pr.findByIduser(friend2);
        List friends = fr.getFriends(friend2);
        List friendRequestedList = fs.usersNotEligibleToSendFriendRequest(friend2); // returns all the ids of the users that are either friends or a friend request is pending with the profile ownwer
        String success = "fr sent";
        mm.addAttribute("success", success);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friendRequestedList", friendRequestedList);
        mm.addAttribute("friends", friends);
        return "profile";
    }

    @RequestMapping(value = "acceptfriendrequest", method = RequestMethod.GET)
    public String acceptFriendRequest(HttpServletRequest req, ModelMap mm) {
        String pw1 = EncryptUtils.decrypt(req.getParameter("idfr1"));
        String pw2 = EncryptUtils.decrypt(req.getParameter("idfr2"));
        int idfriend1 = Integer.parseInt(pw1);
        int idfriend2 = Integer.parseInt(pw2);
        User friend1 = ur.findByIduser(idfriend1);
        User friend2 = ur.findByIduser(idfriend2);
        Friendship friendship = fr.getFriendship(friend1, friend2);
        friendship.setFriend2accepts(1);
        fr.save(friendship);
        mm.addAttribute("user", friend2);
        List posts = pr.findByIduser(friend2); 
        List pms = pmr.getCommentsByIdreceiver(friend2);
        List frs = fr.getAllFriendRequests(friend2);
        List friends = fr.getFriends(friend2);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping(value = "declinefriendrequest", method = RequestMethod.GET)
    public String declineFriendRequest(HttpServletRequest req, ModelMap mm) {
        String pw1 = EncryptUtils.decrypt(req.getParameter("idfr1"));
        String pw2 = EncryptUtils.decrypt(req.getParameter("idfr2"));
        int idfriend1 = Integer.parseInt(pw1);
        int idfriend2 = Integer.parseInt(pw2);
        User friend1 = ur.findByIduser(idfriend1);
        User friend2 = ur.findByIduser(idfriend2);
        Friendship friendship = fr.getFriendship(friend1, friend2);
        fr.delete(friendship);
        mm.addAttribute("user", friend2);
        List posts = pr.findByIduser(friend2);
        List pms = pmr.getCommentsByIdreceiver(friend2);
        List frs = fr.getAllFriendRequests(friend2);
        List friends = fr.getFriends(friend2);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);
        return "profile";
    }

    @RequestMapping(value = "deletefriend", method = RequestMethod.GET)
    public String deleteFriend(HttpServletRequest req, ModelMap mm) {
        String deleterpw = EncryptUtils.decrypt(req.getParameter("deleter"));
        String deletedpw = EncryptUtils.decrypt(req.getParameter("deleted"));
        int iddeleter = Integer.parseInt(deleterpw);
        int iddeleted = Integer.parseInt(deletedpw);
        User deleter = ur.findByIduser(iddeleter);
        User deleted = ur.findByIduser(iddeleted);
        Friendship friendship = fr.getFriendship2(deleter, deleted);
        fr.delete(friendship);
        List posts = pr.findByIduser(deleter);
        List pms = pmr.getCommentsByIdreceiver(deleter);
        List frs = fr.getAllFriendRequests(deleter);
        List friends = fr.getFriends(deleter);
        String success = "fr deleted";
        mm.addAttribute("success", success);
        mm.addAttribute("posts", posts);
        mm.addAttribute("friends", friends);
        mm.addAttribute("friendrequests", frs);
        mm.addAttribute("pms", pms);

        return "profile";
    }

}
