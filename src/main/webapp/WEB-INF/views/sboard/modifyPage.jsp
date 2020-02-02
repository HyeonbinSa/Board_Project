<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<%@include file="/WEB-INF/views/include/header.jsp" %>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	$(".cancel").on("click", function(){
		self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	$(".save").on("click", function(){
		formObj.submit();
		
	});
});
</script>
<h2>수정 화면</h2>
<hr>
<form role="form" method="post" action="modifyPage" >
<input type="hidden" name="page" value="${cri.page }"/>
<input type="hidden" name="perPageNum" value="${cri.perPageNum }"/>
<input type="hidden" name="searchType" value="${cri.searchType }"/>
<input type="hidden" name="keyword" value="${cri.keyword }"/>
<table class="table table-bordered">
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

<%@include file="/WEB-INF/views/include/footer.jsp" %>