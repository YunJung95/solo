<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"><!-- bootstrap -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
<section id="main">
<div class="inner">
<form  name="frm">
<div class="container mt-3">
  <a href="<%=request.getContextPath()%>/indexcontroller" class="logo" style="font-size: 60px;   z-index: 10000; 
    font-family: 'Libre Barcode 128 Text', cursive; ">SORI PICK</a>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">아이디 찾기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">비밀번호 찾기</a>
    </li>
  <!--   <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">Menu 2</a>
    </li> -->
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>아이디 찾기</h3>
      

<div class="form-group">
<div>
<input type="text" name="mname" id="mname" size="20" maxlength="10"
style="resize: none; " class="form-control"  placeholder="이름 입력" rows="1" cols="10" 
 title="실명을 적어주십시오오옹"
/></div>
<div id="nameText" class="red"></div>
</div>

<div class="form-group">
<div>
<input type="text" name ="memail" id="memail"  size="20" class="form-control" 
placeholder="이메일 입력"  />
</div>
<div id="memailText" class="red"></div>
</div>

<div>
<a  class="button alt" onclick="$.idCheck()" id="idFind">찾기</a>
<div id="buttonText" class="red"></div>
</div>

    </div><!-- 아이디 찾기 탭 끝 -->

    <script type="text/javascript">
     
    
     $(function(){
    	 $.idCheck = function(){
             // alert("들옴");
             console.log('idcheck runed');
             
              if($("#mname").val() == "") {
                  $("#nameText").html("이름 입력하셈");
                  $("#mname").focus();
                  return;
              }else if($("#memail").val() == "") {
                  $("#memailText").html("이메일 입력하셈z");
                  $("#memail").focus();
                  return;
              }
              return;
           } 
    	 
    	$("#idFind").click(function(){
    		console.log('idFind runed');
    	    $.ajax({url: "/findidactioncontroller",// url : "/호출할 주소",
    	    	type:"post",
				data : {
					mname : $("#mname").val(),  //아이디로 input의 값을 가져옴
					//{ id : "넘겨줄 id값", pw : "넘겨줄 pw값" }
					memail : $("#memail").val() 
				},
															//dataType:"text", //옵션이므로 JSON으로 받을게 아니면 안써도 됨
    	    	success: function(data){

    	        if(data != null){
    	        	$("#buttonText").html(data);
    	        }
    	    }});
    	});
     });
    </script>
    
    
<!-- 비번 찾기 탭 -->   
    
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>비밀번호 찾기</h3>


<div class="form-group">
<div>
<input type="text"  id="mid1" name="mid1" size="20" maxlength="10"
 style="resize: none; " class="form-control"  placeholder="아이디 입력" rows="1" cols="10" 
 title="특수문자는 사용 불가능 합니다."
 />
	<div id="idText1" class="red"></div>
</div>
<div class="form-group">
<div>
<input type="text" name="mname1" id="mname1" size="20" maxlength="10"
style="resize: none; " class="form-control"  placeholder="이름 입력" rows="1" cols="10" 
 title="실명을 적어주십시오오옹"
/></div>
<div id="nameText1" class="red"></div>
</div>
<div class="form-group">
<div>
<input type="text" name ="memail1" id="memail1"  size="20" class="form-control" 
placeholder="이메일 입력"  />
</div>
<div id="memailText1" class="red"></div>
</div>
<div>
<a  class="button alt" onclick="$.pwdCheck()" id="pwdFind">비밀번호 찾기</a>
<div id="buttonText1" class="red"></div>
</div>
    </div>
<!-- 비번 찾기 탭 끝 -->



<script type="text/javascript">
     
    
     $(function(){
    	 $.pwdCheck = function(){
             // alert("들옴");
             console.log('idcheck runed');
             
             if($("#mid1").val() == "") {
                 $("#idText1").html("아이디 입력하셈");
                 $("#mid1").focus();
                 return;
             }else if($("#mname1").val() == "") {
                  $("#nameText1").html("이름 입력하셈");
                  $("#mname1").focus();
                  return;
              }else if($("#memail1").val() == "") {
                  $("#memailText1").html("이메일 입력하셈");
                  $("#memail1").focus();
                  return;
              }
             
             $.ajax({url: "/findpwdcontroller",// url : "/호출할 주소",
     	    	type:"post",
 				data : {
 					mid : $("#mid1").val(), 
 					mname : $("#mname1").val(),  //아이디로 input의 값을 가져옴
 					memail : $("#memail1").val() //{ id : "넘겨줄 id값", pw : "넘겨줄 pw값" }
 				},								//dataType:"text", //옵션이므로 JSON으로 받을게 아니면 안써도 됨
     	    	success: function(data){

     	        if(data == "NO"){
     	        	$("#buttonText1").html(data);
     	        }else {
     	        	$("#buttonText1").html("<div><div>새로운 비밀번호를 입력해주세요</div>"
     	        	+ "<input type='password' name ='mpwd' id='mpwd'  size='20'maxlength='20' class='form-control' placeholder='새로운 비밀번호 입력'  />"
     	        	+ "<div id='mpwdText' class='red'></div>"
     	        	+ "<input type='password' name ='mpwd2' id='mpwd2'  size='20'maxlength='20' class='form-control' placeholder='다시 한번 비밀번호 입력'  />"
     	        	+ "<div id='mpwd2Text' class='red'></div>"
     	        	+ "<a  class='button alt' onclick='$.pwdUpdate()' id='pwdUpdate'>비밀번호 바꾸기</a>"
     	        	+ "</div>");
 				}
     	    }//success끝
 		});//에이젝 끝
			return;
           } //두번째 함수끝
           
    	 
    	 
    	 
    	 $.pwdUpdate = function(){
    		// alert("비번 바꿀거야?");
    		 
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
             }
    		 
    		 var res;	  
       		 var df = document.frm;
       	 
       	 	res = confirm("비번 바꿀거야???????");
       	 
       		 if (res == true) {
       		 df.method ="post";
       		 df.action ="<%=request.getContextPath()%>/updatepwdcontroller";
       		 df.submit();  
       	  }
       		
       	return;
    	 }
     });
     
     
    /*  $('#pwdUpdate').on('keyup', function() {
         var pass       = $('#pass').val();
         var pass_conf    = $(this).val()
         
         if(!(pass_conf)) {
            $('#msg_join_pass').addClass('red');
            $('#msg_join_pass').text('어… 비밀번호가 비었나요?');
            return false;
         }
         
         if(pass == pass_conf) {
            join.password = true;
            $('#msg_join_pass').removeClass('red');
            $('#msg_join_pass').text('오케이, 비밀번호가 일치해요!');
         } else {
            join.password = false;
            $('#msg_join_pass').addClass('red');
            $('#msg_join_pass').text('비밀번호가 일치하지 않아요!');
            
         }
         $('#msg_join_pass').show();
      }) */
     
    </script>
    


  </div>
</div>

</form>
 </div>
</section>
<!-- Footer -->
<%@ include file="/resources/assets/include/footer.jsp" %>