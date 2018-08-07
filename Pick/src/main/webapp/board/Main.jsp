<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page import="com.tp.soripick.domain.BoardVo"  %>
 <%@ page import="java.util.ArrayList" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <style>
<!--

-->
.mainBox {
  	 display:  -webkit-box;
	 margin-top: 15px;
	 margin-left: 20px
}

 .divbox{
    margin-top: 40px;
    margin-bottom: 20px;
    height: 220px;
 }

 .box{
	border: solid 1px #5FCEC0; 
	border-radius: 12px; 
	width: 200px;
    margin: 0 0 20px 0px;
    height: 100px;
    width: 300px;
 }

 .botton{
    border-radius: 12px;
    font-size: 12px;
 }
 
 .right {
 	margin-right: 40px;
 }
 
 
  
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
  	<li><a href="<%=request.getContextPath()%>/mylistqna">문의 내역 보기</a></li>
    </ul>
  </div>
</nav>


 
<section id="main2">
<div class="inner">



<!-------------------------------------------  ------------------------------------------------------->
<div class="mainBox">
    
    <div class="right">
   <div style="margin:0 auto; padding-left: 40%;">공지사항</div>
<table style="width: 300px;">
<thead>
 <tr>
 <th>번호</th>
 <th>제목</th>
 <th>작성일</th>
 </tr> 
</thead>

<c:forEach var="bv" items="${alist}" varStatus="status"> 
<tbody>
<tr>
<td>${status.index+1}</td>
<td><a href ="<%=request.getContextPath()%>/boardcontnet?bidx=${bv.bidx}">${bv.btitle}</a></td>
<td>
<fmt:parseDate value="${bv.bdate}" var="dateformat" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${dateformat}" pattern="yyyy-MM-dd"/>
<%-- ${dateformat} --%>
<%-- ${bv.bdate} --%>
</td>
</tr>   
</tbody>
</c:forEach>

<tfoot>
<tr>
<td></td>
<td></td>
<td><a href="<%=request.getContextPath()%>/noticelist" >+ 더보기</a></td>
</tr>
</tfoot>
 </table>

    </div>
    
<!-------------------------------------------  ------------------------------------------------------->    
    
    <div  class="right">
  	<div style="margin:0 auto; padding-left: 26%;">자주 물어보는 질문(FAQ)</div>
    <table style="width: 300px;">
<thead>
 <tr>
 <th>번호</th>
 <th>제목</th>
 <th>작성일</th>
 </tr> 
</thead>

<c:forEach var="bv" items="${alist1}"  varStatus="status"> 
<tbody>
<tr>
<td>${status.index+1}</td>
<td><a href ="<%=request.getContextPath()%>/boardcontnet?bidx=${bv.bidx}">${bv.btitle}</a></td>
<td>
<fmt:parseDate value="${bv.bdate}" var="dateformat" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${dateformat}" pattern="yyyy-MM-dd"/>
<%-- ${bv.bdate} --%></td>
</tr>   
</tbody>
</c:forEach>


<tfoot>
<tr>
<td></td>
<td></td>
    <td><a href = "<%=request.getContextPath()%>/faq3list">+ 더보기</a></td>
</tr>
</tfoot>
 </table>

    </div>
    
   <div class="divbox">
    <div  class="box" >
    <a>1:1 문의 하기</a>
   	<button class="botton"  type="button" onclick="location.href='<%=request.getContextPath()%>/qnacome' ">이동하기</button>
    </div>
    <div  class="box">
    <a>1:1 문의 내역</a>
    <button class="botton"  type="button" onclick="location.href='<%=request.getContextPath()%>/mylistqna' ">이동하기</button>
    </div>
   </div>
    
    
</div>


 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>