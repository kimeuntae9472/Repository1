package com.kg.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.kg.myapp.service.IMemberService;
import com.kg.myapp.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	IMemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bpe;
	
	@PostMapping(value="/login.do")
	public String login(String id, String pw, Model model, HttpSession session) {
		String dbpw = memberService.getPassword(id);
		if(dbpw != null & bpe.matches(pw, dbpw)) {
			MemberVO member = memberService.getMember(id);
			session.setAttribute("member", member);
			session.setAttribute("userid", id);
			return "redirect:/emp";
		}else {
			model.addAttribute("message","�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� �옒紐삳릺�뿀�뒿�땲�떎.");
			return "/login";
		}
	}
	
	
	
}
