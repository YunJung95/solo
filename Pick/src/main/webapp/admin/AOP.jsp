<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="/resources/assets/include/header.jsp" %>


<script>
$.morderupdate = function(){	 	 
	
	 var res;
	 res = confirm("회원 결제를 확인하시겠습니까?");	
	 
	 if(res== true){
	 document.frm.method="post";
	 document.frm.action="<%=request.getContextPath()%>/adorderupdatecontroller";
	 document.frm.submit();
	
	 }
}



</script>
<section id="main">
<div class="inner">
<a href="<%=request.getContextPath()%>/adminmaincontroller" class="logo" style="font-size: 30px;   z-index: 10000; ">Admin Page </a>
<a href="<%=request.getContextPath()%>/adminordercontroller" class="logo" style="font-size: 10px;   z-index: 10000; ">Order AdminPage </a>
<br>

<a href="<%=request.getContextPath()%>/adminmembercontroller">회원관리</a>
<a href="<%=request.getContextPath()%>/adminmusiccontroller">음원관리</a>
<a href="<%=request.getContextPath()%>/adminboardcontroller">게시판관리</a>
<a href="<%=request.getContextPath()%>/adminordercontroller">주문관리</a>
 

<form name="frm">
<table style="text-align:center;">

<thead>
 <tr>
 <th>주문일</th>
 <th>사용자아이디</th>
 <th>주문번호</th>
 <th>입금자</th>
 <th>결제수단</th>
 <th>결제금액</th>
 <th>결제상태</th>
 <th>확인</th>

 
 
 </tr> 
</thead>

<c:forEach var="alist" items="${alist}"> 
<tbody>

<tr>
<th>${alist.orderday}</th>
<th>${alist.mid}</th>
<th>${alist.oid}</th>
<th>${alist.oname}</th>
<th>${alist.pmethod}</th>
<th>${alist.ppayment}</th>
<th>${alist.pstatus}</th>
<th>
<input type="hidden"  name="oid" value="${alist.oid}"/>
<c:if test="${alist.pstatus ne 'F'}">
<a href="<%=request.getContextPath()%>/adorderupdatecontroller?oid=${alist.oid}">결제확인</a>
<!-- <input type="button" value="결제확인" class="button alt" onclick="$.morderupdate();">
 -->
 </c:if>
</th>


</tr>	
</tbody>
</c:forEach>
</table>

</form> 
</div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>