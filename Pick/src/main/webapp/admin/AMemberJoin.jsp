<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tp.soripick.domain.MemberVo"  %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="/resources/assets/include/header.jsp" %>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <script>
     $.check = function(){
         //   alert("들옴");
            
            if($("#mid").val() == "") {
                $("#idText").html("아이디 입력하셈");
                $("#mid").focus();
                return;
            }else if($("#mname").val() == "") {
                $("#nameText").html("이름 입력하셈");
                $("#mname").focus();
                return;
            }else if($("#mphone").val() == "") {
                $("#phoneText").html("전번 입력하셈");
                $("#mphone").focus();
                return;
            }else if($("#mbirth").val() == "") {
                $("#mbirthText").html("생년월일 입력하셈");
                $("#mbirth").focus();
                return;
            }else if($("#mpwd").val() == "") {
                $("#mpwdText").html("비번 입력하셈");
                $("#mpwd").focus();
                return;
            }else if($("#mpwd2").val() == "") {
                $("#mpwd2Text").html("비번확인 입력하셈");
                $("#mpwd2").focus();
                return;
            }else if($("#mpwd").val() != $("#mpwd2").val()) {
                alert("비번이 서로 다르다 확인해라");
                //$("#password2Text").html("비번이 서로다름");
                $("#mpwd2").focus();
                return;
            }else if($("#memail").val() == "") {
                $("#memailText").html("이메일 입력하셈");
                $("#memail").focus();
                return;
            }
            
            var res;	  
       		 var df = document.frm;
       	 
       	 	res = confirm("가입하시겠습니까?");
       	 
       		 if (res == true) {
       		 df.method ="post";
       		 df.action ="<%=request.getContextPath()%>/adminjoinaction";
       		 df.submit();  
       	  }
       		
       	return;
        }
     
     </script>

<!-------------------------script----------------------------------------------->


<section id="main">
<div class="inner">
<form role="form" name="frm">
<div class="box-body">
<h1>회원가입</h1>
<div class="form-group">
<div>
<input type="text"  id="mid" name="mid" size="20" maxlength="20"
 style="resize: none; " class="form-control"  placeholder="아이디 입력" rows="1" cols="30" 
 title="특수문자는 사용 불가능 합니다."
 />
 <button type="button" class="btn btn-warning" id="idCheck" >아이디 중복체크</button></div>
	<div id="idText" class="red"></div>
</div>

<div class="form-group">
<div>
<input type="text" name="mname" id="mname" size="20" maxlength="20"
style="resize: none; " class="form-control"  placeholder="이름 입력" rows="1" cols="30" 
 title="실명을 적어주십시오오옹"
/></div>
<div id="nameText" class="red"></div>
</div>


<div class="form-group">
<div>
<input type="number" name="mphone"  size="30"  id="mphone"
style="resize: none; " class="form-control"  placeholder="전화번호 입력" rows="1" cols="30" 
 title="'-'없이 적어주세요" />
 </div>
 <div id="phoneText" class="red"></div>
</div>


<div class="form-group">
<div>
<input type="text" name="mbirth" id="mbirth" size="13" maxlength="13" onchange="inputAge();" 
style="resize: none; " class="form-control"  placeholder="생년월일 입력" rows="1" cols="30" 
 title="'-'없이 적어주세요"  />
</div>
<div id="mbirthText" class="red"></div>
</div>


<div class="form-group">
<div>
<input style="resize: none; " class="form-control" id="mpwd" name="mpwd" placeholder="비밀번호 입력" rows="1" cols="30" 
type="password" title="영문자, 숫자, 특수 기호를 조합한 6자리 이상의 비밀번호를 입력해 주세요." />
</div>
<div id="mpwdText" class="red"></div>
</div>



<div class="form-group">
<div>
<input type="password" name="mpwd2" id="mpwd2" style="resize: none; " class="form-control" 
 placeholder="비밀번호 입력" rows="1" cols="30" 
 title="영문자, 숫자, 특수 기호를 조합한 6자리 이상의 비밀번호를 입력해 주세요." />
 </div>
 <div id="mpwd2Text" class="red"></div>
</div>





<div class="form-group">
<div>
<input type="text" name ="memail" id="memail"  size="20" class="form-control"  />
</div>
<div id="memailText" class="red"></div>
</div>

<div class="form-group">
<select name="mgrade_gm" >
<option value="M" selected> 관리자</option>
</select>
</div>



<div class="form-group">
<input type="button" name="button" value="가입하기" onclick="$.check();" />
<input type="button" value="리셋" onclick="reset();"/>
</div>

</div>


</form>




 </div>
</section>
<%@ include file="/resources/assets/include/footer.jsp" %>