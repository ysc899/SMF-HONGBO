<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<link href="<c:url value='/user/css/common.css?ver=20230711'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/06_sub03.css'/>" type="text/css" rel="stylesheet"/>
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
			<p class="vision_title"><c:out value="${childMenuName }"/></p>
		</div>

		<!--sub_story-->
		<div class="sub_story">

			<img src="/user/img/vision/vision_2025_01.jpg" no-repeat 0 0;></img>
			<img src="/user/img/vision/vision_2025_02.jpg?ver=20230711" no-repeat 0 0; style="margin-left:-108px;"></img>
			<img src="/user/img/sub/vision_03.jpg" no-repeat 0 0;></img>

		</div>
		<!--//sub_story End-->

	</div>
	<!--//container End-->

	<div class="vision_bg_gray"></div>

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




</script>
</body>
</html>
