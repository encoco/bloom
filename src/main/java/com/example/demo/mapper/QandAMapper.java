package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.QandADTO;

@Mapper
public interface QandAMapper {
	void insertQandA(QandADTO QandA);
}
