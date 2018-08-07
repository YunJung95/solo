<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="main">
	<div class="inner">

<h3>나의 곡 리스트</h3>

</script>

<table width="100%" style=align:center>
		
		<tr>
			<td>No</td>
			<td>곡이름</td>
			<td>아티스트</td>
			<td>앨범</td>
			<td>음질</td>
			<td>구매일</td>
		</tr>		

 		<c:set var="ii" value="0"/>
 		<c:set var="i" value="0"/>
		<c:forEach var="mmi" items="${mmi}">      
         <tr>
         <td>${ii=ii+1}</td>
         <td><a href=<%=request.getContextPath()%>/checkcontroller?cidx=${mmi.cidx}>${mmi.cname}</a></td>
         <td>${mmi.cartist}</td>
         <td>${mmi.caname}</td>
         <td>${mmi.cqua}</td>
         <td>${mmi.pregistday}</td>
         </tr>        
		 </c:forEach>  
</table>
</div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>