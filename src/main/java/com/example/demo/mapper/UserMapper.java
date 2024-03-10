package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.UserDTO;

@Mapper
public interface UserMapper {
	public List<UserDTO> getAllUserList();
	public String getuserpwd(String email);
	public void InsertUser(UserDTO userDTO);
    public ModelAndView checkIdDuplication();
	public int isEmailDuplicated(String email);
	public UserDTO findByEmail(String email);
	public boolean changePwd(@Param("email") String email, @Param("changePwd") String changePwd);
	public int EmailReq(String email);
}
