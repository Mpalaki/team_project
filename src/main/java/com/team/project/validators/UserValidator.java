/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.validators;

import com.team.project.model.User;
import com.team.project.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author nikos
 */
@Component
public class UserValidator {

    @Autowired
    UserRepo ur;

    /**
     *
     * @param type
     * @return
     */
    public String validate1(Object o) {
        User u = (User) o;
        String username = u.getUsername();
        String email = u.getEmailAddress();
        if (ur.countUsers(username) > 0) {
            return "username exists";
        } else if (ur.countUsersByEmail(email) > 0) {
            return "email exists";

        } else if (u.getPassword().length() < 5) {
            return "pw short";

        } else if (!u.getPassword().equals(u.getConfirmPassword())) {
            return "pw dont match";

        } else {
            return "success";
        }
    }

}
