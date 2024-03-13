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
    <meta property="og:image" content="<c:url value="/user/img/sub/01sub_img_sim2.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
	
	
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub01_A.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub01_B.css'/>" type="text/css" rel="stylesheet"/>
	
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

					<div class="sub_story">
						<ul class="tabs">
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="tab-link no_bottom tab-<c:out value='${status.count }'/>_central _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
						</ul>
						
						<div class="sub_summury01 _intro">
							<p>임상검사사업</p>
								<span>
									씨젠의료재단 검사결과는 전국 어느곳에서나<br/>
									실시간 Online을 통해 조회가 가능합니다.
								</span>
						</div>

						<div class="sub_summury02 _intro">
							<p class="sub_p">임상검사사업부의 제공 서비스</p>
							<span class="sub_span">진단의학검사, 분자진단검사, 진단병리검사 및 특수검진 검사 등 전 분야에 걸친 4,000여가지 이상의 검사를 진행하고 있으며,
							<br/>전국 네트워크를 통해 어디에서나 검사 의뢰가 가능합니다.<br/> 특히 수십년간 고도의 임상검사기술과 풍부한 노하우를 기반으로, 업계 최고를
							자랑하는 영업·검사실운영·시스템의 네트워크를 구축해 왔습니다.</span>
						</div>

						<div class="sub_summury03 _intro">

								<dl class="dl01">
									<dt>검체운송 시스템</dt>
										<dd>검체에 따른 적정온도 운반 시스템</dd>
										<dd>운송 중 철저한 온도관리</dd>
										<dd>냉장, 냉동, 실온운송에 맞는전용박스</dd>
										<dd>GPS를 통한 검체의 위치 추적 관리</dd>
								</dl>

								<dl class="dl02" style="margin-left:25px;">
									<dt>모바일 접수 시스템</dt>
										<dd>최신의 정보기술을 이용한
										업계최초<br/> 개발 및 적용</dd>
										<dd>현장에서 검체 수거 즉시 실시간 접수</dd>
										<dd>특허출원 등록</dd>
								</dl>

								<dl class="dl03" style="margin-left:25px;">
									<dt>Network</dt>
										<dd>전국 주요 도시에 지점 개설</dd>
										<dd>50여 개 지점</dd>
										<dd>전국 어느 곳에서나 검체 수거 가능</dd>
										<dd>Online을 통한 검사결과 조회 가능</dd>
								</dl>

								<dl class="dl04" style="margin-left:25px;">
									<dt class="dt04">품질 서비스</dt>
										<dd>접수된 내역에 대한 전문가 확인</dd>
										<dd>의뢰내용 중 확인사항 즉시 처리</dd>
										<dd>OCS 를 이용한 자동 전산접수</dd>
										<dd>진단병리센터 운영</dd>
										<dd>부산경남검사센터 운영</dd>
										<dd>응급검사 실시간 가능</dd>
								</dl>

						</div>

						<div class="sub_summury04 sub_ani00 _intro">
							<p>검체 접수 및 분류 인력지원에 대한 체계</p>
							<img src="<c:url value='/user/img/sub/01sub_img_sim2.jpg'/>" style="max-width:1098px;" alt="검체 접수 및 분류 인력지원에 대한 체계 이미지"/>
						</div>
						
						<!-- 소개 -->
						
						<!-- 전국네트워크 -->
						<div class="_network" id="hanbando">
							<!-- Image Map Generated by http://www.image-map.net/ -->
							<img src="<c:url value='/user/img/sub/c_map00.png'/>" alt="지도전체" usemap="#area" name="area" id="networkMap"/>

							<map name="area">

								<area shape="poly" alt="서울" title="수도권지역" coords="77,167,80,159,91,163,93,156,106,154,111,143,119,142,125,155,124,165,133,170,124,186,113,184,98,189" 
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map01.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_seoul" data-loc="seoul" data-bgurl='<c:url value="/user/img/sub/c_map01.png"/>'/>

								<area shape="poly" alt="인천" title="인천지역" coords="80,160,90,164,94,155,104,155,108,142,88,133,70,123,62,135,51,136,49,156,59,162,62,172,66,183,67,190,73,204,83,209,103,207,108,185,94,186,79,168"
								 onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map03.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_incheon" data-loc="incheon" data-bgurl='<c:url value="/user/img/sub/c_map03.png"/>'/>

								<area shape="poly" alt="경기" title="경기지역" coords="122,186,132,169,124,167,125,158,119,143,109,143,70,120,71,110,83,104,91,92,92,82,104,79,103,73,109,63,118,67,124,79,138,79,145,
								83,159,86,167,98,182,107,184,114,173,128,180,156,193,160,196,165,211,171,202,180,207,187,203,211,193,234,177,246,
								165,250,141,270,126,262,94,270,88,255,81,244,69,223,71,212,101,203,102,210,110,184" 
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map02.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_gyeonggi" data-loc="gyeonggi" data-bgurl='<c:url value="/user/img/sub/c_map02.png"/>'/>

								<area shape="poly" alt="강원" title="강원지역" coords="110,59,119,55,139,47,144,51,154,48,171,51,177,50,198,47,214,52,246,51,249,43,260,40,261,32,267,31,269,7,276,3,310,87,360,148,359,155,371,165,371,175,387,191,
								399,215,399,226,380,242,370,236,365,242,347,241,334,233,328,236,328,245,321,248,295,238,289,238,281,232,271,232,268,220,257,
								222,241,226,229,216,222,221,220,231,205,231,199,219,206,188,201,178,209,172,196,165,178,157,173,124,182,115,182,109,165,99,158,86,149,83,139,77,125,80"
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map04.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_gangwon" data-loc="gangwon" data-bgurl='<c:url value="/user/img/sub/c_map04.png"/>'/>

								<area shape="poly" alt="충청(충북 충남 대전)" title="충청지역" coords="39,264,24,278,22,284,3,289,6,299,15,302,23,295,30,302,30,309,41,298,41,309,48,314,40,318,45,327,42,334,46,344,54,349,47,356,53,364,45,374,44,384,58,
								394,61,406,64,412,86,405,89,396,96,389,114,390,118,394,130,399,146,394,154,410,172,415,189,406,216,408,228,385,238,384,238,373,215,366,220,332,214,331,210,321,216,309,232,302,237,295,
								266,279,269,288,284,283,284,271,312,242,297,239,289,238,284,232,273,231,269,224,256,221,244,227,235,216,224,219,223,229,207,232,199,223,181,240,181,249,163,249,144,268,129,259,112,264,
								98,269,90,275,94,286,85,293,81,264,66,258,51,250" 
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map05.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_daejeon" data-loc="daejeon" data-bgurl='<c:url value="/user/img/sub/c_map05.png"/>'/>

								<area shape="poly" alt="경북" title="경북지역" coords="271,289,286,284,285,273,301,251,313,246,323,249,329,245,327,237,334,234,342,242,361,244,370,238,377,242,399,227,406,242,410,272,416,285,416,299,409,
								309,408,316,414,329,410,352,404,355,404,376,409,385,408,394,403,404,412,411,418,408,425,399,431,405,428,420,428,435,422,446,422,462,394,461,382,453,367,470,354,467,345,476,308,476,299,
								469,286,475,278,469,258,466,259,457,249,439,240,441,224,428,219,412,235,387,240,382,238,376,228,375,218,370,221,333,211,328,217,312,230,301,235,293,266,282"
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map06.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_daegu" data-loc="daegu" data-bgurl='<c:url value="/user/img/sub/c_map06.png"/>'/>

								<area shape="poly" alt="호남" title="호남지역" coords="57,426,63,416,86,405,85,396,97,390,117,391,117,398,128,399,147,395,158,412,175,415,184,405,218,411,219,431,201,433,184,452,176,482,190,502,180,524,180,538,204,
								555,203,572,187,584,177,584,153,605,126,613,127,619,106,628,93,656,78,653,52,665,51,674,41,676,37,647,46,617,28,604,27,574,36,556,23,539,18,523,31,508,30,499,40,485,60,482,48,475,37,468,58,452,73,450"
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map07.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_gwangju" data-loc="gwangju" data-bgurl='<c:url value="/user/img/sub/c_map07.png"/>'/>

								<area shape="poly" alt="경남" title="경남지역" coords="180,517,191,503,177,482,184,456,201,433,221,432,236,439,251,438,259,453,259,466,280,470,284,475,300,469,306,475,346,474,352,465,370,472,384,455,393,455,401,459,421,464,420,475,
								409,492,408,512,395,521,389,542,359,557,311,559,283,562,297,565,287,585,258,585,202,573,205,555,179,539" 
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map08.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_busan" data-loc="busan" data-bgurl='<c:url value="/user/img/sub/c_map08.png"/>'/>

								<area shape="poly" alt="제주" title="제주지역" coords="60,719,45,740,55,757,66,758,74,752,97,753,130,738,141,721,128,708,92,709,73,719" 
								onmouseover="if(document.images) area.src='<c:url value="/user/img/sub/c_map09.png"/>'" onfocus="this.blur()" 
								class="map _locArea _locArea_jeju" data-loc="jeju" data-bgurl='<c:url value="/user/img/sub/c_map09.png"/>'/>
							</map>

						</div>

						<!--search_network-->
						<div class="_network" id="search_network">

							<div class="search_table">
								<form id="searchForm" onSubmit="return false;">
								<table>
									<tbody>
										<tr>

											<th><b>지점찾기</b></th>
											<td>
												<select name="codeNetworkType" id="networkSelectArea">
													<option value="">전체</option>
													<c:forEach items="${defaultInfo.locCodes }" var="item">
														<option value="<c:out value='${item.slaveCode }'/>"><c:out value='${item.codeName }'/></option>
													</c:forEach>
												</select>
											</td>

											<td style="display:none;">
												<input type="text" name="searchKeyword" class="_searchKeyword" placeholder="지점을 검색하세요."/>
												<img src="<c:url value='/user/img/search.png'/>" class="_search" alt="검색돋보기"/>
											</td>

										</tr>
									</tbody>
								</table>
								</form>
							</div>

							<div class="area_table">

								<table>

									<thead>
										<tr>
											<th></th>
										</tr>
									</thead>

									<tbody id="networkContent">
										<tr>
											<td colspan="1" style="text-align: center;display:block; height:450px; font-size:22px;font-weight:bold;padding-top:200px;" >지역을 선택해주세요.</td>
										</tr>
									</tbody>

								</table>

							</div>

						</div>
						<!--//search_network End-->
						
						
						
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
		
		function getData(){
			var param = $("#searchForm").serializeObject();
			var url = "<c:url value='/business/clinical/network.json' />";
			axios.get(url,{
					params: param
				})
			  .then(function (res) {
				  var content = '';
				  for(var idx in res.data.result){
					  var item = res.data.result[idx];
					  content +='<tr class="_networkStaffsRow" data-network="'+ item.codeNetworkType +'">';
					  if(item.directorFlag == 'Y'){
						content +='<td class="people_td"><img src="'+ item.imageContent +'" alt="' + item.name +' '+ item.department+'"></td>';
						content +='<td class="people_td2">';
						content +='	<p class="king_name">' + item.name +' '+ item.department+' ('+ item.company +')</p>';
						content +='	<span class="king_address">Mobile : '+ item.mobilePhone +'&nbsp;&nbsp;&nbsp;&nbsp;E-mail : '+ item.email +'</span><br/>';
						content +='	<span class="king_address">Address : '+ item.address +'</span>';
						content +='</td>';
					  }else{
						content +='<td>';
						content +='	<p><img src="<c:url value='/user/img/network_icon.png'/>" alt="icon">'+ item.name +' '+ item.department +' ('+ item.company +')</p>';
						content +='	<span>Mobile : '+ item.mobilePhone +'&nbsp;&nbsp;&nbsp;&nbsp;E-mail : '+ item.email +'<br/> Address : '+ item.address +'</span>';
						
						content +='</td>';
					  }
					  
					  content +='</tr>';
				  }
				  
				  if(res.data.result.length == 0){
					  content = '<tr> <td colspan="1" style="text-align: center;display:block;">검색 결과가 없습니다.</td></tr>';
				  }
				  
				  
				  $("#networkContent").html(content);
			  });
		}
		
		//자세히보기 클릭 이벤트
		$(document).on('click', '._networkStaffsRow',function(){
			var bgurl = $("._locArea_"+$(this).data('network')).data('bgurl');
			$("#networkMap").attr('src', bgurl);
		});
		
		$(document).ready(function(){
			$(".tab-link").click(function(){
				
				$(".tab-link").removeClass('current');
				$(this).addClass('current');
				var view = $(this).data('view');
				$("._intro").hide();
				$("._network").hide();
				$("._"+view).show();
			});
			
			
			$("._locArea").click(function(){
				var locCode = $(this).data('loc');
				var bgurl = $(this).data('bgurl');
				$("#networkMap").attr('src', bgurl);
				
				$("#networkSelectArea").val(locCode).attr("selected", "selected");
				getData();
			});
			
			$("#networkSelectArea").change(function(){
				if($(this).val() == ''){
					$("#networkContent").html('<tr><td colspan="1" style="text-align: center;display:block; height:450px; font-size:22px;font-weight:bold;padding-top:200px;" >지역을 선택해주세요.</td></tr>');
					$("#networkMap").attr('src', "<c:url value='/user/img/sub/c_map00.png'/>");
				}else{
					getData();
					var bgurl = $("._locArea_"+$(this).val()).data('bgurl');
					$("#networkMap").attr('src', bgurl);
				}
				
				
			});
			
			$("._search").click(function(){
				getData();
			});
			$("._searchKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					getData();
				}
			});
			
			
			checkHash();
// 			getData();
		});
	
	</script>
</body>
</html>
