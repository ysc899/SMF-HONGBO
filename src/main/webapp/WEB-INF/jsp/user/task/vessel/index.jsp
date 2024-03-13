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
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/03_sub05.css'/>" type="text/css" rel="stylesheet"/>
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

					<!--sub_story-->
					<div class="sub_story">

						<div class="one_search">
							<form id="searchForm"  onSubmit="return false;">
								<span><spring:message code="search.msg" /></span>
								<input type="text" class="_searchKeyword" name="searchKeyword" placeholder="<spring:message code="search.hint" />" value="<c:out value='${param.searchKeyword }'/>"/>
								<img class="_search" src="<c:url value='/user/img/search.png'/>" alt="검색" />
								<input type="hidden" name="currentPage" value="0" id="current"/>
							</form>
						</div>
						
						<!--one more-->
						<div class="one_more">
							<div class="one_more_plus">
								<span><spring:message code="vessel.view.all" /></span>
								<a href="javascript:void(0);" class="one_more_ico"><img src="<c:url value='/user/img/plus2.png'/>" alt="플러스"/></a>
							</div>

							<div class="one_more_inner">
								<div class="one_more_inner2">
								<ul style="width:360px;">
								<c:forEach items="${allList}" var="item" varStatus="status">
									<c:if test="${status.count % 3 == 1 }">
									<li class="_row" data-seq="<c:out value='${item.seq }'/>"><c:out value='${item.title }'/></li>
									</c:if>
								</c:forEach>
								</ul>
								<ul style="width:345px;">
								<c:forEach items="${allList}" var="item" varStatus="status">
									<c:if test="${status.count % 3 == 2 }">
									<li class="_row" data-seq="<c:out value='${item.seq }'/>"><c:out value='${item.title }'/></li>
									</c:if>
								</c:forEach>
								</ul>
								<ul style="width:345px;">
								<c:forEach items="${allList}" var="item" varStatus="status">
									<c:if test="${status.count % 3 == 0 }">
									<li class="_row" data-seq="<c:out value='${item.seq }'/>"><c:out value='${item.title }'/></li>
									</c:if>
								</c:forEach>
								</ul>
<!-- 								<ul> -->
<%-- 								<c:forEach items="${allList}" var="item" varStatus="status"> --%>
<%-- 									<c:if test="${status.count % 4 == 0 }"> --%>
<%-- 									<li class="_row" data-seq="<c:out value='${item.seq }'/>"><c:out value='${item.title }'/></li> --%>
<%-- 									</c:if> --%>
<%-- 								</c:forEach> --%>
<!-- 								</ul> -->

								</div>
							</div>
						</div>
						<!--//one_more End-->
						
						<!--capsule_area-->
						<div class="capsule_area">
							<!--capsule_ul01-->
							<div class="capsule_ul01" id="vesselList">
							</div>
							<!--//capsule_ul01 End-->

							<div class="one_click_more_view" id="more">
								<span><spring:message code="search.more" /></span><b>+</b>
							</div>
						</div>
						<!--//capsule_area End-->



					</div>
					<!--//sub_story End-->

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
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../include/fixed_header.jsp"></jsp:include >
	</div>
	
<!--popup-->
	<div id="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="popupTitle"></span>
				<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="close"/></b>
			</div>

			<div class="capsule_img">
				<img src="" alt="" class="_popupImg"/>
			</div>

			<div class="capsule_table">
				<table>
					<thead></thead>
					<tbody>
						<tr>
							<th><spring:message code="vessel.view.title" /></th>
							<td class="_popupTitle"></td>
						</tr>

						<tr>
							<th><spring:message code="vessel.view.testname" /></th>
							<td class="_popupInspectionName"></td>
						</tr>

						<tr>
							<th><spring:message code="vessel.view.option" /></th>
							<td class="_popupCodeVesselscName"></td>
						</tr>

						<tr>
							<th><spring:message code="vessel.view.comment" /></th>
							<td class="_popupComment" style="padding-top:10px; padding-bottom: 10px; line-height: 1.2em;"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<img src="<c:url value='/user/img/sub/arrow_left.png'/>" alt="왼쪽화살표" class="arrow_left _popupLeft _row" />
			<img src="<c:url value='/user/img/sub/arrow_right.png'/>" alt="오른쪽화살표" class="arrow_right _popupRight _row" />
		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup-->
	<script type="text/javascript">
	
		function search(){
			$("#current").val(0);
			$('#vesselList').html('');
			
			getData();
		}
	
	
		function getData(){
			var param = $('#searchForm').serializeObject();
			param.currentPage = Number(param.currentPage)+1;
			
			var url = "<c:url value='/task/vessel/moreInfo.json' />";
			axios.get(url,{
					params: param
				})
			  .then(function (res) {
				  
				  var content = '';
				  for(var idx = 0; idx < res.data.result.content.length ; idx++){
					  var item = res.data.result.content[idx];
					  var checkIdx = (idx+1) % 2;
					if(checkIdx == 1){
						content +='<ul>';
					}
					content += '<li>';
					content += '	<table><tbody><tr>';
					content += '		<td class="capsule_img _row" data-seq="'+ item.seq +'">';
					content += '			<img src="'+ item.fileContent +'" style="max-width:184px;" alt="vessel image">';
					content += '		</td>';
					content += '		<td class="capsule_td">';
					if(CommonUtil.isEmpty(item.subTitle)){
					content += '			<p>' + item.title + '</p>';
					}else{
					content += '			<p>' + item.title + '('+ item.subTitle +')</p>';
					}
					content += '		<span class="capsule_span">' + item.inspectionName + '</span>';
					content += '		<b class="capsule_bt _row"  data-seq="'+ item.seq +'"><spring:message code="vessel.view" /></b>';
					content += '	</tr></tbody></table>';
					content += '</li>';
					
					if(checkIdx == 0){
						content +='	</ul>';
					}
				  }
				  
				  $('#vesselList').append(content);
				  $('#current').val(res.data.result.currentPage);
				  
				  if(res.data.result.currentPage == res.data.result.totalPages){
				  	$('#more').hide();
				  }else{
				  	$('#more').show();
				  }
				  
				  if(param.currentPage == 1){
					  setTimeout(function() {
					  	$(window).scrollTop('223');
						}, 150);
				  }
				  
			  });
		}
		
		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			var seq = $(this).data('seq');
			
			var url = "<c:url value='/task/vessel/"+ seq +"/viewInfo.json' />";
			axios.get(url)
			  .then(function (res) {
				  var item = res.data.result;
				  
				  var title = item.title;
				  
				  if(!CommonUtil.isEmpty(item.subTitle)){
					title += ' ('+ item.subTitle +')';
				  }
				  $("#popupTitle").html(title);
				  $("._popupTitle").html(title);
				  $("._popupImg").attr('src', item.fileContent);
				  $("._popupInspectionName").html(item.inspectionName);
				  $("._popupCodeVesselscName").html(item.codeVesselscName);
				  $("._popupComment").html(item.comment);
				  
				  if(item.preSeq == 0){
					  $("._popupLeft").hide();
				  }else{
					  $("._popupLeft").show();
					  $("._popupLeft").data('seq', item.preSeq);
				  }
				  if(item.nextSeq == 0){
					  $("._popupRight").hide();
				  }else{
					  $("._popupRight").show();
					  $("._popupRight").data('seq', item.nextSeq);
				  }
				  
				  
			  });
			
			
			$('#modal').stop().fadeIn(300);
			  $('#modal > .popup_bg , .close_bt').click(function(){
			    $('#modal').fadeOut(300);
			  });
		});
		
		$(document).ready(function(){
			search();
			
			$("._search").click(function(){
				search();
			});
			$("._searchKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search();
				}
			});
			
			$("#more").click(function(){
				getData();
			});
	
			
		});
	
	
	</script>
</body>
</html>
