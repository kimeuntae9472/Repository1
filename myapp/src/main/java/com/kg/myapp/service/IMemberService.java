package com.kg.myapp.service;

import com.kg.myapp.vo.MemberVO;

public interface IMemberService {

	void insertMember(MemberVO member);
	String getPassword(String userid);
	MemberVO getMember(String userid);
	public int checkId(int userId);
}
