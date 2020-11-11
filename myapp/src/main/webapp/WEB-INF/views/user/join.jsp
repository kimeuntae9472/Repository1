<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Page</title>
</head>
<body>
<form action="user/join" method="post">
<table border="1">
<tr>
<td>ID: <input type="text" name="userId"></td>
<td>PASSWORD: <input type="password" name="password"/></td>
<td>NAME: <input type="text" name="name"/></td>
<td>PHONE: <input type="text" name="tel"/></td>
<td>PICTURE: <input type="file" name="picture"></td>
<td><input type="submit" value="JOIN"></td>
</table>

</form>

</body>
</html>