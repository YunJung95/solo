<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tp.soripick.domain.MemberVo"  %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="/resources/assets/include/header.jsp" %>


<style>

 	.box-size {
 	    margin: 50px auto;
    	width: 400px;
    	text-align: center;
 	}

	body.input {
	    width: 400px;	
	}
	
	#mpwdText, #mpwdText {
	    width: 400px;	
	}
	
	#button{
	   width: 400px;
	}
	
</style>


<!-------------------------script----------------------------------------------->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <script>
     $.check = function(){
         //   alert("들옴");
            
            if($("#mid").val() == "") {
                $("#idText").html("아이디 입력하세요.");
                $("#mid").focus();
                return;
            }else if($("#mname").val() == "") {
            	$("#idText").html("");
                $("#nameText").html("이름 입력하세요.");
                $("#mname").focus();
                return;
            }else if($("#mphone").val() == "") {
            	$("#nameText").html("");
                $("#phoneText").html("전번 입력하세요. 없으면 0 입력");
                $("#mphone").focus();
                return;
            }else if($("#mbirth").val() == "") {
            	$("#phoneText").html("");
                $("#mbirthText").html("생년월일 입력하세요.");
                $("#mbirth").focus();
                return;
            }else if($("#mpwd").val() == "") {
            	$("#mbirthText").html("");
                $("#mpwdText").html("비밀번호 입력하세요.");
                $("#mpwd").focus();
                return;
            }else if($("#mpwd2").val() == "") {
            	$("#mpwdText").html("");
                $("#mpwd2Text").html("비밀번호 확인 입력하세요.");
                $("#mpwd2").focus();
                return;
            }else if($("#mpwd").val() != $("#mpwd2").val()) {
                //alert("비밀번호가 서로 다르다 확인하세요.");
                $("#mpwd2Text").html("");
                $("#mpwd2Text").html("비밀번호가 다릅니다. 다시 입력해주세요.");
                $("#mpwd2").focus();
                return;
            }/* else if($("#memail").val() == "") {
            	$("#mpwd2Text").html("");
                $("#memailText").html("이메일 입력하세요.");
                $("#memail").focus();
                return;
            }
             */
            
             //회원가입시 아이디 중복 검사 기능 이멜 형식 맞는지 검사함
            var id = $('#memail').val();
            var emailExp = /^[0-9a-zA-Z_\-]+@[0-9a-zA-Z_\-]+(\.[0-9a-zA-Z_\-]+){1,2}$/;// 이메일 정규 표현식    
                  
            console.log(id);
            console.log(!emailExp.test(id));
            if(!emailExp.test(id)){
              	//아이디가 이메일이 아닐때
	            $("#mpwd2Text").html("");
	            $('#memailText').html("이메일 형식이 아닙니다!!");
	            $("#memail").focus();
	            $('#memailText').show();
              	return false;
            } else {
            	$('#memailText').html("이메일 형식입니다!");
   	     	}
            
           
        
            var res;	  
      		var df = document.frm;
      	 
      	 	res = confirm("가입하시겠습니까?");
      	 
      		 if (res == true) {
      		 df.method ="post";
      		 df.action ="<%=request.getContextPath()%>/joinactioncontroller";
      		 df.submit();  
      	  }
       		return false;
        }
     
     </script>

<!-------------------------script----------------------------------------------->


<section id="main">
<div class="inner">
<form role="form" name="frm">
<div class="box-body">
<div class="box-size">
<h1>회원가입</h1>
<div class="form-group">
<div>
<input type="text"  id="mid" name="mid" size="20" maxlength="20"
 style="resize: none; width: 400px; " class="form-control"  placeholder="아이디 입력" rows="1" cols="30" 
 title="특수문자는 사용 불가능 합니다." 
 />
 <!-- <button type="button" class="btn btn-warning" id="idCheck" >아이디 중복체크</button> -->
 </div>
	<div id="idText" class="red"></div>
</div>

<div class="form-group">
<div>
<input type="text" name="mname" id="mname" size="20" maxlength="20"
style="resize: none; width: 400px;" class="form-control"  placeholder="이름 입력" rows="1" cols="30" 
 title="실명을 적어주십시오"
/></div>
<div id="nameText" class="red"></div>
</div>


<div class="form-group">
<div>
<input type="number" name="mphone"  size="30"  id="mphone"
style="resize: none; width: 400px;" class="form-control"  placeholder="전화번호 입력" rows="1" cols="30" 
 title="'-'없이 적어주세요" />
 </div>
 <div id="phoneText" class="red"></div>
</div>


<div class="form-group">
<div>
<input type="text" name="mbirth" id="mbirth" size="13" maxlength="13"
style="resize: none; width: 400px;" class="form-control"  placeholder="생년월일 입력" rows="1" cols="30" 
 title="'-'없이 적어주세요"  />
</div>
<div id="mbirthText" class="red"></div>
</div>


<div class="form-group">
<div>
<input style="resize: none; width: 400px;" class="form-control" id="mpwd" name="mpwd" placeholder="비밀번호 입력" rows="1" cols="30" 
type="password" title="영문자, 숫자, 특수 기호를 조합한 6자리 이상의 비밀번호를 입력해 주세요." />
</div>
<div id="mpwdText" class="red"></div>
</div>



<div class="form-group">
<div>
<input type="password" name="mpwd2" id="mpwd2" style="resize: none; width: 400px;" class="form-control" 
 placeholder="비밀번호 입력" rows="1" cols="30" 
 title="영문자, 숫자, 특수 기호를 조합한 6자리 이상의 비밀번호를 입력해 주세요." />
 </div>
 <div id="mpwd2Text" class="red"></div>
</div>





<div class="form-group">
<div>
<input type="text" name ="memail" id="memail"  size="20" class="form-control" placeholder="이메일 입력" style="resize: none; width: 400px;" />
</div>
<div id="memailText" class="red"></div>
</div>


<script type="text/javascript">

/*  $('#memail').on('change', function() {    
//회원가입시 아이디 중복 검사 기능 이멜 형식 맞는지 검사함
var id = $(this).val();
var emailExp = /^[0-9a-zA-Z_\-]+@[0-9a-zA-Z_\-]+(\.[0-9a-zA-Z_\-]+){1,2}$/;// 이메일 정규 표현식    
   
if(! emailExp.test(id)){
//아이디가 이메일이 아닐때
$("#mpwd2Text").html("");
$('#memailText').html("이메일 형식이 아닙니다!!");
$("#memail").focus();
$('#memailText').show();
return;
}else {
$('#memailText').html("이메일 형식입니다!");	
return;
}
}); */

</script>


<div class="form-group">
<input type="button" name="button" value="가입하기" onclick="$.check();" style="width: 400px;margin-bottom: 20px"/>
<input type="button" name="button" value="리셋" onclick="reset();"  style="width: 400px"/>
</div>

</div>
</form>

 </div>

</section>
<%@ include file="/resources/assets/include/footer.jsp" %>