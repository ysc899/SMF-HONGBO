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
    <meta property="og:image" content="<c:url value="/user/img/sub/RND01.png"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub02.css'/>" type="text/css" rel="stylesheet"/>
	
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

					<div class="sub_story sub_story_height">
						<ul class="tabs">
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="tab-link no_bottom tab-<c:out value='${status.count }'/>_central _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
<!-- 							<li class="tab-link no_bottom tab-1_central _tab_intro" data-view="intro">사업부 소개</li> -->
<!-- 							<li class="tab-link no_bottom tab-2_central _tab_program" data-view="program">학술지원 프로그램</li> -->
<!-- 							<li class="tab-link no_bottom tab-3_central _tab_research" data-view="research">연구용검사</li> -->
						</ul>
						
						<!--tab menu01-->
						<div class="central01 _contentView _view_intro">

							<div class="sub_summury01">

								<div class="sub_summury01_inner">
									<h1>사업부 소개</h1>
								</div>

								<div class="sub_summury01_inner2">
									<p>R&#38;D 사업본부 에서는</p>
									<span>
										본 재단에서 축적된 의학정보와 진단의학 전문 인력의 인프라·신기술 등을 기반으로 질병관리청·대학교·기업 내 연구소·병원·각종 연구소와 같은 다양한 연구기관과 연구자들로부터 
										정책과제 자료·임상시험 및 연구용 자료로 활용하기 위한 연구개발 과제를 분석하는 업무를 위임받아 엄선된 R&D 연구지원 서비스를 제공하고 있습니다.<br/>
										<br/>
										R&D 연구사업 지원업무는 의뢰기관 또는 연구자와 연구 기획단계에서부터 긴밀하게 협조하여 연구기획·설계·진행과정·결과물 도출·결과 통계처리 
										및 학술발표에 이르기까지 연구수행에 따른 전반적 포트폴리오를 최고의 전문 인력과 함께 진행합니다.<br/>
										<br/>
										또한 연구과제의 다양성과 특이성을 고려한 맞춤형 연구지원 시스템을 구축하여 국내 최초로 R&D 연구사업 전담부서를 운영함으로써 수행기관이나 연구자들의 연구 활동에 실질적인 도움을 드리고 있으며, 
										고객의 요구에 능동적이고 유연하게 대처할 수 있도록 석·박사 등 전문 인력들이 고품질의 맞춤형 서비스를 제공하고 있습니다. 
									</span>
								</div>

							</div>

							<div class="sub_summury02 sub_ani09">
								<div class="sub_summury02_inner">

								<img src="<c:url value='/user/img/sub/RND01.png'/>" class="center_img" alt="central Lab이미지" />

								<div class="box_01">
									<p>환경 보건분야 연구과제 수행</p>
									<small class="small_top">임상화학, 면역, 핵의학 등 일반 임상검사</small>
									<small>분자유전, 세포유전, 미생물, 바이러스 검사</small>
									<small>면역조직병리분야 염색 및 판독 (PD-L1)</small>
								</div>

								<div class="box_02">
									<p>국가연구사업</p>
										<small class="small_top">임상검사 & 자원화 사업</small>
										<small>전국 코호트 사업</small>
										<small>전국 감시망 사업</small>
								</div>

								<div class="box_03">
									<p>생명연구자원 제조부문</p>
										<span>혈액, 동결 및 배양세포, 조직 등에서 각종<br/>
										생명연구자원을 분리 및 보관</span>
								</div>

								<div class="box_04">
									<p>바이오뱅크(Biobanking) 부문</p>
									<span>인체에서 유래된 다양한 생명연구 자원을 적합한<br/>
									조건에 보관하고 시료의 위치, 입 · 출고 현황을<br/>
									체계적으로 관리하는 시스템</span>
								</div>
							</div>

							</div>
						</div>
						<!--//tab01 End-->
						
						<!--tab menu01-->
						<div class="central02 _contentView _view_program">

							<div class="sub_summury01 clinical_tab01">

								<div class="svg_box">
										<?xml version="1.0" encoding="utf-8"?>

										<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
											 y="0px" viewBox="0 0 1133 260" style="enable-background:new 0 0 1133 260;" xml:space="preserve">
										<polyline class="path st1" points="37.22,28.07 37.22,2.59 1099.15,2.59 1099.15,111.04 "/>
										</svg>

										<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
											 y="0px" viewBox="0 0 1133 260" style="enable-background:new 0 0 1133 260;" xml:space="preserve">
										<polyline class="path st2" points="1099.15,231.33 1099.15,257.41 37.22,257.41 37.22,149.56 "/>

										</xml>
								</div>

								<div class="sub_summury01_inner">
									<h1>학술지원 프로그램</h1>
								</div>

								<div class="sub_summury01_inner2">
									<p>최고의 품질에 기반한 고객중심의 맞춤형 R&D 지원서비스 제공</p>
										<span>
											의생명과학은 수많은 연구 데이터를 기초로 하여 입증되며 발전하고 있습니다.<br/>
											저희 씨젠의료재단은 최신 설비 및 특수분석장비, 전용시설을 바탕으로 진단검사의학 및 병리학·핵의학 등<br/>
											다양한 분야의 검사를 수행하며 방대한 양의 의학정보를 생산하고 있으며, 신검사 기술의 개발·컴퓨터 과학· 
											경영기법 등을 통합하여 임상검사 분야 뿐 만 아니라 환경보건 분야 등 사회기반적 연구를 수행하고 있습니다. 
										</span>
								</div>

							</div>

							<div class="sub_summury03 clinical_tab02">

									<dl class="dl05">
										<dt class="dt">01. 국가연구사업</dt>
											<dd>임상검사 & 자원화 사업</dd>
											<dd>전국 코호트 사업</dd>
											<dd>전국 감시망 사업</dd>
									</dl>

									<dl class="dl06">
										<dt style="margin-bottom: 10px;">02. 임상검사 분석사업</dt>
											<dd>임상화학·면역학·핵의학 등<br/>일반 임상검사</dd>
											<dd>분자유전학·세포유전학·미생물학<br/>
											바이러스 검사</dd>
											<dd>조직병리 분야 염색 및 판독 <br/>(PD-L1) </dd>
									</dl>

									<dl class="dl07">
										<dt class="dt2">03. 환경보건 연구사업</dt>
											<dd>생체시료 중 유해물질 분석</dd>
											<dd>산화스트레스 바이오마커 분석</dd>
									</dl>

									<dl class="dl08">
										<dt>04. 임상시험</dt>
											<dd>제약사, 기업, CRO기관</dd>
											<dd>일반임상검사 및 특수면역검사</dd>
											<dd>체외진단용 시약 및 의료기기<br/>
											임상시험검사</dd>
									</dl>

									<dl class="dl09">
										<dt class="dt2">05. 개인연구 지원</dt>
											<dd>석·박사학위 논문용 검사 및 통계 지원</dd>
											<dd>국내외 학술논문 발표용 연구 지원</dd>
									</dl>

									<dl class="dl10">
										<dt class="dt2">06. 유전체 자원제조</dt>
											<dd>혈액, 동결 및 배양세포, 조직 등에서 각종 생명연구자원을 분리 및 보관</dd>
									</dl>

									<dl class="dl11">
										<dt class="dt2">07. 바이오뱅크</dt>
											<dd>다양한 생체 시료를 적합한 조건에 보관하고 시료의 위치, 입출고 관리</dd>
									</dl>

									<dl class="dl12">
										<dt>08. 검체 운송사업 </dt>
											<dd>전국 네트워크를 통한 전국<br/>
											적인 검체 운송 지원</dd>
											<dd>검체 운송 중 온도·습도·위치·진동 <br/>
											모니터링 지원</dd>
									</dl>

							</div>

						</div>
						<!--//tab01 End-->
						
						
						<!--tab menu01-->
						<div class="central03 _contentView _view_research">
							<div class="sub_summury01">

								<div class="sub_summury01_inner">
									<h1>연구용 검사</h1>
								</div>

								<div class="sub_summury01_inner2">
									<p>고객을 위한 Seegene Medical Foundation</p>
										<ul>
											<li>고객중심 마인드를 갖춘 <b>최고의 인력으로 구성</b>되어 있습니다.</li>
											<li>연구계획 단계부터 연구목적에 부합하는 <b>검사항목의 컨설팅 서비스를 제공</b>합니다.</li>
											<li>검사 관련 전문가의 <b>학술지원 서비스</b>를 제공합니다.</li>
											<li>씨젠의료재단의 축적된 노하우에 기반해 <b>샘플링 단계에서부터 보관·운송·검사·결과 제공 단계</b>에 이르기까지<br/>
											Total Service를 지향합니다.</li>
										</ul>
								</div>

							</div>
							
							<div class="sub_summury00">
								<p>연구검사 Work Flow</p>
								<a href="<c:url value='/business/rnd/index.do#program'/>"><img style="max-width:1095px;" src="<c:url value='/user/img/sub/RND02.jpg'/>" alt="RND설계도"/></a>
							</div>

							<div class="box_05">
								<p>Clinical Trial 문의처</p>
								<span><b>E-mail.</b> RND@mf.seegene.com</span>


							</div>

						</div>

						<!--//tab01 End-->
						
						
						
					</div>

			</div>
			<div class="gray_bg2 _contentView _view_program"></div>
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
