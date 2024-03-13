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
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/06_sub01_en.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	
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
	<jsp:include page="../../../include/login_header_en.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	<!--wrap-->
	<div id="wrap">
		
		<!--container-->
			<div id="container">

					<div class="sub_menu">
						<jsp:include page="../../../include/submenu.jsp" flush="true"></jsp:include>

					</div>

					<div id="sub_title">
						<p><c:out value="${childMenuName }"/></p>
					</div>

					<div class="sub_story">

						<div class="left_box">

							<b>Thank you for visiting <strong>Seegene Medical Foundation </strong>website.</b>

							<p style="width:1100px;">Now, as humanity faces the age of homo hundred, we are entering an era in which AI-based diagnostic tests and medical treatment, which were imaginary only a generation ago, will become a reality. The knowledge accumulated from the past and numerous records collected every moment are analyzed to provide optimal treatment and prevention of the disease. As we are moving a step closer to the future where we can be free from the disease, the importance of laboratory medicine is growing further. </p>

							<p style="width:1100px;">With this historical background, Seegene Medical Foundation, specializing in clinical laboratory, is constantly innovating to fulfill its vocation to promote human health. To enable quick and accurate tests, Seegene Medical Foundation built a smart lab equipped with the largest total laboratory automation system in Korea and introduced the 'ONE DAY’ test system that reports test results in one day for the first time in Korea. </p>

							<p>To improve the quality of medical services, Seegene Medical Foundation opened regional laboratory centers equipped with a system and manpower equivalent to the Central Laboratory. Starting with the Busan & Gyeongnam Center in June 2014, Seegene Medical Foundation opened the Daegu & Gyeongbuk Center  in January 2020 , the Gwangju & Honam Center in June 2020, and the Daejeon & Chungcheong Center in February 2022. As a result, Seegene Medical Foundation has established a system that can provide test results anywhere in the country.</p>

							<p>Soon after the outbreak of COVID-19, Seegene Medical Foundation has established a COVID-19 emergency response team, and based on the nation's largest molecular diagnostic testing capabilities, it has provided fast test  results from Seoul, Busan, Daegu, Gwangju, and Daejeon centers, and also operated, ‘Seegene Mobile Lab.’, the state-of-the-art automated mobile laboratory. </p>

							<p>In addition, Seegene Medical Foundation is fulfilling its social responsibilities and expanding a spirit of sharing and coexistence in our society. Even during the COVID-19 pandemic, it has been silently providing diagnostic testing services for the medically underprivileged people in Korea (such as multicultural families, migrant workers, international students, North Korean defectors). Seegene Medical Foundation has also provided volunteer medical services in Vietnam, Cambodia, Kenya, Ukraine, and other countries in collaboration with NGOs. </p>

							<p>Seegene Medical Foundation is committed to disease diagnosis and prevention based on the highest professionalism and trust. Furthermore, It will keep its efforts to improve its testing service to reach a global standard.</p>

							<p><strong>Your continued interest and support will be greatly appreciated. </strong></p>

							<p class="ceo_name">The Chairman of Seegene Medical Foundation<br/><img src="<c:url value='/user/img/sub/ceo-name-en.png'/>" alt="천종기 이사장" /></p>

						</div>

					<!--  	<div class="right_box">
							<img src="<c:url value='/user/img/sub/ceo.png' />" alt="ceo이미지" />
						</div> -->
					</div>

			</div>
			<!--//container End-->
<%-- 			<jsp:include  page="../../../include/rolling.jsp"></jsp:include > --%>

		<div id="top_bt2">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../../../include/footer_en.jsp"></jsp:include >
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
	<jsp:include  page="../../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../../include/fixed_header_en.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
