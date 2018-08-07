<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#hhh{
color : #b3b2a3;}
.red{
color : red;
font-size: 12px;
font-weight:700;}
</style>
<section id="main">
	<div class="inner">
		<center>
			<h2 style="font-size: 30px;">음원 주문완료</h2>
		</center>
		<table width="100%" style="align: center ; text-align: center;"> 
			<tr>
				<td>총결제금액</td>
				<td><h id="hhh">${mo.ppayment}</h></td>
			</tr>
			<tr>
				<td>결제방법</td>
				<td><h id="hhh">${mo.omethod}</h></td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>농협123-4567-8974-43</td>
			</tr>
			<tr>
				<td>예금주명</td>
				<td>(주)소리PICK</td>
			</tr>
			<tr>
				<td>입금자명</td>
				<td><h id="hhh">${mo.oname}</h></td>
			</tr>
		</table>
	
		<center>
			<h2  style="font-size: 20px;">주문이 완료되었습니다.</h2>
			<p class ="red">*'입금자명'과 동일하게 입금해 주세요.</p>
			<a href="<%=request.getContextPath()%>/mypaylistcontroller">내 결제내역 가기</a> &nbsp;&nbsp;&nbsp;
			<a href="<%=request.getContextPath()%>/indexcontroller">소리PICK MAIN으로 가기</a>
		</center>

	</div>
</section>


<%@ include file="/resources/assets/include/footer.jsp"%>