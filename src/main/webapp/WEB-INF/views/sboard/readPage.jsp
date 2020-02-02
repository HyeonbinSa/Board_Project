<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<!-- 게시글 수정, 목록, 삭제 버튼 메소드  -->
<script>
// 게시글 수정, 목록, 삭제 버튼 메소드;
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modify").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/modifyPage");
		formObj.submit();
	});
	$(".remove").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	});	
	$(".list").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list");
		formObj.submit();
	});
});
</script>
<!-- 댓글 리스트 출력 스크립트  -->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="replyLi" data-rno={{rno}}>
	<i class="fa fa-comments bg-blue"></i>
		<div class="timeline-item">
			<span class="time">
				<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
			</span>
			<h3 class="timeline-header"><strong>{{rno}}</strong>-{{replyer}}</h3>
			<div class="timeline-body">{{replytext}}</div>
			<div class="timeline-footer">
			<a class="btn btn-primary btn-xs" 
				data-toggle="modal" data-target="#modifyModal">수정</a><!-- 각 댓글 수정 버튼  -->
			<div>
		</div>
	</li>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var date = dateObj.getDate();
		return year+"/"+month+"/"+date;
	});	
	
	var printData = function(replyArr, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
</script>

<form role="form" method="post">
	<input type="hidden" name="bno" value="${vo.bno}"/>
</form>

<!-- 게시글 정보 출력 화면  -->
<table class="table table-bordered">
	<tr>
	<td >번호</td>
		<td><input type="text" name="bno" readonly="readonly" value="${vo.bno }"/>
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
<!-- 수정 시 데이터 hidden  -->
<form role="form" action="modifyPage" method="post">
	<input type="hidden" name="bno" value="${vo.bno}"/>
	<input type="hidden" name="page" value="${cri.page}"/>
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	<input type="hidden" name="searchType" value="${cri.searchType}"/>
	<input type="hidden" name="keyword" value="${cri.keyword}"/>
</form>
<!-- 댓글 추가 버튼 및 입력 창  -->
<div class="row">
	<div class="col-md-12">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">댓글 추가</h3>
			</div>
			<div class="box-body">
				<label for="newReplyWriter">작성자</label>
				<input class="form-control" type="text" placeholder="User ID" id="newReplyWriter">
				<label for="newReplyText">내용</label>
				<input class="form-control" type="text" placeholder="댓글 내용" id="newReplyText">	
			</div>
			
		<div class="box-footer">
			<button type="submit" class="btn btn-primary" id="replyAddBtn">댓글 추가</button>
		</div>
		</div>
		
		<ul class="timeline">
			<li class="time-label" id="repliesDiv"><span class="bg-green">댓글 목록</span></li>
		</ul>
		<div class="text-center">
			<ul id="pagination" class="pagination pagination-sm no-margin">
			</ul>
		</div>
	</div>
</div>

<!-- 수정 시 생성되는 Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
var bno= ${vo.bno};
var replyPage = 1;
function getPage(pageInfo){
	$.getJSON(pageInfo, function(data){
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));
		
		$("#modifyModal").modal('hide');
	});
}
// 하단 페이징 버튼 출력 
var printPaging = function(pageMaker, target){
	var str="";
	if(pageMaker.prev){
		str+="<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		var strClass= pageMaker.cri.page == i?"class=active":'';
		str += "<li " + strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	target.html(str);
};
$("#repliesDiv").on("click", function(){
	if($(".timeline li").size()>1){
		return;
	}
	getPage("/replies/"+bno+"/1");
});
$(".pagination").on("click", "li a", function(event){
	event.preventDefault();
	replyPage = $(this).attr("href");
	getPage("/replies/"+bno+"/"+replyPage);
});
// 댓글 추가 기능  ------------------------------------------------------
$("#replyAddBtn").on("click", function(){
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext = replytextObj.val();

	$.ajax({
		type:'post',
		url:'/replies/',
		headers:{
			"Content-Type": "application/json",
			"X-HTTP-Method-Override":"POST"},
			dataType:'text',
			data:JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage=1;
					getPage("/replies/"+bno+"/"+replyPage);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
	});
});
// 댓글 목록 ----------------------------------------
$(".timeline").on("click",".replyLi", function(){
	var reply = $(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$('.modal-title').html(reply.attr("data-rno"));
});
//수정 버튼 기능 ------------------------------------
$("#replyModBtn").on("click", function(){
	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();
	$.ajax({
		type : 'put',
		url : '/replies/' + rno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data:JSON.stringify({replytext:replytext}),
		dataType : 'text',
		success : function(result){
			if(result == 'SUCCESS'){
				alert("수정 완료되었습니다. ");
				getPage("/replies/"+bno+"/"+replyPage);
			}
		}
	});
});
// 삭제 버튼 기능 -------------------------------------
$("#replyDelBtn").on("click", function(){
	var rno = $(".modal-title").html();
	var replyttext = $("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+rno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE" },
			data:JSON.stringify({replytext:replytext}),
			dataType:'text',
			success:function(result){
				console.log("result : " + result);
				if(result == "SUCCESS"){
					alert("삭제 완료되었습니다. ");
					getPage("/replies/"+bno+"/"+replyPage);
				}
			
		}});
});
</script>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
