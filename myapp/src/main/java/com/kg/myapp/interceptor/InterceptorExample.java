package com.kg.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kg.myapp.dao.IEmpRepository;

public class InterceptorExample implements HandlerInterceptor{

	@Autowired
	IEmpRepository empRepository; // 필터는 스프링에 포함된것이 아니기에 사용할수 없지만 인터셉터는 가능
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//전
		System.out.println("인터셉터 실행");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//후
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//모든걸 완료후
		
	}
	
	
}
