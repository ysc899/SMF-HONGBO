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
	<link href="<c:url value='/user/css/03_sub07.css'/>" type="text/css" rel="stylesheet"/>
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
						<div id="tab-1" class="tab-content current tab_common">

							<div class="one_search">
								<form id="searchForm" method="get">
									<span><spring:message code="search.msg" /></span>
									<input type="text" class="_searchKeyword" name="searchKeyword" max-length="30" placeholder="<spring:message code="search.hint" />" value="<c:out value='${param.searchKeyword }'/>"/>
									<img class="_search" src="<c:url value='/user/img/search.png'/>" alt="검색" />
								</form>
							</div>
							<div class="sil_box">
							<c:forEach items="${result.thumList }" varStatus="status" var="item">
								<c:if test="${status.count % 4 == 1 }">
									<div class="sil_bg">
										<ul class="book_ul book_gray">
								</c:if>
										<li>
											<img src="<c:out escapeXml="false" value="${item.thumFileContent }"/>" class="popup_bt _thumRow" data-seq="<c:out value='${item.seq }'/>" data-title="<c:out value='${item.title }'/>" alt="인증서"/>
	
											<b class="b2">
												<span class="more_name2 popup_bt _thumRow" data-seq="<c:out value='${item.seq }'/>" data-title="<c:out value='${item.title }'/>" title="크게보기"><c:out value='${item.title }'/></span>
											</b>
												<ul>
													<li data-seq="<c:out value='${item.seq }'/>" data-title="<c:out value='${item.title }'/>" class="popup_bt _thumRow2" title="미리보기" value="${item.thumFileContent }" ></li>
													<li></li>
													<li class="_print" data-seq="<c:out value='${item.seq }'/>" title="<spring:message code="cret.print" />"></li>
													<li></li>
													<li class="_download" data-seq="<c:out value='${item.seq }'/>" title="<spring:message code="cret.download" />"></li>
												</ul>
										</li>
								
								
								<c:if test="${status.count % 4 == 0 || status.last }">
										</ul>
									</div>
								</c:if>
							</c:forEach>
							</div>

							<div class="download_area">
								<ul>
								<c:forEach items="${result.normalList }" var="item" varStatus="status">
									<c:if test="${status.count % 2 == 1 }">
										<li>
											<span><c:out value="${item.title }"/></span>
											<a href="javascript:void(0);" title="다운로드" class="down_img _download" data-seq="<c:out value='${item.seq }'/>"></a>
											<a href="javascript:void(0);" title="인쇄" class="search_img _print" data-seq="<c:out value='${item.seq }'/>"></a>
											<a href="#none" title="미리보기" class="popup_bt view_img" onclick="thum('<c:out value="${item.seq }"/>','<c:out value="${item.title }"/>')"></a>
										</li>
									</c:if>
								</c:forEach>
								</ul>
								<ul>
								<c:forEach items="${result.normalList }" var="item" varStatus="status">
									<c:if test="${status.count % 2 == 0 }">
										<li>
											<span><c:out value="${item.title }"/></span>
											<a href="javascript:void(0);" title="다운로드" class="down_img _download" data-seq="<c:out value='${item.seq }'/>"></a>
											<a href="javascript:void(0);" title="인쇄" class="search_img _print" data-seq="<c:out value='${item.seq }'/>"></a>
											<a href="#none" title="미리보기" class="popup_bt view_img" onclick="thum('<c:out value="${item.seq }"/>','<c:out value="${item.title }"/>')"></a>
										</li>
									</c:if>
								</c:forEach>
								</ul>
<!-- 								<ul> -->
<%-- 								<c:forEach items="${result.normalList }" var="item" varStatus="status"> --%>
<%-- 									<c:if test="${status.count % 3 == 0 }"> --%>
<!-- 										<li> -->
<%-- 											<span><c:out value="${item.title }"/></span> --%>
<%-- 											<a href="javascript:void(0);" title="파일다운로드" class="down_img _download" data-seq="<c:out value='${item.seq }'/>"></a> --%>
<%-- 											<a href="javascript:void(0);" title="인쇄" class="search_img _print" data-seq="<c:out value='${item.seq }'/>"></a> --%>
<!-- 										</li> -->
<%-- 									</c:if> --%>
<%-- 								</c:forEach> --%>
<!-- 								</ul> -->
							</div>

						</div>

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
				<span id="paper_name"></span>
					<div class="right_ico">
						<img src="<c:url value='/user/img/sub/03sub_ico05.png'/>" class="_print" id="popupPrint"  alt="출력아이콘" style="cursor:pointer;" title="인쇄"/>
						<img src="<c:url value='/user/img/sub/sil5.png'/>" alt="실" class="sil"/>
						<img src="<c:url value='/user/img/sub/03sub_ico06.png'/>" class="_download" id="popupDownload" alt="다운로드아이콘" style="cursor:pointer;" title="다운로드"/>
					</div>
					<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
			</div>

			<div class="popup_inner">
				<img src="" alt="" class="paper _content"/>
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup-->
	<script type="text/javascript">
	
		function search(){
			$("#searchForm").submit();
		}
		
		function thum(seq , title) {
			$("#paper_name").html(title);
			$("#popupPrint").data('seq', seq);
			$("#popupDownload").data('seq', seq);
			$("._content").attr('src', '/user/img/inner/letter_'+seq+'.png');
		}
		
		
		$(document).ready(function(){
			
			$("._download").click(function(){
				var seq = $(this).data('seq');
				location.href="<c:url value='/task/request/download/" + seq + ".do' />";
			});
			$("._print").click(function(){
				var seq = $(this).data('seq');
				window.open("<c:url value='/task/request/view/" + seq + ".do' />", '_blank'); 
			});
			
			$("._thumRow").click(function(){
				var seq = $(this).data('seq');
				var title = $(this).data('title');
				
				var url = "<c:url value='/task/request/base64/" + seq + ".do' />";
				axios.get(url)
				  .then(function (res) {
					$("#paper_name").html(title);
					$("#popupPrint").data('seq', seq);
					$("#popupDownload").data('seq', seq);
					console.log(res);
					$("._content").attr('src', res.data.result);
				});
				
// 				base64
// 				$("._content").attr('src',"<c:url value='/task/request/view/" + seq + ".do' />" );
			});
			
			$("._thumRow2").click(function(){
				var seq = $(this).data('seq');
				var title = $(this).data('title');
				
				var url = "<c:url value='/task/request/base64/" + seq + ".do' />";
				axios.get(url)
				  .then(function (res) {
					$("#paper_name").html(title);
					$("#popupPrint").data('seq', seq);
					$("#popupDownload").data('seq', seq);
					console.log(res);
					
					$("._content").attr('src', res.data.result);
					  
				});
			});
			
			$("._thumRow3").click(function(){
				alert("미리보기");
			
				var seq = $(this).data('seq');
				var title = $(this).data('title');
				/*
				var url = "<c:url value='/task/request/base64/" + seq + ".do' />";
				axios.get(url)
				  .then(function (res) {
					$("#paper_name").html(title);
					$("#popupPrint").data('seq', seq);
					$("#popupDownload").data('seq', seq);
					console.log(res);
					
					$("._content").attr('src', res.data.result);
					  
				});
				*/
			});
			
			$("._search").click(function(){
				search();
			});
			$("._searchKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search();
				}
			});
	
		});
	
	
	</script>
</body>
</html>
