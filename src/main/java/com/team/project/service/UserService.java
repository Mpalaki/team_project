/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.service;

import com.team.project.model.User;
import com.team.project.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Makis
 */
public class UserService {

    @Autowired
    UserRepo ur;

    public boolean isPasswordValid(User user, String password) {
        String upass = user.getPassword();
        if (upass.equals(password)) {
            return true;
        } else {
            return false;
        }
    }

    public boolean doesUsernameExist(String username) {
        try {
            User u = ur.findByUsername(username);
            return true;
        } catch (NullPointerException e) {
            return false;
        }
    }

}
