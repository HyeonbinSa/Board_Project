<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 화면 </title>
</head>
<body>
<h2>수정 화면</h2>
<hr>
<form method="post">
<table>
	<tr>
	<td>번호</td>
		<td><input type="text" name="bno" readonly="readonly" value="${vo.bno }"/>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${vo.title }"/>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="3" name="content" >${vo.content }</textarea>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="${vo.writer }"/>
	</tr>
	<tr><td><input type="submit" value="등록"></td>
	<td><input type="reset" value="초기화	"></td>
	</tr>
</table>
</form>
</body>
</html>