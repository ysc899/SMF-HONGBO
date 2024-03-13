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
	<link href="<c:url value='/user/css/common.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/06_sub02_en.css?ver=20221209'/>" type="text/css" rel="stylesheet"/>
	
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

							 <!-- <div class="red_bar"><img src="./img/sub/red_bar.png" alt="빨강막대기"></div>

						<span>재단방문 시 참고하세요!
						</span> -->
					</div>

					<div class="sub_story">

						<!-- <ul class="tabs">

							<li class="tab-link current no_bottom _tab_intro" data-tab="tab-1">About the Foundation</li>
							<li class="tab-link no_bottom _tab_ci" data-tab="tab-2">CI</li>

						</ul> -->

						<!--tab menu01-->
						<div id="tab-1" class="tab-content current">

							<div class="inner_content">
								<img src="<c:out value='/user/img/sub/06sub_img02_en.jpg'/>" alt="재단소개이미지"/>
									<div class="inner_box">
										<p>Seegene Medical Foundation is a clinical laboratory in KOREA that provides over 4,000 test services in all fields including routine laboratory tests, molecular diagnosis,
										 diagnostic pathology service, clinical research to nation-wide hospitals, and clinics.</p>
									</div>
							</div>

							<div class="inner_content02">
								<div class="inner_content_dl">
								<dl>
									<dt><img src="<c:out value='/user/img/sub/06sub_ico.png'/>" alt="재단소개아이콘"/><span>Value</span></dt>
									<dd class="dd_title">“Human health and welfare”</dd>
									<dd><img src="<c:out value='/user/img/dot2.png'/>" class="dd_dot" alt="점이미지"/></dd>
									<dd class="dd_text">
										Seegene Medical Foundation has specialists, master &
										PH.D. graduates, medical technologists, etc. to contribute 
										to human health and welfare through accurate testing 
										and innovative research.
									</dd>
								</dl>

								<dl style="margin-left:35px;">
									<dt><img src="<c:out value='/user/img/sub/06sub_ico03.png'/>" alt="재단소개아이콘"/><span>Quality</span></dt>
									<dd class="dd_title">“Perfect quality”</dd>
									<dd><img src="<c:out value='/user/img/dot2.png'/>" class="dd_dot" alt="점이미지"/></dd>
									<dd class="dd_text">
										Seegene Medical Foundation conducts quality control for 
										testing to ensure the reliability of test results. It is 
										standardizing the entire process from sample
										collection to result reporting.
									</dd>
								</dl>
								
								<dl style="height:auto; margin-left:35px;height:300px;">
									<dt><img src="<c:out value='/user/img/sub/06sub_ico02.png'/>" alt="재단소개아이콘"/><span>R&D</span></dt>
									<dd class="dd_title" style="font-size:19px;margin-top:31px;">“Innovative research & development”</dd>
									<dd><img src="<c:out value='/user/img/dot2.png'/>" class="dd_dot" alt="점이미지"/></dd>
									<dd class="dd_text">
										<!-- The Foundation is equipped with state-of-the art automatic equipment and high-end physicochemical analysis equipment to<br/>
										contribute greatly to the early diagnosis and treatment of patients in connection with medical institutions in the country.<br/>
										Since its inception in 1990, the Foundation has participated in the quality management program administered domestically and<br/>
										internationally to make foundation of technology, thinking the quality as the best value and expanding its technology and business<br/>
										scope through business alliance with related organizations.<br/>
										<br/>
										The Foundation is performing consignment test service providing a variety of medical support services including Diagnostic Medical<br/>
										Test, Molecular Diagnostic Test, Pathologic Test, etc. and national projects that provides support services for the research projectes<br/>
										of national organizations, universites, corporate research institues, etc. Through the strategic alliance with Seegene Co.,<br/>
										Ltd., the Foundation is establishing a specialized system as a specialized institution through popularization and differentiation<br/>
										in the field of Multi-molecular diagnostic test. -->
										To diagnose more diseases, for more reliable and 
										advanced tests Seegene Medical Foundation constantly 
										makes its effort into R&D. 
									</dd>
								</dl>
								</div>
							</div>
<!-- 							<div class="inner_content02">
								<div class="inner_content_dl">

								</div>
							</div> -->

						</div>
						<!--//tab menu01 End-->

						<!--tab menu02-->
						<div id="tab-2" class="tab-content">

							<div class="inner_content">
								<p>Symbol</p>
								<span>It symbolizes “seeing a gene” and refers to Seegene Medical Foundation’s innovative and outstanding genetic testing technologies, <br/>
								which can be used to diagnose disease through genetic analysis.</span>
								<img src="<c:out value='/user/img/sub/ci_img01.jpg'/>" class="first" alt="ci이미지"/>
							</div>

							<div class="inner_content">
								<p>Logotype</p>
								<span>The logotype of Seegene Medical Foundation is a linguistic identifier designed to display Seegene Medical Foundatio’s official organization name.<br/>
								Languages other than Korean and English should not be used for the logotype, and capitalized logotypes should also not be used.</span>
								<img src="<c:out value='/user/img/sub/ci_img02.jpg'/>" class="second" alt="ci이미지"/>
							</div>

							<div class="inner_content">
								<p>Signature</p>
								<span>The standards Seegene Medical Foundation logo is a good combination of the symbol and logotype.<br/>
									Considering the space and layout of each applicable, a proper combination may be chosen among the standard options.</span>
								<img src="<c:out value='/user/img/sub/ci_img03_en.jpg'/>" class="three" alt="ci이미지"/>
							</div>

							<div class="inner_content">
								<p>Color system</p>
								<span>The organization color system is critical to the formation of visual images and expression of originality,<br/>
								because unified visual images can be conveyed through the organization’s primary colors. </span>
								<img src="<c:out value='/user/img/sub/ci_img04_en.jpg'/>" class="four" alt="ci이미지"/>
							</div>

						</div>
						<!--//tab menu02 End-->
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
