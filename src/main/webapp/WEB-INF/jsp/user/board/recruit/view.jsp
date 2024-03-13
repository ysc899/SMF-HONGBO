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
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/05_sub03_inner.css'/>" type="text/css" rel="stylesheet"/>
	
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
						<div class="notice_inner">
							<table class="table1">

								<colgroup>
									<col width='8%'/>
									<col width='38%'/>
									<col width='8%'/>
									<col width='50%'/>
								</colgroup>
								<tbody>
									<tr>
										<th><spring:message code="recruit.view.title" /></th>
										<td><c:out value="${result.title }"/></td>
										<th><spring:message code="recruit.view.writer" /></th>
										<td><spring:message code="title" /></td>
									</tr>

									<tr>
										<th><spring:message code="recruit.view.date" /></th>
										<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.editDate}" /></td>
										<th><spring:message code="recruit.view.count" /></th>
										<td><c:out value="${result.hitCnt}"/></td>
									</tr>

									<c:choose>
									<c:when test="${result.inputTypeFlag == 'N' }">
									<tr>
										<td class="table_story" colspan="4">
											<c:out escapeXml="false" value="${result.content }"/>
										</td>
									</tr>
									</c:when>
									<c:otherwise>
									<tr>
										<td class="table_story" colspan="4">

											<img src="<c:url value='/user/img/sub/lovecall.jpg'/>" alt="채용공고이미지" />
											<p>(재)씨젠의료재단 <c:out value="${result.contentTitle }"/> 전문인력 채용</p>

											<b>1. 채용부문</b>
												<span>
													(재)씨젠의료재단<c:out value="${result.contentComment }"/> 근무할 도전적이고 진취적인 우수인재를 모십니다.
												</span>

											<b>2. 자격요건 및 근무시간</b>
												<table>
													<colgroup>
														<col width="15%"/>
														<col width="40%"/>
														<col width="40%"/>
														<col width="5%"/>
													</colgroup>
													<thead>
														<tr>
															<th>채용부문</th>
															<th>담당업무/근무시간</th>
															<th>자격요건</th>
															<th>인원</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${result.tasks }" var="item">
														<tr>
															<td rowspan="2" class="table_center">
																<c:out value="${item.taskSection }"/><br/>
																(<c:out value="${item.taskLoc }"/>)
															</td>

															<td rowspan="2">
																1.<c:out value="${item.taskAssigned }"/><br/>
																<br/>
																2.근무시간<br/>
																<br/>
																<c:out escapeXml="false" value="${item.taskTime }"/>
															</td>

															<td>
																<span class="table_b">
																	[필수요건]
																</span>
																<c:out escapeXml="false" value="${item.taskRequire }"/>
															</td>

															<td rowspan="2" class="table_center">
																<c:out value="${item.taskApes }"/>
															</td>

														</tr>

														<tr>
															<td style="border-top:1px solid #fff; border-left:1px solid #ccc;">
																<span class="table_b">
																	[우대요건]
																</span>
																<c:out escapeXml="false" value="${item.taskOption }"/>
															</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>

												<b>3. 처우</b>
													<span>- 연봉수준 - 당 재단 채용기준에 준함(협의 가능)</span>
													<span>- 입사 후 3개월간 수습기간 있음(신입,경력)</span>

												<b>4. 복리후생</b>
													<span>① 생활안정지원</span>
													<small>○ 각종 경조금 / 명절상여금(2회) / 하계휴가비</small>

													<span>② 영업활동지원 (영업부에 한함)</span>
													<small>○ 차량제공(출퇴근사용 가능) / 영업활동비 / 유류대</small>

													<span>③ 자기계발</span>
													<small>○ 해외연수 (1년 160명,우수사원선발 해외연수 실시, 개인경비 별도지원)</small>
													<small>○ 온라인 및 오프라인을 통한 사내 외국어 및 직무교육</small>
													<small>○ 학술활동비 및 업무관련 자격 취득 지원</small>

													<span>④ 보상 및 포상</span>
													<small>○ 장기근속포상 / 우수사원 포상 / 사진공모전 포상 / 각종 성과급 및 인센티브</small>

													<span>⑤ 근무편의</span>
													<small>○ 피복지원 (동계패딩조끼,동계점퍼 등 지급) / 부서회식비 월단위 지원</small>

													<span>⑥ 건강</span>
													<small>○ 종합건강검진 (40만원 상당) / 각종 예방접종,검사 / 사내의무실 운영</small>
													<small>○ 단체상해보험 가입 (영업부에 한함)</small>

													<span>⑦출산,육아기 모성보호</span>
													<small>○ 법정육아휴직 1년 이외에 본인 희망시 2년 추가 (총 3년까지 가능)</small>
													<small>○ 결혼, 출산기, 출산후 직원 야간근무 제외</small>
													<small>○ 임신, 출산기 직원 근무시간 단축제도 실시 (1일 2시간, 주 10시간 단축)</small>

													<span>⑧ 기념선물</span>
													<small>○ 명절선물 / 근로자의 날 선물 / 창립기념일 선물 등 지급</small>

												<b>5. 지원서 접수 등 채용전형</b>
													<span>1) 지원서 접수기간 : <fmt:formatDate pattern = "yyyy년 MM월 dd일(E)" value = "${result.endDate}" /> 24:00 까지</span>
													<span>2) 서류전형 합격자 발표 : 접수기간 중 수시 개별통보</span>
													<span>3) 면접 및 채용신체검사 일정 : 수시</span>
													<small>① 서류전형 합격자 1차 면접일정 개별통보</small>
													<small>② 면접은 1차(실무) / 2차(인성)</small>
													<small>③ 2차면접당일 면접실시전에 당 본원에서 채용신체검사 실시</small>
													<span>4) 최종합격자 발표 : 합격자에 한해 개별 통보</span>
													<span>5) 입사예정일 : 협의</span>

												<b>6. 제출서류</b>
													<span>- 입사지원서 (당 재단 홈페이지 메뉴 중 재단안내 - 채용정보에서 다운로드 후 사용)</span>
													<small>① 사진부착</small>
													<small>② 희망 근무지, 지원분야, 희망연봉 반드시 기재</small>
													<small>③ 긴급연락처 반드시 기재</small>
													<small>④ 경력직의 경우 경력기술서 필히 제출</small>

												<b>7. 지원서 접수 : e-mail만 접수가능 (job@mf.seegene.com)</b>

												<b>8. 기타</b>
													<span>1) 입사지원서 및 제출서류는 「채용절차의 공정화에 관한 법률 시행령」 제2조제1항에 따라 신청인이 채용 서류의 반환을 요청하면 14일 이내에 반환요구서류를 발송합니다.</span>
													<small>job@mf.seegene.com으로 '채용 서류 반환 요청' 제목으로 성명, 주소(반환장소), 생년월일, 지원부서를 기재하여 메일 요청 해주시기 바랍니다.</small>
													<small>단, 홈페이지 또는 전자우편 제출 된 경우나 채용공고와 상관없이 자발적으로 제출한 경우는 예외로 합니다.</small>

													<span>2) 입사지원서의 개인 인적사항에 대하여 빠짐없이 기재하시기 바랍니다.</span>
													<span>3) 입사지원서상의 사항은 개인정보보호법에 의거하여 외부로 절대 유출하지 않습니다.</span>
													<span>4) 문의사항은 인사팀 채용담당자 (TEL : 02-2218-9022)으로 해주시기 바랍니다.</span>
										</td>

									</tr>
									
									
									</c:otherwise>
									</c:choose>
									
								</tbody>
							</table>

								<div class="back_notice">
									<span class="_golist"><spring:message code="search.list" /></span>
								</div>
								<form id="hiddenForm" method="get">
									<input type="hidden" name="searchOption" id="search_select" value="<c:out value='${param.searchOption}'/>"/>
									<input type="hidden" name="searchKeyword" id="inputKeyword" value="<c:out value='${param.searchKeyword}'/>"/>
									<input type="hidden" name="codeRecruitTP" id="search_area" value="<c:out value='${param.codeRecruitTP}'/>"/>
									<input type="hidden" name="currentPage" id="currentPage" value="<c:out value="${param.currentPage }"/>"/>
								</form>
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
	<script type="text/javascript">
	
	
		$(document).ready(function(){
			
			var seq = '<c:out value="${result.seq }"/>';
			var title = '<c:out value="${result.title }"/>';
			
			if(seq == ''){
				alert('<spring:message code="recruit.view.no.seq" />');
				location.href="<c:url value='/board/recruit/index.do' />";
			}
			

			$("._golist").click(function(){
				$("#hiddenForm").attr('action', "<c:url value='/board/recruit/index.do' />").submit();
			});

			
			
		});
	
	
	</script>
</body>
</html>
