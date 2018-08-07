<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%
   ArrayList<BoardVo> alist = (ArrayList<BoardVo>) request.getAttribute("alist");
%>

<section id="main">
<a href="<%=request.getContextPath()%>/adminboardcontroller" class="logo" style="font-size: 30px;   z-index: 10000; ">Board AdminPage </a>
<div class="inner">

<a href="<%=request.getContextPath()%>/adminjoin">게시판 등록</a>
<a href="<%=request.getContextPath()%>/musicdelete">1:1 문의 리스트</a>
<a href="<%=request.getContextPath()%>/adminmodify">1:1 문의 답변</a>
<table style="text-align:center;">

<thead>
 <tr>
 <th>번호</th>
 <th>분류</th>
 <th>제목</th>
 <th>작성일</th>
 <th>답변여부</th>
 
 </tr> 
</thead>

<c:forEach var="alist" items="${alist}"> 
<tbody>
<tr>
<th>${alist.bidx}</th>
<th>${alist.bcategory}</th>
<th>${alist.btitle}</th>
<th>${alist.bdate}</th>
<th>${alist.bwaiting_YN}</th>

</tr>	
 </tbody>
 </c:forEach>
 </table>
 
 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>