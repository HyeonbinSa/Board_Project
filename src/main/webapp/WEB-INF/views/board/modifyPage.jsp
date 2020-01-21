<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 화면 </title>
</head>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	$(".cancel").on("click", function(){
		self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	$(".save").on("click", function(){
		formObj.submit();
		
	});
});
</script>
<body>
<h2>수정 화면</h2>
<hr>
<form role="form" method="post" action="modifyPage" >
<input type="hidden" name="page" value="${cri.page }"/>
<input type="hidden" name="perPageNum" value="${cri.perPageNum }"/>
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
	<tr><td><button class="save">저장</button></td>
	<td><button class="cancel">취소</button></td>
	</tr>
</table>
</form>
</body>
</html>