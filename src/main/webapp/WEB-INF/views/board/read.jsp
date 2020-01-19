<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 페이지</title>
</head>
<body>
<h2> 조회 페이지 </h2>
<hr>
<form method="post">
<table>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" readonly="readonly" value="${vo.title }"/>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="3" name="content" readonly="readonly" >${vo.title }</textarea>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" readonly="readonly" value="${vo.writer }"/>
	</tr>
	<tr><td>
	<input type="submit" value="목록">
	<input type="submit" value="삭제">
	<input type="submit" value="수정">
	</td></tr>
</table>
</form>
</body>
</html>