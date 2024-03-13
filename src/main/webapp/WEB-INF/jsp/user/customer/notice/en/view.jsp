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
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
    <meta property="og:title" content=":: <spring:message code="title" /> ::" />
    <meta property="og:url" content="<c:url value='${fullUrl}'/>" />
    <meta property="og:description" content="<c:out value='${result.title}'/>" />
    <meta property="og:image" content="<c:url value='/customer/notice/thum/${result.seq }.view'/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/04_sub01_inner.css?ver=20230721'/>" type="text/css" rel="stylesheet"/>
	
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

							 <!-- <div class="red_bar"><img src="./img/sub/red_bar.png" alt="빨강막대기"></div>

						<span>재단방문 시 참고하세요!
						</span> -->
					</div>

					<!--sub_story-->
					<div class="sub_story">
						<div class="notice_inner">
							<table class="table1">

								<colgroup>
									<col width='10%'/>
									<col width='38%'/>
									<col width='10%'/>
									<col width='50%'/>
								</colgroup>
								<tbody>
									<tr>
										<th><spring:message code="notice.list.number" /></th>
										<td colspan="3"><c:out value="${result.noticeNumber }"/></td>
									</tr>
									<tr>
										<th><spring:message code="notice.view.title" /></th>
										<td><c:out value="${result.title }"/></td>
										<th><spring:message code="notice.view.writer" /></th>
										<td><spring:message code="title" /></td>
									</tr>

									<tr>
										<th><spring:message code="notice.view.date" /></th>
										<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.editDate}" /></td>
										<th><spring:message code="notice.view.count" /></th>
										<td><c:out value="${result.hitCnt}"/></td>
									</tr>

									<tr>
										<th><spring:message code="notice.view.file" /></th>
										<td colspan="3" class="td_zip">
											<ul>
												<c:forEach items="${result.files }" var="item">
													<li class="_fileDown" data-seq="<c:out value='${item.seq }'/>" title="다운로드"><img src="<c:url value='/user/img/sub/folder.png' />" class="folder_ico" alt="폴더아이콘"><c:out value="${item.fileName }"/></img></li>
												</c:forEach>
												
											</ul>
										</td>
									</tr>

									<tr>
										<td class="table_story" colspan="4">
											<c:out escapeXml="false" value="${result.content }"/>
										</td>
									</tr>
								</tbody>
							</table>

							<table class="table2">
								<colgroup>
									<col width="8%"/>
									<col width="92%"/>
								</colgroup>
								<tbody>
									<tr>
										<c:choose>
											<c:when test="${result.preNotice.seq > 0 }">
												<th style="border-bottom:1px solid #ccc;" class="th_sil"><spring:message code="search.pre" /></th>
												<td class="_move" data-seq="<c:out value='${result.preNotice.seq }'/>" style="border-bottom:1px solid #ccc;"><c:out value="${result.preNotice.title }"/></td>
											</c:when>
											<c:otherwise>
												<th class="th_sil"><spring:message code="search.pre" /></th>
												<td><spring:message code="search.pre.empty" /></td>	
											</c:otherwise>
										</c:choose>
									</tr>
									
									<tr>
										<c:choose>
											<c:when test="${result.nextNotice.seq > 0 }">
												<th style="border-bottom:1px solid #ccc;" class="th_sil"><spring:message code="search.next" /></th>
												<td class="_move" data-seq="<c:out value='${result.nextNotice.seq }'/>" style="border-bottom:1px solid #ccc;"><c:out value="${result.nextNotice.title }"/></td>
											</c:when>
											<c:otherwise>
												<th class="th_sil"><spring:message code="search.next" /></th>
												<td><spring:message code="search.next.empty" /></td>	
											</c:otherwise>
										</c:choose>
									</tr>
								</tbody>
							</table>

								<div class="back_notice">
									<span class="_golist"><spring:message code="search.list" /></span>
								</div>
								<form id="hiddenForm" method="get">
									<input type="hidden" name="codeCenterType" id="search_area" value="<c:out value='${param.codeCenterType}'/>"/>
									<input type="hidden" name="searchOption" id="search_select" value="<c:out value='${param.searchOption}'/>"/>
									<input type="hidden" name="searchKeyword" id="inputKeyword" value="<c:out value='${param.searchKeyword}'/>"/>
									
									<c:choose>
										<c:when test="${empty param.currentPage}">
											<input type="hidden" name="currentPage" id="currentPage" value="1"/>
										</c:when>
										<c:otherwise>
											<input type="hidden" name="currentPage" id="currentPage" value="<c:out value="${param.currentPage }"/>"/>
										</c:otherwise>
									</c:choose>
									
								</form>
						</div>
					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<%-- <jsp:include  page="../../include/rolling.jsp"></jsp:include > --%>

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
		<jsp:include  page="../../../include/fixed_header.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	
	
		$(document).ready(function(){
			
			var seq = '<c:out value="${result.seq }"/>';
			var title = '<c:out value="${result.title }"/>';
			
			if(seq == ''){
				alert('<spring:message code="notice.view.no.seq" />');
				location.href="<c:url value='/customer/notice/index.do' />";
			}
			

			$("._golist").click(function(){
				$("#hiddenForm").attr('action', "<c:url value='/customer/notice/index.do' />").submit();
			});

			$("._fileDown").click(function(){
				var fileSeq = $(this).data('seq');
				location.href="<c:url value='/customer/notice/download/" + seq + "/" + fileSeq + ".do' />";
			});
			
			
			$("._move").click(function(){
				var seq = $(this).data('seq');
				$("#hiddenForm").attr('action', "<c:url value='/customer/notice/" + seq + ".view' />").submit();
			});
			
			
		});
	
	
	</script>
</body>
</html>
