package com.example.demo.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MailServiceInter;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService implements MailServiceInter {

    @Autowired
    private JavaMailSender emailSender;

    @Override
    public boolean sendVerificationEmail(String to, String verificationCode) {
        MimeMessage message = emailSender.createMimeMessage();
        try {
        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("wkdwlgjs111@naver.com");
            helper.setTo(to);
            helper.setSubject("Bloom 회원가입 인증코드");

            // Create an HTML message with larger font size
            String htmlContent = "<html><body>"
                    + "<p style=\"font-size: 30px;\">인증코드를 회원가입 창에 입력 후 확인 버튼을 눌러주세요</p>"
                    + "<strong>" + verificationCode + "</strong>"
                    + "</body></html>";

            // Set the HTML content as the email message
            helper.setText(htmlContent, true);

            emailSender.send(message);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public String generateVerificationCode() {
        int codeLength = 6;
        return new Random().ints(0, 10)
                .mapToObj(Integer::toString)
                .limit(codeLength)
                .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
                .toString();
    }
}
