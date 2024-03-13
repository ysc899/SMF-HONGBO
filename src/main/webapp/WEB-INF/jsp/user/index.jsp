<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<script type="application/ld+json">
	{
	 "@context": "http://schema.org",
	 "@type": "Organization",
	 "name": "씨젠의료재단",
	 "url": "https://pr.seegenemedical.com/",
	 "sameAs": [
		"https:www.facebook.com/mf.seegene/",
		"https:www.youtube.com/channel/UCusPMVb6AUr0WE1XO1RNZew"
	 ]
	}
</script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="viewport" content="width=1280, initial-scale=1, minimum-scale=0.5, user-scalable=yes"/>
<!-- 	<meta name="X-UA-Compatible" content="IE=edge,chrome=1"/> -->
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Expires" content="-1"/>
	
	<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 0, fn:length(req.requestURI)), req.contextPath)}" />
	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<%-- 	
    <meta property="og:title" content=":: <spring:message code="title" /> ::" />
    <meta property="og:url" content="<c:url value='${fullUrl}'/>" />
    <meta property="og:description" content="정확한 질병검사와 혁신적인 연구개발로 인류의 건강과 행복에 기여합니다" />
    <meta property="og:image" content="<c:url value="/user/img/sns_thumb.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
 --%>
    <title><spring:message code="title" /></title>
    <meta property="og:title" content="씨젠의료재단" />
    <meta name="description" content="정확한 질병검사와 혁신적인 연구개발로 인류의 건강과 행복에 기여합니다" />
    <meta name="og:description" content="정확한 질병검사와 혁신적인 연구개발로 인류의 건강과 행복에 기여합니다" />
    <meta property="og:url" content="<c:url value='${fullUrl}'/>" />
    <meta property="og:image" content="<c:url value="/user/img/sns_thumb.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css?20201415'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/main222.css?ver=20230531'/>" type="text/css" rel="stylesheet"/>
	
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
    
    <!-- 팝업 표츌 방법 변경으로 인한 STYLE -->
    <style>
		.close_area_new{
			position:absolute;
			bottom:-38px;
			/* width:100%; */
			padding: 5px 0;
			background:#fff;
		}
		.close_area_new form{
			float:left;
			cursor:pointer;
			margin-top:2px;
			margin-left:10px;
		}
		
		.close_area_new input{
			cursor:pointer;
			vertical-align:-1px;
			margin-right:0;
		}
		
		.close_area_new label{
			cursor:pointer;
			font-size:11px;
			font-family:'NotoSans',sans-serif;
			font-weight:500;
			color:#aaa;
		}
		
		.close_bt_new{
			float:right;
			cursor:pointer;
			margin-right:10px;
			font-size:14px;
			color:#fff;
			background:#8b0f1d;
			padding:7px 12px;
			border-radius:5px;
		}
	</style>	
    
<script type="text/javascript">
 function immegration() {
	window.open("https://direct.seegenemedical.com/main_kor/");
 }
 
 function popup(url,userId,loginYn,roleType) {
	 
	 if(url.match("cheomsurvey.com")){
		 
		 if(loginYn =="false"){
			 alert("로그인후 이용해주시기 바랍니다.")
			 return;
		 }
		 
		 if(roleType != 1){
			 alert("병원 사용자만 이용 가능합니다.")
			 return;
		 }

		 var address = url+"?userid="+userId;
			
		if(url == "https://direct.seegenemedical.com/main_kor/" ){
			window.open("https://direct.seegenemedical.com/main_kor/");
		}else{
			window.open(address);
		} 		 
		 
	 }else{		 
			if(url == "https://direct.seegenemedical.com/main_kor/" ){
				window.open("https://direct.seegenemedical.com/main_kor/");
			}else{
				window.open(url);
				//location.href=url;
			}
 
	 }
	
}
 
</script>    
</head>
<body>
		<!--header-->
		<jsp:include page="./include/header.jsp" flush="true"></jsp:include>
		<!--header-->

	<!--wrap-->
	<div id="wrap">
		<%-- <input type="text" value="${loginYn}" id="loginYn"/> --%>
		<!-- 슬라이드 메뉴 시작 -->
		<div class="swiper-container">
			<div class="swiper-wrapper">

				<c:forEach items="${result.mainBanners }" var="item" varStatus="status">
				<div class="swiper-slide">
<%-- 					<img src="<c:out escapeXml="false" value='${item.fileContent }'/>" alt="banner" style="width:100%; height:100%;min-width:fit-content;"/> --%>
					<img src="<c:url value='/main/banner/${status.index}.do'/>" alt="banner" style="width:100%; height:100%;min-width:fit-content;"/>

					<div id="banner_story0<c:out value='${status.count}'/>" class="banner_story">
						<p class="banner_title"><c:out value="${item.title }"/></p>

						<c:if test="${ not empty item.title}">
							<img src="<c:url value='/user/img/white_bar.png'/>" alt="하얀색바" class="white_bar"/>
						</c:if>

	 				 	<p class="banner_text"><c:out escapeXml="false" value="${item.content }"/></p>
	 				 	<c:if test="${not empty item.url }">
	 				 		<a href="<c:out value='${item.url }'/>" target="_blank" class="more_a"><p class="more_button">상세정보<img src="<c:url value='/user/img/search2.png'/>" alt="돋보기아이콘"/></p></a>
	 				 	</c:if>
					</div>

				</div>
				</c:forEach>

			</div>

			<!-- 네비게이션 버튼 -->
			<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
		<!-- 슬라이드 메뉴 끝 -->
		
		<!--container-->
		<div id="container">
			<div class="bin_box"></div> 
			<!--SGM_news-->
		
			<%-- <div style="position: relative; left: -275px; top: 85px;">
				<a href="#none" onclick="immegration()"><img style="height: 59px; width: 548px;"src="<c:url value='/user/img/web_banner-left.png'/>" alt="출국자심사"/></a>
			</div> --%>
		
		 	<!-- <div class="SGM_news" style="width: 544px; position: relative; left: 560px; top: -3px; height: 56px" > -->
<%--		 	 <div class="SGM_news" style="background-color: #fdf46a" >--%>
		 	 <div class="SGM_news" >
				<a href="javascript:void(0);"><img src="<c:url value='/user/img/sgm_info.png'/>" alt="sgm정보"/></a>
				<ul id="stock_01" class="stock" style="width: 950px;">
					<li style="width: 950px;">
						<marquee behavior="scroll"  scrollamount="5" direction="left" style="width: 950px;">
							<c:forEach items="${result.rolling }" var="item" varStatus="status">
								<c:if test="${status.count > 1 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								
								<c:choose>
								<c:when test="${empty item.url }">
								<a href="javascript:void(0);" style="width: 950px;"><c:out value="${item.content }"/></a>
								</c:when>
								<c:otherwise>
								<%-- <a href="<c:url value='${item.url}'/>" style="width: 416px;"><c:out value="${item.content }"/><a> --%>
								<%-- <a href="#none" onclick="popup('${item.url}?userId='${userId}')" style="width: 950px;"><c:out value="${item.content }"/></a> --%>
								<a href="#none" onclick="popup('${item.url}','${userId}','${loginYn}','${roleType}')" style="width: 950px;"><c:out value="${item.content }"/></a>
								</c:otherwise>
								</c:choose>
						
							</c:forEach>
						</marquee>
					</li>
				</ul>
			</div>
			<!--//SGM_news End-->

			<!--notice & oneclcik-->
			<div id="n_o">
				<!--//notice-->
				<div class="notice">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1" style="width: 75px;">새소식<c:if test="${result.board1_newYn > 0}"><img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" /></c:if> </li>
						<li class="tab-link" data-tab="tab-2" style="width: 55px;">공문  <c:if test="${result.board2_newYn > 0}"><img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" /></c:if></li>
						<li class="tab-link" data-tab="tab-3" style="width: 105px;">학술제작물  <c:if test="${result.board3_newYn > 0}"><img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" /></c:if></li>
						<li><a href="javascript:void(0);" class="_moreView"><img src="<c:url value='/user/img/plus.png'/>" alt="더보기버튼"/></a></li>
					</ul>
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>

						<!--tab menu01-->
						<div id="tab-1" class="tab-content current">
							<ul>
								<c:if test="${lang == 'ko' }">
									<c:forEach items="${result.board1 }" var="item">
										<li>
											<a href="<c:url value='/board/1/${item.seq }.view'/>" ><c:out value="${item.title}"/></a>
											<c:if test="${item.newFlag == 'Y' }">
												<img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" />
											</c:if>
											<%-- <span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></span> --%>
											<span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></span>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						<!--//tab munu01 End-->

						<!--tab menu02-->
						<div id="tab-2" class="tab-content">
							<ul>
								<c:forEach items="${result.board2 }" var="item">
									<li>
										<a href="<c:url value='/customer/notice/${item.seq }.view'/>" ><c:out value="${item.noticeNumber}"/><c:out value="${item.title}"/></a>
										<c:if test="${item.newFlag == 'Y' }">
											<img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" />
										</c:if>
										<%-- <span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></span> --%> 
											<span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></span>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!--//tab menu02 End-->

						<!--tab menu03-->
						<div id="tab-3" class="tab-content">
							<ul>
								<c:forEach items="${result.board3 }" var="item">
									<li>
										<a href="javascript:void(0);" class="_viewWebzine" data-url="<c:out value='${item.url }'/>"><c:out value="${item.title}"/></a>
										<c:if test="${item.newFlag == 'Y' }">
											<img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" />
										</c:if>
										<%-- <span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></span> --%>
										<span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></span>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!--//tab menu03 End-->

				</div>
				<!--//notice End-->

				<!--one_click-->
				<div class="one_click">

					<div class="one_click_box">
						<span class="one_click_title">ONE CLICK 건강정보 <c:if test="${result.oneClick_newYn > 0}"><img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" /></c:if></span>
						<p><a href="javascript:void(0);" class="_moreOneClick"><img src="<c:url value='/user/img/plus.png'/>" alt="더보기버튼"/></a></p>
					</div>
					<ul>
						<c:forEach items="${result.healthInfos }" var="item" varStatus="status">
							<li>
								<a href="<c:url value='/customer/healthinfo/${item.seq }.view'/>" >
									<img src="<c:out escapeXml="false" value='${item.imgTitleThumContent }'/>" alt="<c:out value="${item.title}"/>"/>
									<p>
									 <font size="2px;"><c:out value="${item.title}"/></font> 
									<c:if test="${item.newFlag == 'Y' }">
										<img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" />
									</c:if>
									</p>
									<span><c:out value="${item.subTitle}"/></span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--//one_click End-->
			</div>
			<!--//notice & oneclick End-->

		<div class="rolling_all">

			<div id="rolling_banner_box">
			<div class="sub_menu2 rolling_banner">
				<c:forEach items="${result.subBanners }" var="item">
				<c:choose>
					<c:when test="${empty item.url }">
					<a href="javascript:void(0);">
				</c:when>
				<c:otherwise>
					<a href="<c:out value='${item.url }'/>" target="_blank" class="imgs">
				</c:otherwise>
				</c:choose>
					<dl>
						<dt><img src="<c:out escapeXml="false" value='${item.fileContent }'/>" alt="sub image" class="sub_img"/></dt>
						<dd class="sub_title"><c:out value="${item.title }"/> <c:if test="${item.newYn == 'Y'}"><img src="<c:url value='/user/img/new_ico.png'/>" alt="아이콘" style="width:14px;vertical-align:-1px;" /></c:if></dd>
						<dd><img src="<c:url value='/user/img/red_bar.png'/>" alt="바" class="bar" style="padding-top:10px;"/></dd>
						<dd class="sub_text"><c:out escapeXml="false" value="${item.content }"/></dd>
					</dl>
				</a>
				</c:forEach>

			</div>
			</div>
			
			<div class="R_main_prev"><img src="/user/img/arrow_efefef_prev2.png" alt="이전화살표"/></div>
			<div class="R_main_next"><img src="/user/img/arrow_efefef_next2.png" alt="다음화살표"/></div>
		</div>

		</div>
				
		<video width="640" height="360" controls autoplay>
		    <source src="/user/video/test.mp4" type="video/mp4">
		    Your browser does not support the video tag.
		</video>
		<!--//container End-->
		
		<jsp:include  page="./include/rolling.jsp"></jsp:include >
		
		<!--footer-->
		<jsp:include  page="./include/footer.jsp"></jsp:include >
		<!--//footer End-->
	</div>

	<!--quick-menu-->
	<jsp:include  page="./include/quick.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
<c:if test="${not empty result.popups }">
<!--메인팝업-->
<div id="main_modal" class="main_modal" style="display: none;">
<div id="popup" <c:if test="${fn:length(result.popups) == 1 }"> style="height:auto;"</c:if>  >
	<div class="popup_inner">
			<table id="popupTable">
			<tbody id="tbody">
				<tr class="main_panel"> 
					<c:forEach var="item" items="${result.popups}" varStatus="status">
						<td id="popup_${status.count}">
							<a href="#none" style="cursor: pointer;" onclick="moveLink('${item.url}','${item.codeLoginType}','${loginYn}')">
								<img src="<c:out escapeXml="false" value='${item.fileContent}'/>" style="width:${item.popupImageWidth}px; height: ${item.popupImageHeight}px;"/>
							</a>
							<div class="close_area_new" style="width: ${item.popupImageWidth}px;">
								<form method="post" action="" name="register" id="main_popup_form">
									<input type="checkbox" id="7_close_${status.count}" name="7_close"/>
									<!-- <label for="7_close">일주일동안 띄우지않기</label> -->
									<label for="7_close_${status.count}">하루 동안 보이지 않기</label>
								</form>
								<span class="close_bt_new" onclick="closePop('${status.count}')">닫기</span>
							</div>
							<%-- <div style="width:${item.popupImageWidth}px; height: 30px;"> 
								<input type="checkbox" id="7_close" name="7_close" style="float: left; cursor:pointer; vertical-align:-1px; margin-right:0; margin-top: 7px;"/>
								<label for="7_close" style="float: left; cursor:pointer; font-size:13px; font-family:'NotoSans',sans-serif; font-weight:500; color:#aaa; margin-top: 5px;  margin-left: 3px;">하루 동안 보이지 않기</label>
								<button class="close_bt2" style="float: right" onclick="closePop('popup_${status.count}')">X</button>
								<span class="close_bt2" style="float: right;cursor:pointer;margin-right:10px; font-size:14px;color:#fff;background:#8b0f1d;padding:7px 12px;border-radius:5px;" onclick="closePop('popup_${status.count}')">닫기</span> 
							</div> --%>
						</td>
					</c:forEach>
				</tr>
				</tbody>
			</table>
	</div>
</div>
<div class="popup_bg"></div>
</div>
<!--//popup End--------------------------------------------------------------------------------------------->
</c:if>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		  var filter = "win16|win32|win64|mac|macintel";
		  if ( navigator.platform ) {
		    if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
		      //mobile
		      //alert('mobile 접속');
		    } else {
		      //pc
		     	//alert('pc 접속');
		    }
		  }	
		
		if(getParameterByName('checkRole')){
			alert('사원/병원 계정으로 접속 불가능합니다.\n관리자 계정만 접속 가능합니다. ');
		}
		
		
	 	$("._viewWebzine").click(function(){
	 		var url = $(this).data('url');
			
			var ax = screen.width;
			var ay = screen.height;
			
			var property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,scrollbars=no,copyhistory=no,";
			property += "width=" + ax + ",height=" + ay + ",left=" + 0 + ",top=" + 0;
			
			window.open(url, "ecatalog", property);
	 	});
	 	
	 	$("._moreView").click(function(){
	 		$(this).parent().parent().find('li').each(function(){
	 			if($(this).hasClass('current')){
	 				var tab = $(this).data('tab');
	 				if(tab == 'tab-1'){
	 					if('<c:out value="${lang}"/>' == 'ko'){
	 						location.href="<c:url value='/board/1/index.do' />";
	 					}
	 				}else if(tab == 'tab-2'){
	 					location.href="<c:url value='/customer/notice/index.do' />";
	 				}else if(tab == 'tab-3'){
	 					location.href="<c:url value='/customer/webzine/index.do' />";
	 				}
	 			}
	 		});
	 	});
	 	
	 	$("._moreOneClick").click(function(){
	 		location.href="<c:url value='/customer/healthinfo/index.do' />";
	 	});
	 	
	 	
	 	var param = {
 			width:screen.width,
			height: screen.height
	 	}
	 	
		axios.get("<c:url value='/device.json' />",{
			params: param
			
		}).then(function (res) {
		});
	 	
	 	<c:if test="${not empty result.popups }">
	 		
	 		$("._popupThum").click(function(){
	 			$("._popupMain").hide();
	 			$("._popupMainIdx-"+$(this).data('idx')).show();
	 			$("#paper_name").html($(this).data('title'));
	 			
	 		});
	 	
	 		<c:if test="${fn:length(result.popups) > 1 }">
 			$("._popupThum").first().trigger('click');
	 		</c:if>
	 		
	        $('#main_modal > .popup_bg , .close_bt , .close_bt2').click(function(){
	          $('#main_modal').fadeOut(300);
	          
	          
	          if($("#7_close").is(":checked")){
	        	  skipPopup();
	          }
	          
	        });
	 	
	 	</c:if>
	 	
	});
	function moveLink(url,loginYn,loginStatus) {
		if(loginYn == "login"){
			if(loginStatus == "true"){
				location.href= url;
			}else if(loginStatus == "false"){
				alert("로그인후 이용 가능합니다.");
				return;
			}
		}else if(loginYn != "login"){
			location.href= url;
		}
	}
	
	// 팝업 닫기
	function closePop(val){
		
		// 만약 7일간 보지 않기가 체크되어있다면
		   if($('#7_close_'+val).is(":checked")){
			   closePopupSevenDay(val);
		   }
		// 팝업닫기
		$('#popup_'+val).remove();
		var size = $('#popupTable td').length;
		if(size == "0"){
			$('#main_modal').fadeOut(300);
		}
	}
	
	function closePopupSevenDay(val) {
		var expdate = new Date();
		var id = "popup_"+val;
		expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 1);
		setCookie(id, 'true', expdate);
	}
	
	//쿠키 관련
	/* function setCookie (name, value, expires) {
	    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
	} */
	//쿠기값이 존재한다면 해당 팝업 닫기
	cookiedata = document.cookie;
	if (document.cookie.length > 0) {
		var ca = cookiedata.split(';');
		 for(var i = 0; i <ca.length; i++) {
			 var cookiePair = ca[i].split("=");
			 var popId = cookiePair[0].trim();
			 $('#'+popId).remove();
		 }
		 var size = $('#popupTable td').length;
		if(size == "0"){
			$("#main_modal").css("display" ,"none");
		}else{
			$("#main_modal").css("display" ,"block");
		}
	}else{
 			$("#main_modal").fadeIn(300);
	}
	 
	
	</script>
	
</body>
</html>
