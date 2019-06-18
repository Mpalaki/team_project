/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
import com.team.project.repos.UserRepo;
import com.team.project.service.UserService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public String test(HttpServletRequest request) {
        String username = request.getParameter("username");
        String givenpass = request.getParameter("password");
        List<User> l = ur.findByUsernameAndPassword(username, givenpass);
        if (l.isEmpty()) {
//                HttpSession session = request.getSession();
//                session.setAttribute("username", username);
            return "test";
        } else {
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
                user.setRole(2);
                ur.save(user);
                return "welcome";
            } else {
                return "test";
            }
        }
    }

}
