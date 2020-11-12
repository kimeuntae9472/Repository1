<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Mock Data</title>
</head>
<body>
<div class="wrap"></div>
</body>
<script>
$(function(){
	$.ajax({
		url : "/myapp/resources/json/MOCK_DATA.json",
		dataType : "json",
		success : function(data){
			if(data.length>0){
				var tb = $("<table />");
				for(var i in data){
					var $id = data[i].id;
					var $first_name = data[i].first_name;
					var $last_name = data[i].last_name;
					var $email = data[i].email;
					var row = $("<tr />").append(
					$("<td />").text($id),
					$("<td />").text($first_name),
					$("<td />").text($last_name),
					$("<td />").text($email)
					);
					tb.append(row);
				}
				$(".wrap").append(tb);
			}
		}
	});
});
</script>
</html>