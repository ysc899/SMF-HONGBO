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
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub02_en.css?ver=20221219'/>" type="text/css" rel="stylesheet"/>
	
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
						<p class="central_tab"><c:out value="${childMenuName }"/></p>
					</div>

					<div class="sub_story">
						<ul class="tabs">
 							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
 								<li class="tab-link no_bottom tab-<c:out value='${status.count }'/>_central _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
 							</c:forEach>
<%--							<li class="tab-link no_bottom tab-1_central _tab_intro" data-view="intro">About R&D division</li>--%>
<%--							<li class="tab-link no_bottom tab-2_central _tab_area" data-view="area">R&D division business area</li>--%>
<%--							<li class="tab-link no_bottom tab-2_central _tab_research" data-view="research">Test for research</li>--%>
						</ul>
						
						<!--tab menu01-->
						<div class="central01 _contentView _view_1">


						<div class="sub_summury01 _intro _content_1">
							<p>R&D Support Service</p>
									<span>
										For more reliable and advanced tests,<br/>
										Seegene Medical Foundation is committed to R&D today
									</span>
						</div>

						<div class="sub_summury02 _intro _content_1">
							<p class="sub_p">R&D Business</p>
							<span class="sub_span">Based on accumulated information from research and laboratory medicine experts, R&D Business Division, established in 2004, provides high-quality R&D support services to national institutions, universities, biotechnology-related companies, corporate research institutes, food engineering-related companies, hospitals, etc.
							</span>
						</div>

<!-- 							<div class="sub_summury01">

								<div class="sub_summury01_inner">
									<h1>R&D Business</h1>
								</div>

								<div class="sub_summury01_inner2">
									<span>
										Based on accumulated information from research and laboratory medicine experts, R&D Business Division, established in 2004, provides high-quality R&D support services to national institutions, universities, biotechnology-related companies, corporate research institutes, food engineering-related companies, hospitals, etc.

									</span>
								</div>

							</div> -->

							<div class="sub_summury00">
								<p>Work Flow</p>
								<img style="max-width:1095px;" src="<c:url value='/user/img/sub/RND02_en.jpg'/>" alt="RND설계도"/>
							</div>


							<div class="box_99" style="display: none;">
								<div class="content" style="width:50%;">
									<p class="c1">For more information on R&D support services, Contact</p>
								</div>
								<div class="content pt15" ><span class="c2"><b>E-mail.</b> RND@mf.seegene.com</span> </div>
							</div>
							<div class="box_05" >
								<p>
									For more information on
									R&D support services, Contact
								</p>
								<span><b>E-mail.</b> RND@mf.seegene.com</span>

							</div>

							</div>
						</div>
						<!--//tab01 End-->
						
						<!--tab menu02-->
						<div class="central02 _contentView sub_story _view_2">

							<div class="sub_summury03 clinical_tab02">

									<dl class="dl05">
										<dt class="dt"><img  class="field_ic" src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">National research projects</span></dt>
											<dd>Clinical tests, collection of bio specimens, large-scale <br/>
												national cohorts, national surveillance rnd, viral <br/>
												disease research and infectious disease diagnosis<br/>
												control</dd>

									</dl>

									<dl class="dl06">
										<dt style="margin-bottom: 10px;"><img class="field_ic"  src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">Clinical test analysis</span></dt>
											<dd>Clinical tests and special immunological tests necessary for <br/>various clinical trials</dd>
									</dl>

									<dl class="dl07" style="margin-left:0px;">
										<dt class="dt2"><img  class="field_ic" src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">Environmental health research projects</span></dt>
											<dd>Analysis of harmful substances in bio specimens, <br/>
												analysis of heavy metals, analysis of oxidative stress <br/>
												biomarkers, analysis of metabolites, analysis of <br/>
												environmental hormones and analysis of endocrine <br/>
												disruptors</dd>
									</dl>

									<dl class="dl08">
										<dt style="margin-top: 19px; padding-bottom: 19px;"><img class="field_ic"  src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">Support for clinical research analysis for personal research</span></dt>
											<dd>Research support for master's and Ph.D. degree</dd>
											<dd>Research support for presentations of academic papers at<br/>
												home and abroadanalysis of endocrine disruptors</dd>
									</dl>

									<dl class="dl09">
										<dt class="dt2"><img  class="field_ic" src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">Clinical test analysis for research</span></dt>
											<dd>Special immunological ELISA analysis, molecular <br/>
												diagnosis test (PCR / RT-PCR / NGS), clinical chemistry, <br/>
												immunology, radioimmunology, etc.</dd>
									</dl>

									<dl class="dl10">
										<dt class="dt2"><img  class="field_ic" src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">Biobank</span></dt>
											<dd>Implementation of a system equivalent to National Biobank of Korea</dd>
											<dd>Storage of various biological specimens in appropriate <br/>
												conditions, and control of specimen storage and release</dd>
											<dd>24-hour (uninterruptible power supply system) storage management</dd>
											<dd>Monitoring temperature and humidity in real-time</dd>
									</dl>

									<dl class="dl11" style="margin-left:0px;">
										<dt class="dt2" style="margin-top: 19px; padding-bottom: 19px;"><img class="field_ic"  src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">Production of human biological material resources</span></dt>
											<dd>Production of human biological materials (serum,<br/>
												plasma, DNA, PBMC, cell culture, etc.)</dd>
											<dd>Storage of various biological research resources</dd>
									</dl>

									<dl class="dl12">
										<dt><img class="field_ic" src="<c:url value='/user/img/rnd_icon.png'/>" alt="icon"><span class="field_title">High-quality sample transportation business</span></dt>
											<dd>Real-time temperature and position monitoring</dd>
											<dd>In-house production of a special dedicated sample transport<br/>
												box for each sample</dd>
									</dl>

							</div>

						</div>
						<!--//tab02 End-->
						
					</div>

			</div>
<!-- 			<div class="gray_bg2 _contentView _view_area"></div> -->
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
				$("._contentView").hide();
				$("._view_"+view).show();
			});
			
			
			checkHash();
		});
	
	</script>
</body>
</html>
