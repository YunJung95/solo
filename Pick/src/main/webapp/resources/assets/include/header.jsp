<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\ "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
		<title>SORI PICK</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/assets/css/main.css" /> <!-- css연결 -->
  	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"><!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Libre+Barcode+128+Text" rel="stylesheet"><!-- 폰트 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script><!-- jquery?? -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script><!-- jquery?? -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"><!--부트스트랩 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> 
	  <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="<%=request.getContextPath()%>/indexcontroller" class="logo" style="font-size: 60px;   z-index: 10000; ">SORI PICK</a>
					<section id="banner">
				<div class="inner">
					<ul class="actions" style=" margin-left: 40px; padding-top: 38px; ">
						<input type="text" name="textfield" placeholder="검색" >
					</ul>
				</div>
			</section>
                   <a href="<%=request.getContextPath()%>/bestchartcontroller">소리픽차트</a>
				    <a href="<%=request.getContextPath()%>/genrecontroller?caidx=1">장르음악 </a>
				    <a href="<%=request.getContextPath()%>/newchartcontroller?caidx=1">최신음악</a>
					<c:if test = "${sMgrade eq 'M'}">	   
				    <a href="<%=request.getContextPath()%>/adminmaincontroller">ADMIN</a>
				   	</c:if>
				
					<nav id="nav">
						<c:choose>
						<c:when test ="${sMidx ne null}">
						<a href="<%=request.getContextPath()%>/profilecontroller">마이페이지</a>						
						<a href="<%=request.getContextPath()%>/logoutcontroller">로그아웃</a>
						</c:when>
						<c:otherwise>
						<a href="<%=request.getContextPath()%>/joincontroller">회원가입</a>
						<a href="<%=request.getContextPath()%>/logincontroller">로그인</a>						
						</c:otherwise>
						</c:choose>
					</nav>
				</div>
			</header>