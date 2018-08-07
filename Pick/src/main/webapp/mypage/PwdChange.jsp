<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>

<section id="main">
<div class="inner">
<form  name="frm"  style=" text-align:  center;">

 <h3>비밀번호 변경</h3>


<div class="form-group">
<div>
<input type="password"  id="pwd" name="pwd" size="20" maxlength="10"
 style="resize: none; margin: 0 auto;" class="form-control"  placeholder="현재 비밀번호 입력" rows="1" cols="10" 
 title="특수문자는 사용 불가능 합니다."
 />
	<div id="pwdText" class="red"></div>
</div>


<div>
<a  class="button alt" onclick="$.change()" id="change" style='width: 500px'>찾기</a>
<div id="buttonText1" class="red"></div>
</div>
</div>



<script type="text/javascript">
     
     //$('#pwd').on('keyup', function() {
    //	 var pwd = $('#pwd').val();
    //	 var pwd_conf = $(this).val()
    	 
   // 	 if($("#pwd").val() == "") {
    //		 $("#pwdText").html("현재 비밀번호 입력하셈");
  //  		 return false;
   // 	 }
 //    });
     	
    
     $(function(){
    	 $.change = function(){
             // alert("들옴");
            
             
             if($("#pwd").val() == "") {
                 $("#pwdText").html("현재 비밀번호 입력하셈");
                 $("#pwd").focus();
                 return false;
             }else {
        		$("#pwdText").html("");
			}
             
             $.ajax({url: "/pwdchangefindcontroller",// url : "/호출할 주소",
      	    	type:"post",
  				data : {
  					pwd : $("#pwd").val() //{ id : "넘겨줄 id값", pw : "넘겨줄 pw값" }
  				},								//dataType:"text", //옵션이므로 JSON으로 받을게 아니면 안써도 됨
  				dataType: "text", //타입 써주니까 됨... text로 쓸때는 return하는게 text라서?
  				error:function(request,status,error){
  			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
  			       },
      	    	success: function(data){
					//alert(data);
      	    		if(data == "NO"){
         	        	$("#pwdText").html(data);
         	        }else {
         	        	$("#buttonText1").html("<div><div>새로운 비밀번호를 입력해주세요</div>"
         	        	+ "<input type='password' name ='mpwd' id='mpwd' style='resize: none; margin: 0 auto;' size='20'maxlength='20' class='form-control' placeholder='새로운 비밀번호 입력'  />"
         	        	+ "<div id='mpwdText' class='red'></div>"
         	        	+ "<input type='password' name ='mpwd2' id='mpwd2' style='resize: none; margin: 0 auto;' size='20'maxlength='20' class='form-control' placeholder='다시 한번 비밀번호 입력'  />"
         	        	+ "<div id='mpwd2Text' class='red'></div>"
         	        	+ "<a  class='button alt' onclick='$.pwdUpdate()' id='pwdUpdatebu'  style='width: 500px'>비밀번호 바꾸기</a>"         	        
         	        	+ "</div>");
         	        	 $('#change').remove();
     				}
      	    	}//success끝
      	    	
  			});//에이젝 끝
 			return;
            } //두번째 함수 끝
             
    	 $.pwdUpdate = function(){ //세번째 함수
     		// alert("비번 바꿀거야?");
     		 $('#change').remove();
     		 if($("#mpwd").val() == "") {
                  $("#mpwdText").html("바꿀 비번 입력하셈");
                  $("#mpwd").focus();
                  return;
              }else if($("#mpwd2").val() == "") {
                  $("#mpwd2Text").html("바꿀 비번 확인 부분 입력하셈");
                  $("#mpwd2").focus();
                  return;
              }else if($("#mpwd").val() != $("#mpwd2").val()) {
                  alert("비번이 서로 다르다 확인해라");
                  //$("#password2Text").html("비번이 서로다름");
                  $("#mpwd2").focus();
                  return;
              }$.ajax({url: "/pwdchangeactioncontroller",// url : "/호출할 주소",
        	    	type:"post",
      				data : {
      					mpwd : $("#mpwd").val() //{ id : "넘겨줄 id값", pw : "넘겨줄 pw값" }
      				},								//dataType:"text", //옵션이므로 JSON으로 받을게 아니면 안써도 됨
      				dataType: "text", //타입 써주니까 됨... text로 쓸때는 return하는게 text라서?
      				error:function(request,status,error){
      			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
      			       },
          	    	success: function(data){
    					alert(data);
          	    		if(data == "NO"){
             	        	$("#mpwd2Text").html(data);
             	        }else {
             	        	$("#mpwd2Text").html("비밀번호가 변경 되었습니다. "
             	        			+"<a href='<%=request.getContextPath()%>/profilecontroller'>MYPAGE</a>");
         				}$('#pwdUpdatebu').remove();
          	    	}//success끝
          	    	
      			});
        		3
        	return;
     	 }

     });//첫번째 함수의 끝

    </script>
    

</form>
 </div>
</section>


<%@ include file="/resources/assets/include/footer.jsp" %>