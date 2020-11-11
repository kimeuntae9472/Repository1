<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Emp${message}</title>
</head>
<body>
<h1>사원 정보 ${message eq "insert" ? "입력" : "수정"}</h1>
<c:choose>
<c:when test="${message eq 'insert'}">
<form:form action="./${message}" method="post" modelAttribute="emp" enctype="multipart/form-data" >
<table border=1>
<tr>
<th>Employee_id</th>
<td><form:input path="employeeId"/>
<form:errors path="employeeId"/><button id="check">중복 검사</button></td>
</tr>
<tr>
<th>First_name</th>
<td><form:input path="firstName"/>
<form:errors path="firstName"/></td>
</tr>
<tr>
<th>Last_name</th>
<td><form:input path="lastName"/>
<form:errors path="lastName"/></td>
</tr>
<tr>
<th>Email</th>
<td><form:input path="email"/>
<form:errors path="email"/></td>
</tr>
<tr>
<th>Phone_number</th>
<td><form:input path="phoneNumber"/>
<form:errors path="phoneNumber"/></td>
</tr>
<tr>
<th>Hire_date</th>
<td><form:input path="hireDate" type="date" required="required"/>
<form:errors path="hireDate"/></td>
</tr>
<tr>
<th>Job_id</th>
<td><form:select path="jobId">
<c:forEach var="job" items="${jobList}">
<option value="${job.jobId}">${job.jobTitle}</option>
</c:forEach>
</form:select></td>
</tr>
<tr>
<th>Salary</th>
<td><form:input path="salary"/>
<form:errors path="salary"/></td>
</tr>
<tr>
<th>Commission_pct</th>
<td><form:input path="commissionPct" type="number" step="0.05"/>
<form:errors path="commissionPct"/></td>
</tr>
<tr>
<th>Manager_id</th>
<td><form:select path="managerId">
<c:forEach var="man" items="${manList}">
<option value="${man.managerId}">${man.managerName}</option>
</c:forEach>
</form:select></td>
</tr>
<tr>
<th>Department_id</th>
<td><form:select path="departmentId">
<c:forEach var="dept" items="${deptList}">
<option value="${dept.departmentId}">${dept.departmentName}</option>
</c:forEach>
</form:select></td>
</tr>
<tr>
<td>프로필 사진(5Mb 이하)</td><td><input type=file name=file></td>
</tr>
<tr>
<td><input type=submit value="저장" id=submit><input type=reset value=취소></td>
</tr>
</table>
</form:form>
</c:when>
</c:choose>

<script>
$(function(){
	var ck = false;
	$("#check").on("click",function(){
		if($("#employeeId").val()){
			$.ajax({
				url : "check",
				type : "post",
				data : {empId : $("#employeeId").val()},
				dataType : "text",
				success : function(check){
					if(check){
						alert("중복되지 않습니다!");
						$("#check").remove();
						$("#employeeId").attr("readonly",true);
						ck = !ck;
					}else{
						alert("사원번호가 중복됩니다!");
						
					}
					return false;
				},
				error : function(){
					alert("ajax에 문제가 있습니다!");
					return false; // alert가 있을때 실행되지 않게 하려면 return false를 사용해야한다!!!
				}
			});
		}else{
			alert("값이 있어야 합니다!");
			return false; // return false를 적지 않으면 자동으로 true로 되어 form을 마무리하기 때문에 다시 돌아가려면 무조건 적어야한다!!!
		}
	});
	$("#submit").on("click",function(){ // var check = function(){}이런 형식의 함수는 결과값을 저장하지 않기 때문에 결과값이 필요하면 이렇게 적으면 안됨 결과값이 필요하면 function check(){}형식으로 적어야함
		if(ck){
			
		}else{
			alert("중복검사가 먼저 진행되어야합니다.");
			return false;
		}
	});
});
</script>



</body>
</html>