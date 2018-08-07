<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="/resources/assets/include/header.jsp" %>


<%
ArrayList<ContentVo> alist = (ArrayList<ContentVo>) request.getAttribute("alist");
%>

<section id="main">

<div class="inner">
<div>
<a href="<%=request.getContextPath()%>/adminmaincontroller" class="logo" style="font-size: 30px;   z-index: 10000; ">Admin Page </a>
<a href="<%=request.getContextPath()%>/adminmusiccontroller" class="logo" style="font-size: 10px;   z-index: 10000; ">Content AdminPage </a>
<br>

<a href="<%=request.getContextPath()%>/adminmembercontroller">회원관리</a>
<a href="<%=request.getContextPath()%>/adminmusiccontroller">음원관리</a>
<a href="<%=request.getContextPath()%>/adminboardcontroller">게시판관리</a>
<a href="<%=request.getContextPath()%>/adminordercontroller">주문관리</a>
</div>
<div>
<hr>
<a href="<%=request.getContextPath()%>/musicinsert">음원등록</a>
</div>

<table style="text-align:center;">
<thead>
 <tr>
 <th>장르</th>
 <th>음원제목</th>
 <th>아티스트</th>
 <th>소속사</th>
 <th>앨범이름</th>
 <th>음원등록일</th>
 <th>음원국적</th>
 <th>수정</th>
 </tr> 
</thead>


<c:forEach var="alist" items="${alist}"> 
<tbody>
<tr>
<th>${alist.caidx}</th>
<th>${alist.cname}</th>
<th>${alist.cartist}</th>
<th>${alist.ccompany}</th>
<th>${alist.caname}</th>
<th>${alist.creleaseday}</th>
<th>${alist.cnat}</th>
<th>
<a href="<%=request.getContextPath()%>/musicmodify?cidx=${alist.cidx}" class="button small">수정</a>
<a href="<%=request.getContextPath()%>/musicdelete?cidx=${alist.cidx}" class="button small">삭제</a>
</th>
</tr>	
</tbody>
</c:forEach>
</table>
</div>
</section>

<%@ include file="/resources/assets/include/footer.jsp" %>
