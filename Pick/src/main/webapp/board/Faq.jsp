<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page import="com.tp.soripick.domain.BoardVo"  %>
 <%@ page import="java.util.ArrayList" %>

  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
  
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
    <li class="active"><a href="<%=request.getContextPath()%>/faq3list">FAQ</a></li>
  	<li><a href="<%=request.getContextPath()%>/qnacome">1:1 문의 하기</a></li>
  	<li><a href="<%=request.getContextPath()%>/mylistqna">문의 내역 보기</a></li>
    </ul>
  </div>
</nav>


<section id="main2">
<div class="inner">

<div  style="  display:  flex;">
<div>
<div class="container" style=" border: 1px solid #dedede; width: 150px; height: 400px;">

<ul class="nav nav-pills nav-stacked" role="tablist" style="list-style: none;">
  <li><a href="<%=request.getContextPath()%>/faq3list">웹사이트</a></li>
  <li><a href="<%=request.getContextPath()%>/faq4list">이용권</a></li>
  <li><a href="<%=request.getContextPath()%>/faq5list">플레이어</a></li>
  <li><a href="<%=request.getContextPath()%>/faq6list">회원/로그인</a></li>
 </ul>
 </div>
</div>
 
 
 
 
<div style="border-radius: 0;
    border-color: #5FCEC0;
    margin-bottom: 2em;
    padding: 1.5em; ">
    
    <div>
<table style="width:  800px;">
<thead>
 <tr>
 <th>번호</th>
 <th>제목</th>

 <th>조회수</th>
 </tr> 
</thead>


<c:forEach var="bv" items="${alist}" varStatus="status"> 
<tbody>
<tr>
<td>${status.index+1}</td>
<td><a href ="<%=request.getContextPath()%>/boardcontnet?bidx=${bv.bidx}">${bv.btitle}</a></td>
<%-- <td>${bv.bdate}
<fmt:parseDate value="${bv.bdate}" var="dateformat" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${dateformat}" pattern="yyyy-MM-dd"/>
</td> --%>
<td>${bv.bhit}</td>
</tr>   
</tbody>
</c:forEach>

<tfoot>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</tfoot>
 </table>

    </div>
</div>

 </div>
 
 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>