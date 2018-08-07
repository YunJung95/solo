<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="/resources/assets/include/header.jsp" %>

<script>

$.deleteOrder = function(oidx,midx,oid){	
		
		 alert("왜 안ㄴㅏ와?")
	
		 $.ajax({
			url : "/order/"+midx+"/"+oid+"/"+oidx,
			type:"get",
			datatype:"json",
			error : function(){				
				alert("error");
			},
			success:function(data){	
	
				document.location.href='<%=request.getContextPath()%>/indexcontroller';	
			}
		});

}	

$.orderFinish=function(){
	
	if($("#omethod").val()==""){
 		alert("결제방법을 선택해주세요.");
		return;
	}else if($("#oname").val()==""){
		$("#name").html("<font color='red'>입금명을 입력해주세요.</font>");
		$("#oname").focus();
		return;
	}

	 var res;
	 res = confirm("결제하시겠습니까?");
	
	 if (res == true){
		 document.frm.method="post";
		 document.frm.action="<%=request.getContextPath()%>/orderupdatecontroller";
		 document.frm.submit();
	 }
		
}

$.cancel=function(){
	var res;
	 res = confirm("주문을 취소 하시겠습니까?");
	 if (res == true){
		 document.frm.method="post";
		 document.frm.action="<%=request.getContextPath()%>/ordercancelcontroller";
		 document.frm.submit();

	 }
	
}

 
</script>

<section id="main">
<div class="inner">

<form  name="frm">
<input type="hidden" id="ovmidx" name="ovmidx" value="${ov.midx}"/>
<input type="hidden" id="ovoid" name="ovoid" value="${ov.oid}"/> 

<table width="100%" style=align:center>
		
		<center><h4>소리PICK 음원주문</h4></center>
		
		<tr>
			<td>번호</td>
			<td>곡정보</td>
			<td>음질</td>
			<td>금액</td>
			<td> </td>
		</tr>
				
 		<c:set var="ii" value="0"/>
 		<c:set var="i" value="0"/>
		<c:forEach var="alist" items="${alist}">      
         <tr>
         <td>${ii=ii+1}</td>
         <td>${alist.cname}</td>
         <td>${alist.cqua}</td>
         <td>${alist.opayment} </td>
         <td><input type="button" value="삭제" onclick="$.deleteOrder(${alist.oidx},${alist.midx},'${alist.oid}');"></td>  
         </tr>
         <input type="hidden" id="oid" name="oid" value="${alist.oid}"/>
         <input type="hidden" id ="midx" name="midx" value="${alist.midx}"/> 
		 <input type="hidden" id="oidx" name="oidx" value="${alist.oidx}"/>  
      	 <c:set var="i" value="${i=i+alist.opayment}"/>              
   </c:forEach>     		
    
    	
		</table> 
 		<center>
 		 		
 		<div class="orderinput">
 		<hr>
 		<b>상품결제방법</b>
 		<select id= "omethod" name = "omethod" style="width: 240px;display : inline-block;">
 		<option value ="">결제방법을 선택하세요. ▼</option>
 		<option value ="무통장입금">무통장입금</option>
 		</select><br>
 		<b>총 결제 금액</b>
 		<%-- <div id ="totalpay" style=";>700원'ajax'</div> --%>
 		<input type="text"  name="ppayment" style="border:none;width:200px;text-align:center;color:red; display : inline-block; " value="${i}">
 		<hr>
 		
 		<li style="width: 300px;display:inline;">입금자명</li>
 		<input type="text"name="oname" id="oname" style="width:150px; display :inline-block;">
 		<div id="name"></div>
 		<li style="color : #b3b2a3;">계좌 : 농협 123-4567-8974-43 </li>
 		</div>
<br><br> 		
<input type="button" value="결제하기" onclick="$.orderFinish();">
<input type="button" value="취소" onclick="$.cancel();">

</form >
</center>

</div>
</section>

<%@ include file="/resources/assets/include/footer.jsp" %>