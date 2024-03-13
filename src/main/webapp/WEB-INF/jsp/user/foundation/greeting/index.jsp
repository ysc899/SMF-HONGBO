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
    <meta property="og:image" content="<c:url value="/user/img/sns_thumb.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/06_sub01.css'/>" type="text/css" rel="stylesheet"/>
	
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
					</div>

					<div class="sub_story">

						<div class="left_box">

							<h1>안녕하십니까?</h1>
							<b style="width:1100px;">재단법인 씨젠의료재단 홈페이지를 찾아주셔서 감사드립니다.</b>

							<p style="width:1100px;">(재)씨젠의료재단은 정확한 질병검사와 혁신적인 연구개발로 인류의 건강과 행복에 기여하기 위해, 국내 최고의 전문의, 석·박사, 임상병리사 등 800여명의 임직원
								들이 진단검사의학, 분자진단검사, 병리검사, 연구용 검사 등 전 분야에서 임상진료 및 연구를 위한 4,000여 가지 검사 서비스를 전국 병・의원에 제공하는 <strong>글로벌 질병검사 전문의료기관</strong>입니다.</p>

							<p>저희는 국내 분자진단 검사 분야에서 정확하고 신속한 진료를 위해 최초로 전문화 및 자동화된 분자진단검사센터를 운영하는 것은 물론, 하루 만에 검사결과를 제공하는 <strong>'ONE DAY 검사 시스템' 도입</strong>
							으로 환자의 조기진단 및 치료에 큰 역할을 함으로써 의료서비스 질 향상에 많은 변화와 혁신을 이끌어 냈습니다.</p>

							<p>특히, <strong>부산경남 · 대구경북 · 광주호남검사센터 등 지역랩 운영</strong>으로 검체 운송의 안정성을 확보하여 고품질의 검사결과 서비스를 제공하고, 지역 일자리 창출,
								 지역의료 발전 등 지역사회에 차별화된 의료서비스를 제공하고 있습니다.</p>

							<p>또한, 씨젠의료재단은 비영리법인으로서 나눔의가치를 실현하기 위해, <strong>국내를 비롯하여 베트남 농짱씨젠 및 다이안씨젠보건소 건립 · 몽골
								 결핵퇴치 사업, 네팔 지진구호 활동, 필리핀 및 동티모르 의료봉사 그리고 아프리카 케냐의 의료이동봉사까지,</strong> 국내 및 해외 의료취약계층을 위해
								 적극적인 봉사활동을 실천하고, 다양한 사회공헌 프로그램 개발 및 사회봉사기관과 연계를 확대하여 사회봉헌 기업으로써의 역할을 다하고 있습니다.</p>

							<p>지난 2015년에는 재단 설립 26주년을 맞아, 세계로 진출하는 글로벌 질병검사 전문기관이라는 <strong>비전 2020을 선포</strong>하고, 대내외 양적 및 질적 목표를 달성하기 위해 5가지 핵심가치
							(품질경영 · 정도경영 · 인재양성 · 연구개발 · 사회공헌)와 행동원칙(최고지향 · 원칙중시 · 고객중심 · 혁신선도 · 상호존중)을 전 임직원이 실천하며 최상의 의료서비스 제공을 위해
							 노력하고 있습니다.</p>

							<p>앞으로도 씨젠의료재단은 끊임없는 연구와 혁신으로 글로벌 질병검사 전문의료기관으로서 최고의 검사품질과 서비스 수준을 향상 시키는데 선도적 역할을 다하겠습니다.</p>

							<p style="margin-bottom:0;"><strong>씨젠의료재단에 변함없는 관심과 성원을 부탁드립니다.</strong></p>

							<p><strong>감사합니다.</strong></p>

							<p class="ceo_name">재단법인 씨젠의료재단 이사장<img src="<c:url value='/user/img/sub/ceo-name.png'/>" alt="천종기 이사장" /></p>

						</div>

					<!--<div class="right_box">
							<img src="<c:url value='/user/img/sub/ceo.png' />" alt="ceo이미지" />
						</div> -->
					</div>

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
