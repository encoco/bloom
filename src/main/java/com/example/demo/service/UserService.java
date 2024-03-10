package com.example.demo.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dto.UserDTO;
import com.example.demo.mapper.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private UserMapper userMapper;

	@Autowired
	public UserService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public List<UserDTO> getAllUserList() {
		return userMapper.getAllUserList();
	}

	public boolean register(UserDTO user) {
		if (user.getEmail().equals("") || user.getUsername().equals("") || user.getUserpwd().equals("")
				|| user.getTel().equals("") || user.getRRN().equals("")) {
			return false;
		}

		else {
			userMapper.InsertUser(user);
			return true;
		}
	}

	public boolean isEmailDuplicated(String email) {
		int count = userMapper.isEmailDuplicated(email);
		return count > 0;
	}

	public int getuserpwd(String email, String userpwd) {
		String pw = userMapper.getuserpwd(email);
		if (pw == null || userpwd == null) {
			return 0;
		} else if (!pw.equals(userpwd)) {
			return 1;
		} else if (pw.equals(userpwd)) {
			return 2;
		} else {
			return 3;
		}
	}

	public boolean changepwd(String email, String changePwd) {
		if(userMapper.changePwd(email,changePwd)) return true;
		else return false;
	}

	public int EmailReq(String email) {
		return userMapper.EmailReq(email);
	}

	public UserDTO findUserByEmail(String email) {
		return userMapper.findByEmail(email);
	}

}