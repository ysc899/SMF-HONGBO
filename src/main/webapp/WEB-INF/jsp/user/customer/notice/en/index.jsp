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
	<link href="<c:url value='/user/css/04_sub01.css?ver=20230721'/>" type="text/css" rel="stylesheet"/>
	
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

					<div class="sub_story">

						<div class="notice_table">

							<div class="n_left">
								<b><spring:message code="search.total" /> <c:out value="${result.totalElements }"/></b> <span>[<c:out value="${result.currentPage }"/>/<c:out value="${result.totalPages }"/><spring:message code="search.page" />]</span>
							</div>

							<form id="searchForm" method="get">
							<div class="n_right">
								<select name="codeCenterType" id="search_area" style="display:none;">
									<option value=""><spring:message code="search.all" /></option>
									<c:forEach items="${defaultInfo.centerCodes}" var="item">
										<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.codeName }"/></option>
									</c:forEach>
								</select>
								<select name="searchOption" id="search_select">
									<option value=""><spring:message code="search.all" /></option>
									<option value="title"><spring:message code="notice.option1" /></option>
									<option value="content"><spring:message code="notice.option2" /></option>
								</select>
								<input type="text" placeholder="<spring:message code="search.hint" />" class="search_text"  name="searchKeyword" id="inputKeyword" value="<c:out value='${ result.option.searchKeyword}'/>"/>
								<input type="button" class="search_bt" id="btnSearch"/>
								<input type="hidden" name="currentPage" id="currentPage" value="<c:out value="${result.option.currentPage }"/>"/>
							</div>
							</form>

							<!--notice table-->
							<table>
								<colgroup>
									<col width="7%"/>
									<col width="6%"/>
									<col width="15%"/>
									<col width="55%"/>
									<col width="12%"/>
									<col width="5%"/>
								</colgroup>
								<thead>
									<tr>
										<th><spring:message code="notice.list.row" /></th>
										<th><spring:message code="notice.list.area" /></th>
										<th><spring:message code="notice.list.number" /></th>
										<th><spring:message code="notice.list.title" /></th>
										<th><spring:message code="notice.list.date" /></th>
										<th><spring:message code="notice.list.count" /></th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${notice}" var="item">
									<tr class="notice_header_td">
										<td><span><spring:message code="notice.notice" /></span></td>
										<td><c:out value="${item.codeCenterName}"/></td>
										<td><c:out value="${item.noticeNumber}"/></td>
										<td class="left_td">
											<a href="javascript:void(0);" class="_row" data-seq="<c:out value='${item.seq }'/>" style="font-weight:600;color:#333;"><c:out value="${item.title}"/></a>
											<c:if test="${item.fileCnt > 0 }">
											<img src="<c:url value='/user/img/sub/folder.png'/>" alt="폴더아이콘"/>
											</c:if>
										</td>
										<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></td>
										<td><c:out value="${item.hitCnt}"/></td>
									</tr>
									</c:forEach>
									
									<c:forEach items="${result.content}" var="item">
									<tr>
										<td><c:out value="${item.row}"/></td>
										<td><c:out value="${item.codeCenterName}"/></td>
										<td><c:out value="${item.noticeNumber}"/></td>
										<td class="left_td">
											<a href="javascript:void(0);" class="_row" data-seq="<c:out value='${item.seq }'/>" style="font-weight:600;color:#333;"><c:out value="${item.title}"/></a>
											<c:if test="${item.fileCnt > 0 }">
											<img src="<c:url value='/user/img/sub/folder.png'/>" alt="폴더아이콘"/>
											</c:if>
										</td>
										<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></td>
										<td><c:out value="${item.hitCnt}"/></td>
									</tr>
									</c:forEach>

								</tbody>
							</table>
							<!--//notice_table End-->

							<!--page_number-->
							<div class="page_number">
								<c:if test="${result.option.currentPage > 2 }">
								<img src="<c:url value='/user/img/sub/prev_bt2.png'/>" class="prev_bt _btnPrev2" alt="이전버튼"/>
								</c:if>
								<c:if test="${result.option.currentPage > 1 }">
								<img src="<c:url value='/user/img/sub/prev_bt.png'/>" class="prev_bt _btnPrev" alt="이전버튼"/>
								</c:if>
								<ul>
									<c:set var="startPage" value="1"/>
									<c:set var="endPage" value="10"/>
									<c:choose>
										<c:when test="${result.totalPages <= 10 }">
											<c:set var="startPage" value="1"/>
											<c:set var="endPage" value="${result.totalPages}"/>
										</c:when>
										<c:when test="${result.totalPages > 10 && result.option.currentPage > 4 && result.option.currentPage <= (result.totalPages -5) }">
											<c:set var="startPage" value="${result.option.currentPage -4 }"/>
											<c:set var="endPage" value="${result.option.currentPage +5 }"/>
										</c:when>
										<c:when test="${result.totalPages > 10 && (result.totalPages - result.option.currentPage) < 5  }">
											<c:set var="startPage" value="${result.totalPages -10}"/>
											<c:set var="endPage" value="${result.totalPages}"/>
										</c:when>
										
									</c:choose>
									<c:forEach begin="${startPage }" end="${endPage }" varStatus="status">
										<c:set var="idx" value="${status.index}"/>
										<li class='_page <c:if test="${result.option.currentPage == idx }"> active </c:if>'  data-page='<c:out value="${idx }"/>'><c:out value="${idx }"/></li>
									</c:forEach>
								</ul>
								<c:if test="${result.option.currentPage < result.totalPages -1 }">
								<img src="<c:url value='/user/img/sub/next_bt2.png'/>" class="next_bt _btnNext2" alt="다음버튼"/>
								</c:if>
								<c:if test="${result.option.currentPage != result.totalPages }">
								<img src="<c:url value='/user/img/sub/next_bt.png'/>" class="next_bt _btnNext" alt="다음버튼"/>
								</c:if>
							</div>
							<!--//page_number End-->

						</div>

					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<jsp:include  page="../../../include/rolling.jsp"></jsp:include > 

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
	
	
		function search(page){
			$("#currentPage").val(page);
			$("#searchForm").submit();
		}
	
		$(document).ready(function(){
			//선택 박스 값 설정
			$("#search_area").val('<c:out value="${result.option.codeCenterType }"/>').attr("selected", "selected");
			$("#search_select").val('<c:out value="${result.option.searchOption }"/>').attr("selected", "selected");
			
			
// 			if(navigator.platform == 'iPad' || navigator.platform == 'iPhone' || navigator.platform == 'iPod'){
// 					alert('1111');
// 					alert($(".page_number").height());
// 			       $(".page_number").css("position", "fixed").css("top", $('window').height());
// 			};
			
			
			$("#btnSearch").click(function(){
				search(1);
			});
			$("#inputKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search(1);
				}
			});
			
			$("._page").click(function(){
				search($(this).data('page'));
			});
			
			$("._btnPrev").click(function(){
				
				var currentPage = <c:out value="${result.option.currentPage}"/>;
				
				if(currentPage > 1){
					search(currentPage -1);
				}
			});
			
			$("._btnPrev2").click(function(){
				
				var currentPage = <c:out value="${result.option.currentPage}"/>;
				
				if(currentPage > 11){
					search(currentPage -10);
				}else{
					search(1);
				}
			});
		
			$("._btnNext").click(function(){
				var currentPage = <c:out value="${result.option.currentPage}"/>;
				var totalPage = <c:out value="${result.totalPages}"/>;
				
				if(currentPage < totalPage){
					search(currentPage +1);
				}
			});
			
			$("._btnNext2").click(function(){
				var currentPage = <c:out value="${result.option.currentPage}"/>;
				var totalPage = <c:out value="${result.totalPages}"/>;
				
				if(currentPage < totalPage){
					
					if((currentPage+10) < totalPage){
						search(currentPage +10);
					}else{
						search(totalPage);
					}
				}
			});
			
			$("._row").click(function(){
				var seq = $(this).data('seq');
				
				$("#searchForm").attr('action', "<c:url value='/customer/notice/" + seq + ".view' />").submit();
			});
			
			
		});
	
	
	</script>
</body>
</html>