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
	<link href="<c:url value='/user/css/04_sub05_2.css?ver=20230721'/>" type="text/css" rel="stylesheet"/>
	
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
						<c:forEach items="${result.codes }" var="item" varStatus="status">
							<li class="tab-link no_bottom _row-<c:out value='${status.count }'/>" data-tab="tab-<c:out value='${status.count }'/>" ><c:out value="${item.codeName }"/></li>
						</c:forEach>
						<li class="tab-link no_bottom _row-10" style="border-left-width: 0px;" data-tab="tab-10" >특수건강진단</li>
					</ul>

					<!--tab menu01-->
					<c:forEach items="${result.codes }" var="item" varStatus="status">
					
						<div id="tab-<c:out value='${status.count }'/>" class="tab-content tab_common faq<c:out value='${status.count }'/>">
							<table cellspacing="0" class="recruit">
								
								<c:forEach items="${result.faqList }" var="target" varStatus="tStatus">
									<c:if test="${target.codeCategoryType ==  item.slaveCode}">
									<tr class="title">
										<td class="img_td"><img src="<c:url value='/user/img/sub/Q.png'/>" alt="Q이미지"/></td>
										<td><a href="javascript:void(0);" class="_question" data-seq="a_<c:out value='${status.count}'/>_<c:out value='${tStatus.count  }'/>"><c:out escapeXml="false" value="${target.question }"/></a></td>
									</tr>
		
									<tr class="hide" id="a_<c:out value='${status.count}'/>_<c:out value='${tStatus.count  }'/>">
										<td class="img_td2"><img src="<c:url value='/user/img/sub/A.png'/>" alt="A이미지"/></td>
										<td><span><c:out escapeXml="false" value="${target.answer }"/></span></td>
									</tr>
									</c:if>
								</c:forEach>
	
							</table>
						</div>
					</c:forEach>
						<div id="tab-10" class="tab-content tab_common faq10">
							<table cellspacing="0" class="recruit">
								
								<c:forEach items="${specialResult.faqList }" var="target" varStatus="tStatus">
									<tr class="title">
										<td class="img_td"><img src="<c:url value='/user/img/sub/Q.png'/>" alt="Q이미지"/></td>
										<td><a href="javascript:void(0);" class="_question" data-seq="a_<c:out value='${status.count}'/>_<c:out value='${tStatus.count  }'/>"><c:out escapeXml="false" value="${target.question }"/></a></td>
									</tr>
		
									<tr class="hide" id="a_<c:out value='${status.count}'/>_<c:out value='${tStatus.count  }'/>">
										<td class="img_td2"><img src="<c:url value='/user/img/sub/A.png'/>" alt="A이미지"/></td>
										<td><span><c:out escapeXml="false" value="${target.answer }"/></span></td>
									</tr>
								</c:forEach>
	
							</table>
						</div>
					<!--//tab menu01 End-->


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
	<div class="red_bg"></div>
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
			
			$("._row-"+ arrHash[1]).trigger('click');
			
		}else{
			$(".tab-link").first().trigger('click');
		}
		  setTimeout(function() {
			  	$(window).scrollTop('223');
				}, 150);
	}
	//해시태그 변경될때 메소드
	$(window).bind('hashchange', function() {
		checkHash();
	});
	
	
	$(document).ready(function(){
		$("._row-1").trigger('click');
		
		$("._question").click(function(){
			
			var domId = $(this).data('seq');

			
			$("._question").removeClass('bold');
			
			if($("#"+domId).attr('class') == 'hide'){
				
				$(this).addClass('bold');
				$(".show").removeClass('show').addClass('hide');
				$("#"+domId).removeClass('hide').addClass('show');
			}else{
				$(".show").removeClass('show').addClass('hide');
			}
			
		});
		
		checkHash();
// 		setTimeout(function() {
// 		  	$(window).scrollTop('223');
// 			}, 150);
		
	});
	
	
	</script>
</body>
</html>
