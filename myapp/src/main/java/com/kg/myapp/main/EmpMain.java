package com.kg.myapp.main;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.kg.myapp.service.EmpService;
import com.kg.myapp.service.IEmpService;
import com.kg.myapp.vo.EmpVO;

public class EmpMain {

	public static void main(String[] args) {
		AbstractApplicationContext con = 
				new GenericXmlApplicationContext("app-config.xml");
		IEmpService empService = con.getBean(IEmpService.class);
		empService.deleteEmp(100);
//		List<EmpVO> empList = empService.selectAllEmployees();
//		for(EmpVO emp : empList) {
//			System.out.println(emp);
//		}
	}
	
}
