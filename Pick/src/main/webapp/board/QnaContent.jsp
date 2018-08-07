<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page import="java.util.ArrayList" %>
 
 <%@ page import ="com.tp.soripick.domain.*" %>
<%
BoardVo mbo = (BoardVo)request.getAttribute("mbo");	
%>

  <style>

  	textarea {
  	width: 784px;
    margin: 0 auto;
    resize: none;
  	}
 
 </style>
 
 
 <link rel="stylesheet" href="../resources/assets/css/category-nav.css" /> 
<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 58px;">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
    <li><a href="<%=request.getContextPath()%>/noticelist">공지사항</a></li>
    <li><a href="<%=request.getContextPath()%>/faq3list">FAQ</a></li>
  	<li><a href="<%=request.getContextPath()%>/qnacome">1:1 문의 하기</a></li>
  	<li><a href="<%=request.getContextPath()%>/mylistqna">문의 내역 보기</a></li>
    </ul>
  </div>
</nav>

 
 
<section id="main2">
<div class="inner">



<%
	int midx = 0;	
    if (session.getAttribute("sMidx") != null) {
     midx = (int)session.getAttribute("sMidx");
    }	
%> 


<% if(midx == 0){ %> 

로그인을 하세요
<a href="<%=request.getContextPath()%>/joincontroller">회원가입</a>
<a href="<%=request.getContextPath()%>/logincontroller">로그인</a>	


<% }else { %>

<form name="frm" enctype="multipart/form-data" >

<table>

<input type="hidden" name="bidx" value="${mbo.bidx}" />


<tr>
<td>제목</td>
<td colspan="3">
<textarea name="btitle" id="title" rows=1 cols=10><%=mbo.getBtitle() %></textarea>

</td>
</tr>

<tr>
<td>내용</td>
<td  colspan="3">
<textarea name="bcontent" id="content" rows=10 cols=1000 ><%=mbo.getBcontent() %></textarea>
</td>
</tr>



<% if (mbo.getBrecontent() == null) { %>
<tr>
<td></td>
<td align="center" colspan="3">
	<div id="text" class="red"> 질문한 게시글의 수정, 삭제가 힘듭니다. 신중하게 작성해주세요. </div>
</td>
</tr>



<tr>
<td align="center"  colspan="4">
<input type="button" name="button" value="수정" onclick="$.submit();" />
<input type="button" value="리셋" onclick="reset();"/>
<input type="button" value="목록" onclick="javascript:document.location.href='<%=request.getContextPath()%>/mylistqna'"/>
</td>
</tr>
<% } %>

<% if (mbo.getBrecontent() != null) { %>
<tr>
<td>관리자의 답변</td>
<td colspan="3">
<textarea name="brecontent" id="recontent" rows=20 cols=100  value="<%=mbo.getBrecontent() %>" disabled="disabled" ></textarea>
</td>
</tr>
<% } %>
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
   	 
   	 	res = confirm("질문을 수정하시겠습니까?");
   	 
   		 if (res == true) {
   		 df.method ="post";
   		 df.action ="<%=request.getContextPath()%>/qnaupdate";
   		 df.submit();  
   	  }
   		
   	return;
	 }
});

</script>



<%@ include file="/resources/assets/include/footer.jsp" %>