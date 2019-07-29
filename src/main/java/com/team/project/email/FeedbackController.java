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
        helper.setText("<h1>Hey "+feedback.getName()+" Click the link bellow to activate your account on Calendart!</h1>" +
                "<br>" +
                "<h3>Calendart is A website dedicated to artists and art lovers<br>\n" +
                "                Post in Calendart and exhibit your artwork</h3>\n" +
                "http://localhost:8080/project/activate?serial="+feedback.getSerial());
        // Send mail
        
        emailSender.send(mailMessage);
    }
}