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
	<link href="<c:url value='/user/css/03_sub02.css'/>" type="text/css" rel="stylesheet"/>
	
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
								<h1>검사의뢰방법</h1>
							</div>

							<div class="sub_summury01_inner2">
								<p>전국적 네트워크를 이용하여 전국 어느 의료기관에서나<br/>
								진료에 필요한 검사 의뢰가 가능합니다.</p>
									<span>최신의 정보기술을 이용한 모바일 접수시스템을 이용하여 현장에서 수거 즉시 접수가 이루어지며 의뢰된 검체의<br/>
									운송과정에서 결과보고까지 철저한 품질관리를 시행하고 있습니다.<br/>
									또한, 완료된 검사 결과는 전국 어느 곳에서나 Online을 통하여 조회할 수 있습니다.</span>
							</div>

						</div>

						<ul>
							<li class="sub_ani11">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number01.png'/>" alt="숫자"/></p>
								<b class="b1">검체 채취</b>
								<span class="sub_span">검체는 검사항목별 지정된 용기에 담아주시고, 검체용기에 환자명 및 기타사항을 반드시 기재하여 주십시오.</span><br/>
								<span>검체는 검사안내서 및 의뢰서를 참고하시어 검사항목에 적합한 검체 및 검체량을 확인해주십시오.</span>
							</li>

							<li class="sub_ani12">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number02.png'/>" alt="숫자"/></p>
								<b class="b2">검사의뢰서작성</b>
								<span class="sub_span2">검사항목에 따라 검사의뢰서를 선택하여 다음사항을 기입하여 주십시오.</span>


									<small class="small_top">- 의뢰기관 정보: 의뢰기관명, 진료과, 의사명 등 기입</small><br/>
									<small>- 환자정보 : 수진자명, 주민번호, 나이, 성별, 차트번호, 혈액형, 임상소견 및 참고사항(임신주수 등) 기입</small><br/>
									<small>- 검사항목 : 의뢰하실 검사항목에 V표 체크 (의뢰서에 없는 검사항목은 의뢰지 하단 기타란에 검사명 기재)</small>
							</li>

							<li class="sub_ani13">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number03.png'/>" alt="숫자"/></p>
								<b class="b3">검체보관 및 운송</b>
								<span class="sub_span3">검체는 지정된 검체보관 방법을 지켜 검사의뢰서와 함께 정리하여 저희 담당직원에게 주시면 안전하게 운송됩니다.</span>
							</li>

							<li class="sub_ani14">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number04.png'/>" alt="숫자"/></p>
								<b class="b4">검사결과보고</b>
								<span class="sub_span4">검사결과는 씨젠의료재단 홈페이지에서 실시간으로 조회가 가능하며, 검사결과지는 익일 또는 검체 수거시에 전달합니다.<br/>
								홈페이지 실시간 조회를 이용하시면 더 편리하게 이용하실 수 있습니다. (홈페이지 결과 조회 창에서 다운받으실 수 있습니다.)<br/>
								일정별(요일별)로 실시하는 검사는 검사일 전날까지 도착된 검사물에 대해 검사를 실시합니다.</span>

							</li>

							<li class="sub_ani15">
								<p class="sub_jemok"><img src="<c:url value='/user/img/sub/number05.png'/>" alt="숫자"/></p>
								<b class="b5">검사항목추가</b>
								<span class="sub_span">의뢰하신 검체에 대해 검사항목을 추가하고자 할 경우에는 씨젠의료재단 홈페이지 검사결과조회 화면에서 고객님께서 직접
								추가신청을 하거나,<br/> 1566-6500 고객행복센터로 연락하여 검사 추가를 하실 수 있습니다. </span>
							</li>

						</ul>


					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<div class="gray_bg2"></div>
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
