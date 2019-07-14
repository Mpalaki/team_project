package com.team.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.IOException;

@SpringBootApplication
public class ProjectApplication{

//	@Autowired
////	private JavaMailSender javaMailSender;

	public static void main(String[] args) {
		SpringApplication.run(ProjectApplication.class, args);
	}
//
//	@Override
//	public void run(String... args) {
//
//		System.out.println("Sending Email...");
//
//		try {
//			sendEmail();
//			sendEmailWithAttachment();
//
//		} catch (MessagingException | IOException e) {
//			e.printStackTrace();
//		}
//
//		System.out.println("Done");
//
//	}
//
//	void sendEmail() {
//
//		SimpleMailMessage msg = new SimpleMailMessage();
//		msg.setTo("panos.hd@yahoo.com");
//
//		msg.setSubject("Testing from Spring Boot");
//		msg.setText("Hello World \n Spring Boot Email");
//
//		javaMailSender.send(msg);
//
//	}
//
//	void sendEmailWithAttachment() throws MessagingException, IOException {
//
//		MimeMessage msg = javaMailSender.createMimeMessage();
//		String [] emails = {"gkarfakis@yahoo.com","kermezisn@gmail.com","panos.hd@gmail.com"};
//
//		// true = multipart message
//		MimeMessageHelper helper = new MimeMessageHelper(msg, true);
////		helper.setTo("gkarfakis@yahoo.com");
//		helper.setTo(emails);
//
//		helper.setSubject("Testing from Spring Boot");
//
//		// default = text/plain
//		//helper.setText("Check attachment for image!");
//
//		// true = text/html
//		helper.setText("<h1>Check attachment for image from Calendart Server!</h1>", true);
//
////		FileSystemResource file = new FileSystemResource(new File("./linkedin_profile_image.png"));
//
//		//Resource resource = new ClassPathResource("android.png");
//		//InputStream input = resource.getInputStream();
//
//		//ResourceUtils.getFile("classpath:android.png");
//
//		helper.addAttachment("profile_image.png",new File("./linkedin_profile_image.png"));
//
//		javaMailSender.send(msg);
//
//	}

}
