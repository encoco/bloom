package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; // 이 부분 추가
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody; // 이 부분 추가

import com.example.demo.service.EmailService;

@Controller // 이 부분을 @Controller로 변경
@RequestMapping(value = "/api/mail")
public class MailServiceRestController {

    @Autowired
    private EmailService emailService;

    @RequestMapping("/emailVerification")
    public String showVerificationPage() {
        return "emailVerification";
    }
    @GetMapping(value = "/sendEmailVerification")
    @ResponseBody
    public Map<String, String> sendEmailVerification(@RequestParam(name = "email") String email) {
        String code = emailService.generateVerificationCode();
        boolean isSuccess = emailService.sendVerificationEmail(email, code);

        Map<String, String> response = new HashMap<>();
        response.put("success", isSuccess ? "true" : "false");
        response.put("code", code);

        return response;
    }
}
