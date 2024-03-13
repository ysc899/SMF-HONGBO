<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>

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
    <meta property="og:title" content=":: <spring:message code="title" /> ::" />
    <meta property="og:url" content="<c:url value='${fullUrl}'/>" />
    <meta property="og:description" content="글로벌 질병검사 전문기관 <c:if test='${not empty urlDesc }'>- <c:out value='${urlDesc }'/> </c:if>" />
    <meta property="og:image" content="<c:url value="/user/img/sub/04_sub02_img_n.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/04_sub02.css?ver=20230721'/>" type="text/css" rel="stylesheet"/>
	
	<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet"/>
	<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" href="<c:url value='/lib/swiper/dist/css/swiper.min.css'/>"/>
    
    <script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
    <script src="<c:url value='/lib/swiper/dist/js/swiper.min.js'/>"></script>
    
	<!--  polyfill -->
	<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
	<!-- axios -->
	<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
    <script src="<c:url value='/user/js/common.js'/>"></script>
	<script src="<c:url value='/js/common-util.js'/>"></script>
    
    
</head>

<body>
		<!--header-->
	<div id="login_header">
	<jsp:include page="../../include/login_header.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	<!--wrap-->
	<div id="wrap">
		
		<!--container-->
			<div id="container">

					<div class="sub_menu">
						<jsp:include page="../../include/submenu.jsp" flush="true"></jsp:include>

					</div>

					<div id="sub_title">
						<p><c:out value="${childMenuName }"/></p>
<!-- 						<p class="vision_title2">검사의뢰·학술문의 <b>1566-6500</b></p> -->
							 <!-- <div class="red_bar"><img src="./img/sub/red_bar.png" alt="빨강막대기"></div>

						<span>재단방문 시 참고하세요!
						</span> -->
					</div>

					<!--sub_story-->
					<div class="sub_story">

						<div class="sub_summury01">
							<div class="svg_box">
								<?xml version="1.0" encoding="utf-8"?>

									<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
										 y="0px" viewBox="0 0 1145 360.89" style="enable-background:new 0 0 1145 360.89;" xml:space="preserve">
									<polyline class="path st1" points="36.7,62.22 36.7,8 1111.07,8 1111.07,144 "/>
									</svg>

									<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
										 y="0px" viewBox="0 0 1145 360.89" style="enable-background:new 0 0 1145 360.89;" xml:space="preserve">
									<polyline class="path st2" points="1111.07,298.67 1111.07,352.89 36.7,352.89 36.7,216 "/>
									</svg>

								</xml>
							</div>

							<div class="sub_summury01_box">

								<div class="sub_summury01_inner">
									<h1>씨젠 Talk</h1>
								</div>

								<div class="sub_summury01_inner2">
									<p><b>고객만족</b>을 위해 최선을 다하는 씨젠 Talk<br/>
											고객의 건강과 행복을 지켜드립니다.</p>
										<span>
											글로벌 질병검사 전문의료기관 씨젠의료재단은 국내·외 의료기관의 요구를 충족하고 질 높은 서비스를<br/>
											제공하기 위해 체계적인 CTI 전산 시스템을 구축하여 병·의원에서 요청하는 검사·학술문의 및 지원업무를<br/>
											씨젠의료재단만의 상담시스템인 씨젠 Talk을 통해 신속 정확하게 답변해 드립니다.
										</span>

								</div>

								<div class="box_05">
									<b>상담시간</b>
										<span>평일 : 오전 8시 ~ 오후 8시</span>
										<img src="<c:url value='/user/img/sub/sil2.png'/>" alt="실"/>
										<span class="span_left">토요일 : 오전 8시 ~ 오후 5시</span>
								</div>

							</div>
						</div>

						<div class="sub_summury02">

							<img src="<c:url value='/user/img/sub/04_sub02_img_n.jpg'/>" alt="씨젠Talk이미지" class="img"/>
<%-- 							<img src="<c:url value='/user/img/sub/04_sub02_img01_2.png'/>" alt="씨젠Talk이미지"/> --%>

						</div>

					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<jsp:include  page="../../include/rolling.jsp"></jsp:include >

		<div id="top_bt">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../../include/footer.jsp"></jsp:include >
		<!--//footer End-->
	</div>
	
	<!--//wrap End-->

	<!-- banner_bg-->
	<div class="banner_box">
		<h1><c:out value="${parentMenuName }"/></h1>
		<div class="banner_bg"></div>
	</div>
	<!--banner_bg End-->
	
	<!--quick-menu-->
	<jsp:include  page="../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../include/fixed_header.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
