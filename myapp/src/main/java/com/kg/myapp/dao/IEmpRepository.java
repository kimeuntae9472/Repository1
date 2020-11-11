package com.kg.myapp.dao;

import java.util.List;
import java.util.Map;

import com.kg.myapp.vo.EmpVO;

public interface IEmpRepository {

	public EmpVO selectEmployee(int empId);
	public List<EmpVO> selectAllEmployees();
	public void deleteEmp(int empId);
	public void deleteJobHistory(int empId);
	public void insertEmp(EmpVO emp);
	public void updateEmp(EmpVO emp);
	int getEmpCount();
	int getEmpCount(int deptId);
	public List<EmpVO> getEmpList();
	public List<EmpVO> getEmpList(int deptId);
	EmpVO getEmpInfo(int empId);
	public List<EmpVO> getEmpSearch(String name);
	public List<Map<String, Object>> getAllDeptId();
	public List<Map<String, Object>> getAllJobId();
	public List<Map<String, Object>> getAllManagerId();
	public void updateManagers(int empId);
	public Map<String, Integer> getUpdateCount(int empId);
	public int idCheck(int empId);
}
