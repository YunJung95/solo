<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tp.soripick.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/resources/assets/include/header.jsp"%>

<%
	ArrayList<ContentVo> alist = (ArrayList<ContentVo>) request.getAttribute("alist");
%>

<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #5FCEC0; text-decoration: underline;}
</style>


<script type="text/javascript">
 $.selectMusic=function(){		 
	 document.frm.method="post";
	 document.frm.action="<%=request.getContextPath()%>/checkcontroller";
	 document.frm.submit();	
	
} 
</script>

<section id="main">
	<div class="inner">
		<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
		
		<br>
		<br>
		<h4>New Chart</h4>
		<br>
		
<div id="demo" class="carousel slide" data-ride="carousel">
<!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <!--반복문 돌릴거  -->
      <c:forEach var="alist2" items="${alist2}"> 
	  <a href="<%=request.getContextPath()%>/infocontroller?cidx=${alist2.cidx}"><img src="displayFile?fileName=${alist2.cimg}" width="151" height="151"></a>
	  </c:forEach> 
	</div>
	
	<div class="carousel-item">
      <!--반복문 돌릴거  -->
      <c:forEach var="alist3" items="${alist3}"> 
	  <a href="<%=request.getContextPath()%>/infocontroller?cidx=${alist3.cidx}"><img src="displayFile?fileName=${alist3.cimg}" width="151" height="151"></a>
	  </c:forEach> 
	</div> 
	
	<div class="carousel-item">
      <!--반복문 돌릴거  -->
      <c:forEach var="alist4" items="${alist4}"> 
	  <a href="<%=request.getContextPath()%>/infocontroller?cidx=${alist4.cidx}"><img src="displayFile?fileName=${alist4.cimg}" width="151" height="151"></a>
	  </c:forEach> 
	</div> 
  </div>
  
 
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
		<hr><br>
		<h4>SORI PICK Chart</h4><br>
		<form name="frm">
		<div class="table-wrapper">
		
			<table style="align: center">
				<thead>
					<tr>
						<th>순위</th>
						<th></th>
						<th>제목</th>						
						<th>아티스트</th>
						<th></th>
						<th><input type="button" value="선택듣기"
							onclick="$.selectMusic();"></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<c:set var="ii" value="0" />
						<c:forEach var="alist" items="${alist}">
							<tbody>
								<tr>
									<th>${ii=ii+1}</th>
									<th><img src="displayFile?fileName=${alist.cimg}" width="100" height="300" alt="" class="img-fluid"></th>
									<th><a href="<%=request.getContextPath()%>/checkcontroller?cidx=${alist.cidx}">${alist.cname}</a></th>
									<th>${alist.cartist}</th>
									<th><a
										href="<%=request.getContextPath()%>/checkcontroller?cidx=${alist.cidx}"
										class="button alt">듣기</a> <a
										href="<%=request.getContextPath()%>/infocontroller?cidx=${alist.cidx}"
										class="button alt">정보</a></th>
									<th><input type="checkbox" id="${alist.cidx}"
										name="cidx" value="${alist.cidx}">
										<label for="${alist.cidx}"></label></th>
								</tr>
							</tbody>
						</c:forEach>
			</table>
		</div>
		</form>
		
		<hr>
		<h4>Shortcuts</h4>
		<p>자주묻는 질문외에는 <b color='red'>로그인</b> 후에 이용 가능 합니다.</p>
				
		<div style=" display: flex; ">
		<div style="width: 280px;border-right: solid 1px silver;margin-right: 36px;">
		<img src="/resources/images/내곡정보.png" width="60" height="60">&nbsp;
			<a href="<%=request.getContextPath()%>/mymusiclistcontroller" style=" float:  right;  margin: 0 20px;">내곡정보</a>
		<span style="float:  left;font-size:  12px;float: right;margin-right: 20px; margin-top: -24px;" >내가 구매한 곡 확인 가능합니다</span>
		</div>
		
		<div style="width: 280px;border-right: solid 1px silver;margin-right: 36px;">
		<img src="/resources/images/QNA.png"  width="60" height="60">&nbsp
		<a href="<%=request.getContextPath()%>/mylistqna" style=" float:  right;  margin: 0 20px;">1:1문의</a> 
		<span style="float:  left;font-size:  12px;float: right;margin-right: 20px;  margin-top: -24px;">내 문의 내역을 확인하세요</span> 
    	</div>
    	
    	<div style="width: 280px; margin-right: 36px;">
    	<img src="/resources/images/faq (1).png"  width="60" height="60" />
    	<a href="<%=request.getContextPath()%>/mainpage" style=" float:  right;  margin: 0 20px;">고객센터</a>
    	<span style="float:  left;font-size:  12px;float: right;margin-right: 20px; margin-top: -24px;">공지사항, 자주 물어보는 질문, 1:1문의</span>
		</div>
		</div>
		
		
		
		
<!-- 		
	 	<h4>Actions</h4>
		<ul class="actions">
			<li><a href="#" class="button special">Special</a></li>
			<li><a href="#" class="button">Default</a></li>
			<li><a href="#" class="button alt">Alternate</a></li>
		</ul>
		<ul class="actions small">
			<li><a href="#" class="button special small">Small</a></li>
			<li><a href="#" class="button small">Small</a></li>
			<li><a href="#" class="button alt small">Small</a></li>
		</ul> -->


	</div>
</section>
<%@ include file="/resources/assets/include/footer.jsp"%>
