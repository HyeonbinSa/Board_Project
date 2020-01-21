<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 화면 </title>
</head>
<body>
<h2>등록 화면</h2>
<hr>
<form method="post">
<table>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" placeholder="Enter Title"/>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="3" name="content" placeholder="Enter Content"></textarea>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" placeholder="Enter Writer"/>
	</tr>
	<tr><td><input type="submit" value="등록"></td></tr>
</table>
</form>
</body>
</html>