<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	 uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		 uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags"%>

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
	<link href="<c:url value='/user/css/06_sub05_en.css?20230616_2'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	
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

						<ul class="tabs">
					
							<li class="tab-link current _tab-1" data-tab="1"><span>Central Laboratory</span></li>
							<li class="tab-link _tab-2" data-tab="2"><span>Busan & Gyeongnam <br/>Laboratory Center</span></li>
							<li class="tab-link _tab-3" data-tab="3"><span>Daegu & Gyeongbuk <br/>Laboratory Center</span></li>
							<li class="tab-link _tab-4" data-tab="4"><span>Gwangju & Honam <br/>Laboratory Center</span></li>
							<li class="tab-link _tab-5" data-tab="5"><span>Daejeon & Chungcheong <br/>Laboratory Center</span></li>
<!-- 							<li class="tab-link current _tab-1" data-tab="tab-1">본원검사센터</li> -->
<!-- 							<li class="tab-link _tab-2" data-tab="tab-2">부산경남검사센터</li> -->
<!-- 							<li class="tab-link _tab-3" data-tab="tab-3">대구경북검사센터</li> -->
<!-- 							<li class="tab-link _tab-4" data-tab="tab-4">광주호남검사센터</li> -->
					
						</ul>
					
						<!--tab menu01-->
						<div id="tab-1" class="tab-content current tab_common tab_map1">
					
							<div class="contact_content">
					
								<div class="office_img">
					
									<div class="office_text">
						
												<table>
													<thead>
														<tr>
															<th>Central Laboratory</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
														</tr>
														<tr>
															<td><p>320, Cheonho-daero, Seongdong-gu, Seoul,<br/> 04805, Republic of Korea</p></td>
														</tr>
<!-- 														<tr> -->
<%-- 															<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td> --%>
<!-- 														</tr> -->
														<tr>
															<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />+82-2-3394-6503</td>
														</tr>
														<tr>
															<td class="margin_td"><img src="<c:url value='/user/img/sub/email_en.png'/>" class="fax_ico" alt="이메일아이콘" />seegenecs@mf.seegene.com</td>
														</tr>
						
													</tbody>
												</table>
						
											</div>
									</div>
									<div class="map_area">
										<img id="seegene_map" src="<c:url value='/user/img/sub/map_seoul_en.jpg'/>" style="width:1100px;height:320px;"/>
									</div>
							</div>
						</div>
						<!--//tab munu01 End-->
						
					
						<!--tab menu02-->
						<div id="tab-2" class="tab-content tab_common tab_map2">
							<div class="contact_content">
								<div class="office_img">
										<div class="office_text">
											<table>
												<thead>
													<tr>
														<th>Busan & Gyeongnam <br/>Laboratory Center</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>297, Jungang-daero, Dong-gu, Busan, <br/>48792, Republic of Korea</p></td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td> --%>
<!-- 													</tr> -->
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />+82-2-3394-6503</td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/email_en.png'/>" class="fax_ico" alt="이메일아이콘" />seegenecs@mf.seegene.com</td>
													</tr>
												</tbody>
											</table>
					
										</div>
								</div>
					
								<div class="map_area">
									<img id="seegene_map2" src="<c:url value='/user/img/sub/map_busan_en.jpg'/>" style="width:1100px;height:320px;"/>
								</div>
					
							</div>
						</div>
						<!--//tab menu02 End-->
					
						<!--tab menu03-->
						<div id="tab-3" class="tab-content tab_common tab_map3">
							<div class="contact_content">
								<div class="office_img">
										<div class="office_text">
											<table>
												<thead>
													<tr>
														<th>Daegu & Gyeongbuk <br/>Laboratory Center</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>2619, Dalgubeol-daero, Suseong-gu, Daegu,<br/>42066, Republic of Korea</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />+82-2-3394-6503</td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/email_en.png'/>" class="fax_ico" alt="이메일아이콘" />seegenecs@mf.seegene.com</td>
													</tr>
												</tbody>
											</table>
					
										</div>
								</div>
								<div class="map_area">
					
									<img id="seegene_map3" src="<c:url value='/user/img/sub/map_daegu_en.jpg'/>" style="width:1100px;height:320px;"/>
					
								</div>
					
					
							</div>
						</div>
						<!--//tab menu03 End-->
					
						<!--tab menu04-->
						<div id="tab-4" class="tab-content tab_common tab_map4">
							<div class="contact_content">
								<div class="office_img">
										<div class="office_text">
											<table>
												<thead>
													<tr>
														<th>Gwangju & Honam <br/>Laboratory Center</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>200, Hyou-ro, Nam-gu, Gwangju, <br/>61743, Republic of Korea</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />+82-2-3394-6503</td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/email_en.png'/>" class="fax_ico" alt="이메일아이콘" />seegenecs@mf.seegene.com</td>
													</tr>
												</tbody>
											</table>
					
										</div>
								</div>
					
								<div class="map_area">
					
									<img id="seegene_map4" src="<c:url value='/user/img/sub/map_gwangju_en.jpg'/>" style="width:1100px;height:320px;"/>
					
								</div>
					
							</div>
						</div>
						<!--//tab menu04 End-->
						
						<!--tab menu05-->
						<div id="tab-5" class="tab-content tab_common tab_map5">
							<div class="contact_content">
								<div class="office_img">
										<div class="office_text">
											<table>
												<thead>
													<tr>
														<th>Daejeon & Chungcheong <br/>Laboratory Center</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>77, Mannyeon-ro, Seo-gu, Daejeon, <br/>35203, Republic of Korea</p></td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />+82-2-3394-6503</td> --%>
<!-- 													</tr> -->
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/email_en.png'/>" class="fax_ico" alt="이메일아이콘" />seegenecs@mf.seegene.com</td>
													</tr>
												</tbody>
											</table>
					
										</div>
								</div>
					
								<div class="map_area">
					
									<img id="seegene_map5" src="<c:url value='/user/img/sub/map_dajeon_en_20230616.jpg'/>" style="width:1100px;height:320px;"/>
					
								</div>
					
							</div>
						</div>
						<!--//tab menu05 End-->
					
					
					
					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<div class="vision_bg_area"></div>
			<div class="vision_bg_gray"></div>
			
<%-- 			<jsp:include	page="../../../include/rolling.jsp"></jsp:include > --%>

		<div id="top_bt2">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include	page="../../../include/footer_en.jsp"></jsp:include >
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
	<jsp:include page="../../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include page="../../../include/fixed_header_en.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	
		//해시태그 세팅하기
		function fnSetHash(page) {
			var hash = "#" + page;
			window.location.hash = hash;
		}
		
		function checkHash(){
			
			var currentPage = '1';
			
			if (document.location.hash != ""){     //받아올 해시가 있으면
				
				var arrHash = new Array();
	
				var hash = document.location.hash;
				
				arrHash = hash.split("#");
				currentPage = arrHash[1];
			}
			$(".tab-link").removeClass('current');
			$("._tab-"+currentPage).addClass('current');
			$(".tab-content").removeClass('current');
			$("#tab-"+currentPage).addClass('current');
			
		}
		
		
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
	
		});
	
		
		$(document).ready(function(){
			
			
			
			
			$(".tab-link").click(function(){
				fnSetHash($(this).data('tab'));
				
			});
			
			checkHash();
		});
	
	</script>
</body>
</html>
