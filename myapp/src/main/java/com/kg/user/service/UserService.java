package com.kg.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kg.user.vo.UserVO;

@Service
public class UserService implements IUserService{

	IUserService UserService;
	
	@Override
	public void joinUser(UserVO user) {
		
	}
	
	@Override
	public List<UserVO> selectAllUser(String userId) {
		
		return null;
	}
}
