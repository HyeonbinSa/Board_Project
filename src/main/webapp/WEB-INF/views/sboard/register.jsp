<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>


<form method="post" role="form">
<div class="box-body">
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
</div>
</form>


<%@include file="/WEB-INF/views/include/footer.jsp" %>