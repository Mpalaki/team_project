/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
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
public class LoginController {

    @Autowired
    UserRepo ur;

    @RequestMapping("LoginController")
    public String login(HttpServletRequest request, ModelMap mm) {
        String username = request.getParameter("username");
        String givenpass = request.getParameter("password");
        User u = ur.findByUsernameAndPassword(username, givenpass);
        if (u == null) {
            return "test";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            mm.addAttribute("user", u);
            return "welcome";
        }
    }

    @RequestMapping("SignupController")
    public String redirectToSignupForm() {
        return "test";
    }

    @RequestMapping("RegisterController")
    public String register(User user, @RequestParam("username") String givenun, @RequestParam("wordpass") String wordpass) {
        if (ur.countUsers(givenun) > 0) {
            return "test";
        } else {
            if (givenun.equals(wordpass)) {
                user.setRole(2); // eisagontai oloi os aploi users, oi admins tha prostithentai kateutheian stin vasi
                ur.save(user);
                return "welcome";
            } else {
                return "test";
            }
        }
    }

}
