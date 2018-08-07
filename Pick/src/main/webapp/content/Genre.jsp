<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
   ArrayList<ContentVo> alist = (ArrayList<ContentVo>) request.getAttribute("alist");
%>

<section id="main">
<div class="inner">
<a href="<%=request.getContextPath()%>/genrecontroller?caidx=1" class="logo" style="font-size: 20px;   z-index: 10000; ">장르음악</a>
<hr>

<div>               
    <a href="<%=request.getContextPath()%>/genrecontroller?caidx=1">발라드</a>
    <a href="<%=request.getContextPath()%>/genrecontroller?caidx=2">댄스</a>
    <a href="<%=request.getContextPath()%>/genrecontroller?caidx=3">힙합</a>
    <a href="<%=request.getContextPath()%>/genrecontroller?caidx=4">OST</a>
	<a href="<%=request.getContextPath()%>/genrecontroller?caidx=5">그 외</a>        
</div>
<hr>
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

<tbody>
<tr>

<c:set var="ii" value="0"/>
<c:forEach var="alist" items="${alist}"> 
<tbody>
<tr>
<th>${ii=ii+1}</th>
<th><img src="displayFile?fileName=${alist.cimg}" width="100" height="300" alt="" class="img-fluid"></th>
<th>${alist.cname}</th>
<th>${alist.cartist}</th>
<th>
<a href="<%=request.getContextPath()%>/checkcontroller?cidx=${alist.cidx}" class="button alt" >듣기</a>
<a href="<%=request.getContextPath()%>/infocontroller?cidx=${alist.cidx}" class="button alt">정보</a>
<input type="hidden" id="cidx" name="cidx" value="${alist.cidx}"/>
</th>
<th>
<input type="checkbox" id="${alist.cidx}" "name="mcheck"><label for="${alist.cidx}"></label>
</th>
</tr>	
</tbody>
</c:forEach>
</table>
 </div>
</section>

<%@ include file="/resources/assets/include/footer.jsp" %>