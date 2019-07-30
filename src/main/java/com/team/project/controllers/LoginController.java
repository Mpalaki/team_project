/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.controllers;

import com.team.project.email.Feedback;
import com.team.project.email.FeedbackController;
import com.team.project.model.Post;
import com.team.project.model.User;
import com.team.project.repos.PostRepo;
import com.team.project.repos.UserRepo;
import com.team.project.service.PostService;

import static com.team.project.utils.EncryptUtils.*;

import com.team.project.validators.UserValidator;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class LoginController {

    @Autowired
    UserRepo ur;
    @Autowired
    PostRepo pr;
    @Autowired
    PostService ps;
    @Autowired
    UserValidator userValidator;

    @Autowired
    FeedbackController feedbackController;

    @RequestMapping("login")
    public String login(HttpServletRequest request, ModelMap mm) {
        String username = request.getParameter("username");
        String givenpass = request.getParameter("password");
        User u = ur.findByUsername(username);
        if (u == null) {
            String message = "no such username";
            mm.addAttribute("message", message);
            return "registerform";
        } else {
            if (u.getActive() == 1) {
                if (checkPass(givenpass, u.getPassword())) {
                    int iduser = u.getIduser();
                    int role = u.getRole();
                    HttpSession session = request.getSession();
                    session.setAttribute("user", u);
                    session.setAttribute("iduser", iduser);
                    session.setAttribute("username", username);
                    session.setAttribute("role", role);
                    return "redirect:home";
                } else {
                    String message = "incorrect password";
                    mm.addAttribute("message", message);
                    return "registerform";
                }
            } else {
                String message = "activate account";
                mm.addAttribute("message", message);
                return "welcome";
            }
        }
    }

    @RequestMapping("activate")
    public String activateAccount(HttpServletRequest request, ModelMap mm, @RequestParam("serial") String UrlSerial) throws UnsupportedEncodingException {
//        String serial = java.net.URLDecoder.decode(UrlSerial, StandardCharsets.UTF_8.name());
        User u = ur.findUserBySerial(UrlSerial);
        u.setActive(1);
        u.setSerial("alreadyactive");// so that the activate account link is no longer valid
        ur.save(u);
        int iduser = u.getIduser();
        int role = u.getRole();
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
        session.setAttribute("iduser", iduser);
        session.setAttribute("username", u.getUsername());
        session.setAttribute("role", role);
        String message = "active account";
        mm.addAttribute("message", message);
        return "welcome";

    }

    @RequestMapping("logout")
    public String logout(HttpSession session, ModelMap mm) {
        session.removeAttribute("username");
        session.invalidate();
        return "redirect:home";
    }

    @RequestMapping("signup")
    public String redirectToSignupForm() {
        return "registerform";
    }

    @RequestMapping("artists")
    public String reditToSignupForm() {
        return "artists";
    }

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String listPostPages(
            Model model,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);
        Page<Post> postsPage = ps.findPaginated(PageRequest.of(currentPage - 1, pageSize));
        model.addAttribute("postsPage", postsPage);
        int totalPages = postsPage.getTotalPages();
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "welcome";

    }

    @RequestMapping("register")
    public String register(HttpServletRequest request, User user, @RequestParam("username") String givenun, @RequestParam("password") String password,
            @RequestParam("wordpass") String wordpass, @RequestParam("emailAddress") String emailAddress, @RequestParam("photo") MultipartFile image, ModelMap mm) throws IOException, ServletException, MessagingException {
        user.setUsername(givenun);
        user.setPassword(password);
        user.setConfirmPassword(wordpass);
        user.setEmailAddress(emailAddress);
        String validation = userValidator.validate1(user);
        if (!validation.equals("success")) {
            mm.addAttribute("message", validation);
            return "registerform";
        } else {
            String cryptedPw = hashPassword(password);
            user.setPassword(cryptedPw);
            String serial = encrypt(givenun);// stored in DB
            String UrlSerial = java.net.URLEncoder.encode(serial, StandardCharsets.UTF_8.name());// sent to user by email
            user.setSerial(serial);

            if (!image.isEmpty()) {
                String fileName2 = request.getSession().getServletContext().getRealPath("/");// returns url NetBeansProjects\project\target\project-0.0.1-SNAPSHOT
                String saveDirectory = fileName2 + "../../src/main/webapp/resources/avatars/";// goes back to NetBeansProjects\project and the enters src/main...
                String fileName = image.getOriginalFilename();
                String fileUrl = "resources/avatars/" + fileName;
                image.transferTo(new File(saveDirectory + fileName));
                user.setStringAvatar(fileUrl);
            } else {// an den valei avatar na mpainei ena default
                String fileName2 = request.getSession().getServletContext().getRealPath("/");// returns url NetBeansProjects\project\target\project-0.0.1-SNAPSHOT
                String saveDirectory = fileName2 + "../../src/main/webapp/resources/avatars/";// goes back to NetBeansProjects\project and the enters src/main...
                String fileName = "defav.png";
                String fileUrl = "resources/avatars/" + fileName;
                user.setStringAvatar(fileUrl);
            }
            user.setRole(2); // eisagontai oloi os aploi users, oi admins tha prostithentai kateutheian stin vasi
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            user.setSignupDate(date);
            user.setPostsNo(0);
            user.setCommentsNo(0);
            user.setActive(0);

            Feedback feedback = new Feedback(user.getFirstName(), emailAddress, UrlSerial, "Activate your Account");
//            FeedbackController feedbackController = new FeedbackController();
            feedbackController.sendSimpleMessage(feedback);

            ur.save(user);
            String message = "email sent";
            mm.addAttribute("message", message);
            return "welcome";
        }

    }

    @RequestMapping("resetPassword")
    public String changePassword(HttpServletRequest request, User user,
            @RequestParam("emailAddress") String emailAddress, ModelMap mm) throws IOException, ServletException, MessagingException {
        try {
            user = ur.findByEmailAddress(emailAddress);
            String serial = encrypt(user.getUsername());
            String UrlSerial = java.net.URLEncoder.encode(serial, StandardCharsets.UTF_8.name());// sent to user by email
            Feedback feedback = new Feedback(user.getFirstName(), emailAddress, UrlSerial, "Reset Password");
            feedbackController.sendSimpleMessageForResetPassword(feedback);
            user.setSerial(serial);
            ur.save(user);
            String message = "new pass sent";
            mm.addAttribute("message", message);
            return "welcome";
        } catch (NullPointerException e) {
            String message = "invalid email";
            mm.addAttribute("message", message);
            return "registerform";
        }
    }

    @RequestMapping("newPass")
    public String goToForNewPasswordPage(HttpServletRequest request, ModelMap mm, @RequestParam("serial") String UrlSerial){
        User u = ur.findUserBySerial(UrlSerial);
        mm.addAttribute("iduser", u.getIduser());
        return "fornewpass";
    }

    @RequestMapping("savenewpass")
    public String saveNewPassword(ModelMap mm, @RequestParam("iduser") int iduser, @RequestParam("password") String password) {
        User user = ur.findByIduser(iduser);
        user.setPassword(hashPassword(password));
        user.setSerial("alreadyactive");
        ur.save(user);
        String message = "pass changed";
        mm.addAttribute("message", message);
        return "welcome";
    }

    @RequestMapping("search")
    public String searchDb(@RequestParam("search") String searchtext, ModelMap mm) {
        List<User> users = ur.getUsersWhereUsernameLike(searchtext);
        List<Post> searchPosts = pr.getPostsLike(searchtext);
        mm.addAttribute("users", users);
        mm.addAttribute("searchPosts", searchPosts);
        return "welcome";
    }

}
