<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="main">
	<div class="inner">

<h3>나의구매정보</h3>

</script>

<table width="100%" style=align:center>
		
		<tr>
			<td>번호</td>
			<td>주문번호</td>
			<td>주문일</td>
			<td>총결제금액</td>
			<td>결제방법</td>
			<td>결제완료일</td>
			<td>입금확인</td>	
		</tr>
		

 		<c:set var="ii" value="0"/>
 		<c:set var="i" value="0"/>
		<c:forEach var="mmi" items="${mmi}">      
         <tr>
         <td>${ii=ii+1}</td>
         <td><a href ="<%=request.getContextPath()%>/myoidetailcontroller?oid=${mmi.oid}">${mmi.oid}</a></td>
         <td>${mmi.orderday}</td>
         <td>${mmi.ppayment}</td>
         <td>${mmi.omethod}</td>
         <td>${mmi.pregistday}</td>
         <td>${mmi.pstatus}</td>
         </tr>        
		 </c:forEach>  
   
</table>
</div>
</section>



<%@ include file="/resources/assets/include/footer.jsp" %>