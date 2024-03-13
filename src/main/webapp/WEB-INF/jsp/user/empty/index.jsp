<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="viewport" content="width=1280, initial-scale=1, minimum-scale=0.5, user-scalable=yes"/>
<!-- 	<meta name="X-UA-Compatible" content="IE=edge,chrome=1"/> -->
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Expires" content="-1"/>
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/testing.css'/>" type="text/css" rel="stylesheet"/>
	
	<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet"/>
	<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" href="<c:url value='/lib/swiper/dist/css/swiper.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/lib/simplelightbox-master/dist/simple-lightbox.min.css'/>"/>
    
    <script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
    <script src="<c:url value='/lib/swiper/dist/js/swiper.min.js'/>"></script>
    
    <script src="<c:url value='/lib/simplelightbox-master/dist/simple-lightbox.jquery.min.js'/>"></script>
    
	<!--  polyfill -->
	<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
	<!-- axios -->
	<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
    <script src="<c:url value='/user/js/common.js'/>"></script>
	<script src="<c:url value='/js/common-util.js'/>"></script>
    
    
</head>
<style>
header {
margin-left:-70px;
}</style>
<body>
	
	<!--wrap-->
	<div id="wrap">
		<!--header-->
		<jsp:include page="../include/header.jsp" flush="true"></jsp:include>
		<!--header-->
		
		
		<!--container-->
		<div id="container">
			<div class="sub_menu">

				<div id="testing_page">
					<img src="<c:url value='/user/img/testing.jpg'/>" alt="테스팅이미지"/>
					<span class="_gopopup">빠른시일안에 개선하도록 노력하겠습니다.<br/>감사합니다.</span>
				</div>

			</div>

		</div>
		<!--//container End-->
		
		<jsp:include  page="../include/rolling.jsp"></jsp:include >
		
		<!--footer-->
		<jsp:include  page="../include/footer.jsp"></jsp:include >
		<!--//footer End-->
	</div>
	
	<!--quick-menu-->
	<jsp:include  page="../include/quick.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
		<!--popup1-->
	<div id="modal" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">팝업 갤러리 샘플</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"/></b>
			</div>

			<div class="popup_inner" style="width:100%; height:100%;">
				<div style="width:49%; background-color: gray;height:100%; float:left;">
					<img src="<c:url value='/user/img/sub/map_bg44.png'/>" alt="검사실이미지"/>
				</div>
				<div style="width:49%; background-color: yellow;height:100%; float:right;">
				<div class="gallery">
					<a href="<c:url value='/lib/simplelightbox-master/demo/img/full/01.jpg'/>"><img src="<c:url value='/lib/simplelightbox-master/demo/img/thumb/01.jpg'/>" style="width:40%;" alt="" title=""/></a>
					<a href="<c:url value='/lib/simplelightbox-master/demo/img/full/02.jpg'/>"><img src="<c:url value='/lib/simplelightbox-master/demo/img/thumb/02.jpg'/>" style="width:40%;"alt="" title=""/></a>
					<a href="<c:url value='/lib/simplelightbox-master/demo/img/full/03.jpg'/>"><img src="<c:url value='/lib/simplelightbox-master/demo/img/thumb/03.jpg'/>" style="width:40%;"alt="" title=""/></a>
					<a href="<c:url value='/lib/simplelightbox-master/demo/img/full/04.jpg'/>"><img src="<c:url value='/lib/simplelightbox-master/demo/img/thumb/04.jpg'/>" style="width:40%;"alt="" title=""/></a>
					<a href="<c:url value='/lib/simplelightbox-master/demo/img/full/05.jpg'/>"><img src="<c:url value='/lib/simplelightbox-master/demo/img/thumb/05.jpg'/>" style="width:40%;"alt="" title=""/></a>
					<a href="<c:url value='/lib/simplelightbox-master/demo/img/full/06.jpg'/>"><img src="<c:url value='/lib/simplelightbox-master/demo/img/thumb/06.jpg'/>" style="width:40%;"alt="" title=""/></a>
				</div>
				</div>
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("._gopopup").click(function(){
// 			alert('1111');
			$('#modal').stop().fadeIn(300);
			
			$('#modal > .popup_bg , .close_bt').click(function(){
				$('#modal').fadeOut(300);
			});
			
			 var gallery = $('.gallery a').simpleLightbox({navText:    ['&lsaquo;','&rsaquo;']});
		});
		
	});

	</script>
</body>
</html>
