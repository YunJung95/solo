<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page import="com.tp.soripick.domain.BoardVo"  %>
 <%@ page import="java.util.ArrayList" %>
 
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%
	String sMid = "";	
    if (session.getAttribute("sMid") != null) {
	sMid = (String)session.getAttribute("sMid");
    }	
    
       
%> 

  <style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #5FCEC0; text-decoration: underline;}
</style>


 <link rel="stylesheet" href="../resources/assets/css/category-nav.css" /> 
<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 58px;">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
    <li><a href="<%=request.getContextPath()%>/noticelist" class="active">공지사항</a></li>
    <li><a href="<%=request.getContextPath()%>/faq3list">FAQ</a></li>
  	<li><a href="<%=request.getContextPath()%>/qnacome">1:1 문의 하기</a></li>
  	<li class="active"><a href="<%=request.getContextPath()%>/mylistqna">문의 내역 보기</a></li>
    </ul>
  </div>
</nav>




<script>
function Modify(){	
	document.location.href='<%=request.getContextPath()%>/mypage MAIN로 가야됨';	
	return;
}
</script>


<section id="main2">
<div class="inner">
<%/*  if (sMid == ""){
	out.println("로그인 하세요");
	out.println("<a href ='"+request.getContextPath()+"/joincontroller'>회원가입하기</a>");
	}else{
	out.println(sMid+"님 안녕하세요");
	out.println("<a href ='"+request.getContextPath()+"/logoutcontroller'>로그아웃</a>"+
				"<input type='button' name='button' value='회원정보수정' onclick='Modify();' />");
	} */
 %>
 

 
<% if(sMid != ""){ %> 

    <div>
<table >
<thead>
 <tr>
 <th>번호</th>
 <th>제목</th>
 <th>작성일</th>
 <th>처리현황</th>
 </tr> 
</thead>


<c:forEach var="alist" items="${alist}" varStatus="status"> 
<tbody>
<tr>
<td>${status.index+1}</td>
	<td><a href ="<%=request.getContextPath()%>/qnacontent?bidx=${alist.bidx}">${alist.btitle}</a></td>
<td>

<fmt:parseDate value="${alist.bdate}" var="dateformat" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${dateformat}" pattern="yyyy-MM-dd"/>

</td> 
<td><%-- ${alist.bwaiting_YN} --%>
 ${alist.bwaiting_YN == 'Y' ? '답변 완료' : '답변 대기중'} 
<%-- <c:if test="${bwaiting_YN eq 'Y'}"> <!-- eq == , nq !=  -->
답변완료
</c:if> --%>

<%-- 
<c:set var="bwaiting_YN" value="Y" />

<c:if test="${bwaiting_YN eq 'Y'}">
    답변 완료
</c:if>
<c:if test="${bwaiting_YN eq 'N'}">
    답변 대기중
</c:if>
 --%>
</td>
</tr>   
</tbody>
</c:forEach>

<tfoot>
<tr>
<td></td>
<td></td>
<td><!-- <a href = "#">+ 더보기</a> --></td>
</tr>
</tfoot>
 </table>

    </div>


<% }else { %>
로그인을 하세욤z
<a href="<%=request.getContextPath()%>/joincontroller">회원가입</a>
<a href="<%=request.getContextPath()%>/logincontroller">로그인</a>	
<% } %>



    



 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>