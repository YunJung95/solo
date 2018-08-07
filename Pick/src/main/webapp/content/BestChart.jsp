<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/assets/include/header.jsp"%>

<script>
$.selectMusic=function(){
	
	document.frm.method="post";
	document.frm.action="<%=request.getContextPath()%>/checkcontroller";
	document.frm.submit();
	
	
}


</script>

<section id="main">
<div class="inner">
<a href="<%=request.getContextPath()%>/bestchartcontroller" class="logo" style="font-size: 20px;   z-index: 10000; ">소리픽차트 </a>
<hr>
<form name="frm">
<table style=align:center>
<thead>
<tr>
<th>음원순위</th>
<th></th>
<th>음원제목</th>
<th>아티스트</th>
<th></th>
<th><input type="button" value="선택듣기" onclick="$.selectMusic();"></th>
</tr> 
</thead>

<tr>

<c:set var="ii" value="0"/>
<c:forEach var="alist" items="${alist}"> 
<tr>
<th>${ii=ii+1}</th>
<th><img src="displayFile?fileName=${alist.cimg}" width="100" height="300" alt="" class="img-fluid"></th>
<th>${alist.cname}</th>
<th>${alist.cartist}</th>
<th>
<a href="<%=request.getContextPath()%>/checkcontroller?cidx=${alist.cidx}" class="button alt">듣기</a>
<a href="<%=request.getContextPath()%>/infocontroller?cidx=${alist.cidx}" class="button alt">정보</a>
</th>
<th>
<input type="checkbox" id="${alist.cidx}" name="cidx" value="${alist.cidx}"><label for="${alist.cidx}"></label>
</th>
</tr>	

</c:forEach>
</table>
</form>

</div>
</section>

<%@ include file="/resources/assets/include/footer.jsp" %>
