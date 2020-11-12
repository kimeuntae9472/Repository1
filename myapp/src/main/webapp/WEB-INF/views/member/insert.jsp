<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#loadingImage{
position : absolute;
left : 50%;
top : 50%;
background : #ffffff;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<h1>회원 정보 입력</h1>
<form action="/myapp/member/insert" method=post enctype=multipart/form-data>
<table>
<tr>
<td>아이디</td><td><input type=text id=userid name=userid><button type=button id="check">중복 검사</button></td>
</tr>
<tr>
<td>비밀번호</td><td><input type=password name=password></td>
</tr>
<tr>
<td>이름</td><td><input type=text name=name></td>
</tr>
<tr>
<td>전화번호</td><td><input type=text name=tel pattern="^[0][1][0-9](-|\s)\d{4}(-|\s)\d{4}$"></td>
</tr>
<tr>
<td>프로필 사진</td><td><input type=file name=file></td>
</tr>
<tr>
<td><input type=submit value=가입 id=submit><input type=reset value=취소></td>
</tr>
</table>
<div id="loadingImage"><img src="/myapp/resources/images/loading.gif"></div>

</form>
<script>
$(function(){
	$("#loadingImage").hide();
	var ck = false;
	$("#check").on("click",function(){
		if($("#userid").val()){
			$.ajax({
				url : "/myapp/member/check",
				type : "post",
				data : {userId : $("#userid").val()},
				dataType : "text",
				success : function(result){
					if(result){
						alert("중복되지 않습니다!");
						$("#check").remove();
						$("#userid").attr("readonly",true);
						ck = !ck;
					}else{
						alert("아이디가 중복됩니다!");
					}
					return false;
				}, 
				error : function(){
					alert("ajax에 문제가 있습니다!");
					return false; 
				}
			});
		}else{
			alert("값이 있어야 합니다!");
			return false; 
		}
	});
	$(document).ajaxStart(function(){ // 3.* 버전에만있는 기능
		$("#loadingImage").show();
		
	})
	$(document).ajaxStop(function(){
		$("#loadingImage").hide();
	})
	$("#submit").on("click",function check(){
		if(!ck){
			alert("중복 검사를 진행하셔야합니다.");
			return false;
		}else{
			
		}
	});
	/* $("#submit").on("click",function(){ 
		if(ck){
			
		}else{
			alert("중복검사가 먼저 진행되어야합니다.");
			return false;
		}
	}); */
});
</script>
</body>
</html>