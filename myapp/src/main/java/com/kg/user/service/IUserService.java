package com.kg.user.service;

import java.util.List;

import com.kg.user.vo.UserVO;

public interface IUserService {

	public void joinUser(UserVO user);
	public List<UserVO> selectAllUser(String userId);
}
