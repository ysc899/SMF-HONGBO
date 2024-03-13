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
	<link href="<c:url value='/user/css/06_sub05.css?ver=20230616_3'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<c:out value='${apiKey }'/>"></script>
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

						<ul class="tabs">
					
							<li class="tab-link current _tab-1" data-tab="1">본원</li>
							<li class="tab-link _tab-2" data-tab="2">부산경남검사센터</li>
							<li class="tab-link _tab-3" data-tab="3">대구경북검사센터</li>
							<li class="tab-link _tab-4" data-tab="4">광주호남검사센터</li>
							<li class="tab-link _tab-5" data-tab="5">대전충청검사센터</li>
<!-- 							<li class="tab-link current _tab-1" data-tab="tab-1">본원검사센터</li> -->
<!-- 							<li class="tab-link _tab-2" data-tab="tab-2">부산경남검사센터</li> -->
<!-- 							<li class="tab-link _tab-3" data-tab="tab-3">대구경북검사센터</li> -->
<!-- 							<li class="tab-link _tab-4" data-tab="tab-4">광주호남검사센터</li> -->
					
						</ul>
					
						<!--tab menu01-->
						<div id="tab-1" class="tab-content current tab_common tab_map1">
					
							<div class="contact_content">
					
								<div class="office_img">
					
									<!-- <div class="office_inner">
									</div> -->
					
										<div class="office_text">
					
											<table>
												<thead>
													<tr>
														<th>본원</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>서울특별시 성동구 천호대로 320 (용답동)</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />02-3394-6503</td> --%>
<!-- 													</tr> -->
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/bus.png'/>" class="bus_ico" alt="버스아이콘" />버스</td>
													</tr>
					
													<tr>
														<td><img src="<c:url value='/user/img/sub/jisun.png'/>" class="bus" alt="지선버스" />015,2221,3216,3220</td>
													</tr>
					
													<tr>
														<td><img src="<c:url value='/user/img/sub/gansun.png'/>" class="bus" alt="간선버스" />130,145,300,303,370,721</td>
													</tr>
					
													<tr>
														<td><img src="<c:url value='/user/img/sub/kangyuk.png'/>" class="bus" alt="광역버스" />9403,9301</td>
													</tr>
					
													<tr>
														<td><b>: 답십리삼거리 정류소 하차</b></td>
													</tr>
					
													<tr>
														<td><img src="<c:url value='/user/img/sub/train.png'/>" class="train_ico" alt="기차아이콘"/>지하철</td>
													</tr>
					
													<tr>
														<td><img src="<c:url value='/user/img/sub/5line.png'/>" class="bus" alt="5호선"/>답십리역 하차 후 5번 출입구로 나와서 도보로 약 5분</td>
													</tr>
					
													<tr>
														<td><img src="<c:url value='/user/img/sub/2line.png'/>" class="bus" alt="2호선"/>용답역 하차 후 1번 출입구로 나와서 도보로 약 10분</td>
													</tr>
					
												</tbody>
											</table>
					
										</div>
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
														<th>부산경남검사센터</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>부산광역시 동구 중앙대로 297 (초량동)</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />02-3394-6503</td> --%>
<!-- 													</tr> -->
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/bus.png'/>" class="bus_ico" alt="버스아이콘" />버스</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/jisun.png'/>" class="bus" alt="지선버스" />40,41</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/kangyuk.png'/>" class="bus" alt="광역버스" />1000,1003</td>
													</tr>
													<tr>
														<td><b>: 초량역 정류소 하차</b></td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/train.png'/>" class="train_ico" alt="기차아이콘" />지하철</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/1line.png'/>" class="bus" alt="1호선" />초량역 9번 출입구로 나와서 도보로 약 50m</td>
													</tr>
													<tr>
														<td class="margin_td2">(부산역에서 도보 15분)</td>
													</tr>
												</tbody>
											</table>
					
										</div>
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
														<th>대구경북검사센터</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>대구광역시 수성구 달구벌대로 2619 (만촌동)</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />02-3394-6503</td> --%>
<!-- 													</tr> -->
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/bus.png'/>" class="bus_ico" alt="버스아이콘" />버스</td>
													</tr>
													<tr>
														<td>
														 <ul>														
														  <li><b>: 구.남부정류장앞 1 또는 구.남부정류장앞 2</b></li>
														 </ul>
														</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/train.png'/>" class="train_ico" alt="기차아이콘" />지하철</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/new_2line.png'/>" class="bus" alt="2호선" />대구지하철 2호선 만촌역 4번출구 이용 도보 5분</td>
													</tr>
												</tbody>
											</table>
					
										</div>
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
														<th>광주호남검사센터</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>광주광역시 남구 효우로 200 (행암동)</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />02-3394-6503</td> --%>
<!-- 													</tr> -->
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/bus.png'/>" class="bus_ico" alt="버스아이콘" />버스</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/jisun.png'/>" class="bus" alt="지선버스" />봉선76,송암68,진월75</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/gphang.png'/>" class="bus" alt="급행버스" />수완03</td>
													</tr>
													<tr>
														<td><b>: 신기교 정류장 하차</b></td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/car_ico.png'/>" class="train_ico" alt="차아이콘" />자차 이용시</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/car.png'/>" class="bus" alt="1호선"/>광주대학교에서 효덕로 방향으로 우회전하여 695m 이동 후</td>
													</tr>
													<tr>
														<td class="margin_td2">효천2지구,노인건강타운 방면으로 우회전하여 534m 이동</td>
													</tr>
												</tbody>
											</table>
					
										</div>
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
														<th>대전충청검사센터</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><img src="<c:url value='/user/img/sub/red_bar.png'/>" class="red_bar" alt="레드바" /></td>
													</tr>
													<tr>
														<td><p>대전광역시 서구 만년로 77 (만년동)</p></td>
													</tr>
													<tr>
														<td class="margin_td"><img src="<c:url value='/user/img/sub/call_ico.png'/>" class="call_ico" alt="전화아이콘" />1566-6500</td>
													</tr>
<!-- 													<tr> -->
<%-- 														<td class="margin_td"><img src="<c:url value='/user/img/sub/fax_ico.png'/>" class="fax_ico" alt="팩스아이콘" />02-3394-6503</td> --%>
<!-- 													</tr> -->
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/bus.png'/>" class="bus_ico" alt="버스아이콘" />버스</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/gansun.png'/>" class="bus" alt="간선버스" />104, 301, 318, 604, 606, 705, 911, 918</td>
													</tr>

													<tr>
														<td><b>: 서구보건소 정류소 하차 후 도보 3분</b></td>
													</tr>
													
													<tr>
														<td><img src="<c:url value='/user/img/sub/train.png'/>" class="train_ico" alt="기차아이콘" />지하철</td>
													</tr>
													<tr>
														<td><img src="<c:url value='/user/img/sub/DaJeon_subway_20230616.png'/>" class="bus" alt="대전2호선" />대전지하철1호선 정부청사역 하차 후 도보 23분</td>
													</tr>

												</tbody>
											</table>
					
										</div>
								</div>
					
							</div>
						</div>
						<!--//tab menu05 End-->
						<div class="map_area">
							<div id="seegene_map" style="width:1100px;height:300px;"></div>
						</div>
					
					
					
					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<div class="vision_bg_area"></div>
			<div class="vision_bg_gray"></div>
			
			<jsp:include	page="../../include/rolling.jsp"></jsp:include >

		<div id="top_bt">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include	page="../../include/footer.jsp"></jsp:include >
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
	<jsp:include page="../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include page="../../include/fixed_header.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	
		var map;
		var marker, marker2, marker3, marker4, marker5;
	
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
			
			map.relayout();
			map.setLevel(4);
			
			if(currentPage == '1'){
				map.setCenter(marker.getPosition());
			}else if(currentPage == '2'){
				map.setCenter(marker2.getPosition());
			}else if(currentPage == '3'){
				map.setCenter(marker3.getPosition());
			}else if(currentPage == '4'){
				map.setCenter(marker4.getPosition());
			}else if(currentPage == '5'){
				map.setCenter(marker5.getPosition());
			}
			
			
		}
		
		
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
	
		});
	
		
		$(document).ready(function(){
			
			var mapContainer = document.getElementById('seegene_map'), // 지도를 표시할 div
			mapOption = {
					center: new kakao.maps.LatLng(37.564448, 127.055160), // 지도의 중심좌표
					level: 5 // 지도의 확대 레벨
			};
			
			map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			var imageSrc = '<c:url value="/user/img/map.png"/>', // 마커이미지의 주소입니다
				imageSize = new kakao.maps.Size(60, 50), // 마커이미지의 크기입니다
				imageOption = {offset: new kakao.maps.Point(30, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				markerPosition = new kakao.maps.LatLng(37.564448, 127.055160); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			marker = new kakao.maps.Marker({
				position: markerPosition,
				image: markerImage // 마커이미지 설정
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			var iwContent = '<div style="padding:5px; width:290px;"><span style="color:#bc1225;font-size:15px;">본원 검사센터</span><br/>서울특별시 성동구 천호대로 320 (용답동)</div>';
		    var iwPosition = new kakao.maps.LatLng(37.565348, 127.055160); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
			    map: map, // 인포윈도우가 표시될 지도
			    position : iwPosition, 
			    content : iwContent,
			    removable : false
			});
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerPosition2 = new kakao.maps.LatLng(35.1232472,129.0437164); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			marker2 = new kakao.maps.Marker({
				position: markerPosition2,
				image: markerImage // 마커이미지 설정
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker2.setMap(map);
			
			var iwContent2 = '<div style="padding:5px; width:270px;"><span style="color:#bc1225;font-size:15px;">부산경남검사센터</span><br/>부산광역시 동구 중앙대로 297 (초량동)</div>';
		    var iwPosition2 = new kakao.maps.LatLng(35.1242472,129.0437064);
			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow2 = new kakao.maps.InfoWindow({
			    map: map, 
			    position : iwPosition2, 
			    content : iwContent2,
			    removable : false
			});
			
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerPosition3 = new kakao.maps.LatLng(35.857867, 128.648860); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			marker3 = new kakao.maps.Marker({
				position: markerPosition3,
				image: markerImage // 마커이미지 설정
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker3.setMap(map);
			
			var iwContent3 = '<div style="padding:5px; width:300px;"><span style="color:#bc1225;font-size:15px;">대구경북검사센터</span><br/>대구광역시 수성구 달구벌대로 2619 (만촌동)</div>';
		    var iwPosition3 = new kakao.maps.LatLng(35.858867, 128.648860);

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow3 = new kakao.maps.InfoWindow({
			    map: map, 
			    position : iwPosition3, 
			    content : iwContent3,
			    removable : false
			});
			
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var  markerPosition4 = new kakao.maps.LatLng(35.101777, 126.893828); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			marker4 = new kakao.maps.Marker({
				position: markerPosition4,
				image: markerImage // 마커이미지 설정
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker4.setMap(map);
			
			var iwContent4 = '<div style="padding:5px; width:250px;"><span style="color:#bc1225;font-size:15px;">광주호남검사센터</span><br/>광주광역시 남구 효우로 200 (행암동)</div>';
		    var iwPosition4 = new kakao.maps.LatLng(35.102777, 126.893828);
			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow4 = new kakao.maps.InfoWindow({
			    map: map, 
			    position : iwPosition4, 
			    content : iwContent4,
			    removable : false
			});
			
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var  markerPosition5 = new kakao.maps.LatLng(36.367599, 127.381450); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			marker5 = new kakao.maps.Marker({
				position: markerPosition5,
				image: markerImage // 마커이미지 설정
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker5.setMap(map);
			
			var iwContent5 = '<div style="padding:5px; width:250px;"><span style="color:#bc1225;font-size:15px;">대전충청검사센터</span><br/>대전 서구 만년로 77</div>';
// 		    var iwPosition5 = new kakao.maps.LatLng(36.350728, 127.371756);
		    var iwPosition5 = new kakao.maps.LatLng(36.368451, 127.381393);
			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow5 = new kakao.maps.InfoWindow({
			    map: map, 
			    position : iwPosition5, 
			    content : iwContent5,
			    removable : false
			});
			
			
			
			$(".tab-link").click(function(){
				fnSetHash($(this).data('tab'));
			});
			
			checkHash();
		});
	
	</script>
</body>
</html>
