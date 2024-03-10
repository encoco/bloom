package com.example.demo.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QandADTO {
	private int inquiries_id;
	private int product_id;
	private String email;
	private String content;
	private int comment;
	private Timestamp rdate;
}
