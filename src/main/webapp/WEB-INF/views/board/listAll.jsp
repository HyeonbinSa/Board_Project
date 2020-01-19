<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>등록 회원 전체 리스트</title>
</head>
<script>
	var result = '${msg}';
	if(result == "SUCCESS"){
		alert("처리가 완료되었습니다.");
	}
</script>
<body>
<h2>전체 글 목록 </h2>
<hr>
<table border="1">
	<tr>
		<th>BNO</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list }" var="vo">
		<tr>
		<td>${vo.bno }</td>
		<td><a href="/board/read?bno=${vo.bno}">${vo.title}</a></td>
		<td>${vo.content}</td>
		<td>${vo.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
		<td>${vo.viewcnt}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>