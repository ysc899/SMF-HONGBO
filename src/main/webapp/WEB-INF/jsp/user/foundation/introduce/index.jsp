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
    <meta property="og:image" content="<c:url value="/user/img/sub/06sub_img01_n.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/06_sub02.css'/>" type="text/css" rel="stylesheet"/>
	
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

							 <!-- <div class="red_bar"><img src="./img/sub/red_bar.png" alt="빨강막대기"></div>

						<span>재단방문 시 참고하세요!
						</span> -->
					</div>

					<div class="sub_story">

						<ul class="tabs">

							<li class="tab-link current no_bottom _tab_intro" data-tab="tab-1">재단소개</li>
							<li class="tab-link no_bottom _tab_ci" data-tab="tab-2">CI</li>

						</ul>

						<!--tab menu01-->
						<div id="tab-1" class="tab-content current">

							<div class="inner_content">
								<img src="<c:out value='/user/img/sub/06sub_img01_n.jpg'/>" alt="재단소개이미지"/>
									<div class="inner_box">
										<p>씨젠의료재단은 진단검사의학, 분자진단 검사, 진단면역 검사, 병리 검사, 연구용 검사 등 전 분야에서 임상진료 및 연구를 위한<br/>
										4,000여 가지 검사 서비스를 전국 병·의원에 제공하는 질병검사 전문의료기관입니다.</p>
									</div>
							</div>

							<div class="inner_content02">
								<div class="inner_content_dl">
								<dl>
									<dt><img src="<c:out value='/user/img/sub/06sub_ico.png'/>" alt="재단소개아이콘"/><span>가치</span></dt>
									<dd class="dd_title">의생명과학의 가장 근원적인 가치기준</dd>
									<dd><img src="<c:out value='/user/img/dot2.png'/>" class="dd_dot" alt="점이미지"/></dd>
									<dd class="dd_text">
										인류의 생명과 건강을 지키기 위해<br/>
										전문의, 석·박사, 임상병리사 등<br/>
										<b>국내 최고 전문가들을 구성하여</b><br/>
										진단의학검사, 분자진단검사, 병리검사 등<br/>
										검체검사 관련 <b>전 분야에 걸친 4,000여개<br/>
										이상의 검사를 진행하여 임상진료 및<br/>
										연구를 위한 진단검사 서비스를<br/>
										전국 의료기관에 제공하고 있다.</b>
									</dd>
								</dl>

								<dl>
									<dt><img src="<c:out value='/user/img/sub/06sub_ico02.png'/>" alt="재단소개아이콘"/><span>연구</span></dt>
									<dd class="dd_title">혁신적인 연구개발</dd>
									<dd><img src="<c:out value='/user/img/dot2.png'/>" class="dd_dot" alt="점이미지"/></dd>
									<dd class="dd_text">
										<b>“정확한 질병검사와 혁신적인 연구개발로<br/>
										인류의 건강과 행복에 기여한다”</b>는<br/>
										미션으로 <b>“세계로 진출하는 글로벌<br/>
										질병검사 전문의료기관”</b>이라는<br/>
										비젼2020을 선포하고,<br/>
										내외부적으로 양적 및 질적목표를<br/>
										달성하기 위해 핵심가치와 행동원칙을<br/>
										전 임직원이 실천하고 있다.
									</dd>
								</dl>

								<dl>
									<dt><img src="<c:out value='/user/img/sub/06sub_ico03.png'/>" alt="재단소개아이콘"/><span>품질</span></dt>
									<dd class="dd_title">최고의 검사품질을 유지</dd>
									<dd><img src="<c:out value='/user/img/dot2.png'/>" class="dd_dot" alt="점이미지"/></dd>
									<dd class="dd_text">
										<b>최첨단 대형 자동화 장비와 고난이도 이화학<br/>
										분석장비 등을 다량 확보하여 전국의 의료기관과 연계,<br/>
										 환자의 조기 진단 및 치료에 크게 이바지하고 있는<br/>
										 씨젠의료재단</b>은 1990년 설립 이래<br/>
										국내외에서 주관하는 정도관리 프로그램에 참여,<br/> 
										검사 품질을 최고의 가치로 생각하는<br/>
										기술력의 토대를 마련하고, 국내외 유관기관들과의<br/>
										업무제휴를 통해 재단의 기술력 및 업무 영역을<br/>
										확대해 나가고 있다.
									</dd>
								</dl>
							</div>

								<div class="inner_box">
									<p>(재)씨젠의료재단은 종합병원 및 일반 병 · 의원 등 의료기관을 대상으로 진단의학검사 · 분자진단검사 · 병리검사 등의 분야에서 <br/>
										검체검사 수탁사업을 운영하며, 국가기관 및 대학 · 기업연구소 등의 연구과제를 위한 검사지원 서비스를 제공하는 국가정책 사업을 진행하고 있습니다. </p>
								</div>

							</div>

						</div>
						<!--//tab menu01 End-->

						<!--tab menu02-->
						<div id="tab-2" class="tab-content">

							<div class="inner_content">
								<p>심볼</p>
								<span>‘유전자(Gene)를 바라보다(See)’라는 형태를 심볼로 나타냈습니다.<br/>
								유전자를 분석하여 질병의 여부를 판별하는 독창적이고 우수한 동시다중 유전자 검사 기술을 상징합니다.</span>
								<img src="<c:out value='/user/img/sub/ci_img01.jpg'/>" class="first" alt="ci이미지"/>
							</div>

							<div class="inner_content">
								<p>로고타입</p>
								<span>로고타입은 심볼마크와 함께 씨젠의료재단의 이미지를 시각적으로 전달하는 가장 기본적인 요소입니다.<br/>
								시그니처 사용 시 한글과 영어 외에 다른 언어로 로고타입으로 사용할 수 없으며, 대문자 조합의 로고타입 사용을 금지합니다.</span>
								<img src="<c:out value='/user/img/sub/ci_img02.jpg'/>" class="second" alt="ci이미지"/>
							</div>

							<div class="inner_content">
								<p>시그니처</p>
								<ul>
									<li>유전체문양은 생명의 근원으로 <b>생명과학의 끊임없는 새로운 진단기술의 개발을 의미</b></li>
									<li>빨강색은 <b>새로움에 대한 도전, 뜨거운 열정 그리고 성공을 향한 강한 의지</b></li>
									<li>새로운 진단기술이 <b>세계를 하나로 연결하는 Globalization으로, 인류의 건강을 증진시키는 원동력을 의미</b></li>
								</ul>
								<img src="<c:out value='/user/img/sub/ci_img03.jpg'/>" class="three" alt="ci이미지"/>
							</div>

							<div class="inner_content">
								<p>색상체계</p>
								<span>색상체계는 기본요소의 하나로서 씨젠의료재단의 고유한 색상이미지를 형성하고 심볼마크 · 로고타입 및 각종 시각매체에 적용하여 씨젠의료재단의 이미지를 전달하는 기능을<br/> 합니다.</span>
								<img src="<c:out value='/user/img/sub/ci_img04.jpg'/>" class="four" alt="ci이미지"/>
							</div>

						</div>
						<!--//tab menu02 End-->


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
		
		checkHash();
	});
	
	</script>
</body>
</html>
