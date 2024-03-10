package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class orderDTO {
    // Orders 테이블 필드
    private int order_id;
    private Date order_date;
    private String order_req;
    private String receiver;
    private String phone;
    private String address;

    // OrderDetails 테이블 필드
    private int product_id;
    private int quantity;
    private String size;
    private String name;
    private String img1;
    private String price;
}