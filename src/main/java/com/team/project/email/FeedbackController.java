package com.team.project.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class FeedbackController {

    @Autowired
    public JavaMailSender emailSender;

    public void sendSimpleMessage(Feedback feedback) throws MessagingException {
        MimeMessage mailMessage = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);
        helper.setSubject(feedback.getFeedback());
        helper.setTo(feedback.getEmail());
        helper.setText("Hey " + feedback.getName() + ". Click the link bellow to activate your account on Calendart!\n"
                + ""
                + "Calendart is A website dedicated to artists and art lovers\n"
                + "                Post in Calendart and exhibit your artwork\n"
                + "http://localhost:8080/project/activate?serial=" + feedback.getSerial());
        // Send mail

        emailSender.send(mailMessage);
    }

    public void sendSimpleMessageForResetPassword(Feedback feedback) throws MessagingException {
        MimeMessage mailMessage = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);
        helper.setSubject(feedback.getFeedback());
        helper.setTo(feedback.getEmail());
        helper.setText("Hey " + feedback.getName() + ". Click the link bellow to reset your password!\n"
                + ""
                + "Calendart is A website dedicated to artists and art lovers\n"
                + "                Post in Calendart and exhibit your artwork\n"
                + "http://localhost:8080/project/newPass?serial=" + feedback.getSerial());
        // Send mail

        emailSender.send(mailMessage);
    }
}
