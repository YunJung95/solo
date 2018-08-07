<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/assets/include/header.jsp" %>

<script>
/* jquery */
$.check = function() {
	//alert("함수들옴");
		if($("#mid").val() == "") {
             $("#idText").html("아이디 입력하셈");
             $("#mid").focus();
           return;
    	}else if($("#mpwd").val() == "") {
      		 $("#mpwdText").html("비번 입력하셈");
             $("#mpwd").focus();
		   return false;
            }

	 var res;
	 var form = document.frm;
	  res = confirm("로그인 하시겠습니까?z");
	  
	  	if (res == true) {	
		   	form.method ="post";
		   	form.action ="<%=request.getContextPath()%>/loginactioncontroller";
		   	form.submit();
		   	
		   	return;
	  	}
	  	return ;
}


</script>

<style>

 	.box-size {
 	    margin: 150px auto;
    	width: 400px;
 	}

	body.input {
	    width: 400px;	
	}
	
	#mpwdText, #mpwdText {
	    width: 400px;	
	}
	
	
</style>

<section id="main">
<div class="inner">
<form name="frm">
<div class="box-body">

<div class="box-size">
	<div class="form-group">
	<input type="text" name="mid" id="mid" class="form-control" size="20" maxlength="20" placeholder="Enter ID" />
	<div id="idText" class="red"></div>
	</div>
	<div class="form-group">
	<input type="password" name="mpwd" id="mpwd" class="form-control" size="20" maxlength="20" placeholder="Enter PASSWORD" />
	<div id="mpwdText" class="red"></div>
	</div>

<div class="form-group">
	<button type="button" class="btn btn-primary" onclick="$.check();" style=" width: 500px; height: 44px;">로그인</button> 
</div>
<div>
	<a href = "<%=request.getContextPath()%>/findidcontroller">아이디 | 패스워드 찾기</a>
</div>
</div>

<!-- <div>
	<input type="checkbox" id="useCookie" name="useCookie">
	<label for="useCookie">자동 로그인</label>
</div>
 -->
</form>
</div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>