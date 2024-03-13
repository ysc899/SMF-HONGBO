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
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub01_A_en.css?ver=20221220'/>" type="text/css" rel="stylesheet"/>
	
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
						<ul class="tabs">
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="tab-link no_bottom tab-<c:out value='${status.count }'/>_central _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
						</ul>
						<div class="sub_summury01 _intro _content_1">
							<p>Clinical test</p>
									<span>
										Seegene Medical Foundation provides test results in real <br/>
										time via online anywhere in the country.

									</span>
						</div>

						<div class="sub_summury02 _intro _content_1">
							<p class="sub_p">Clinical test business</p>
							<span class="sub_span">Seegene Medical Foundation provides more than 4,000 test services for clinical practice and research in all fields including routine laboratory tests, molecular diagnosis, diagnostic pathology service, and clinical research to hospitals and clinics nationwide.
								<br/>Clinical test services are available at any of its branches around the country.
							</span>
						</div>

						<div class="sub_summury03 _intro _content_1">

								<dl class="dl01">
									<dt>Sample transport system</dt>
										<dd>Transporting samples at appropriate temperatures</dd>
										<dd>Thoroughly temperature management during transportation</dd>
										<dd>Sample-only boxes suitable for refrigerated and room temperature</dd>
										<dd>Tracking management using GPS technology transportation</dd>
								</dl>

								<dl class="dl02">
									<dt>Mobile reception system (STAR system)</dt>
										<dd>Developed and patented for the first time in the clinical laboratory industry</dd>
										<dd>Registering samples on the server after collection on site</dd>
										<dd>Registration by dedicated receptionists and duplex checks
											<br/>(to minimize human errors)</dd>

								</dl>

								<dl class="dl03" style="margin-left:0px;">
									<dt>Nation-wide network</dt>
										<dd>Branches in major cities around the country</dd>
										<dd>Samples can be collected anywhere in the country</dd>
										<dd>Test results can be viewed offline & online, on mobile devices</dd>
								</dl>

								<dl class="dl04">
									<dt class="dt04">Test services</dt>
										<dd>Laboratory specialists check the details of requests received
											<br/>and process them immediately</dd>
										<dd>Automatic computerized reception using the special program</dd>
										<dd>Establishment of laboratory centers in regional areas
											<br/>and real-time operation of tests</dd>
								</dl>

						</div>

						<div class="sub_summury04 sub_ani00 _intro _content_1">
							<p>System for clinical test</p>
							<img src="<c:url value='/user/img/sub/01sub_img_sim2_en_20221220.jpg'/>" style="max-width:1098px;" alt="검체 접수 및 분류 인력지원에 대한 체계 이미지"/>
						</div>
						
						<!-- 소개 -->

						<div class="sub_summury05 sub_ani00 _intro _content_2">
							<p>Nation-wide branches</p>
							<img src="<c:url value='/user/img/sub/network_en.jpg'/>" style="max-width:1098px;" alt="검체 접수 및 분류 인력지원에 대한 체계 이미지"/>
						</div>
						
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
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../../include/fixed_header_en.jsp"></jsp:include >
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
				$("._intro").hide();
				// $("._network").hide();
				$("._content_"+view).show();
			});

			checkHash();
		});
	
	</script>
</body>
</html>
