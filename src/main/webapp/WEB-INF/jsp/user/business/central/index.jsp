<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <meta property="og:image" content="<c:url value="/user/img/sub/central_lab.png"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub03.css'/>" type="text/css" rel="stylesheet"/>
	
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
						<p class="central_tab"><c:out value="${childMenuName }"/></p>
					</div>

					<div class="sub_story">
						<ul class="tabs">
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="tab-link no_bottom tab-<c:out value='${status.count }'/>_central _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
						
<!-- 							<li class="tab-link no_bottom tab-1_central _tab_intro" data-view="intro">Central Lab 소개</li> -->
<!-- 							<li class="tab-link no_bottom tab-2_central _tab_trial" data-view="trial">Clinical Trial</li> -->
						</ul>
						
						<!--tab menu01-->
						<div class="central01 _contentView _view_intro">

							<div class="sub_summury01">

								<div class="sub_summury01_inner">
									<h1>Central Lab</h1>
								</div>

								<div class="sub_summury01_inner2">
									<p>고품질의 결과를 제공하는 임상시험의 프리미엄 파트너</p>
									<span>
										씨젠의료재단은 30년간 축적한 인프라를 바탕으로 국제적 수준의 분석시스템, 전국적 물류 네트워크를 통해<br/>
										고품질의 결과를 제공하는 임상시험의 프리미엄 파트너입니다.<br/>
										국가의 연구과제를 비롯하여 전국 대학교, 병원 등의 연구용 검사 및 국내외 제약사의 다양한 임상시험에 대하여<br/>
										신뢰 높은 결과를 제공하고 있습니다.
									</span>
<!-- 									<span> -->
<!-- 										씨젠의료재단은 30년간 축적한 인프라를 바탕으로 국제적 수준의 분석시스템,<br/>전국적 물류 네트워크를 통해 고품질의 결과를 제공하는<br/> -->
<!-- 										임상시험의 프리미엄 파트너입니다. 국가의 연구과제를 비롯하여 전국 대학교,<br/>병원 등의 연구용 검사 및 국내외 제약사의 다양한<br/> -->
<!-- 										임상시험에 대하여 신뢰 높은 결과를 제공하고 있습니다. -->
<!-- 									</span> -->
								</div>

							</div>

							<div class="sub_summury02 sub_ani09">
								<div class="sub_summury02_inner">

								<img src="<c:url value='/user/img/sub/central_lab.png'/>" class="center_img" alt="central Lab이미지"/>

								<div class="box_01">
									<p>연구인력과 기술</p>
									<span>임상 연구 전문 과정을 수료한 전문의를 포함하여 30여명의<br/>
									전문의 (진단검사, 병리) 박사들이 관련 분야의<br/>
									<b>정도관리, 분석, 결과해석을 주관하며, 연구와 개발을 통해<br/>
									특수검사를 위한 최첨단 장비 도입과 신기술 개발에 <br/>
									노력</b>하고 있습니다. </span>
								</div>

								<div class="box_02">
									<p>전국네트워크</p>
									<span>전국 30여개의 지점을 통해<br/> <b>어디서나 검체 접수가 가능하며,<br/>
									접수된 검체는 당일 본사에 도착</b><br/>되어 분석이 이루어집니다.</span>
								</div>

								<div class="box_03">
									<p>운송시스템</p>
									<span>분석 전 검체 안정성 확보와 분실에 대한 위험의 배제를 위하여<br/>
									노력하고 있습니다. 검체 안정성 확보를 위해 <b>검체가 외부 온도의<br/>
									<b>영향을 받지 않기 위해 PVC 재질의 운송상자를 이용하고,<br/>
									운송 중 규정온도를 유지할 수 있도록 PCM 물질을 사용하며,<br/>
									운송중의 온도를 모니터링하여 관리합니다.</b></span>
								</div>

								<div class="box_04">
									<p>품질보증</p>
									<span>분석결과의 신뢰를 담보하기 위하여<br/> <b>국내외의 정도관리
									프로그램에<br/> 가입하여 인증을 획득하고 있습니다.</b></span><br/>
									<small class="small_top">미국 CAP 등 국제 인증획득</small>
									<small>진단검사의학재단 등 국내정도관리 인증 획득</small>
								</div>
							</div>
						</div>
					</div>
						<!--//tab01 End-->
						<!--tab menu01-->
<!-- 						<div class="central02 _contentView _view_trial"> -->
						<div class="central02 _contentView _view_trial">

							<div class="sub_summury01 clinical_tab01">

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
									<h1>Clinical Trial</h1>
								</div>

								<div class="sub_summury01_inner2">
									<p>수년간 쌓아온 경험과 노하우를 기반으로 다음과 같은 서비스를 지원합니다.</p>
										<ul>
											<li>임상시험 문의 단계에서부터 <b>전문 코디네이터 배정</b></li>
											<li>각 임상시험의 특성에 맞는 <b>채혈 매뉴얼 작성 및 임상시험실시기관별 교육</b></li>
											<li>임상시험실시기관에서의 채혈과정 중 발생할 수 있는 문제를 최소화 시켜주는 <b>방문 회차별 전용 <br/>Sample Kit를 제작</b></li>
											<li>엄격한 데이터 확인체제 및 <b>On-line</b> 지원</li>
											<li>보관조건이 엄수된 <b>검체운송 및 보관</b></li>
										</ul>
								</div>

							</div>

							<div class="sub_summury03 clinical_tab02">

									<dl class="dl05">
										<dt>검체관리</dt>
											<dd>임상시험의 검체 보관조건 및</dd>
											<dd>특성에 대해 전문적인 지식을 습득한</dd>
											<dd>검체 관리사들이 직접 방문하여</dd>
											<dd>검체를 운송합니다.</dd>
											<dd>운송된 검체는 약속된 기일 동안</dd>
											<dd>지정된 보관 조건에 맞추어</dd>
											<dd>보관이 이루어집니다.</dd>
									</dl>

									<dl class="dl06" style="margin-left: 25px;">
										<dt class="dt">결과관리</dt>
											<dd>일반검사는 검체 의뢰 후</dd>
											<dd>씨젠의료재단 홈페이지를 통해</dd>
											<dd>결과를 확인할 수 있으며,</dd>
											<dd>지정된 ID와 password를</dd>
											<dd>제공하여 비밀을 유지합니다.</dd>
									</dl>

									<dl class="dl07" style="margin-left: 25px;">
										<dt>문서관리</dt>
											<dd>결과 보고 후 분석에 관련된</dd>
											<dd>정보를 제공하며,</dd>
											<dd>의뢰기관의 요청 시 내부정도관리,</dd>
											<dd>외부정도관리에 대한 자료를 제공합니다.</dd>
											<dd>작성된 문서는 상호 계약된</dd>
											<dd>기간 동안 문서보관실에서</dd>
											<dd>안전하게 보관됩니다.</dd>
									</dl>

									<dl class="dl08" style="margin-left: 25px;">
										<dt class="dt04">Sample Kit</dt>
											<dd>임상시험에 사용되는</dd>
											<dd>검체 채취용기, 채취설명서,</dd>
											<dd>인수확인서, Label 등을</dd>
											<dd>Sample kit화 하여</dd>
											<dd>제공해 드립니다.</dd>
									</dl>

							</div>

							<div class="box_05">
								<p>Clinical Trial 문의처</p>
									<span><b>E-mail.</b> RND@mf.seegene.com</span>
									<span class="span_left"><b>Tel</b> 02-2218-9278</span>


							</div>


						</div>
						<!--//tab01 End-->
				</div>
			</div>
			<div class="gray_bg2 _contentView _view_trial"></div>
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
	
	function checkHash(){
		
		if (document.location.hash != ""){     //받아올 해시가 있으면
				var arrHash = new Array();
				var hash = document.location.hash;
				arrHash = hash.split("#");
				
				$("._tab_"+ arrHash[1]).trigger('click');
				
			}else{
				$(".tab-link").first().trigger('click');
			}
		}
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
		});
		
		
		
		$(document).ready(function(){
			$(".tab-link").click(function(){
				
				$(".tab-link").removeClass('current');
				$(this).addClass('current');
				var view = $(this).data('view');
				$("._contentView").hide();
				$("._view_"+view).show();
			});
			
			
			checkHash();
		});
	
	</script>
</body>
</html>
