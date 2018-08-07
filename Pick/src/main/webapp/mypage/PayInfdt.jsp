<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$.paycancel = function(){
	
	 var res;
	 res = confirm("사용자 주문을 취소하시겠습니까?");
	
	 if (res == true){
		 document.frm.method="post";
		 document.frm.action="<%=request.getContextPath()%>/mypagecancelcontroller";
		 document.frm.submit();
	 }
	
}
</script>

<section id="main">
	<div class="inner">
<form name="frm">
		<c:forEach var="mymi" items="${mymi}">      
<table width="100%" style="align : center;">
	
		<center><h2 style="font-size: 30px;">내 주문 상세보기</h2></center>	
		
		<tr>
			<td>No</td>
			<td>곡이름</td>
			<td>음질</td>
			<td>금액</td>
		</tr>
		

 		<c:set var="ii" value="0"/>
 		<c:set var="i" value="0"/>
        <tr>
        <td>${ii=ii+1}</td>
        <td>${mymi.cname}</td>
        <td>${mymi.cqua}</td>
        <td>${mymi.opayment}</td>
        <input type="hidden" id="oid" name="oid" value="${mymi.oid}"/>
        <input type="hidden" id ="midx" name="midx" value="${mymi.midx}"/>
        
        </tr>        
</table>
<hr><br>

	<table style="align: center ; text-align: center;"> 

			<tr>
				<td>주문금액</td>
				<td><h><c:out value="${mymi.ppayment}"/></h></td>
			</tr>
			<tr>
				<td>결제방법</td>
				<td><h><c:out value="${mymi.omethod}"/></h></td>
			</tr>
			<tr>
				<td>입금자명</td>
				<td><h><c:out value="${mymi.oname}"/></h></td>
			</tr>
	</table>
	<c:if test="${mymi.pstatus eq 'I'}">
	<center><input type="button" value="결제취소" onclick="$.paycancel();"></center>
	</c:if>
	
	</c:forEach>  

</form>

</div>
</section>
<%@ include file="/resources/assets/include/footer.jsp" %>