<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.tp.soripick.domain.*" %>
<% 
/* String mid = (String)request.getAttribute("mid"); */

MemberVo mv = (MemberVo)request.getAttribute("mlist");	
%>

<style>
.box-body {
    border: solid 1px #5FCEC0;
    width: 450px;
    margin: 30px 0px 0px -60px;
}

.divbox {
	width: 450px;
	margin: 30px 0px 0px 80px;
}

 .botton{
    border-radius: 12px;
    font-size: 12px;
 }
 
</style>

<link rel="stylesheet" href="../resources/assets/css/category-nav.css" /> 
<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 58px;">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
   <li><a href="<%=request.getContextPath()%>/mymusiclistcontroller">나의 곡 리스트</a></li>
  <li><a href="<%=request.getContextPath()%>/mylistqna">1:1 문의 내역</a></li>
  <li><a href="<%=request.getContextPath()%>/mypaylistcontroller">나의 구매 정보</a></li>
  <li><a href="<%=request.getContextPath()%>/pwdchangecontroller">비밀번호 수정</a></li>
    </ul>
  </div>
</nav>

<section id="main2">
<div class="inner">

<form role="form" name="frm" style="display:  -webkit-box;">
<div style="margin-left: 10px;">MYPAGE</div>
<div class="box-body">

회원정보
<div> 
<div>
<label >아이디</label>
 <a><%=mv.getMid() %></a>	  
 </div>

<div>
<label >이름</label>
<a><%=mv.getMname() %></a>
</div>


<div class="form-group">
<label>연락처</label>

<input id="mphone" name="mphone" placeholder="<%=mv.getMphone() %>"  />

<a  class="button alt" onclick="$.phonechange()" id="phonechange">수정하기</a>
<div id="mphoneText" class="red"></div>
</div>

<script type="text/javascript">
$(function(){
	 $.phonechange = function(){
		// alert('왓ㅆ');
		 if($("#mphone").val() == "") {
             $("#mphoneText").html("바꾸시려면 바꿀 연락처를 입력하세요");
             $("#mphone").focus();
             return false;
         }else {
        	 $("#mphoneText").html("");
		}
		 
		  $.ajax({url: "/phonechangecontroller",// url : "/호출할 주소",
   	    	type:"post",
				data : {
					mphone : $("#mphone").val()
				},							
   	    	success: function(data){
			//alert(data);
   	        if(data == "NO"){
   	        	$("#mphoneText").html(data);
   	        }else {
   	        	$("#mphoneText").html("연락처가 변경되었습니다.");
				}
   	    }//success끝
		});//에이젝 끝
		 
	 }// 두번째 함수 끝 (phonechange)
});//첫번째 함수 끝
</script>






<div class="form-group">
<label >이메일</label>

<input id="memail" name="memail" placeholder="<%=mv.getMemail() %>"  />

<a  class="button alt" onclick="$.emailchange()" id="emailchange">수정하기</a>
<div id="memailText" class="red"></div>
</div>

</div>


<script type="text/javascript">
$(function(){
	 $.emailchange = function(){
		// alert('왓ㅆ');
		 if($("#memail").val() == "") {
             $("#memailText").html("바꾸시려면 바꿀 이메일을 입력하세요");
             $("#memail").focus();
             return false;
         }else {
        	 $("#memailText").html("");
		}
		 
		  $.ajax({url: "/emailchangecontroller",// url : "/호출할 주소",
   	    	type:"post",
				data : {
					memail : $("#memail").val()
				},							
   	    	success: function(data){
			//alert(data);
   	        if(data == "NO"){
   	        	$("#memailText").html(data);
   	        }else {
   	        	$("#memailText").html("이메일이 변경되었습니다.");
				}
   	    }//success끝
		});//에이젝 끝
		 
	 }// 두번째 함수 끝 (phonechange)
});//첫번째 함수 끝

//회원가입시 아이디 중복 검사 기능 이멜 형식 맞는지 검사함
$('#memail').on('change', function() {
	  
   var id = $(this).val();
   var emailExp = /^[0-9a-zA-Z_\-]+@[0-9a-zA-Z_\-]+(\.[0-9a-zA-Z_\-]+){1,2}$/;// 이메일 정규 표현식
  
    
   if(! emailExp.test(id)){
      //아이디가 이메일이 아닐때
      $('#memailText').html("이메일 형식이 아닙니다!!");
      $('#memailText').show();
      return;
   }else {
  	 $('#memailText').html("이메일 형식입니다!");	
  	 
	}
   
});
</script>

<button class="botton"  type="button"  onclick="location.href='<%=request.getContextPath()%>/pwdchangecontroller' ">비밀번호 변경하기</button>

</div><!-- 내용 묶어주는 애 닫힘 -->




 <div class="divbox">
    <div  class="box" >
    <a>나의 곡 리스트</a>
   	<button class="botton"  type="button" onclick="location.href='<%=request.getContextPath()%>/mymusiclistcontroller' ">+더보기</button>
    </div>
    <div  class="box">
    <a>1:1 문의 내역</a>
    <button class="botton"  type="button" onclick="location.href='<%=request.getContextPath()%>/mylistqna' ">+더보기</button>
    </div>
   </div>
    

</form>
 </div>
</section>

<%@ include file="/resources/assets/include/footer.jsp" %>