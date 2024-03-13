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
    <meta property="og:description" content="<c:out value='${result.title}'/>" />
    <meta property="og:image" content="<c:url value='/customer/healthinfo/thum/${result.seq }.view'/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
	
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/04_sub03_inner2.css?ver=20240118'/>" type="text/css" rel="stylesheet"/>
	
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

					<div id="sub_title2">
						<p><c:out value="${childMenuName }"/></p>
						<img id="btnPrint" src="<c:url value='/user/img/sub/03sub_ico01.png'/>" title="인쇄" alt="출력아이콘"/>
					</div>

					<!--sub_story-->
					<div class="sub_story">

						<div id="oneclick_paper">
							<img src="<c:out value='${result.imgContent}'/>" style="max-width:1100px;" alt="원클릭이미지"/>
						</div>

						<div class="oneclick_table">
							<p><spring:message code="healthinfo.testinfo"/></p>							
							<table>
								<colgroup>
									<col width="10%"/>
									<col width="30%"/>
									<col width="20%"/>
									<col width="20%"/>
									<col width="20%"/>
								</colgroup>
								<thead>
									<tr>
										<th><spring:message code="healthinfo.testCode" /></th>
										<th><spring:message code="healthinfo.testName" /></th>
										<th><spring:message code="healthinfo.specimen" /></th>
										<th><spring:message code="healthinfo.testMethod" /></th>
										<th><spring:message code="healthinfo.testDay" />/<spring:message code="healthinfo.processDay" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.tests}" var="item">
									<tr class="_rowTest" data-seq="<c:out value='${item.seq }'/>">
										<td><c:out value='${item.testCode }'/></td>
										    <input type="hidden" id="hiddenYn" value='${item.testCode}'/>
										<td>
											<span style="font-weight:bold;color:#000;">
												<c:out escapeXml="false"  value='${item.testName }'/>
												<c:if test="${not empty item.comment }">
											</span>
											<br/>
											<span style="color:#000;">
												<c:out escapeXml="false" value='${item.comment }'/>
												</c:if>
											</span>
										</td>
										<td><c:out escapeXml="false" value='${item.specimen }'/></td>
										<td><c:out escapeXml="false"  value='${item.testMethod }'/></td>
										
										<!-- 검사일과 소요일 데이터 빈값 체크하여 2개 값 사이에 / 를 소요일이 존재할 경우만 표기되도록 수정 -->
										<c:choose>
										
											<c:when test="${item.processDay eq ' ' || empty item.processDay}">
										    	<td><c:out escapeXml="false"  value='${item.testDay }'/>  
										    </c:when>
										    
										    <c:when test="${item.testDay eq ' ' || empty item.testDay}">
										    	<td><c:out escapeXml="false"  value='${item.processDay }'/>  
										    </c:when>
										
										    <c:when test="${item.testDay ne ' ' && item.processDay ne ' '}">
										    	<td><c:out escapeXml="false"  value='${item.testDay }'/> / <c:out escapeXml="false" value='${item.processDay }'/></td>
										    </c:when>
										
										    <c:otherwise>
										       <td><c:out escapeXml="false"  value='${item.testDay }'/><c:out escapeXml="false" value='${item.processDay }'/></td>
										    </c:otherwise>
										    
										</c:choose>
										
<%-- 										<td><c:out value='${item.testDay }'/> / <c:out value='${item.processDay }'/> <spring:message code="healthinfo.day" /></td> --%>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="oneclick_info">
							<table >
								<thead></thead>
									<tbody>
										<tr>
										<%-- 	<th><spring:message code="healthinfo.writer" /><img src="<c:url value='/user/img/sub/sil2.png'/>" style="margin-right:5px;" alt="아이콘"/></th>
											<td><c:out value="${result.writer }"/></td>
											<th><spring:message code="healthinfo.inspector" /><img src="<c:url value='/user/img/sub/sil2.png'/>" style="margin-right:5px;" alt="아이콘"/></th>
											<td><c:out value="${result.inspector }"/><br/>(<c:out value="${result.inspectorCmt }"/>)</td> 
										--%>
										<td width="400px;"></td>
											<th><spring:message code="healthinfo.source" /><img src="<c:url value='/user/img/sub/sil2.png'/>" style="margin-right:5px;" alt="아이콘"/></th>
											<td>
												<ul>
													<c:forEach items="${result.sources }" var="item">
													<li style="max-width: 400px;">
													<c:choose>
														<c:when test="${not empty item.url }">
															<a href="<c:out value='${item.url }'/>" target="_blank"><c:out value="${item.source }"/></a>
														</c:when>
														<c:otherwise>
															<c:out value="${item.source }"/>
														</c:otherwise>
													</c:choose>
													<c:if test="${not empty item.comment }">
													<br/><span><c:out escapeXml="false" value="${item.comment }"/></span>
													</c:if>
													</li>
													</c:forEach>
												</ul>
											</td>
										</tr>
									</tbody>
							</table>
						</div>


					</div>
					<!--//sub_story End-->
					<div class="oneclick_page">
						<ul>
							<c:if test="${result.pre.seq > 0 }">
							<li class="left _move" data-seq="<c:out value='${result.pre.seq }'/>"><span><spring:message code="search.pre" /></span></li>
							</c:if>
							<li class="_golist"><span><spring:message code="search.list" /></span></li>
							<c:if test="${result.next.seq > 0 }">
							<li class="right _move" data-seq="<c:out value='${result.next.seq }'/>"><span><spring:message code="search.next" /></span></li>
							</c:if>
						</ul>
					</div>
					<form id="hiddenForm" method="get">
						<input type="hidden" name="searchKeyword" id="inputKeyword" value="<c:out value='${param.searchKeyword}'/>"/>
					</form>
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
		<jsp:include  page="../../../include/fixed_header_en.jsp"></jsp:include >
	<script type="text/javascript">
	
	
		$(document).ready(function(){
			
			if($("#hiddenYn").val().trim() =="" ){
				$(".oneclick_table").css("display","none");
			};
			
			
			var seq = '<c:out value="${result.seq }"/>';
			
			if(seq == ''){
				alert('<spring:message code="healthinfo.no.seq" />');
				location.href="<c:url value='/customer/healthinfo/index.do' />";
			}

			$("#oneclick_paper").bind("contextmenu", function(e){return false;});
			$("#oneclick_paper").bind("selectstart", function(e){return false;});
			$("#oneclick_paper").bind("dragstart", function(e){return false;});
			

			$("._golist").click(function(){
				$("#hiddenForm").attr('action', "<c:url value='/customer/healthinfo/index.do' />").submit();
			});
			
			
			$("._move").click(function(){
				var seq = $(this).data('seq');
				$("#hiddenForm").attr('action', "<c:url value='/customer/healthinfo/" + seq + ".view' />").submit();
			});
			
			
			$("#btnPrint").click(function(){
				$(".sub_story").printThis({
				    importCSS: true,
// 				    loadCSS: "<c:url value='/user/css/04_sub03_inner.css'/>",
				});
			});
			
		});
	
	
	</script>
</body>
</html>
