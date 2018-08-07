<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ page import="com.tp.soripick.domain.*" %>
<% BoardVo bv  = (BoardVo)request.getAttribute("bv");  %>

  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


 <link rel="stylesheet" href="../resources/assets/css/category-nav.css" /> 

<style>
 .box {
 
    height: 370px;
    display: grid;
    width: 990px;
 }

</style>

<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 58px;">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
    <li class="active"><a href="<%=request.getContextPath()%>/noticelist" class="active">공지사항</a></li>
    <li><a href="<%=request.getContextPath()%>/faq3list">FAQ</a></li>
  	<li><a href="<%=request.getContextPath()%>/qnacome">1:1 문의 하기</a></li>
  	<li><a href="<%=request.getContextPath()%>/mylistqna">문의 내역 보기</a></li>
    </ul>
  </div>
</nav>



<section id="main2">
<div class="inner">

<div class="box">

	<div class="form-group">
	<label for="examInputEmail1"style="display: -webkit-box;width: 900px;">
	
	<div style=" margin-right: 500px;"><a>제목 : ${bv.btitle }</a></div>
	<div style=" margin-right: 140px;"><a>등록일 
			<fmt:parseDate value="${bv.bdate}" var="dateformat" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${dateformat}" pattern="yyyy-MM-dd"/></a></div>
	<div><a>조회수 ${bv.bhit}</a></div>
	
	</label>
	
	</div>
	
	
	
	<div class="form-group">
	<label for="examInputPassword1">내용 </label>
	<textarea class="form-control" rows="3" readonly="readonly" style="height: 230px; margin-top: 0; resize: none;">
	${bv.bcontent}
	</textarea>	  
	</div>
	
</div>

 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>