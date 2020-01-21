<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>등록 회원 Criteria 리스트</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	var result = '${msg}';
	if(result == "SUCCESS"){
		alert("처리가 완료되었습니다.");
	}
	$(document).ready(function(){
		$("#searchBtn").on("click", function(event){
			self.location = "list" + "${pageMaker.makeQuery(1)}"
			+ "&searchType="+$("select option:selected").val()
			+ "&keyword="+encodeURIComponent($("#keywordInput").val());
		});		
		
		$("#newBtn").on("click", function(evt){
			self.location = "register";
		});
		
		//var formObj = $("form[role='form']");
		//console.log(formObj);
		//$(".register").on("click", function(){
		//	self.location = "/board/register";
		//});
	});
</script>
<body>
<h2>전체 글 목록 </h2>
<hr>
<div>
<select name="searchType">
	<option value="n"
	<c:out value="${cri.searchType == null ? 'selected' : '' }"/>>---</option>
	<option value="t"
	<c:out value="${cri.searchType eq 't' ? 'selected' : '' }"/>>Title</option>
	<option value="c"
	<c:out value="${cri.searchType eq 'c' ? 'selected' : '' }"/>>Content</option>
	<option value="w"
	<c:out value="${cri.searchType eq 'w' ? 'selected':'' }"/>>Writer</option>
	<option value="tc"
	<c:out value="${cri.searchType eq 'tc' ? 'selected':'' }"/>>Title OR Content</option>
	<option value="cw"
	<c:out value="${cri.searchType eq 'cw' ? 'selected':'' }"/>>Content OR Writer</option>
	<option value="tcw"
	<c:out value="${cri.searchType eq 'tcw' ? 'selected':'' }"/>>Title OR Content OR Writer</option>
</select>
<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }"/>
<button id="searchBtn">검색</button>
<button id="newBtn">새 게시글</button>
</div>
<hr>
<button class="register">글 등록</button>
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
		<!-- <td><a href="/board/read?bno=${vo.bno}">${vo.title}</a></td> -->
		<td><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${vo.bno}">${vo.title}</a></td> 
		<td>${vo.content}</td>
		<td>${vo.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
		<td>${vo.viewcnt}</td>
		</tr>
	</c:forEach>
</table>
<div>
	<ul>
		<c:if test="${pageMaker.prev }">
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }" var="idx">
			<li <c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
			<a href="list${pageMaker.makeSearch(idx) }">${idx }</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<!-- <li><a href="listPage?page=${pageMaker.endPage + 1 }">&raquo;</a></li>-->
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>