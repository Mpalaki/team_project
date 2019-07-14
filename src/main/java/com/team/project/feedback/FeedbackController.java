package com.team.project.feedback;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.validation.ValidationException;
import java.io.File;

@RestController
@RequestMapping("/feedback")
public class FeedbackController {
    @Autowired
    JavaMailSender mailSender;

    private EmailCfg emailCfg;

    public FeedbackController(EmailCfg emailCfg) {
        this.emailCfg = emailCfg;
    }

    @PostMapping
    public void sendFeedback(@RequestBody Feedback feedback,
                             BindingResult bindingResult) throws MessagingException {
        if(bindingResult.hasErrors()){
            throw new ValidationException("Feedback is not valid");
        }

        // Create a mail sender
//        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//        mailSender.setHost(this.emailCfg.getHost());
//        mailSender.setPort(this.emailCfg.getPort());
//        mailSender.setUsername(this.emailCfg.getUsername());
//        mailSender.setPassword(this.emailCfg.getPassword());
////        mailSender.setDefaultEncoding("utf8");
////        mailSender.getJavaMailProperties();

        // Create an email instance
//        SimpleMailMessage mailMessage = new SimpleMailMessage();
////        mailMessage.setFrom(this.emailCfg.getUsername());
//        mailMessage.setTo(feedback.getEmail());
//        mailMessage.setSubject("New feedback from " + feedback.getName());
//        mailMessage.setText(feedback.getFeedback());
        MimeMessage mailMessage = mailSender.createMimeMessage();
        String [] emails = {"gkarfakis@yahoo.com","kermezisn@gmail.com","panos.hd@gmail.com"};

        // true = multipart message
        MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);
//		helper.setTo("gkarfakis@yahoo.com");
//        helper.setTo(emails);
        helper.setTo(feedback.getEmail());

        helper.setSubject(feedback.getFeedback());

        // default = text/plain
        //helper.setText("Check attachment for image!");

        // true = text/html
        helper.setText("<h1>Hey "+feedback.getName()+" Check attachment for image from Calendart Server!</h1>" +
                "<br>" +
                "<h3>Calendart is A website dedicated to artists and art lovers<br>\n" +
                "                Post in Calendart and exhibit your artwork</h3>", true);

//		FileSystemResource file = new FileSystemResource(new File("./linkedin_profile_image.png"));

        //Resource resource = new ClassPathResource("android.png");
        //InputStream input = resource.getInputStream();

        //ResourceUtils.getFile("classpath:android.png");

        helper.addAttachment("profile_image.png",new File("./linkedin_profile_image.png"));

//        javaMailSender.send(msg);
        // Send mail
        mailSender.send(mailMessage);
    }
}
