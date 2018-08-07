<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/include/header.jsp" %>

<script type="text/javascript">

</script>
<section id="main">
<div class="inner">
<a href="<%=request.getContextPath()%>/adminmaincontroller" class="logo" style="font-size: 30px;   z-index: 10000; ">Admin Page </a>
<hr>

<a href="<%=request.getContextPath()%>/adminmembercontroller">회원관리</a>
<a href="<%=request.getContextPath()%>/adminmusiccontroller">음원관리</a>
<a href="<%=request.getContextPath()%>/adminboardcontroller">게시판관리</a>
<a href="<%=request.getContextPath()%>/adminordercontroller">주문관리</a>
 </div>
</section>



<%@ include file="/resources/assets/include/footer.jsp" %>