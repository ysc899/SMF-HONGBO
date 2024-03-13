<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
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
	<link href="<c:url value='/user/css/02_sub02_A.css'/>" type="text/css" rel="stylesheet"/>
	
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
    <script src="<c:url value='/user/js/slide.js'/>"></script>
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
						<p class="central_tab"><c:out value="${childMenuName }"/></p>
					</div>

					<div class="sub_story">
						<ul class="tabs">
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="tab-link no_bottom tab-<c:out value='${status.count }'/>_central _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
<!-- 							<li  class="tab-link no_bottom _tab_1">진단검사의학센터</li> -->
<!-- 							<li  class="tab-link no_bottom _tab_2">진단면역센터</li> -->
<!-- 							<li  class="tab-link no_bottom _tab_3">분자진단센터</li> -->
<!-- 							<li  class="tab-link no_bottom _tab_4">생명환경과학센터</li> -->
<!-- 							<li  class="tab-link no_bottom _tab_5">병리센터</li> -->
						</ul>
						
						<!--tab1-->
						<div id="tab-1" class="tab-content tab_common _contentView">

						<div class="sub_summury01 sub_summury_text">
							<p>진단검사의학센터</p>
									<span>
										24시간 검사실 운영 및 철저한 정도관리를 통해<br/>
										신속하고 정확한 검사 결과를 제공합니다.
									</span>
						</div>

						<div class="check_room room01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/A_01.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>임상화학</p>
											<span>혈청 및 체액을 이용하여 화학적 방법에 의한분석으로 다양한 질병의 진단 및<br/>
											경과 관찰에 이용됩니다. </span>
											<b>간기능 검사, 지질 검사, 신장기능 검사, 당뇨 검사, 요화학 검사, 요침사 검사 등</b>

											<span class="check_roombt check_popupbt">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room02">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/A_02.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>혈액학</p>
											<span>혈구(Blood cell)의 증가와 감소, 형태학적 변화 등을 관찰하여 혈액학적 질환의<br/>
											진단은 위한기초적이고 필수적인 검사를 시행하고 있으며, 혈액응고 및 수혈의학<br/>
											관련검사도 시행되고 있습니다.</span>
											<b>일반혈액 검사, 혈액응고 검사, 수혈의학 검사 등</b>

											<span class="check_roombt check_popupbt2">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room03">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/A_03.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>미생물학</p>
											<span>미생물에 감염된 환자에게 채취한 가검물을 이용하여 그 원인 병원체를 분리 및<br/>
											동정하고 항균제 감수성 검사를 시행하여 그 결과를 보고합니다.</span>
											<b>Gram stain 검사, 일반세균 · 결핵균 · 진균 · 바이러스 배양 검사, 기생충 검사,<br/> 분변 잠혈 검사 등</b>

											<span class="check_roombt check_popupbt3">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>

						</div>

						<div class="check_room room04">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/A_04.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>핵의학</p>
											<span>방사성 동위원소로 표지된 항원 · 항체를 이용한 핵의학적 검사 방법으로,<br/>
											다양한 내분비 진단검사를 시행합니다.</span>
											<b>뇌하수체호르몬 검사, 종양표지자 검사, 부신피질기능 검사 등</b>

											<span class="check_roombt check_popupbt4">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					<!-- 	<div class="check_room room05">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/A_05.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>요경검팀</p>
											<span>소변의 물리적, 화학적 성상을 측정하고 현미경적 관찰을 통해 신요로계의 이상과<br/>
											전신적인 내분비, 대사질환에 대한 정보를 알 수 있습니다.</span>
											<b>요시험지 검사, 요침사 검사, 약물 스크리닝 검사</b>

											<span class="check_roombt check_popupbt5">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div> -->

					</div>
					<!--//tab-1 End-->

					<!--tab2-->
					<div id="tab-2" class="tab-content tab_common _contentView">

						<div class="sub_summury02 sub_summury_text">
							<p>생명환경과학센터</p>
									<span>
										인류의 건강한 삶을 위해 특수장비 도입을 통한 생명환경과학 분야의<br/>
										진단 및 분석, 연구개발을 실시하고 있습니다
									</span>
						</div>

						<div class="check_room room01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/B_01.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>산업보건분석</p>
											<span>[특수건강진단 지정기관] 유해인자에 노출되는 업무에 종사하는 근로자의<br/>
											생물학적 노출지표를 검사하며, 인체에 해로운 작업장의 작업환경을 분석 및<br/>
											평가하며 개선사항을 제안합니다. </span>
											<b style="letter-spacing:-0.3px;">특수건강진단 생물학적 노출지표 검사, 작업환경측정 및 시료 분석, 유해 노출 실태평가,<br/>
												산업위생전문가 작업환경 개선 컨설팅, 특수건강진단 직업환경의학 전문의 상담</b>

											<span class="check_roombt check_popupbt6">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room02">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/B_02.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>대사체/무기분석</p>
											<span>생체 시료 분석을 위한 최첨단의 이화학 분석 장비와 특수 설비를 도입하여,<br/>
											환경 및 보건분야의 진단용 분석을 실시하고 있습니다.</span>
											<b><i style="font-weight: 800; color: #8b0f1d;">[대사체분석]</i> 신생아 선천성 대사이상 선별 검사, 리소좀축적병 선별 검사, <br/>부신수질기능 검사, 비타민 분획검사, 약물농도분석 및 대사체 관련 분석<br/>
												<i style="font-weight: 800; color: #8b0f1d;">[무기분석]</i> 생체시료(혈액 · 혈청 · 소변) 중 유해 중금속 및 미량원소 검사, <br/>미량무기질(Trace Minerals) 검사, 투석용수 미세물질 검사, <br/>
												검사용수 중 실리케이트 검사, 특수건강진단 생물학적 노출지표 검사(유해 중금속)</b>

											<span class="check_roombt check_popupbt7">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room03">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/B_03.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>특수건강진단</p>
											<span>산업안전보건법 제130조의 규정에 의한 소음, 분진, 화학물질 등 유해인자에<br/>
											노출되는 근로자의 건강을 보호, 유지하고 직업성 질환을 예방하기 위한<br/>
											건강진단을 실시하고 있습니다.</span>
											<b style="margin-bottom:5px;font-size:16px;font-weight: bold;">※ 불만고충 및 문의사항 안내</b>
											<small>특수건강진단 관련 문의사항이나 불만고충 사항을 이메일(sghealth@mf.seegene.com)<br/>
											또는 전화(02-2218-9196~8)로 연락 주시기 바랍니다. </small>

											<span class="check_roombt check_introduce">소개</span>
											<span class="check_roombt _gofaq">FAQ</span>
										</td>
									</tr>
								</tbody>
							</table>

						</div>

					</div>
					<!--//tab-2 End-->

					<!--tab3-->
					<div id="tab-3" class="tab-content tab_common _contentView">

						<div class="sub_summury03 sub_summury_text">
							<p>분자진단검사센터</p>
									<span>
										분자생물학적 기술(Realtime PCR, Sequencing, NGS 등)을 통해 <br/>
										각종 질환을 진단하며, 새로운 유전자 진단법 개발에 매진하고 있습니다.
									</span>
						</div>

						<div class="check_room room01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/C_01.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자미생물학</p>
											<span>최신 분자진단 자동화 검사 시스템을 통해 하루만에 검사 결과를 보고하는 ONE<br/>
											DAY 검사 시스템을 운영하고 있으며, 약제내성 검사를 제공합니다.</span>
											<b>SARS-CoV-2 PCR 검사, MERS-CoV PCR 검사, Zika virus PCR 검사, <br/>
												폐렴 원인균 및 호흡기바이러스 PCR 검사,<br/>
												<i style="font-style: italic;">Helicobacter pylori</i>&nbsp;(Clarithromycin 내성) 검사,  세균성 뇌수막염 PCR 검사, <br/>
												급성설사 원인균 PCR 검사, MTB real-time PCR 검사,<br/>
												STI multiplex real-time PCR 검사, HPV 유전자형 real-time PCR 검사, <br/>
												Influenza A&B virus PCR 검사, CMV real-time PCR 정량 검사,<br/>
												EBV real-time PCR 정량 검사, HBV PCR 정성 및 정량 검사,<br/>
												HCV PCR 정성 및 정량 검사 등
											</b>

											<span class="check_roombt check_popupbt8">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room02">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/C_02.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자유전학</p>
											<span>각종 유전질환·암 유전자 검사 및 치료제 선택을 위한 유전자 검사를 실시하며,<br/>
											철저한 평가 과정을 거친 검사 도입으로 고품질 검사 결과를 제공합니다.</span>
											<b>유전질환 검사, 산전 및 영유아 대상 유전자 검사, 암 유전자 검사, 약물 유전자 검사,<br/>
												개인식별 유전자 검사 등</b>

											<span class="check_roombt check_popupbt9">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room03">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/C_03.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>세포유전학</p>
											<span>최첨단 자동화 핵형 분석 시스템을 바탕으로, 혈액종양 FISH Panel 검사 등<br/>
											고품질의 세포유전학 검사 결과를 제공합니다. </span>
											<b>산전 염색체 검사, 선천성 염색체 검사, 혈액종양 염색체 검사, 산전 FISH 검사,<br/>
												혈액종양 FISH 검사, 조직 FISH 검사,
												전체 유전체에 걸쳐 유전자의 결실이나 <br/>
												중복을 확인하는 염색체 마이크로어레이(CMA)검사 등</b>

											<span class="check_roombt check_popupbt10">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>

						</div>

						<div class="check_room room04">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/c_04_2022_0707.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>NGS (Next Generation Sequencing)</p>
											<span>유전자 검사를 통해 질병의 진단 또는 예후평가 등을 빠르게 평가할 수 있고,<br/>
											기존의 염기서열분석 검사법과 달리 대량의 염기서열을 증폭과 동시에 분석하여<br/>
											다량의 유전자 정보를 신속하게 보고할 수 있습니다.</span>
											<b>유전성 질환(Hereditary disorder) Panel, Metagenomics 분석, <br/>
												WES(whole exome sequencing) 및 WGS(whole genome sequencing) 분석 등</b>

											<span class="check_roombt check_popupbt11">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<!--//tab-3 End-->

					<!--tab4-->
					<div id="tab-4" class="tab-content tab_common _contentView">

						<div class="sub_summury04 sub_summury_text">
							<p>진단면역검사센터</p>
									<span>
										진단면역학을 기초로, 면역기능을 평가하며<br/>
										종양표지 및 호르몬 검사를 전문적으로 시행합니다.
									</span>
						</div>

						<div class="check_room room01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/D_01.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>면역학</p>
											<span>소량의 검체로 항원·항체 반응을 이용하여 진단검사를 실시하며, 검사실 자동화
											시스템을 통해 대부분의 검사가 완료됩니다.</span>
											<b>심혈관질환 검사, 호르몬 검사, 당뇨 관련 검사, 갑상선 관련 검사, 골대사 검사, <br/>
												각종 바이러스 감염증 검사, 종양표지자 검사 등</b>

											<span class="check_roombt check_popupbt12">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room02">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/D_02.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>특수면역학</p>
											<span>혈액이나 체액을 이용해 특이 항원·항체 반응을 통해 각종 감염증 검사·<br/>
											자가면역질환 관련 검사·잠복결핵 검사 등을 시행하고 있습니다.</span>
											<b>산전 검사, 자가항체 검사, 잠복결핵 검사, 면역글로불린 검사, 세포면역 검사, <br/>
												자가면역표적 검사, 각종 감염증 검사, 알레르기 항원 검사 등</b>

											<span class="check_roombt check_popupbt13">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<!--//tab-4 End-->

					<!--tab5-->
					<div id="tab-5" class="tab-content tab_common _contentView">

						<div class="sub_summury05 sub_summury_text">
							<p>병리센터</p>
									<span>
										병리 검사 분야의 최신 지견을 반영하여<br/>
										세계적 수준의 병리 검사 서비스를 제공합니다.
									</span>
						</div>

						<div class="check_room room01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/E_01.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>조직병리</p>
											<span>헤마톡실린 에오신(H&E) 염색 및 특수 염색을 시행하여 정확하고 신속한 진단<br/>
											으로 환자의 치료 방향을 정하고 예후를 추정하는데 도움을 주고 있습니다.</span>
											<b>육안 검사, 현미경 검사, 특수염색, 면역조직화학염색</b>

											<span class="check_roombt check_popupbt14">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room02">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/E_02.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>세포병리</p>
											<span>탈락 세포검사는 방법이 간단해 질병의 조기 진단을 위한 선별검사로 널리 사용<br/>
											되고 있습니다. 세침흡인세포검사도 조직검사에 비해 간편하고 통증이 덜한<br/>
											장점이 있으며, 주로 갑상선과 림프절에서 시행하고 있습니다.</span>
											<b>탈락세포 검사 (자궁질도말 · 객담 · 요 · 체액),<br/>
												세침흡인세포 검사 (갑상선 · 유방 · 침샘 · 림프절 · 폐 및 흉부 · 간 및 복부),<br/>
												액상세포 검사</b>

											<span class="check_roombt check_popupbt15">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room03">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/E_03.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>면역병리</p>
											<span>IHC(면역조직화학염색) 검사는 헤마톡실린 에오신(H&E) 염색만으로 감별이<br/>
											어려운 경우 정확한 진단에 도움을 줄 수 있으며, 치료방침의 결정과 치료제의<br/>
											선택, 예후 예측 및 치료 경과 평가 등에 광범위하게 이용되고 있습니다.</span>
											<b>항원-항체 반응을 이용하여 세포의 단백질 발현 양상을 분석하는 검사 방법<br/>
												→ 60여종 항체 보유 (PD-L1 등)</b>

											<span class="check_roombt check_popupbt16">장비안내</span>
										</td>
									</tr>
								</tbody>
							</table>

						</div>

						<div class="check_room room04">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/E_04.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자병리</p>
											<b>병변이 있는 조직 및 세포에서 핵산을 추출, 유전자 수준의 변화 분석 <br/>
												→ FISH (<i style="font-style: italic;">Her-2</i>, <i style="font-style: italic;">c-myc</i>, <i style="font-style: italic;">ALK</i> gene rearrangement, <i style="font-style: italic;">ROS1</i> gene rearrangement)</b>

										
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<!--//tab-5 End-->
						
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
	
	<!---------------------------------------------------------popup_Area --------------진단검사의학센터------------------------------>
	
		<!--popup1-->
	<div id="modal" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">임상화학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 		<b>Hitachi 7600 DDP</b>
																<span>Liver function test, Renal function test, Lipd test</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>Cobas 8000 (c702, c502)</b>
															 <span>화학분석 전용장비, 약물검사</span>
														 </p>
													</li>

													<li class="banner4">
														 <p class="banner_text">
															 <b>Hitachi Automatic Analyzer(LABOSPECT 008AS)</b>
															 <span>Liver function test, Renal function test, Lipd test</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
														 	<b>UC-3500</b>
															<span>Routine Urinalysis</span>
														 </p>
													</li>

													<li class="banner6">
														 <p class="banner_text">
															 <b>UF-5000</b>
															 <span>Urinary Sediment Analysis</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">Hitachi 7600 DDP</li>
													<li>Cobas 8000 (c702, c502)</li>
													<li>Hitachi Automatic Analyzer (LABOSPECT 008AS)</li>
<!-- 													<li>Hitachi Automatic Analyzer</li> -->
													<li>UC-3500</li>
													<li>UF-5000</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup1 End--------------------------------------------------------------------------------------------->
	
		<!--popup2-->
	<div id="modal2" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">혈액학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 		<b>Sysmex XN-9000 & SP-10</b>
																<span>일반혈액학 검사(CBC, Diff.count, Reticulocyte)</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>Bio-rad IH=1000</b>
															 <span>ABO 및  Rh혈액형 검사</span>
														 </p>
													</li>

													<li class="banner3">
														 <p class="banner_text">
															 <b>Tosoh HLC-723G8</b>
															 <span>당화혈색소 검사 (HbAlc)</span>
														 </p>
													</li>

													<li class="banner4">
														 <p class="banner_text">
															 <b>Stago R MAX</b>
															 <span>혈액응고 검사(PT, aPTT, Fibrinogen, Factor assay)</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>TEST 1 SDI</b>
															 <span>적혈구침강속도 (ESR)</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">Sysmex XN-9000 & SP-10</li>
													<li>Bio-rad IH=1000</li>
													<li>Tosoh HLC-723G8</li>
													<li>Stago R MAX</li>
													<li>TEST 1 SDI</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup2 End--------------------------------------------------------------------------------------------->
	
		<!--popup3-->
	<div id="modal3" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">미생물학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 		<b>MALDI Biotyper</b>
																<span>Culture&ID</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>VITEK 2 system</b>
															 <span>Culture&ID, 항균제감수성검사(MIC)</span>
														 </p>
													</li>

													<li class="banner3">
														 <p class="banner_text">
															 <b>Microscan Walkaway 96 plus</b>
															 <span>Culture&ID, 항균제감수성검사(MIC)</span>
														 </p>
													</li>

													<li class="banner4">
														 <p class="banner_text">
															 <b>ADAGIO</b>
															 <span>항균제감수성검사 Disk-diffusion</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>KS-S100</b>
															 <span>AFB stain</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>Bactec MGIT 960 system</b>
															 <span>결핵균 액체배양</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>BD BACTEC FX</b>
															 <span>혈액배양검사 Blood Culture</span>
														 </p>
													</li>
													
													<li class="banner8">
														 <p class="banner_text">
															 <b>NS-Prime</b>
															 <span>Stool occult blood</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">MALDI Biotyper</li>
													<li>VITEK 2 system</li>
													<li>Microscan Walkaway 96 plus</li>
													<li>ADAGIO</li>
													<li>KS-S100</li>
													<li>Bactec MGIT 960 system</li>
													<li>BD BACTEC FX </li>
													<li>NS-Prime</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup3 End--------------------------------------------------------------------------------------------->
	
		<!--popup4-->
	<div id="modal4" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">핵의학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>Gamma counter</b>
															<span>IRMA RIA를 이용한 각종 호르몬 검사</span>
														 </p>
													</li>
													
													<li class="banner2">
														 <p class="banner_text">
															 <b>GEMINI</b>
															 <span>C.difficile toxin A&B 검사</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">Gamma counter</li>
													<li>GEMINI</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup4 End--------------------------------------------------------------------------------------------->
	
		<!--popup5-->
<!--  	<div id="modal5" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">요경검팀</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>UC-3500</b>
															<span>Routine Urinalysis</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>UF-5000</b>
															 <span>Urinary Sediment Analysis</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">UC-3500</li>
													<li>UF-5000</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div>
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>-->
	<!--//popup5 End--------------------------------------------------------------------------------------------->
	
	<!---------------------------------------------------------popup_Area --------------생명환경과학센터------------------------------>
	
		<!--popup6-->
	<div id="modal6" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">산업보건분석</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													
													<li class="banner3 on">
														 <p class="banner_text">
															 <b>전처리실</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>시약실</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>GC / Headspace <br/>Agilent 8890 / Agilent 7697A</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>Agilent 1200(HPLC)</b>
															 <span>-</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">전처리실</li>
													<li>시약실</li>
													<li><span class="dot_span">GC / Headspace <br/>Agilent 8890 / Agilent 7697A</span></li>
													<li>Agilent 1200(HPLC)</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup6 End--------------------------------------------------------------------------------------------->
	
		<!--popup7-->
	<div id="modal7" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">대사체/무기분석</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>MILESTONE DMA-80(Mercury Analyzer)</b>
															<span>-</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>PerkinElmer Clarus SQ8T(GC-MS)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>PerkinElmer AAnalyst 600(AAS)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>PerkinElmer NexION 2000(ICP-MS)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>SCIEX Triple Quad 5500+(LC-MS/MS)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>Agilent 1200(HPLC)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner8">
														 <p class="banner_text">
															 <b>Automatic immunoassay system<br/>PerkinElmer AutoDELFIA</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner9">
														 <p class="banner_text">
															 <b>Agilent 6470(LC-MS/MS)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner10">
														 <p class="banner_text">
															 <b>Waters Xevo TQD(LC-MS/MS)</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner11">
														 <p class="banner_text">
															 <b>Tandem Mass Spectrometer<br/>PerkinElmer Qsight 210 MD</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>시약실</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner12">
														 <p class="banner_text">
														 	<b>생명환경과학센터 기기분석실</b>
															<span>-</span>
														 </p>
													</li>

													<li class="banner13">
														 <p class="banner_text">
															 <b>Dark Room</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner14">
														 <p class="banner_text">
															 <b>전처리실</b>
															 <span>-</span>
														 </p>
													</li>
												</ul>

												<ul class="dot" style="overflow-y:scroll;height:580px;">
													<li class="on"><span>MILESTONE DMA-80(Mercury Analyzer)</span></li>
													<li><span>PerkinElmer Clarus SQ8T(GC-MS)</span></li>
													<li><span>PerkinElmer AAnalyst 600(AAS)</span></li>
													<li><span>PerkinElmer NexION 2000(ICP-MS)</span></li>
													<li><span>SCIEX Triple Quad 5500+(LC-MS/MS)</span></li>
													<li>Agilent 1200(HPLC)</li>
													<li><span class="dot_span">Automatic immunoassay system<br/>PerkinElmer AutoDELFIA</span></li>
													<li>Agilent 6470(LC-MS/MS)</li>
													<li>Waters Xevo TQD(LC-MS/MS)</li>
													<li><span class="dot_span">Tandem Mass Spectrometer<br/>PerkinElmer Qsight 210 MD</span></li>
													<li>시약실</li>
													<li>생명환경과학센터 기기분석실</li>
													<li>Dark Room</li>
													<li>전처리실</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup7 End--------------------------------------------------------------------------------------------->
	
	<!---------------------------------------------------------popup_Area --------------분자진단검사센터------------------------------>
	
		<!--popup8-->
	<div id="modal8" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">분자미생물학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>STARIet</b>
															<span>자동핵산추출장비</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>MagNa Pure 96, Roche</b>
															 <span>자동핵산추출기</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>CFX96/Bio-rad</b>
															 <span>Real-time PCR</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>SEEAMP/Seegene</b>
															 <span>PCR 장비</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>Labchip</b>
															 <span>전기영동</span>
														 </p>
													</li>
													
													<li class="banner8">
														 <p class="banner_text">
															 <b>cobas 6800</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner9">
														 <p class="banner_text">
															 <b>cobas 4800</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner10">
														 <p class="banner_text">
															 <b>kingfisher-flex</b>
															 <span>-</span>
														 </p>
													</li>
													
													<li class="banner11">
														 <p class="banner_text">
															 <b>MolecuTech HybREAD480</b>
															 <span>-</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">STARIet</li>
													<li>MagNa Pure 96, Roche</li>
													<li>CFX96/Bio-rad</li>
													<li>SEEAMP/Seegene</li>
													<li>Labchip</li>
													<li>cobas 6800</li>
													<li>cobas 4800</li>
													<li>kingfisher-flex</li>
													<li>MolecuTech HybREAD480</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup8 End--------------------------------------------------------------------------------------------->
	
		<!--popup9-->
	<div id="modal9" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">분자유전학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>Image Analyzer, Bio-rad</b>
															<span>전기영동촬영장치</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>AB3730XL/ABI</b>
															 <span>염기서열분석기</span>
														 </p>
													</li>
													
													 <li class="banner2">
														 <p class="banner_text">
															 <b>AB3500xl Dx/ABI</b>
															 <span>염기서열분석기</span>
														 </p>
													</li>
												
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>MagNa Pure 96, Roche</b>
															 <span>자동핵산추출기</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>SEEAMP/Seegene</b>
															 <span>PCR 장비</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>CFX96/Bio-rad</b>
															 <span>Real-time PCR</span>
														 </p>
													</li>
													
													<li class="banner8">
														 <p class="banner_text">
															 <b>LC480/Roche</b>
															 <span>Real time PCR</span>
														 </p>
													</li>
													
													<li class="banner9">
														 <p class="banner_text">
															 <b>AB7500, AB</b>
															 <span>Real-time PCR</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">Image Analyzer, Bio-rad</li>
													<li>AB3730XL/ABI</li>
													<li>AB3500xl Dx/ABI</li>
													<li>MagNa Pure 96, Roche</li>
													<li>SEEAMP/Seegene</li>
													<li>CFX96/Bio-rad</li>
													<li>LC480/Roche</li>
													<li>AB7500, AB</li>
												<!-- <li>CobasAmpliprep + TaqMan 480/Roche</li> -->
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup9 End--------------------------------------------------------------------------------------------->
	
		<!--popup10-->
	<div id="modal10" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">세포유전학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>Auto-image analysis/Metafer-4</b>
															<span>자동핵형분석기</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>ECLIPSE 80_kon</b>
															 <span>형광현미경</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>SDS-5/Thermotronlnd</b>
															 <span>온.습도자동조절챔버</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>HERACell 150i CO2 Incubator</b>
															 <span>CO2 배양기</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>S500-24/Abbot</b>
															 <span>자동교잡기</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on" style="letter-spacing:-0.5px;">Auto-image analysis/Metafer-4</li>
													<li>ECLIPSE 80_kon</li>
													<li>SDS-5/Thermotronlnd</li>
													<li>HERACell 150i CO2 Incubator</li>
													<li>S500-24/Abbot</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup10 End--------------------------------------------------------------------------------------------->
	
		<!--popup11-->
	<div id="modal11" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">NGS (Next Generation Sequencing)</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>MiseqDX</b>
															<span>차세대 염기서열 분석 장비</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>HyperVAC MAX</b>
															 <span>동결건조 진공농축기</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>Covaris M220</b>
															 <span>초음파 분쇄기</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>4200 Tape station</b>
															 <span>자동화 전기영동 장비</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>Veriti96</b>
															 <span>PCR 장비</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">MiseqDX</li>
													<li>HyperVAC MAX</li>
													<li>Covaris M220</li>
													<li>4200 Tape station</li>
													<li>Veriti96</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup11 End--------------------------------------------------------------------------------------------->
	
<!---------------------------------------------------------popup_Area --------------진단면역검사센터------------------------------>
	
		<!--popup12-->
	<div id="modal12" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">면역학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>Architect i4000</b>
															<span>Infectious Disease</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>Cobas8000 e801</b>
															 <span>Hormone, tumor, thyroid</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>DXI800</b>
															 <span>Vitamin</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>VIDAS</b>
															 <span>Immunoassay System</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>AVL9180</b>
															 <span></span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">Architect i4000</li>
													<li>Cobas8000 e801</li>
													<li>DXI800</li>
													<li>VIDAS</li>
													<li>AVL9180</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup12 End--------------------------------------------------------------------------------------------->
	
		<!--popup13-->
	<div id="modal13" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">특수면역학</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>DS2 System</b>
															<span>IEIA Automation Platform(잠복결핵용)</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>TRITURUS</b>
															 <span>EIA Automation Platform</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>SPA plus</b>
															 <span>Immunoglobulin, complement 분석 장비</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>AP 16 IF</b>
															 <span>IFA processing system</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>Cytomics FC 500</b>
															 <span>Flow Cytometry Analyzer</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>Q-STATION</b>
															 <span>MAST 알러지 검사</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>Immulite 2000XPi</b>
															 <span>Nicotine metabolite 외 바이러스 검사</span>
														 </p>
													</li>
													
													<li class="banner8">
														 <p class="banner_text">
															 <b>ImmunoCAP 250system</b>
															 <span>Allergy</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">DS2 System</li>
													<li>TRITURUS</li>
													<li>SPA plus</li>
													<li>AP 16 IF</li>
													<li>Cytomics FC 500</li>
													<li>Q-STATION</li>
													<li>Immulite 2000XPi</li>
													<li>ImmunoCAP 250system</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup13 End--------------------------------------------------------------------------------------------->
	
<!---------------------------------------------------------popup_Area --------------병리센터------------------------------>
	
		<!--popup14-->
	<div id="modal14" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">조직병리</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>Pathcentre/SHANDON (Tissue-processor)</b>
															<span>조직 내에 알코올, 자일렌, 파라핀을 자동으로 침투</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>VIP 6/SAKURA (Tissue-processor)</b>
															 <span>조직 내에 알코올, 자일렌, 파라핀을 자동으로 침투</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>Excelsior ES/SHANDON (Tissue-processor)</b>
															 <span>조직 내에 알코올, 자일렌, 파라핀을 자동으로 침투</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>EFTP/INTE LSINT (Tissue-processor)</b>
															 <span>조직 내에 알코올, 자일렌, 파라핀을 자동으로 침투</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>Tissue-Tek/SAKURA (Embedding Center)</b>
															 <span>조직을 파라핀 블록으로 제작</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>RM2245/LEICA (Microtome)</b>
															 <span>파라핀 블록을 3~4㎛ 두께로 박절</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>RM2235/LEICA (Microtome)</b>
															 <span>파라핀 블록을 3~4㎛ 두께로 박절</span>
														 </p>
													</li>
													
													<li class="banner8">
														 <p class="banner_text">
															 <b>CoverStai ner/D A KO (Auto stainer)</b>
															 <span>자동으로 헤마톡실린 에오신 염색 및 슬라이드 봉입</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on" style="font-size:13px;letter-spacing:-0.8px;
													line-height:3.2em;">Pathcentre/SHANDON (Tissue-processor)</li>
													<li style="font-size:13px;letter-spacing:-0.8px;
													line-height:3.2em;">VIP 6/SAKURA (Tissue-processor)</li>
													<li style="font-size:13px;letter-spacing:-0.8px;
													line-height:3.2em;">Excelsior ES/SHANDON (Tissue-processor)</li>
													<li style="font-size:13px;letter-spacing:-0.8px;
													line-height:3.2em;">EFTP/INTE LSINT (Tissue-processor)</li>
													<li style="font-size:13px;letter-spacing:-0.8px;
													line-height:3.2em;">Tissue-Tek/SAKURA (Embedding Center)</li>
													<li>RM2245/LEICA (Microtome)</li>
													<li>RM2235/LEICA (Microtome)</li>
													<li style="font-size:13px;letter-spacing:-0.8px;
													line-height:3.2em;">CoverStai ner/D A KO (Auto stainer)</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup14 End--------------------------------------------------------------------------------------------->
	
		<!--popup15-->
	<div id="modal15" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">세포병리</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>Tissue-Tek DRS 200</b>
															<span>자동염색기</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>Tissue-Tek Glas</b>
															 <span>자동봉입기</span>
														 </p>
													</li>
													
													<li class="banner3">
														 <p class="banner_text">
															 <b>Auto stainer-Varistain 24-4K</b>
															 <span>자동염색기</span>
														 </p>
													</li>
													
													<li class="banner4">
														 <p class="banner_text">
															 <b>Cytospin</b>
															 <span>세포도말기</span>
														 </p>
													</li>
													
													<li class="banner5">
														 <p class="banner_text">
															 <b>LEICA Autostainer XL</b>
															 <span>자동염색기</span>
														 </p>
													</li>
													
													<li class="banner6">
														 <p class="banner_text">
															 <b>Cell prep</b>
															 <span>액상세포검사</span>
														 </p>
													</li>
													
													<li class="banner7">
														 <p class="banner_text">
															 <b>Thin prep</b>
															 <span>액상세포검사</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">Tissue-Tek DRS 200</li>
													<li>Tissue-Tek Glas</li>
													<li>Auto stainer-Varistain 24-4K</li>
													<li>Cytospin</li>
													<li>LEICA Autostainer XL</li>
													<li>Cell prep</li>
													<li>Thin prep</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup15 End--------------------------------------------------------------------------------------------->
	
		<!--popup16-->
	<div id="modal16" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">면역병리</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<!-- banner_slide-->
											<div class="slide">

												<ul class="panel">
													<li class="banner1 on">
														 <p class="banner_text">
														 	<b>PT-Link</b>
															<span>조직내 항원 복구</span>
														 </p>
													</li>

													<li class="banner2">
														 <p class="banner_text">
															 <b>AS Link48/DAKO (Immuno-Auto stainer)</b>
															 <span>자동으로 면역조직화학염색 시행</span>
														 </p>
													</li>
												</ul>

												<ul class="dot">
													<li class="on">PT-Link</li>
													<li>AS Link48/DAKO (Immuno-Auto stainer)</li>
												</ul>

												<div class="arrow_area">
													<div class="next1">↓</div>
													<div class="prev1">↑</div>

												</div>

											</div><!--banner_slide End-->
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup16 End--------------------------------------------------------------------------------------------->
	
	<!--popup17 introduce_popup-->
	<div id="modal17" class="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name">특수건강진단</span>
				<b class="close_bt"><img src="/user/img/sub/close.png" alt="닫기버튼"></b>
			</div>

			<div class="popup_inner">
				<div class="content_inner01">
				 	<p>특수건강진단 실시대상</p>
				 	<span>직업성 질환의 발생 원인이 되는 유해인자 181종에 노출되는 업무에 종사하는 근로자</span>
				</div>
				
				<div class="content_inner02">
					<p>특수건강진단 대상 유해인자</p>
					<table>
						<thead></thead>
						<tbody>
							<tr>
							  <td>작업환경 측정 및 MSDS 자료를 바탕으로 한 유기화합물 109종</td>
							  <td style="width:220px;">금속류 20종</td>
							  <td>산 및 알칼리류 8종</td>
							</tr>
							
							<tr>
							  <td>가스상태 물질류 14종</td>
							  <td>허가대상물질 12종</td>
							  <td>금속가공유</td>
							</tr>
							
							<tr>
							  <td>분진 7종</td>
							  <td>물리적 인자(소음, 진동 등) 8종</td>
							  <td>야간작업 2종</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="content_inner03">
					<p>특수건강진단 종류</p>
					<table>
						<thead>
							<colgroup>
								<col width="20%">
								<col width="45%">
								<col width="35%">
							</colgroup>
						</thead>
						<tbody>
							<tr>
							  <th>[구분]</th>
							  <th>[진단시기]</th>
							  <th>[진단대상자]</th>
							</tr>
							
							<tr>
							  <td>배치전건강진단</td>
							  <td>특수건강진단 유해인자에 노출되는 업무에 배치되기 전</td>
							  <td>대상업무 배치 예정자</td>
							</tr>
							
							<tr>
							  <td>특수건강진단</td>
							  <td>작업 중 노출되는 유해인자에 따른 기본주기</td>
							  <td>대상 유해인자에 노출된 근로자</td>
							</tr>
							
							<tr>
							  <td>수시건강진단</td>
							  <td>특수건강진단 시기 외에 작업관련 증상을 호소할 때</td>
							  <td>천식, 피부질환, 기타 건강장애 증상 호소자</td>
							</tr>
							
							<tr>
							  <td>임시건강진단</td>
							  <td>같은 유해인자에 노출되는 근로자에게 유사항 질병의자각,<br/>
							   타각증상이 발생하거나 직업병 유소견자가 다수 발생하는 경우</td>
							  <td>동일부서 근로자</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="content_inner04">
					<p>예약시필요서류 <i>(※ 사전 전화예약 필수)</i></p>
					<table>
						<thead></thead>
						<tobody>
						  <tr>
						  	<td style="width:389px;">사업자등록증</td>
						  	<td>비용지원통보서 (비용지원 사업장에 해당)</td>
						  </tr>
						  
						 <tr>
						  	<td>검진의뢰서 (사업장정보, 검진대상자 성명, 부서 등)</td>
						  	<td>전년도 특수건강진단 결과표 및 사후관리 소견서</td>
						  </tr>
						  
						  <tr>
						  	<td>최근 2회분 작업환경측정서 (필요에 따라 MSDS 포함)</td>
						  	<td>야간작업 근무시간표 (야간작업 근로자에 해당) 등</td>
						  </tr>
						</tobody>
					</table>
				</div>
				
				<div class="content_inner05">
					<img src="/user/img/check_room/popup_tree_20230201_1.png"></img>
					<table>
						<thead>
							<colgroup>
								<col width="15%">
								<col width="30%">
								<col width="20%">
								<col width="15%">
								<col width="20%">
							</colgroup>
						</thead>
						<tbody>
							<tr>
								<th>[이름]</th>
								<th>[담당업무]</th>
								<th>[직종]</th>
								<th>[직책]</th>
								<th>[연락처]</th>
							</tr>

							<tr>
								<td>곽우석</td>
								<td>총괄,문진,이학적검사,판정</td>
								<td>직업환경의학전문의</td>
								<td>부서장</td>
								<td>02-2218-9357</td>
							</tr>

							<tr>
								<td>양대율</td>
								<td>행정업무(사전조사),흉부촬영</td>
								<td>방사선사</td>
								<td>팀장</td>
								<td>02-2218-9357</td>
							</tr>

							<tr>
								<td>백진주</td>
								<td>행정업무(결과처리),폐활량&amp;청력검사</td>
								<td>간호사</td>
								<td>-</td>
								<td>02-2218-9198</td>
							</tr>
							<tr>
								<td>김상화</td>
								<td>행정업무(결과처리),폐활량&amp;청력검사</td>
								<td>간호사</td>
								<td>-</td>
								<td>02-2218-9196</td>
							</tr>
							<!-- 	<tr>
									<td>신윤정</td>
									<td>행정업무(결과처리)</td>
									<td>간호사</td>
									<td>-</td>
									<td>02-2218-9197</td>
								</tr>
							-->
							<tr>
								<td>김희선</td>
								<td>채혈,검체관리</td>
								<td>임상병리사</td>
								<td>-</td>
								<td>02-2218-9198</td>
							</tr>

							<tr>
								<td>김소영</td>
								<td>분석(유기)</td>
								<td>산업위생관리기사</td>
								<td>-</td>
								<td>02-2218-9197</td>
							</tr>
							<tr>
								<td>장지원</td>
								<td>분석(유기)</td>
								<td>산업위생관리기사</td>
								<td>-</td>
								<td>02-2218-9197</td>
							</tr>
							<tr>
								<td>신유경</td>
								<td>분석(유기)</td>
								<td>산업위생관리기사</td>
								<td>-</td>
								<td>02-2218-9197</td>
							</tr>

							<tr>
								<td>최승현</td>
								<td>분석(무기)</td>
								<td>산업위생관리기사</td>
								<td>-</td>
								<td>02-2218-9196</td>
							</tr>
							<tr>
								<td>최현준</td>
								<td>분석(무기)</td>
								<td>분석사</td>
								<td>-</td>
								<td>02-2218-9198</td>
							</tr>


						</tbody>
					</table>
				</div>

			</div>
		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup17 End--------------------------------------------------------------------------------------------->
	
	
	<script type="text/javascript">
	
	//해시태그 세팅하기
	function fnSetHash(page) {
		var hash = "#" + page;
		window.location.hash = hash;
	}
	
	function checkHash(){
		
		if (document.location.hash != ""){     //받아올 해시가 있으면
			var arrHash = new Array();
			var hash = document.location.hash;
			arrHash = hash.split("#");
			
			$("._tab_"+ arrHash[1]).trigger('click');
			
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
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
		
		$(document).ready(function(){

			$(".tab-link").click(function(){
				
				$(".tab-link").removeClass('current');
				$(this).addClass('current');
				var view = $(this).data('view');
				$("._contentView").hide();
				$("#tab-"+view).show();
			});
			
			
			$("._gofaq").click(function(){
				location.href = "<c:url value='/faq/special/index.do#10'/>";
			});
			
// 			$("#tab-1").show();
			
			checkHash();
			
			if(!CommonUtil.isEmpty(getParameterByName('sp'))){
				  setTimeout(function() {
					  	$(window).scrollTop('1167');
						}, 280);
			}			
		});
	
	</script>
</body>
</html>
