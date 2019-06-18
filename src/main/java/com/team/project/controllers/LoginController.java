/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.model.User;
import com.team.project.repos.UserRepo;
import com.team.project.service.UserService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
        try {
            User user = ur.findByUsername(username);
            String givenpass = request.getParameter("password");
            UserService us = new UserService(); // check if there is any other way to avoid creating new
            if (us.isPasswordValid(user, givenpass)) {
                return "welcome";
            } else {
                return "test";
            }
        } catch (NullPointerException e) {
            return "null";
        }
    }
    @RequestMapping("SignupController")
    public String register(HttpServletRequest request) {
        String username = request.getParameter("username");
        try {
            User user = ur.findByUsername(username);
            String givenpass = request.getParameter("password");
            UserService us = new UserService(); // check if there is any other way to avoid creating new
            if (us.isPasswordValid(user, givenpass)) {
                return "welcome";
            } else {
                return "test";
            }
        } catch (NullPointerException e) {
            return "null";
        }
    }

}
