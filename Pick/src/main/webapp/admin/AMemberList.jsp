<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%
   ArrayList<MemberVo> alist = (ArrayList<MemberVo>) request.getAttribute("alist");
%>


<section id="main">


<div class="inner">
<div>
<a href="<%=request.getContextPath()%>/adminmaincontroller" class="logo" style="font-size: 30px;   z-index: 10000; ">Admin Page </a>
<a href="<%=request.getContextPath()%>/adminmembercontroller" class="logo" style="font-size: 10px;   z-index: 10000; ">Member AdminPage </a>
<br>

<a href="<%=request.getContextPath()%>/adminmembercontroller">회원관리</a>
<a href="<%=request.getContextPath()%>/adminmusiccontroller">음원관리</a>
<a href="<%=request.getContextPath()%>/adminboardcontroller">게시판관리</a>
<a href="<%=request.getContextPath()%>/adminordercontroller">주문관리</a>
</div>

<div>
<hr>
<a href="<%=request.getContextPath()%>/adminjoin">관리자계정등록</a>
<a href="<%=request.getContextPath()%>/adminmodify">관리자계정수정</a>
<a href="<%=request.getContextPath()%>/musicdelete">관리자계정삭제</a>
  </div> 
  

 
<table style="text-align:center;">
<thead>
 <tr>
 <th>회원번호</th>
 <th>아이디</th>
 <th>비밀번호</th>
 <th>이름</th>
 <th>폰</th>
 <th>가입일</th>
 <th>이멜</th>
 <th>생년</th>
 <th>권한</th>
 </tr> 
</thead>

<c:forEach var="alist" items="${alist}"> 
<tbody>
<tr>
<th>${alist.midx}</th>
<th>${alist.mid}</th>
<th>${alist.mpwd}</th>
<th>${alist.mname}</th>
<th>${alist.mphone}</th>
<th>${alist.mjoin}</th>
<th>${alist.memail}</th>
<th>${alist.mbirth}</th>
<th>${alist.mgrade_gm}</th>
</tr>	
 </tbody>
 </c:forEach>
 </table>
 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>