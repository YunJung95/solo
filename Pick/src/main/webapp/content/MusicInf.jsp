<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tp.soripick.domain.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<style>
#tbl {
	width:100%;	
}

#tbl ul, #commenttbl ul {	
	list-style: none; 
	margin: 0;
	padding: 0; 
	
}
#tbl li.title1,#tbl li.title2,#tbl li.title3,#tbl li.title4 {	
	height:30px;
	background-color:#f3f3f3;	
	border-bottom:1px solid #71717138;
	text-align:center;
	}
#tbl li.sub1,#tbl li.sub2,#tbl li.sub4 {	
	height:44px;
	background-color:#FFFFFF;	
	border-bottom:1px solid #71717138;
	text-align:center;
}
#tbl li.sub1,li.title1 {
	float:left;
	width:5%;		
}
#tbl li.sub2,li.title2 {
	float:left;
	width:15%;		
}
#tbl li.sub3,li.title3 {
	float:left;
	width:65%;	
	height:44px;
	background-color:#FFFFFF;	
	border-bottom:1px solid #71717138;
}
#tbl li.sub4,li.title4 {
	float:left;
	width:15%;		
}



</style>
<%

ContentVo cv  = (ContentVo)request.getAttribute("cv");
ReplyVo rv = (ReplyVo)request.getAttribute("rv");

int sMidx=0;
if(session.getAttribute("sMidx") !=null) {
sMidx = (int) session.getAttribute("sMidx");
}
%>

<script type="text/javascript">

$(function(){

	$.contentReplyList();	
		
		
$('#save').click(function(){
	
     //alert("이예나돼지");

	 var cidx = $("#cidx").val();
	 var rwriter = $("#rwriter").val();
	 var rcontent = $("#rcontent").val();			 
	 
	 $.ajax({
		 type : 'POST',
			url  : "/reply",
			headers: {"Content-Type" : "application/json",
		 		 "X-HTTP-Method-Override" : "POST"
		 		 }, 
			datatype : 'text' , 
			data : JSON.stringify({
				cidx : cidx,
				rwriter : rwriter,
				rcontent : rcontent
			}),
			error : function(request,status,error){				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success : function(data){
				
				if (data == null){
					alert("데이터없음");
				}
				 
				alert(data);
				
				$.contentReplyList();
				
				//$("#cidx").val("");
				$("#rwriter").val("");
				$("#rcontent").val("")
				}		
	 });

});

$("#tbl").on("click","button" , function(ridx){
		
	var ridx = $(this).attr('value');
	var cidx = <%=cv.getCidx()%>;
	
	//alert(ridx);
	
	$.ajax({
			type : "GET",
			url  : "/reply/"+ridx+"/"+cidx,			
			datatype : "json",				
			cache : false,
			error : function(request,status,error){				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success : function(data){			
				
				if (data == null){
					alert("데이터없음");
				}
				 
				alert(data);
				
				$.contentReplyList();
			}			
		});	
	 
});



});



$.contentReplyList = function(){
	
	
	<%-- alert("cidx?"+<%=cv.getCidx()%>);
	alert("midx?"+<%=sMidx%>); --%>
	$.ajax({
		type : "GET",
		url  : "/reply/all/<%=cv.getCidx()%>",
		datatype : "text",
		cache : false,
		error : function(request,status,error){				
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(data){			
			replyList(data);
			}			
	});	 	
}	

function replyList(data){
	var str = '';
	var Midx = <%=sMidx%>;
	
	$(data).each(function(){
		
		
		var deleteline = "";
		if (Midx == this.midx) {
			deleteline ="<li class='sub4'><button class='button alt' value="+this.ridx+">삭제</button></li>";
			}else{
			
			deleteline ="<li class='sub4'><button class='button alt' disabled='disabled'>삭제</button></li>";	
				
			}
		
		str += "<ul><li class='sub1'>"+this.ridx   + "</li>" 
			+  "<li class='sub2'>"+this.rwriter + "</li>"
			+  "<li class='sub3'>"+this.rcontent  + "</li>"
			+  deleteline
			+  "</ul>";					
	});
	
	$('#tbl').html("<ul><li class='title1'>번호</li>"
					+"<li class='title2'>작성자</li>"
					+"<li class='title3'>내용</li>"
					+"<li class='title4'>삭제</li>"
					+"</ul>"
					+str+"");				

}

</script>

<section id="main">
<div class="inner">
<div class="box-body">
	
	<div class="form-group">
	<label for="examInputEmail1">이미지 </label>
	<img src="displayFile?fileName=${cv.cimg}" width="150" height="300" alt="" class="img-fluid">
	</div>
	
	<div class="form-group">
	<label for="examInputEmail1">노래 제목 </label>
	<textarea class="form-control" readonly="readonly">
	<%=cv.getCname()%>
	</textarea>
	</div>
	
	<div class="form-group">
	<label for="examInputPassword1">아티스트 </label>
	<textarea class="form-control" readonly="readonly">
	<%=cv.getCartist() %>
	</textarea>	  
	</div>
	
	
	
	<div class="form-group">
	<label for="examInputEmail1">좋아요 </label>
	<textarea class="form-control" rows="3" readonly="readonly">
	<%=cv.getClike()%>
	</textarea>
	</div>	
</div>

<div id="tbl"></div>

<div id="commenttbl" class="box-body">
	<div>
	<label>댓글 작성시</label>
	<label style="color:red">고운말 바른말을 사용합시다.</label>
	<input type="hidden" name="cidx" id="cidx"  value="<%=cv.getCidx()%>" />	
	<textarea name="rcontent" id="rcontent" placeholder="내용입력"></textarea>
	</div>
	
	<div>
	<input type="button" name="save" id="save" value="저장" />	
	</div>
	
</div>
</div>
</section>

<%@ include file="/resources/assets/include/footer.jsp" %>