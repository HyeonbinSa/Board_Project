<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<meta charset="UTF-8">
<title>조회 페이지</title>
</head>
<body>
<h2> 조회 페이지 </h2>
<hr>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modify").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/modifyPage");
		formObj.submit();
	});
	$(".remove").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	});	
	$(".list").on("click", function(){
		self.location = "/board/listPage";
	});
	
});
</script>


<form role="form" method="post">
	<input type="hidden" name="bno" value="${vo.bno}"/>
</form>


<table>
	<tr>
	<td>번호</td>
		<td><input type="text" name="title" readonly="readonly" value="${vo.bno }"/>
	</tr>
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
	<button type="submit" class="btn list">목록</button>
	<button type="submit" class="btn remove">삭제</button>
	<button type="submit" class="btn modify">수정</button>
	</td></tr>
</table>
<form role="form" action="modifyPage" method="post">
	<input type="hidden" name="bno" value="${vo.bno}"/>
	<input type="hidden" name="page" value="${cri.page}"/>
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
</form>
</body>
</html>