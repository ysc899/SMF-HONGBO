<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
	<link href="<c:url value='/user/css/03_sub06.css'/>?date=20230419" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/03_sub04.css'/>?date=20230419" type="text/css" rel="stylesheet"/>
	
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

						<div class="sub_summury01" id="printDiv">

							<p class="test_item_title"><c:out value="${result.f010fen }"/></p>
							<table id="printArea">
								<colgroup>
									<col width="15%"/>
									<col width="40%"/> 
									<col width="15%"/>
									<col width="30%"/>
								</colgroup>
								<tbody>
								<!--tr>
									<th class="th1">검사명</th>
									<td class="null_td" colspan="3"><c:out value="${result.f010fen }"/></td>
								</tr-->
								<tr>
									<th>Seegene code</th>
									<td class="td1"><c:out value="${result.f010gcd }"/></td>
									<th>Test method</th>
									<td class="null_td"><c:out value="${result.f010msnm }"/></td>
								</tr>
								<tr>
									<th class="th1">Test per-formed</th>
									<td class="td1"><c:out value="${result.t001day }"/></td>
									<th>Specimen type</th>
									<td class="null_td"><c:out value="${result.f010tnm }"/></td>
								</tr>
								<tr>
									<th class="th1">TAT (Day)</th>
									<td class="td1"><c:out value="${result.f010eed }"/></td>
									<th>Sample collection amount (mL)</th>
									<td class="null_td"><c:out value="${result.f010gtq }"/></td>
								</tr>
								<tr>
									<!--th class="th1">보험코드</th>
									<td class="td1"><%--c:out value="${result.docdTmp }"/--%></td-->
										<th class="th1">Specimen stability
										<td class="td1"></td>
								<%-- 	<th class="th1">Price (￦)
										<br><p style="color: #0000FF;font-size: 10px;">*Excluding quality sur-charge</p></br></th>
									<td class="td1">
										<c:if test="${empty result.docdTmp}">
											<c:if test="${loginYn == true}">
												<c:out value="${result.tssu}"/>
											</c:if>
											<c:if test="${loginYn == false}">
												<c:out value=" "/>
											</c:if>
										</c:if>
										<c:if test="${not empty result.docdTmp}">
											<c:if test='${result.viewYn == "Y"}'>
												<c:if test="${loginYn == true}">
													<c:out value="${result.tssu}"/>
												</c:if>
												<c:if test="${loginYn == false}">
													<c:out value=" "/>
												</c:if>
											</c:if>
											<c:if test='${result.viewYn == "N"}'>
												<c:out value="${result.tssu}"/>
											</c:if>
										</c:if>
									</td> --%>
									<th>Required sample amount (mL)</th>
									<td class="null_td"><c:out value="${result.f010stq }"/></td>
								</tr>
								<tr>
									<th class="th1">Storage conditions</th>
									<td class="td1"><c:out value="${result.t001sav }"/>
									<th>Specimen containers</th>
									<td class="null_td"><c:out value="${result.f010gbnm }"/></td>
									</td>
								</tr>
								<!--tr>
									<th class="th1">분류번호</th>
									<td style="border-right: 1px solid #333;">
										<%--c:choose>
											<c:when test="${empty result.somk }"><c:out value="${result.bomk }"/></c:when>
											<c:when test="${not empty result.somk && not empty result.bomk && result.somk == result.bomk}"><c:out value="${result.somk }"/></c:when>
											<c:when test="${not empty result.somk && empty result.bomk}"><c:out value="${result.somk }"/></c:when>
											<c:otherwise ><c:out value="${result.somk }"/>&nbsp;,&nbsp;<c:out value="${result.bomk }"/></c:otherwise>
										</c:choose--%>
									</td>
									<th>Specimen containers</th>
									<td class="null_td"><c:out value="${result.f010gbnm }"/></td>
								</tr-->
								<tr>
									<th class="th1">Refrence range</th>
									<td class="td1"><c:out escapeXml="false" value="${result.t001ref }"/></td>
									<th>Specimen container image</th>
									<td class="null_td">
										<img src="<c:url value='https://trms.seegenemedical.com${result.vessimg }'/>" style="margin-left:30px;max-width:100%;" />
									</td>
								</tr>
								<tr>
									<th class="th1">Clinical significance</th>
									<td colspan="3" class="null_td"><c:out escapeXml="false" value="${result.t001cont }"/></td>
								</tr>
								<tr>
									<th class="th1">Precautions</th>
									<td colspan="3" class="null_td"><c:out escapeXml="false" value="${result.t001etc }"/></td>
								</tr>
								</tbody>
							</table>
						</div>
					</br>
					<div class="sub_summury01">
							<table id="printArea" style="border-top: 1px solid #ccc;">
								<colgroup>
									<col width="15%"/>
									<col width="28.3%"/> 
									<col width="28.3%"/>
									<col width="28.3%"/>
								</colgroup>
								<tbody>
								<tr>
									<th rowspan="2" style="border-bottom: 2px solid black;">Specimen stability</th>
									<td style="border-right: 1px solid #333; text-align: center; font-weight: 600; he">
									<b>Room temperature</b></td>
									<td style="border-right: 1px solid #333; text-align: center; font-weight: 600;"> Refrigerated</td>
									<td class="null_td" style="text-align: center; font-weight: 600;"><b>Frozen</b></td>
								</tr>
								<tr>
									<td style="border-right: 1px solid #333; text-align: left; border-bottom: 2px solid black;">
									<c:if test="${fn:length(fn:trim(result.t001room)) > 0}">								
											<c:out escapeXml="false" value="${result.t001room}"/>
										</c:if> 
										<c:if test="${fn:length(fn:trim(result.t001room)) <= 0}">								
											-
										</c:if> 
									</td>
									<td style="border-right: 1px solid #333; text-align: left; border-bottom: 2px solid black;">
										<c:if test="${fn:length(fn:trim(result.t001cold)) > 0}">								
											<c:out escapeXml="false" value="${result.t001cold}"/>
										</c:if> 
										<c:if test="${fn:length(fn:trim(result.t001cold)) <= 0}">								
											-
										</c:if> 	
									</td>
									<td class="null_td" style="text-align: left; border-bottom: 2px solid black;" >
										<c:if test="${fn:length(fn:trim(result.t001frozen)) > 0}">								
											<c:out escapeXml="false" value="${result.t001frozen}"/>
										</c:if> 
										<c:if test="${fn:length(fn:trim(result.t001frozen)) <= 0}">								
											-
										</c:if> 
									</td>
								</tr>
								</tbody>
							</table>
						</div>
		
						<div class="oneclick_page">
							<ul>
								<li id="btnPrint"><img src="<c:url value='/user/img/capsule/print.png'/>" alt="프린트아이콘"/>Print</li>
								<li class="_golist">Go List</li>
							</ul>
						</div>
				</div>
					<!--//sub_story End-->
			<form id="hiddenForm" method="get">
				<input type="hidden" name="searchOption" value="<c:out value='${sparam.searchOption}'/>"/>
				<input type="hidden" name="searchKeyword" value="<c:out value='${sparam.searchKeyword}'/>"/>
				<input type="hidden" name="currentPage" value="<c:out value="${sparam.currentPage }"/>"/>
<%-- 				<input type="hidden" name="testInfoOption" value="<c:out value="${sparam.testInfoOption }"/>"/> --%>
<%-- 				<input type="hidden" name="mediClsOption" value="<c:out value="${sparam.mediClsOption }"/>"/> --%>
<%-- 				<input type="hidden" name="dissClss" value="<c:out value="${sparam.dissClss }"/>"/> --%>
				<input type="hidden" name="searchFlag" value="<c:out value="${sparam.searchFlag }"/>"/>
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
	</div>
	
	
	<script type="text/javascript">
		
		
		
	
		$(document).ready(function(){
			
			//목록 가기 클릭 이벤트
			$("._golist").click(function(){
				<c:if test="${sparam.mainSearchFlag == 'N'}">
				
				if(document.referrer){
				// https://programmingsummaries.tistory.com/318 참고
					history.back();
				}else{
					$("#hiddenForm").attr('action', "<c:url value='/task/test/index.do' />").submit();
				}
				</c:if>
				<c:if test="${sparam.mainSearchFlag == 'Y'}">
				$("#hiddenForm").attr('action', "<c:url value='/task/test/index.do' />").submit();
				</c:if>
			});
			
			$("#btnPrint").click(function(){
				$("#printDiv").printThis({
				    importCSS: true,
				    printDelay: 333
				});
			});
			
		});
	
	
	</script>

	<!--mobile_popup-->
		<div class="m_print">
			<div class="m_print_header">
				<p><img src="../../../../../user/img/x.png" class="m_close_bt"></p>
				<h1><img src="../../../../../user/img/logo_white.png"></h1>
			</div>

			<!--뒤로가기 스크립트-->
			<script>
				$(document).ready(function() {
					$(".m_close_bt").click(function() {
						window.open('about:blank', '_self').close();
					});
				}); 

			</script>

			<div id="sub_title">
				<p><c:out value="${childMenuName }"/></p>
			</div>

			<table id="printArea">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="30%"/>
				</colgroup>
					<tbody>
						<tr>
							<th class="th1">Test name</th>
							<td class="td1"><c:out value="${result.f010fen }"/></td>
							<th>Seegene code</th>
							<td class="null_td"><c:out value="${result.f010gcd }"/></td>
						</tr>

						<tr>
							<th class="th1">TAT (Day)</th>
							<td class="td1"><c:out value="${result.t001day }"/></td>
							<th>Specimen type</th>
							<td class="null_td"><c:out value="${result.f010tnm }"/></td>
						</tr>
						<tr>
							<th class="th1">Specimen type</th>
							<td class="td1"><c:out value="${result.f010eed }"/>일</td>
							<th>Sample amount(ml)</th>
							<td class="null_td"><c:out value="${result.f010gtq }"/></td>
						</tr>

						<tr>
							<th class="th1">Test method</th>
							<td class="td1"><c:out value="${result.f010msnm }"/></td>
							<th>Storage conditions</th>
							<td class="null_td"><c:out value="${result.t001sav }"/></td>
						</tr>

						<tr>
							<!--th class="th1">보험코드</th>
							<td class="td1"><c:out value="${result.docdTmp }"/></td-->

							<th class="th1">Price</th>
							<td class="td1"><c:out value="${result.tssu }"/></td>
							<th>Specimen containers</th>
							<td class="null_td"><c:out value="${result.f010gbnm }"/></td>
						</tr>

						<!--tr>
							<th class="th1">검사수가</th>
							<td class="td1"><c:out value="${result.tssu }"/></td>
							<th class="th1">분류번호</th>
							<td>
								<c:choose>
									<c:when test="${empty result.somk }"><c:out value="${result.bomk }"/></c:when>
									<c:when test="${not empty result.somk && not empty result.bomk && result.somk == result.bomk}"><c:out value="${result.somk }"/></c:when>
									<c:when test="${not empty result.somk && empty result.bomk}"><c:out value="${result.somk }"/></c:when>
									<c:otherwise ><c:out value="${result.somk }"/>&nbsp;,&nbsp;<c:out value="${result.bomk }"/></c:otherwise>
								</c:choose>
								<%-- 								<c:out value="${result.somk }"/><c:if test="${not empty result.somk && not empty result.bomk }">&nbsp;,&nbsp;</c:if><c:out value="${result.bomk }"/> --%>
							</td>
						</tr-->

						<tr>
							<th class="th1">Refrence range</th>
							<td colspan="3" class="defaultView"><c:out escapeXml="false" value="${result.t001ref }"/></td>
						</tr>

						<tr>
							<th class="th1">Clinical significance</th>
							<td colspan="3" class="defaultView"><c:out escapeXml="false" value="${result.t001cont }"/></td>
						</tr>

						<tr>
							<th class="th1">Precautions</th>
							<td colspan="3" class="defaultView"><c:out escapeXml="false" value="${result.t001etc }"/></td>
						</tr>

				</tbody>
			</table>
			<div class="printArea">
			<table>
				<thead>
					<colgroup>
						<col width="20%">
					</colgroup>
				</thead>
				<tbody>
					<tr>
						<th>검체용기</th>
					</tr>
					<tr>
						<td class="null_td">
							<img src="<c:url value='https://trms.seegenemedical.com${result.vessimg }'/>" style="width:100%;"/>
						</td>
					</tr>
				</tbody>
			</table>
			</div>

		</div>
	<!--//mobile_popup End-->
</body>
</html>
