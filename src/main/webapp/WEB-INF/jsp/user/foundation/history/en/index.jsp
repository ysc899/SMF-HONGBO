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
    <meta property="og:image" content="<c:url value="/user/img/sns_thumb.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/06_sub04_en.css?20230131'/>" type="text/css" rel="stylesheet"/>
	
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

					<div class="sub_story">
						<!--큰탭-->
						<ul class="h_tabs">
							<li class="_topTab" data-idx="1" data-start='<c:out value="${defaultInfo.t1Start.codeName }"/>' data-end='<c:out value="${defaultInfo.t1End.codeName }"/>'><c:out value="${defaultInfo.t1End.codeName }"/>~<c:out value="${defaultInfo.t1Start.codeName }"/></li>
							<li class="_topTab" data-idx="2" data-start='<c:out value="${defaultInfo.t2Start.codeName }"/>' data-end='<c:out value="${defaultInfo.t2End.codeName }"/>'><c:out value="${defaultInfo.t2End.codeName }"/>~<c:out value="${defaultInfo.t2Start.codeName }"/></li>
							<li class="_topTab" data-idx="3" data-start='<c:out value="${defaultInfo.t3Start.codeName }"/>' data-end='<c:out value="${defaultInfo.t3End.codeName }"/>'><c:out value="${defaultInfo.t3End.codeName }"/>~<c:out value="${defaultInfo.t3Start.codeName }"/></li>
							<li class="_topTab" data-idx="4" data-start='<c:out value="${defaultInfo.t4Start.codeName }"/>' data-end='<c:out value="${defaultInfo.t4End.codeName }"/>'><c:out value="${defaultInfo.t4End.codeName }"/>~<c:out value="${defaultInfo.t4Start.codeName }"/></li>
						</ul>
						<!--//큰탭 끝-->
						
						<div id="tab-1" >
							<div class="h_bg h01 _subTabs subTab-1" id="subTab-1" style="display: none;">
								<h1><c:out value="${defaultInfo.t1End.codeName }"/> ~ <c:out value="${defaultInfo.t1Start.codeName }"/></h1>
								<ul class="chaps _sub1YearList" >
								</ul>
							</div>
							<div id="_sub1ContentList" class="_subTabs subTab-1">
							
							</div>
							<div class="h_bg h02 _subTabs subTab-2" id="subTab-2" style="display: none;">
								<h1><c:out value="${defaultInfo.t2End.codeName }"/> ~ <c:out value="${defaultInfo.t2Start.codeName }"/></h1>
								<ul class="chaps _sub2YearList">
								</ul>
							</div>
							<div id="_sub2ContentList" class="_subTabs subTab-2">
							
							</div>
							<div class="h_bg h03 _subTabs subTab-3" id="subTab-3" style="display: none;">
								<h1><c:out value="${defaultInfo.t3End.codeName }"/> ~ <c:out value="${defaultInfo.t3Start.codeName }"/></h1>
								<ul class="chaps _sub3YearList">
								</ul>
							</div>
							<div id="_sub3ContentList" class="_subTabs subTab-3">
							
							</div>
							<div class="h_bg h04 _subTabs subTab-4 id="subTab-4" style="display: none;">
								<h1><c:out value="${defaultInfo.t4End.codeName }"/> ~ <c:out value="${defaultInfo.t4Start.codeName }"/></h1>
								<ul class="chaps _sub4YearList">
								</ul>
							</div>
							<div id="_sub4ContentList" class="_subTabs subTab-4">
							
							</div>
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
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../../include/fixed_header_en.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	
	function getData(start, end, idx){
		
		var url = "<c:url value='/foundation/history/getData.json' />";
		axios.get(url,{
				params: {start:start, end:end}
			})
		  .then(function (res) {
			  
			  $("._sub"+ idx +"YearList").empty();
			  $("#_sub"+ idx +"ContentList").html('');
			  var yearContent = '';
			  var historyContent = '';
			  var yearInfos = res.data.result.yearInfos;
			  var historyByYears = res.data.result.hitstoryByYears;
			  for(var yearIdx in yearInfos){
				  var item = yearInfos[yearIdx];
				  if(CommonUtil.isEmpty(item.endYear)){
				  	yearContent += '<li class="chap-link _chap-link" data-tab="chap-'+ item.year +'">'+ item.year +'</li>';
				  }else{
				  	yearContent += '<li class="chap-link _chap-link" data-tab="chap-'+ item.year +'">'+ item.year +' ~ '+ item.endYear +'</li>';
				  }
				  
				  var historyList = _.filter(historyByYears, function(t){return t.year == item.year});
				  var monthList = _.groupBy(historyList, function(t){return t.month});
				  
				  historyContent +='<div id="chap-'+ item.year +'" class="chap-content _chap-content">';
				  historyContent +='<table>';
				  
				  var sortKey = _.sortBy(_.keys(monthList), function(num){return num;}).reverse();

				  
				  for(var keyIdx in sortKey){
					  
					  var monthIdx = sortKey[keyIdx];
						var conList = monthList[monthIdx];
						historyContent +='	<tr>';
						if(CommonUtil.isEmpty(item.endYear)){
							historyContent +='	<th>'+monthIdx+'&nbsp;Month</th>';
						}else{
							historyContent +='	<th class="h_1991">'+item.year +'&nbsp;Year&nbsp;~&nbsp;'+ item.endYear+'&nbsp;Year</th>';	
						}
						historyContent +='	<td>';
						for(var conIdx in conList){
							historyContent +=' - '+conList[conIdx].content+'<br/>';
						}
						historyContent +='	</td>';
						historyContent +='	</tr>';
				  }
				  
				  historyContent +='</table>';
				  historyContent +='</div>';
			  }
			  
			  $("._sub"+ idx +"YearList").html(yearContent);
			  $("#_sub"+ idx +"ContentList").html(historyContent);
			  
			  $("._sub"+ idx +"YearList").children().first().trigger('click');
			  
			  
			  if(idx == 1){
				  setTimeout(function() {
					  	$(window).scrollTop('223');
						}, 150);
				}
		  });
	}
	
	//자세히보기 클릭 이벤트
	$(document).on('click', '._chap-link',function(){
		  var tabDomId = $(this).data('tab');
		  $("._chap-link").removeClass('surrent');
		  $("._chap-content").removeClass('surrent');
		  $(this).addClass('surrent');
		  $("#"+tabDomId).addClass('surrent');
	});
		
	$(document).ready(function(){
		$("._topTab").click(function(){
			var idx = $(this).data('idx');
			var start = $(this).data('start');
			var end = $(this).data('end');
			
			$("._topTab").removeClass('current');
			$(this).addClass('current');
			
			$("._subTabs").hide();
			$(".subTab-"+idx).show();
			
			getData(start, end, idx);
		});
		
		$("._topTab").first().trigger('click');
		
	});
	
	</script>
</body>
</html>
