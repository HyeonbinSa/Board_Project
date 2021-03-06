<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script>
	var bno = 2949067;
	getPageList(1);
	//alert("안녕"); //스크립트 진입 테스트.
	/*
	$.getJSON("/replies/all/"+bno, function(data){
		var str = "";
		console.log(data.length);
		$(data).each(function(){
			str +="<li data-rno='"+this.rno+ "'class='replyLi'>"+this.rno+":"+this.replytext+"</li>";
		});
		
	$("#replies").html(str);
	});
	*/
	function getAllList(){
		//var bno = 19934;
		$.getJSON("/replies/all/"+bno, function(data){
			var str = "";
			console.log(data.length);
			$(data).each(function(){
				str +="<li data-rno='"+this.rno+ "'class='replyLi'>"+this.rno+":"+this.replytext+"<button>MOD</button></li>";
			});
		$("#replies").html(str);
	
		});
		
	}
	
	function getPageList(page){	

		$.getJSON("/replies/"+bno+"/"+page, function(data){
			
			console.log(data.list.length);
			var str ="";
			
			$(data.list).each( function(){
				str+= "<li data-rno='"+this.rno+"' class='replyLi'>"
				+this.rno+":"+this.replytext+
				"<button>MOD</button></li>";
			});
			$('#replies').html(str);
			printPaging(data.pageMaker);
		});
	}

	function printPaging(pageMaker){
		
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage - 1)+"'> << </a></li>'";
		}
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i<=len;i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li " +strClass +"><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>'";
		}
		$('.pagination').html(str);
	}
	var replyPage =1;
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPageList(replyPage);
	});
</script>
<style>
#modDiv{
	width:300px;
	height:100px;
	background-color:gray;
	position : absolute;
	top : 50%;
	left : 50%;
	margin-top : -50px;
	margin-left : -150px;
	padding : 10px;
	z-indel : 1000;
}
</style>
</head>
<body>
<h2>Ajax Test Page</h2>
<hr>
<div>
	<div>
		Replyer <input type="text" name="replyer" id="newReplyWriter">
	</div>
	<div>
		Reply Text <input type="text" name="replytext" id='newReplyText'>
	</div>
	<button id="replyAddBtn">Add Reply</button>
</div>
<ul id="replies">

</ul>

<ul class="pagination">

</ul>
<div id="modDiv" style="display: none;">
	<div class="modal-title"></div>
	<div>
		<input type="text" id="replytext">
	</div>
	<div>
		<button type="button" id="replyModBtn">Modify</button>
		<button type="button" id="replyDelBtn">Delete</button>
		<button type="button" id="closeBtn">Close</button>
	</div>
</div>
 <script>
	//등록 버튼 기능 ------------------------------------
	$("#replyAddBtn").on("click", function(){
		//alert("클릭 ");
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		
		$.ajax({
			type : 'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result){
				if(result == 'SUCCESS'){
					alert("등록 완료! ");
					getAllList();
					//getPageList(1);
				}
			}
		});
	});
	// 수정 div 불러오기  ------------------------------------
	$("#replies").on("click", ".replyLi button", function(){
		var reply = $(this).parent();
		
		var rno = reply.attr("data-rno");
		var replytext = reply.text();
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
	// 삭제 버튼 기능 ------------------------------------
	$("#replyDelBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result){
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다. ");
					$("#modDiv").hide("slow");
					getPageList(replyPage);
				}
			}
		});
	});
	// 수정 버튼 기능 ------------------------------------
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
					alert("수정 되었습니다. ");
					$("#modDiv").hide("slow");
					//getAllList();
					getPageList(replyPage);
				}
			}
		});
	});
	// ------------------------------------------------
</script>
</body>
</html>