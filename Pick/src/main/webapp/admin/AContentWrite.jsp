<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>
<%@ page import="com.tp.soripick.domain.*"%>

<style>
.fileDrop{
	width:50%;
	height : 200px;
	border:1px dotted blue;
	margin:auto;
}

small{
	margin-left: 3px;
	font-weight:bold;
	color:gray;
}

.fileDrop2{
	width:50%;
	height : 200px;
	border:1px dotted blue;
	margin:auto;
}

small2{
	margin-left: 3px;
	font-weight:bold;
	color:gray;
} 
</style>

<%@ include file="/resources/assets/include/header.jsp"%>

<script type="text/javascript">
function check() {

		var formname = document.frm;
		/* if(document.frm.memberId.value =="") 
		지속적 중복되는 if안에 document.frm부분을 변수로 지정하여 중복을 줄인다. 
		각 memberId,Name 부분에 변수를 지정하여 단축시켜 사용해도 상관없음.*/

		if (formname.cname.value == "") {
			alert("음원 제목을 입력하세요");
			formname.cname.focus(); //커서이동
			return;
		} else if (formname.cartist.value == "") {
			alert("아티스트를 입력하세요");
			formname.cartist.focus(); //커서이동
			return;
		} else if (formname.caname.value == "") {
			alert("앨범이름을 입력하세요");
			formname.caname.focus(); //커서이동
			return;
		} else if (formname.ccompany.value == "") {
			alert("소속사를 입력하세요");
			formname.ccompany.focus(); //커서이동
			return;
 		} else if (formname.clyrics.value == "") {
			alert("가사를 입력하세요");
			formname.clyrics.focus(); 
			return;
		} 
		

		var res; 
		res = confirm("음원 등록 하시겠습니까?");

		if (res == true) {
			formname.method = "post"; 
			formname.action = "<%=request.getContextPath()%>/musicinsertaction";
			formname.submit();
			
		}

		return;
		
	}

function addFilePath(msg){
	alert(msg);
	
}

$(document).ready(function(){ 
	
 	$(".fileDrop").on("dragenter dragover",function(event){
 	//	alert("들어왔숑?");
 		
		event.preventDefault();
	//	alert("얘 실행되는건가,,");
		
	}); 

	$(".fileDrop").on("drop",function(event){
	
		//alert("들어온건가,,");
		
		event.preventDefault();
		//alert("얘도 실행되는건가,,");
		
		var files = event.originalEvent.dataTransfer.files;
		//alert("찍히나용"+ files);
		
		var file = files[0];
		//alert("file"+file);
		
//		console.log(file);
		
		var formData = new FormData();
		
		formData.append("file",file);
		
			$.ajax({
				url : "/uploadAjax",
				data : formData,
				dataType : 'text',
				processData : false,
				contentType: false,
				type : 'POST',
				success : function(data){
					
				 	$("#cimg").val(data.replace(/s-/, ""));
					alert(data.replace(/s-/, ""));			 
//					alert(data);
//					alert(checkImageType(data)); 
					var str ="";
  					 if(checkImageType(data)){
						
						str="<div>"
							+"<a href ='displayFile?fileName="+getImageLink(data)+"'>"
							+"<img src='displayFile?fileName="+data+"'/>"
							+getImageLink(data)+"</a><small data-src="+data+">ⓧ</small></div>";		
					}else{
						str = "<div><a href = 'displayFile?fileName="+data+"'>" 
								+ getOriginalName(data)+"</a>"
								+"<small data-src="+data+">ⓧ</small></div>";
					}  
					 
		
/*   		 			 if(checkImageType(data)){
							str = "<div>"
							+"<a href ='displayFile?fileName="+getImageLink(data)+"'>"
							+"<img src='displayFile?fileName"+data+"'/>"+getImageLink(data)+"</a></div>";
					}else {
						str = "<div><a href = 'displayFile?fileName="+data+"'>" 
								+ getOriginalName(data)+"</a></div>";
					}  
					  */
					$(".uploadedList").append(str); 
					
 				/* 	 $(".uploadedList").html("<img src='/resources/imges/"+data+"'>"); 
 													 	//"경로는 하드코딩으로 써놓기.(일단은)/파일이름" ;;일단 확인 해보려고.  */
			}
		});

	});
	
	$(".uploadedList").on("click","small" , function(event){
		
		var that = $(this);
		
		$.ajax({
			
			url:"deleteFile",
			type:"post",
			data:{fileName:$(this).attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result=='deleted'){
					alert("deleted");
					that.parent("div").remove();
				}
			}
			
		});
		
	});
	
	
});

$(document).ready(function(){ 
	
 	$(".fileDrop2").on("dragenter dragover",function(event){
 		
		event.preventDefault();
		
	}); 

	$(".fileDrop2").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		//alert("찍히나용"+ files);
		
		var file = files[0];
		
		
		var formData = new FormData();
		
		formData.append("file",file);
		
			$.ajax({
				url : "/uploadAjax",
				data : formData,
				dataType : 'text',
				processData : false,
				contentType: false,
				type : 'POST',
				success : function(data){
					
				 	$("#cfilename").val(data.replace(/s-/, ""));
					alert(data.replace(/s-/, ""));			 
//					alert(data);
//					alert(checkImageType(data)); 
					var str ="";
  					 if(checkImageType(data)){
						
						str="<div>"
							+"<a href ='displayFile?fileName="+getImageLink(data)+"'>"
							+"<img src='displayFile?fileName="+data+"'/>"
							+getImageLink(data)+"</a><small data-src="+data+">ⓧ</small></div>";		
					}else{
						str = "<div><a href = 'displayFile?fileName="+data+"'>" 
								+ getOriginalName(data)+"</a>"
								+"<small data-src="+data+">ⓧ</small></div>";
					}  
					 
		
/*   		 			 if(checkImageType(data)){
							str = "<div>"
							+"<a href ='displayFile?fileName="+getImageLink(data)+"'>"
							+"<img src='displayFile?fileName"+data+"'/>"+getImageLink(data)+"</a></div>";
					}else {
						str = "<div><a href = 'displayFile?fileName="+data+"'>" 
								+ getOriginalName(data)+"</a></div>";
					}  
					  */
					$(".uploadedList").append(str); 
					
 				/* 	 $(".uploadedList").html("<img src='/resources/imges/"+data+"'>"); 
 													 	//"경로는 하드코딩으로 써놓기.(일단은)/파일이름" ;;일단 확인 해보려고.  */
			}
		});

	});
	
	$(".uploadedList2").on("click","small" , function(event){
		
		var that = $(this);
		
		$.ajax({
			
			url:"deleteFile",
			type:"post",
			data:{fileName:$(this).attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result=='deleted'){
					alert("deleted");
					that.parent("div").remove();
				}
			}
			
		});
		
	});
	
	
});


function checkImageType(fileName){
	
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	
	return fileName.match(pattern);
}


function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;
	}

	var idx = fileName.indexOf("_")+1;
	return fileName.substr(idx);
}

//파일이 이미지일때
function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}
	//위치 폴더뽑기
	var front = fileName.substr(0,12);
	//파일이름뽑기 _는 빼고
	var end = fileName.substr(14);
	
	return front + end;
}



	function getOriginalName(fileName) {

		if (checkImageType(fileName)) {
			return;
		}
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}

	function getImageLink(fileName) {

		if (!checkImageType(fileName)) {
			return;
		}

		var front = fileName.substr(0, 12);
		var end = fileName.substr(14);

		return front + end;

	}

</script>


<section id="main">
<div class="inner">
	<form name="frm" enctype="multipart/form-data">
	<input type="hidden" name="cimg" id="cimg"/>  
	<input type="hidden" name="cfilename" id="cfilename"/>  

		<table>
			<tr>
			<td>음원 제목</td>
			<td><input type="text" name="cname"  size="10"	maxlength="20" /></td>
				
			</tr>
			<tr>
			<td>장르</td>
			<td>
				<select name="caidx">
				<option value="1" selected> 발라드</option> <!-- selected 우선순위선정 -->
				<option value="2"> 댄스</option>
				<option value="3"> 힙합&랩</option>
				<option value="4"> OST</option>
				<option value="5"> 그 외</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>아티스트</td>
				<td><input type="text" name="cartist" size="10"
					maxlength="20" /></td>
			</tr>
			
			<tr>
				<td>앨범이름</td>
				<td><input type="text" name="caname"  size="10"
					maxlength="20" /></td>
			</tr>
			
			<tr>
				<td>소속사</td>
				<td><input type="text" name="ccompany"  size="10"
					maxlength="20" /></td>
			</tr>
			
			<tr>
				<td>음원 국적</td>
				<td>
				<select name="cnat">
				<option value="K" selected> K-POP</option> <!-- selected 우선순위선정 -->
				<option value="P"> POP</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td>음원 가사</td>
				<td><input type="text" name="clyrics"  size="10"/></td>
			</tr>			

				<tr>
					<td colspan=2 align=center>
					<input type="button" name="button" value="등록" onclick="check();"/></td>
				</tr>
			</table>
			
		 <div class='fileDrop'>이미지</div>
		 <div class='uploadedList'></div>
		 <hr>
		 <div class='fileDrop2'>음원등록</div>
		 <div class='uploadedList2'></div>
		</form>
	</div>
</section>


<%@ include file="/resources/assets/include/footer.jsp"%>