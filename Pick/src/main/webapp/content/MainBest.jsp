<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="main">
<div class="inner">
<a href="<%=request.getContextPath()%>/mainnewchart" class="logo" style="font-size: 20px;   z-index: 10000; ">소리픽차트 </a>
<hr>
<table style=align:center>
<tdead>
<tr>
<td>음원순위</td>
<td>음원제목</td>
<td>음원이미지</td>
<td>아티스트</td>
<td></td>
<td><input type="button" value="선택듣기" onclick="$.selectMusic();"></td>
</tr> 
</tdead>

<tr>

<c:set var="ii" value="0"/>
<c:forEach var="alist" items="${alist}"> 
<tr>
<td>${ii=ii+1}</td>
<td>${alist.cname}</td>
<td><img src="displayFile?fileName=${alist.cimg}" width="150" height="300" alt="" class="img-fluid"></td>
<td>${alist.cartist}</td>
<td>
<a href="<%=request.getContextPath()%>/checkcontroller?cidx=${alist.cidx}" class="button alt">듣기</a>
<a href="<%=request.getContextPath()%>/infocontroller?cidx=${alist.cidx}" class="button alt">정보</a>
</td>
<td>
<input type="checkbox" id="${alist.cidx}" name="mcheck" value="${alist.cidx}"><label for="${alist.cidx}"></label>
</td>
</tr>	

</c:forEach>
</table>


</div>
</section>
<%@ include file="/resources/assets/include/header.jsp" %>