/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Comment;
import com.team.project.model.Likes;
import com.team.project.model.Post;
import com.team.project.model.User;
import com.team.project.repos.CommentRepo;
import com.team.project.repos.LikeRepo;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
public class CommentController {

    @Autowired
    CommentRepo cr;
    
    @Autowired
    PostRepo pr;
    
    @Autowired
    UserRepo ur;
    @Autowired
    LikeRepo lr;
    
    
    
    @RequestMapping("insertcomment")
    public String insertComment(ModelMap mm, HttpServletRequest req, Comment comment, @RequestParam("description") 
            String description, @RequestParam("idpost") int idpost) {
        HttpSession session = req.getSession();
        Post post = pr.getPostByIdpost(idpost);
        User user = (User) session.getAttribute("user");
//        mm.addAttribute("iduser",iduser);
//        mm.addAttribute("idpost",idpost);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        comment.setDate(date);
        comment.setIdpost(post);
        comment.setIduser(user);
        comment.setKeimeno(description);
        cr.save(comment);
         long likes = lr.countLikes(post);
        List<Comment> comments = cr.getCommentsByIdpost(post);
        List<User> likers = lr.usersThatHaveLikedThePost(post);
        mm.addAttribute("post",post);
        mm.addAttribute("likers",likers);
        mm.addAttribute("likes",likes);
        mm.addAttribute("comments",comments);
        return "redirect:viewPost";
    }
    @RequestMapping("like")
    public String likePost(ModelMap mm, HttpServletRequest req, Likes like, @RequestParam("idpost") int idpost) {
        HttpSession session = req.getSession();
        Post post = pr.getPostByIdpost(idpost);
        User user = (User) session.getAttribute("user");
        like.setIdpost(post);
        like.setIduser(user);
        lr.save(like);
        long likes = lr.countLikes(post);
        List<Comment> comments = cr.getCommentsByIdpost(post);
        List<User> likers = lr.usersThatHaveLikedThePost(post);
        mm.addAttribute("post",post);
        mm.addAttribute("likers",likers);
        mm.addAttribute("likes",likes);
        mm.addAttribute("comments",comments);
        return "postpage";
    }
    
    @RequestMapping("unlike")
    public String unlikePost(ModelMap mm, HttpServletRequest req, @RequestParam("idpost") int idpost) {
        HttpSession session = req.getSession();
        Post post = pr.getPostByIdpost(idpost);
        User user = (User) session.getAttribute("user");
        Likes like = lr.findByIduserAndIdpost(user, post);
        lr.delete(like);
        long likes = lr.countLikes(post);
        List<Comment> comments = cr.getCommentsByIdpost(post);
        List<User> likers = lr.usersThatHaveLikedThePost(post);
        mm.addAttribute("post",post);
        mm.addAttribute("likers",likers);
        mm.addAttribute("likes",likes);
        mm.addAttribute("comments",comments);
        return "postpage";
    }

}
