package com.example.demo.mapper;


public interface MailServiceInter {
    boolean sendVerificationEmail(String to, String verificationCode);
    String generateVerificationCode();
}
