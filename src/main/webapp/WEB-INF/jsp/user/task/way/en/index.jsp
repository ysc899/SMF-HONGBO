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
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/03_sub02_en.css'/>" type="text/css" rel="stylesheet"/>
	
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

					<!--sub_story-->
					<div class="sub_story">

						<div class="sub_summury01">

							<div class="svg_box">
								<?xml version="1.0" encoding="utf-8"?>

										<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
											 y="0px" viewBox="0 0 1133 280" style="enable-background:new 0 0 1133 280;" xml:space="preserve">
										<polyline class="path st1" points="37.22,27.41 37.22,3.11 1099.15,3.11 1099.15,108 "/>
										</svg>

										<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
											 y="0px" viewBox="0 0 1133 280" style="enable-background:new 0 0 1133 280;" xml:space="preserve">
										<polyline class="path st2" points="1099.15,254 1099.15,278.89 37.22,277.11 37.22,184.67 "/>
										</svg>

								</xml>
							</div>

							<div class="sub_summury01_inner">
								<h1>How to<br/>request test</h1>
							</div>

							<div class="sub_summury01_inner2">
								<p>Our national network enables any medical<br/>
								institute in the country to request medical tests.</p>
									<span>Reception of specimen is made on site immediately after the collection using the realtime registration<br/>
									system(RRS) with the latest informaion technology. The collected specimen is handled under strict quality<br/>
									management program from the transportation to report of results. In addition, the test results can be<br/>
									viewed online from anywhere in the country.</span>
							</div>

						</div>

						<ul>
							<li class="sub_ani11">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number01.png'/>" alt="숫자"/></p>
								<b class="b1">Specimen collection</b>
								<span class="sub_span">Be sure to place the specimen in the container supplied by Seegene Medical Foundation with patient name and other information on the container. </span><br/>
								<span>Please refer to the test guideline and test request form to check the adequate amount of specimen according the test item.</span>
							</li>

							<li class="sub_ani12">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number02.png'/>" alt="숫자"/></p>
								<b class="b2">Preparation of Test Request Form</b>
								<span class="sub_span2">Please select the Test Request Form according to the test item and fil out the followings.</span>


									<small class="small_top">- Requesting institution : Name of the institution, department, name of physician</small><br/>
									<small>- Patient information : Patient name, age, gender, chart No., blood type, clinical findings and notes (ex, gestational weeks)</small><br/>
									<small>- Test item : Check V mark on the test item to request (For the items not listed on the Request Form,write the test item on the remark column at the bottom of the form)</small>
							</li>

							<li class="sub_ani13">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number03.png'/>" alt="숫자"/></p>
								<b class="b3">Storage and transportation of specimen</b>
								<span class="sub_span3">For safe transportation, please give the collected specimen to our staff in accordance to the storage method along with the Test Request Form.</span>
							</li>

							<li class="sub_ani14">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number04.png'/>" alt="숫자"/></p>
								<b class="b4">Report of test results</b>
								<span class="sub_span4">The test results can be viewed in real time basis on our website and the test result sheet<br/> will be delivered the next day or on the day of specimen collection.<br/>
								It is more convenient to use real time view on our Homepage. (The result can be downloaded from the View Result.) <br/>
								The test performed by schedule (by day) will be carried out for the specimen that has arrived by the day before the test.</span>

							</li>

							<li class="sub_ani15">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number05.png'/>" alt="숫자"/></p>
								<b class="b5">Addition of test item</b>
								<span class="sub_span">To add a test item for the specimen already submitted, visit to our website and add item on the View Result or call Customer Center. (1566-6500) </span>
							</li>

						</ul>


					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<div class="gray_bg2"></div>
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
