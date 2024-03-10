package com.example.demo.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.QandADTO;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.QandAMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QandAService {
	private final QandAMapper QandAMapper;
	private final ProductService productservice;
	
	public void addQandA(QandADTO QandA) throws IOException {
		// 데이터베이스에 저장
	    QandAMapper.insertQandA(QandA);
	}


	
	
	
	
}
