<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/search_page.css'/>" type="text/css" rel="stylesheet"/>
	
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
	<jsp:include page="../include/login_header.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	
	<!-- banner_bg-->
	<div class="banner_bg">
		<div class="banner_inner">

			<div class="seegene_search">
				<form id="searchForm" method="get">
					<input type="text" maxlength="40" placeholder="검색어를 입력하세요." name="searchKeyword" id="inputKeyword" value='<c:out value="${result.searchKeyword }"/>'/>
					<img src="<c:url value='/user/img/search.png'/>" id="btnSearch" alt="검색"/>
				</form>
			</div>

			<p>
				<b class="search_text">'<c:out value="${result.searchKeyword }"/>'</b>의 검색결과는 총 <b class="search_count"><c:out value="${result.totalCount }"/>건</b>입니다.
				<c:set var="pointText" value='<b class="search_text01">${result.searchKeyword}</b>'/>
			</p>

		</div>
	</div>
	<!--banner_bg End-->
	<!--wrap-->
	<div id="wrap">
		

		<!--container-->
			<div id="container">
				<div class="sub_story">
					
					<!--공문-->
					<div class="search_area01">

						<div class="search_head">
							<p><c:out value='${result.noticeMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.noticeList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.noticeMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.noticeList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_row" data-url="<c:out value='${result.noticeMenu.menuUrl }'/>" data-seq="<c:out value='${item.seq }'/>" ><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">고객지원 > 공문</small><small class="right_small"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//공문 End-->
					<!--게시판-->
					<c:forEach items="${result.boards}" var="boardMenus" varStatus="status">
						<c:set var="board" value="${boardMenus.key }"/>
						<c:set var="boardList" value="${boardMenus.value }"/>
						
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${board.menuName }'/> <b class="search_area_count">(<c:out value='${boardList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${board.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${boardList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_row" data-url="<c:out value='${board.menuUrl }'/>" data-seq="<c:out value='${item.seq }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">재단홍보실 > <c:out value='${board.menuName }'/></small><small class="right_small"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					</c:forEach>
					<!--//게시판 End-->
					
					<!--faq-->
						
					<div class="search_area02">
						<div class="search_head">
							<p><c:out value='${result.faqMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.faqList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.faqMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story faq_story">
							<table cellspacing="0" class="recruit">
							<c:forEach items="${result.faqList.content }" var="item"  varStatus="status">
								<tr class="title">
									<td class="img_td"><img src="<c:url value='/user/img/sub/Q.png'/>" alt="Q이미지"/></td>
									<td><a href="javascript:void(0);" class="_question" data-seq="a_<c:out value='${status.count}'/>"><c:out escapeXml="false" value="${item.question }"/></a></td>
								</tr>
	
								<tr class="hide" id="a_<c:out value='${status.count}'/>">
									<td class="img_td2"><img src="<c:url value='/user/img/sub/A.png'/>" alt="A이미지"/></td>
									<td><span><c:out escapeXml="false" value="${item.answer }"/></span></td>
								</tr>
							</c:forEach>
							</table>
						</div>
						<!--//search_story-->
					</div>
					<!--//faq End-->
<!-- 					faq -->
<%-- 					<c:forEach items="${result.faqs}" var="faqMenus" varStatus="status"> --%>
<%-- 						<c:set var="faq" value="${faqMenus.key }"/> --%>
<%-- 						<c:set var="faqList" value="${faqMenus.value }"/> --%>
						
<!-- 					<div class="search_area02"> -->

<!-- 						<div class="search_head"> -->
<%-- 							<p><c:out value='${faq.menuName }'/> <b class="search_area_count">(<c:out value='${faqList.totalElements }'/>건)</b></p> --%>
<%-- 							<span class="search_all" data-url="<c:out value='${faq.menuUrl }'/>">전체보기 ></span> --%>
<!-- 						</div> -->
<!-- 						search_story -->
<!-- 						<div class="search_story faq_story"> -->
<!-- 							<table cellspacing="0" class="recruit"> -->
<%-- 							<c:forEach items="${faqList.content }" var="item"  varStatus="status"> --%>
<!-- 								<tr class="title"> -->
<%-- 									<td class="img_td"><img src="<c:url value='/user/img/sub/Q.png'/>" alt="Q이미지"/></td> --%>
<%-- 									<td><a href="javascript:void(0);" class="_question" data-seq="a_<c:out value='${status.count}'/>"><c:out escapeXml="false" value="${item.question }"/></a></td> --%>
<!-- 								</tr> -->
	
<%-- 								<tr class="hide" id="a_<c:out value='${status.count}'/>"> --%>
<%-- 									<td class="img_td2"><img src="<c:url value='/user/img/sub/A.png'/>" alt="A이미지"/></td> --%>
<%-- 									<td><span><c:out escapeXml="false" value="${item.answer }"/></span></td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<!-- 							</table> -->
<!-- 						</div> -->
<!-- 						//search_story -->
<!-- 					</div> -->
<%-- 					</c:forEach> --%>
<!-- 					//faq End -->
					
					<!--검사항목-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.testMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.testList.totalElements }'/>건)</b></p>
							<span class="search_test_all" data-url="<c:out value='${result.testMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story_table">
							
							<table>
								<colgroup>
									<col width="100px;"/>
									<col width="*"/>
									<col width="100px;"/>
									<col width="120px;"/>
									<col width="100px;"/>
									<col width="100px;"/>
								</colgroup>
								<thead>
									<tr>
										<th class="border_none"><spring:message code="test.list.head.1" /></th>
										<th><spring:message code="test.list.head.2" /></th>
										<th><spring:message code="test.list.head.3" /></th>
										<th><spring:message code="test.list.head.4" /></th>
										<th><spring:message code="test.list.head.5" /></th>
										<th><spring:message code="test.list.head.6" /></th>
									</tr>
								</thead>
								<tbody id="testResultBody">
									<c:forEach items="${result.testList.content }" var="item">
										<tr class="_rowTest" data-url="<c:out value='${result.testMenu.menuUrl }'/>" data-seq="<c:out value='${item.f010gcd }'/>">
											<td class="border_none"><c:out value="${item.f010gcd }"/></td>
											<td><c:out value="${item.f010fkn }"/></td>
											<td><c:out value="${item.f010tnm }"/></td>
											<td><c:out value="${item.f010msnm }"/></td>
											<td><c:out value="${item.t001day }"/></td>
											<td><c:out value="${item.f010eed }"/></td>
										</tr>
									</c:forEach>
									<c:if test="${result.testList.totalElements == 0 }">
										<tr>
											<td class="border_none" colspan="6">검사항목조회 결과가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							
						</div>
						<!--//search_story-->
					</div>
					<!--//검사항목End-->
					
					
					<!--검사의뢰서-->
					<div class="search_area03">

						<div class="search_head">
							<p><c:out value='${result.requestMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.requestList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.requestMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.requestList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class=" request_download_area" style="cursor: default;" data-url="<c:out value='${result.requestMenu.menuUrl }'/>" data-seq="<c:out value='${item.seq }'/>" >
									<c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/>
									<a href="javascript:void(0);" title="인쇄" class="search_img _requestPrint" data-seq="<c:out value='${item.seq }'/>"></a>
									<a href="javascript:void(0);" title="다운로드" class="down_img _requestDownload" data-seq="<c:out value='${item.seq }'/>"></a>
								</p>
								
								<small class="left_small">검사 의뢰 안내 > <c:out value='${result.requestMenu.menuName }'/></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					
					
					
					<!--검체용기-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.vesselMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.vesselList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.vesselMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.vesselList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_rowVessel" data-seq="<c:out value='${item.seq }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">검사 의뢰 안내 > <c:out value='${result.vesselMenu.menuName }'/></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//검체용기End-->
					
					<!--채용-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.recruitMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.recruitList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.recruitMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.recruitList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_row" data-url="<c:out value='${result.recruitMenu.menuUrl }'/>" data-seq="<c:out value='${item.seq }'/>">[<c:out value="${item.codeRecruitStateName }"/>]&nbsp;<c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">재단홍보실 > 채용정보</small><small class="right_small"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.startDate}" /> ~ <fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.endDate}" /></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//채용End-->
					
					<!--웹진-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.webzineMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.webzineInfoList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.webzineMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.webzineInfoList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_viewWebzine" data-url="<c:out value='${item.url }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">고객지원 > One Click 웹진</small><small class="right_small"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//웹진End-->
					
					<!--원클릭 건강정보-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.healthInfoMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.healthInfoList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.healthInfoMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.healthInfoList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_row" data-url="<c:out value='${result.healthInfoMenu.menuUrl }'/>" data-seq="<c:out value='${item.seq }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">고객지원 > One Click 건강정보</small><small class="right_small"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//원클릭 건강정보 End-->
					
					<!--재단 브로슈어-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.promotionBookMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.promotionBookList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.promotionBookMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.promotionBookList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_viewWebzine" data-url="<c:out value='${item.url }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/></p>
								<small class="left_small">재단홍보실 > <c:out value='${result.promotionBookMenu.menuName }'/></small><small class="right_small"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//재단 브로슈어End-->
					
					<!--재단 동영상-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.promotionVideoMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.promotionVideoList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.promotionVideoMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.promotionVideoList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_viewPromotion" data-seq="<c:out value='${item.seq }'/>" data-url="<c:out value='${item.url }'/>" data-title="<c:out value='${item.title }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/> (<c:out value="${item.subTitle }"/>)</p>
								<small class="left_small">재단홍보실 > <c:out value='${result.promotionVideoMenu.menuName }'/></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//재단 동영상End-->
					
					<!--재단 포토영상-->
					<div class="search_area02">

						<div class="search_head">
							<p><c:out value='${result.promotionImageMenu.menuName }'/> <b class="search_area_count">(<c:out value='${result.promotionImageList.totalElements }'/>건)</b></p>
							<span class="search_all" data-url="<c:out value='${result.promotionImageMenu.menuUrl }'/>">전체보기 ></span>
						</div>
						<!--search_story-->
						<div class="search_story">
							<c:forEach items="${result.promotionImageList.content }" var="item">
								<div class="search_story_box01 sbox">
								<p class="_viewPromotion" data-seq="<c:out value='${item.seq }'/>" data-url="<c:out value='${item.url }'/>" data-title="<c:out value='${item.title }'/>"><c:out escapeXml="false" value="${fn:replace(item.title, result.searchKeyword, pointText) }"/> </p>
								<small class="left_small">재단홍보실 > <c:out value='${result.promotionImageMenu.menuName }'/></small>
							</div>
							</c:forEach>
						</div>
						<!--//search_story-->
					</div>
					<!--//재단 포토영상End-->
					
			</div>
					

			</div>
			<!--//container End-->
			<jsp:include  page="../include/rolling.jsp"></jsp:include >

		<div id="top_bt">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../include/footer.jsp"></jsp:include >
		<!--//footer End-->
	</div>
	<form id="hiddenSearchForm" target="_blank">
		<input type="hidden" name="searchKeyword" value="<c:out value="${result.searchKeyword }"/>"  />
		<input type="hidden" name="currentPage" value="1"/>
	</form>
	<form id="hiddenTestSearchForm" target="_blank">
		<input type="hidden" name="searchKeyword" value="<c:out value="${result.searchKeyword }"/>" />
		<input type="hidden" name="currentPage" value="1"/>
		<input type="hidden" name="searchFlag" value="Y"/>
	</form>
	<form id="hiddenTestViewSearchForm" target="_blank">
		<input type="hidden" name="searchKeyword" value="<c:out value="${result.searchKeyword }"/>" />
		<input type="hidden" name="currentPage" value="1"/>
		<input type="hidden" name="searchFlag" value="Y"/>
		<input type="hidden" name="mainSearchFlag" value="Y"/>
	</form>
	<!--//wrap End-->

	<!--popup-->
	<div id="modalPromotion">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name"></span>
					<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="close"/></b>
			</div>

			<div class="popup_inner">
				<iframe style="width:925px; height:520px; display: none;" id="popupIframe"
					src=""
					allowfullscreen
					allowtransparency
					allow="autoplay"
				></iframe>
				<video id="popupPlayer" playsinline controls style="width:925px; height:520px; display: none;">
<%-- 				  <source src="<c:url value='/admin/promotion/image/stream/${result.seq }.view'/>" type="video/mp4" /> --%>
				</video>
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	
	
	
	<div id="modalVessel">
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
		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup-->

	<!--quick-menu-->
	<jsp:include  page="../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../include/fixed_header.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".search_all").click(function(){
				var url = $(this).data('url');
				$("#hiddenSearchForm").attr('action', "<c:url value='"+ url +"' />").submit();
			});
			$(".search_test_all").click(function(){
				var url = $(this).data('url');
				$("#hiddenTestSearchForm").attr('action', "<c:url value='"+ url +"' />").submit();
			});
			
			
			
			$("._row").click(function(){
				var url = $(this).data('url');
				url = url.replace('/index.do', '/'+ $(this).data('seq') +'.view');
				$("#hiddenSearchForm").attr('action', "<c:url value='"+ url +"' />").submit();
			});
			$("._rowTest").click(function(){
				var url = $(this).data('url');
				url = url.replace('/index.do', '/'+ $(this).data('seq') +'.view');
				$("#hiddenTestViewSearchForm").attr('action', "<c:url value='"+ url +"' />").submit();
			});
			
			$("._rowVessel").click(function(){
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
				
				
				$('#modalVessel').stop().fadeIn(300);
				  $('#modalVessel > .popup_bg , .close_bt').click(function(){
				    $('#modalVessel').fadeOut(300);
				  });
			});
			
		 	$("._viewWebzine").click(function(){
		 		var url = $(this).data('url');
				
				var ax = screen.width;
				var ay = screen.height;
				
				var property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,scrollbars=no,copyhistory=no,";
				property += "width=" + ax + ",height=" + ay + ",left=" + 0 + ",top=" + 0;
				
				window.open(url, "ecatalog", property);
		 	});
		 	
			$("._requestDownload").click(function(){
				var seq = $(this).data('seq');
				location.href="<c:url value='/task/request/download/" + seq + ".do' />";
			});
			$("._requestPrint").click(function(){
				var seq = $(this).data('seq');
				window.open("<c:url value='/task/request/view/" + seq + ".do' />", '_blank'); 
			});
			
		 	
		 	$("._viewPromotion").click(function(){
		 		var url = $(this).data('url');
		 		var seq = $(this).data('seq');
		 		var title = $(this).data('title');
				
				$('#modalPromotion').stop().fadeIn(300);
				  $('#modalPromotion > .popup_bg , .close_bt').click(function(){
				    $('#modalPromotion').fadeOut(300);
				    
				    $("#popupIframe").attr('src', '');
				    $("#popupPlayer").attr('src', '');
				    $("#popupIframe").hide();
					$("popupPlayer").hide();
				    
				  });
				
				$("#paper_name").html(title);
				  
				if(CommonUtil.isEmpty(url)){
					$("#popupIframe").hide();
					$("#popupPlayer").show();
					$("#popupPlayer").attr('src', '<c:url value="/promotion/stream/'+ seq +'.view"/>');
				}else{
					$("#popupPlayer").hide();
					$("#popupIframe").show();
					$("#popupIframe").attr('src', url);
				}
				  
			});
		 	
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
		 	
		 	
			$("#btnSearch").click(function(){
				$("#searchForm").submit();
			});
			$("#inputKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					$("#searchForm").submit();
				}
			});
		});
	
	</script>
</body>
</html>
