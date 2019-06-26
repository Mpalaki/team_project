/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.Post;
import com.team.project.model.User;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import com.team.project.service.PostService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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
public class LoginController {

    @Autowired
    UserRepo ur;
    @Autowired
    PostRepo pr;
    @Autowired 
    PostService ps;

    @RequestMapping("LoginController")
    public String login(HttpServletRequest request, ModelMap mm) {
        String username = request.getParameter("username");
        String givenpass = request.getParameter("password");
        User u = ur.findByUsernameAndPassword(username, givenpass);
        if (u == null) {
            return "registerform";
        } else {
            int iduser = u.getIduser();
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            session.setAttribute("iduser", iduser);
            session.setAttribute("username", username);
            mm.addAttribute("user", u);
            List<Post> posts = ps.getTenLastsPosts();
            mm.addAttribute("posts", posts);
            return "welcome";
        }
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("username");
        session.invalidate();        
        return "welcome";
    }
    @RequestMapping("SignupController")
    public String redirectToSignupForm() {
        return "registerform";
    }

    @RequestMapping("home")
    public String homePage(ModelMap mm) {
        List<Post> posts = ps.getTenLastsPosts();
        mm.addAttribute("posts", posts);
        return "welcome";
    }

    @RequestMapping("RegisterController")
    public String register(HttpServletRequest request, User user, @RequestParam("username") String givenun, @RequestParam("password") String password,
            @RequestParam("wordpass") String wordpass, @RequestParam("photo") MultipartFile image) throws IOException, ServletException {
        if (ur.countUsers(givenun) > 0) {
            return "registerform";
        } else {
            if (password.equals(wordpass)) {
                byte[] img = image.getBytes();
                user.setAvatar(img);
                user.setRole(2); // eisagontai oloi os aploi users, oi admins tha prostithentai kateutheian stin vasi
                java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
                user.setSignupDate(date);
                ur.save(user);
                return "welcome";
            } else {
                return "registerform";
            }
        }
    }

}
