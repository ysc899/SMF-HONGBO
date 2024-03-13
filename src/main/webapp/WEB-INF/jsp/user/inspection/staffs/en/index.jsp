<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/02_sub01_en.css'/>" type="text/css" rel="stylesheet"/>
	
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
	<script src="<c:url value='/lib/printThis-master/printThis.js'/>"></script>
	
	<!-- underscore -->
	<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
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
							<li class="tab-link no_bottom _centerRow _centerMenu_1" data-tab="tab-1" style="line-height: 45px;" ><spring:message code="search.all" /></li>
							<c:forEach items="${defaultInfo.centerCodes }" var="item" varStatus="status">
								<li class="tab-link no_bottom _centerRow _centerMenu_<c:out value='${status.count +1 }'/>" data-tab="tab-<c:out value='${status.count +1 }'/>" ><c:out value='${item.codeName }'/></li>
							</c:forEach>
						</ul>
						
						<div id="tab-1" class="tab-content tab_common">
						</div>
						<c:forEach items="${defaultInfo.centerCodes }" var="item" varStatus="status">
							<div id="tab-<c:out value='${status.count +1 }'/>" class="tab-content tab_common"></div>
						</c:forEach>
						

					</div>
					<!--//sub_story End-->
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
	
	
	<!--popup-->
	<div id="modal" style="display: none;">
		<div id="popup">
			<div class="popup_title">
				<span class="_popupTitle"></span>
				<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
			</div>

			<table>
				<tbody>
					<tr>
						<td class="popup_td01">
							<div>
								<p class="_popupName"></p>
								<span class="_popupPosition"></span>
								<small class="_popupDegree"></small>
							</div>
						</td>

						<td class="popup_td02">
							<dl class="_popupHistory">
							</dl>
						</td>
					</tr>
				</tbody>
			</table>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup-->
	
	
	<script type="text/javascript">
		
		var resultJson = <c:out escapeXml="false" value='${result}'/>;
		
		function checkHash(){
			
			if (document.location.hash != ""){     //받아올 해시가 있으면
				
				var arrHash = new Array();
	
				var hash = document.location.hash;
				
				arrHash = hash.split("#");
				
				$("._centerMenu_"+ arrHash[1]).trigger('click');
				
			}else{
				$("._centerRow").first().trigger('click');
			}
			
		}
	
// 		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			var seq = $(this).data('seq');
			
			
			var url = "<c:url value='/inspection/staffs/"+ seq +"/view.json' />";
			axios.get(url)
			  .then(function (res) {
				  
				  var item = res.data.result;
				  
				  if(item.codePartType =='pathology'){
					  $(".popup_title").css("background-image", "url(<c:url value='/user/img/people2/popup_title2.png'/>)");
				  }else if(item.codePartType == 'industrial'){
					  $(".popup_title").css("background-image", "url(<c:url value='/user/img/people2/popup_title3.png'/>)");
				  }else{
					  $(".popup_title").css("background-image", "url(<c:url value='/user/img/people2/popup_title.png'/>)");
				  }
				  
				  $("._popupTitle").html(item.specialty);
				  $("._popupName").html(item.name);
				  $("._popupPosition").html(item.position);
				  $("._popupDegree").html(item.degree);
				  $(".popup_td01").css("background-image", "url('"+ item.imageContent +"'), url('<c:url value="/user/img/sub/sil4.png"/>')");
				  $("._popupHistory").html('');
				  var historyContent = '<dt><spring:message code="staffs.history" /></dt>';
				  for(var idx in item.beforeHistory){
					  historyContent += '<dd class="dot_dd">';
					  historyContent += item.beforeHistory[idx].content;
					  if(!CommonUtil.isEmpty(item.beforeHistory[idx].comment)){
						  historyContent += '<br/>'+item.beforeHistory[idx].comment;  
					  }
					  historyContent += '</dd>';
				  }
				  for(var idx in item.nowHistory){
					  
					  
					  if(idx == 0){
					  historyContent += '<dd class="red_ico red_ico01"><b><spring:message code="staffs.now" /></b>';
						  
					  }else{
					  historyContent += '<dd class="red_ico"><b><spring:message code="staffs.now" /></b>';
					  }
						  
					  historyContent += item.nowHistory[idx].content;
					  if(!CommonUtil.isEmpty(item.nowHistory[idx].comment)){
						  historyContent += '<br/>'+item.nowHistory[idx].comment;  
					  }
					  historyContent += '</dd>';
				  }
				  
				  
				  $("._popupHistory").html(historyContent);
					
				$('#modal').stop().fadeIn(300);
				  $('#modal > .popup_bg , .close_bt').click(function(){
				    $('#modal').fadeOut(300);
				  });
			  });
		});
		
		
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
	
		});
		
		
	
		$(document).ready(function(){
			
			var allCenterHtml = '';
			
			<c:forEach items="${defaultInfo.centerCodes }" var="center" varStatus="status">
				//센터용
				var center_<c:out value="${center.slaveCode}"/> = '';
				<c:forEach items="${defaultInfo.partCodes }" var="part">
					//부서용
					var part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> = '';
					var centerMasterStaffs = _.filter(resultJson, function(t){return t.codeCenterType == '<c:out value="${center.slaveCode}"/>' && t.codePartType == '<c:out value="${part.slaveCode}"/>' && t.masterFlag == 'Y'});
					var centerStaffs = _.filter(resultJson, function(t){return t.codeCenterType == '<c:out value="${center.slaveCode}"/>' && t.codePartType == '<c:out value="${part.slaveCode}"/>' && t.masterFlag == 'N'});
					
					if(centerStaffs.length > 0 || centerMasterStaffs.length > 0){
						if('<c:out value="${part.slaveCode}"/>' != 'empty'){
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '<p><c:out value="${center.codeName }"/> - <c:out value="${part.codeName }"/></p>';
						}else{
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '<p><c:out value="${center.codeName }"/></p>';
						}
						if(centerMasterStaffs.length > 0){
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '<div class="people_top">';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	<ul>';
							
							for(var idx in centerMasterStaffs){
								if(centerMasterStaffs[idx].historyCount > 0){
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	<li class="_row" data-seq="'+ centerMasterStaffs[idx].seq +'">';
								}else{
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	<li>';	
								}
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		<table>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		<tbody>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '			<tr>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="td_small">';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<span>'+ centerMasterStaffs[idx].position +'</span>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<p>'+ centerMasterStaffs[idx].name +'</p>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<small>'+ centerMasterStaffs[idx].degree +'</small>';
// 								if(centerMasterStaffs[idx].historyCount > 0){
// 								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<b class="_row" data-seq="'+ centerMasterStaffs[idx].seq +'"><spring:message code="staffs.viewprofile" /></b>';
// 								}
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				</td>';
								if(idx == 0){
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="td_all"><img src="'+ centerMasterStaffs[idx].thumImageContent +'" class="img_top"';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				</td>';
								}else{
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="td_all_not sil"><img src="'+ centerMasterStaffs[idx].thumImageContent +'" class="img_small"';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				</td>';
									
								}
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '			</tr>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		</tbody>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		</table>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	</li>';	
							}
							
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	</ul>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '</div>';
							
						}
						
						
						for(var idx in centerStaffs){
							
							var checkIdx = (idx +1) % 3;
							if(checkIdx == 1){
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '<div class="people1">';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	<ul>';
							}
							
							
							var item = centerStaffs[idx];
							if(item.historyCount > 0){
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	<li class="_row" data-seq="'+ item.seq +'">';
							}else{
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	<li>';
							}
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		<table>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		<tbody>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '			<tr>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="name_td">';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<span class="<c:out value='${lang}'/>">'+ item.position +'</span>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<p>'+ item.name +'</p>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '					<small>'+ item.degree +'</small>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				</td>';
// 							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td></td>';
							if(checkIdx == 0 || idx == centerStaffs.length-1){
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="sil_not"><img src="'+ item.thumImageContent +'"';
							}else{
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="sil"><img src="'+ item.thumImageContent +'"';
							}
							
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				</td>';
							/*
							if(checkIdx == 0){
								
// 							if(item.historyCount > 0){
// 							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td><b class="_row" data-seq="'+ item.seq +'"><spring:message code="staffs.viewprofile" /></b></td>';
// 							}else{
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td></td>';	
// 							}
							
							}else{
							
							if(item.historyCount > 0){
								
								if(idx == centerStaffs.length-1){
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td ><b class="_row" data-seq="'+ item.seq +'"><spring:message code="staffs.viewprofile" /></b></td>';
								}else{
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td class="sil" ><b class="_row" data-seq="'+ item.seq +'"><spring:message code="staffs.viewprofile" /></b></td>';		
								}
							}else{
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td></td>';	
							}
							}
							*/
// 							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '				<td></td>';	
							
							
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '			</tr>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		</tbody>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '		</table>';
							part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	</li>';	

							if(checkIdx == 0 || idx == centerStaffs.length -1){
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '	</ul>';
								part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/> += '</div>';
							}
						}
						
						
						
						center_<c:out value="${center.slaveCode}"/> += part_<c:out value="${center.slaveCode}"/>_<c:out value="${part.slaveCode}"/>;
					}
					
				</c:forEach>
				
				allCenterHtml += center_<c:out value="${center.slaveCode}"/>;
				$("#tab-<c:out value='${status.count +1 }'/>").html(center_<c:out value="${center.slaveCode}"/>);
				
			</c:forEach>
			$("#tab-1").html(allCenterHtml);
			
			  setTimeout(function() {
				  	$(window).scrollTop('223');
					}, 150);
			
			checkHash();
			
		});
	
	
	</script>
</body>
</html>
