<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page import="java.util.ArrayList" %>
 
 <%@ page import ="com.tp.soripick.domain.*" %>
 
<% 
/* String mid = (String)request.getAttribute("mid"); */

MemBoardVo mbo = (MemBoardVo)request.getAttribute("mbo");	
%>
 

 
 <link rel="stylesheet" href="../resources/assets/css/category-nav.css" /> 
<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 58px;">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
    <li><a href="<%=request.getContextPath()%>/noticelist" class="active">공지사항</a></li>
    <li><a href="<%=request.getContextPath()%>/faq3list">FAQ</a></li>
  	<li class="active"><a href="<%=request.getContextPath()%>/qnacome">1:1 문의 하기</a></li>
  	<li><a href="<%=request.getContextPath()%>/mylistqna">문의 내역 보기</a></li>
    </ul>
  </div>
</nav>

 
  <style>
 
 /* 	.size {
  	width: 300px;
    margin: 0 auto;
  	}
  	 */
  	textarea {
  	width: 784px;
    margin: 0 auto;
    resize: none;
  	}
 
 </style>
 
<section id="main2">
<div class="inner">



<%
	int midx = 0;	
    if (session.getAttribute("sMidx") != null) {
     midx = (int)session.getAttribute("sMidx");
    }	
%> 


<% if(midx == 0){ %> 

로그인을 하세욤z
<a href="<%=request.getContextPath()%>/joincontroller">회원가입</a>
<a href="<%=request.getContextPath()%>/logincontroller">로그인</a>	


<% }else { %>

<form name="frm" enctype="multipart/form-data" >

<table >

<tr>
<td>아이디</td>
<td>
<input type="text" id="id"  class="size"  value="<%=mbo.getMid() %>" disabled="disabled"
style="width: 300px; margin: 0 auto;"
 />
</td>
<td>이메일</td>
<td>
<input type="text" id="email" class="size"  value="<%=mbo.getMemail()%>" disabled="disabled" 
style="width: 300px; margin: 0 auto;"
/>
</td>
</tr>

<tr>
<td>제목</td>
<td colspan="3">
<textarea name="btitle" id="title" rows="1" cols="500"></textarea>
</td>
</tr>

<tr>
<td>내용</td>
<td colspan="3">
<textarea name="bcontent" id="content" rows="10" cols="1000" ></textarea>
</td>
</tr>

<tr>
<td></td>
<td align="center"  colspan="3">
	<div id="text" class="red"> 질문한 게시글의 수정, 삭제가 힘듭니다. 신중하게 작성해주세요. </div>
</td>
</tr>

<tr>
<td></td>
<td align="center"  colspan="3">
<input type="button" name="button" value="등록" onclick="$.submit();" />
<input type="button" value="리셋" onclick="reset();"/>
<input type="button" value="목록" onclick="javascript:document.location.href='<%=request.getContextPath()%>/mylistqna'"/>
</td>
</tr>

</table>
</form>
<% } %>
 </div>
</section>


<script>

$(function(){
	 $.submit = function(){
		 if($("#title").val() == "") {
             alert("제목을 입력해주세요");
             $("#title").focus();
             return false;
         }else if($("#content").val() == "") {
             alert("내용을 입력해주세요");
             $("#content").focus();
         }
		 
		 var res;	  
   		 var df = document.frm;
   	 
   	 	res = confirm("질문을 등록하시겠습니까?");
   	 
   		 if (res == true) {
   		 df.method ="post";
   		 df.action ="<%=request.getContextPath()%>/qnainsert";
   		 df.submit();  
   	  }
   		
   	return;
	 }
});

</script>



<%@ include file="/resources/assets/include/footer.jsp" %>