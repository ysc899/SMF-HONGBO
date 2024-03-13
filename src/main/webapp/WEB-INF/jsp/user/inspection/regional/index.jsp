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
	<link href="<c:url value='/user/css/02_sub03_A.css?ver=20230704'/>" type="text/css" rel="stylesheet"/>
	
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
							<li class="tab-link no_bottom _centerRow _centerMenu_1  _tab_1" data-view="1">부산경남검사센터</li>
							<li class="tab-link no_bottom _centerRow _centerMenu_2  _tab_2" data-view="2">대구경북검사센터</li>
							<li class="tab-link no_bottom _centerRow _centerMenu_3  _tab_3" data-view="3">광주호남검사센터</li>
							<li class="tab-link no_bottom _centerRow _centerMenu_5  _tab_5" data-view="5">대전충청검사센터</li>
							<%-- <li class="tab-link no_bottom _centerRow _centerMenu_4  _tab_4" data-view="4">카자흐스탄 알마티 검사센터(SKL)</li> --%>
						</ul>
						
						<!--tab1-->
						<div id="tab-1" class="tab-content tab_common current">

						<div class="content_inner01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td rowspan="2" class="td_title"><img src="<c:url value='/user/img/check_room2/A_title.png'/>" class="c_img1" alt="센터이미지"/>
											<b class="center_img_bt1">센터이미지 보기</b></td>
										<td class="td_up">
											<div>
												<p>부산경남검사센터</p>
												<span>부산경남검사센터는 부산·경남지역을 대표하는 검체검사<br/>
												수탁전문기관으로, 진단의학검사·분자진단검사·병리검사<br/>
												등을 주·야간 실시하며 고품격의 검사서비스를 제공합니다.</span>
											</div>
										</td>
									</tr>

									<tr>
										<td class="td_down">
											<p>센터 소개</p>
											 <ul>
											 		<li>1. 실시간 검체 운송 및 검사 시행</li>
											 		<li>2. 응급검사 시스템 운영</li>
											 		<li>3. 분자진단 검사 분야 ONE DAY 검사 실시</li>
											 		<li>4. 철저한 정도관리 및 검체 안정성 보장</li>
											 </ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room01">
							<p>검사분야</p>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/1A_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>진단검사의학부</p>
											<span>최첨단 검사실 자동화 시스템 및 24시간 검사실 운영을 통해 신속하고 정확한 검사<br/>
											결과를 제공합니다.</span>
											<b>[임상화학] 간기능검사·신장기능검사·지질검사·당뇨검사·염증검사·약물검사·철분검사 등</b>
											<b>[면역학] 간염바이러스검사·종양표지자검사·갑상선기능검사·성호르몬검사·알레르기검사 등</b>
											<b>[요검경학] 일반 소변검사·마약 소변검사·정액검사 등</b>
											<b>[혈액학] 일반혈액검사·혈액형검사·혈액응고검사·비특이 항체검사·체액검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/1A_sub01.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub02.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub03.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub04.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub05.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub06.png'/>" alt="이미지" /></li>
							</ul>
						</div>

						<div class="check_room room02">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/1B_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자진단검사부</p>
											<span>분자생물학적 기술을 통해 각종 질환을 진단하며, ONE DAY 검사 시스템 운영으로<br/>
											 24시간내 결과를 보고합니다.</span>
											<b><i style="font-size:15px;font-weight:600;">PCR검사</i> : 세균성 뇌수막염 PCR 검사, 급성설사 원인균 PCR 검사<br/>
											<br/>
											<i style="font-size:15px;font-weight:600;">Realtime PCR검사</i> : <!--코로나바이러스감염증-19 검사, STI multiplex검사, HPV 유전자형검사, 
											폐렴 원인균 및 호흡기바이러스 검사, Mycoplasma pneumoniae Macrolide<br/>
											내성검사, <i style="font-style: italic;">Helicobacter pylori</i>&nbsp;(클라리스로마이신 내성 포함)검사 등</b>-->
											SARS-CoV-2 PCR 검사, MERS-CoV PCR 검사, Zika virus PCR 검사, 폐렴 원인균 및 호흡기바이러스 PCR 검사,
											<i style="font-style:italic;"> Helicobacter pylori</i> (Clarithromycin 내성 포함) 검사, MTB real-time PCR 검사, STI multiplex real-time PCR 검사,
											HPV 유전자형 real-time PCR 검사, Influenza A&B virus PCR 검사, CMV real-time PCR 정량 검사, EBV real-time PCR 정량 검사,
											HBV PCR 정성 및 정량 검사, HCV PCR 정성 및 정량 검사 등
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/1A_sub01_01.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub02_02.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub03_03.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub04_04.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub05_05.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/1A_sub06_06.png'/>" alt="이미지" /></li>
							</ul>
						</div>

						<div class="check_room room03">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/1C_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>병리검사부</p>
											<span>병리검사 분야에 디지털 및 AI 등 최신기술을 접목시켜 차원 높은 병리검사<br/>
											서비스를 제공하고 있습니다.</span>
											<b> 분자병리 검사(FISH), 면역조직화학염색 검사(PD-L1), 면역조직화학염색 검사<br/>
											(IHC Stain), 동결절편 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/1C_sub01.jpg'/>" alt="이미지" /></li>
                                <li><img src="<c:url value='/user/img/check_room2/1C_sub02.jpg'/>" alt="이미지" /></li>
                                <li><img src="<c:url value='/user/img/check_room2/1C_sub03.jpg'/>" alt="이미지" /></li>
                                <li><img src="<c:url value='/user/img/check_room2/1C_sub04.jpg'/>" alt="이미지" /></li>
                                <li><img src="<c:url value='/user/img/check_room2/1C_sub05.jpg'/>" alt="이미지" /></li>
                                <li><img src="<c:url value='/user/img/check_room2/1C_sub06.jpg'/>" alt="이미지" /></li>
							</ul>
						</div>

						<div class="content_inner02">
							<p>24시간 검사 안내</p>
							 <span>최적의 응급검사 시스템 운영으로 병원 내 검사실처럼 완벽한 '24시간 결과 서비스'를 제공합니다.</span>
							 <span>검사 안내(응급검사 관련 문의 : 1566-6500)</span>

							 <table>
						 		<colgroup>
						 			<col width="20%"/>
						 			<col width="80%"/>
						 		</colgroup>

								<tbody>
									<tr>
										<th>수혈 전 검사</th>
										<td>ABO & Rh typing 검사, 비예기항체검사(Antibody Screening test)</td>
									</tr>

									<tr>
										<th>심장기능검사</th>
										<td>LDH, CK total, CK-MB, Troponin I, hs-CRP</td>
									</tr>

									<tr>
										<th>지질검사</th>
										<td>Cholesterol, Triglyceride, HDL- Cholesterol, LDL- Cholesterol</td>
									</tr>

									<tr>
										<th>간기능검사</th>
										<td>AST, ALT, γ-GT, ALP, Total Bilirubin, Direct Bilirubin, Indirect Bilirubin, Ammonia</td>
									</tr>

									<tr>
										<th>신장기능검사</th>
										<td>Protein, Albumin, BUN, Creatinine, GFR</td>
									</tr>

									<tr>
										<th>혈액응고검사</th>
										<td>PT, APTT, D-dimer, Antithrombin III</td>
									</tr>

									<tr>
										<th>내분비검사</th>
										<td>TSH , T3, T4, Free T4, TSH-R Ab, Thyroglobulin</td>
									</tr>

									<tr>
										<th>전해질검사</th>
										<td>Ca, Phosphorus, Na, K, Cl, Mg</td>
									</tr>

									<tr>
										<th>면역혈청검사</th>
										<td>HBs Ag, HBs Ab, HBe Ag, HBe Ab, HCV Ab, HIV Ab, Rubella IgG, Rubella IgM</td>
									</tr>

									<tr>
										<th>당뇨검사</th>
										<td>Glucose, HbA1c, Insulin, C-peptide</td>
									</tr>

									<tr>
										<th>일반혈액검사</th>
										<td>CBC, Reticulocyte count, PBS, ESR</td>
									</tr>

									<tr>
										<th>체액검사</th>
										<td>Body fluid analysis</td>
									</tr>

									<tr>
										<th>요 및 정액검사</th>
										<td>Urine analysis, Semen analysis, 마약 소변검사</td>
									</tr>

									<tr>
										<th>종양표지자검사</th>
										<td>AFP, CEA, CA19-9, CA125, PSA, Cyfra21-1, CA15-3, β-HCG</td>
									</tr>

									<tr>
										<th>Wet smear</th>
										<td>Direct Smear 현미경검사</td>
									</tr>

									<tr>
										<th>대변 및 기생충 검사</th>
										<td>Stool Hb(정량), Ova,Parasite, Protozoa Cyst, Scotch tape법, Stool WBC</td>
									</tr>

									<tr>
										<th>세균검사</th>
										<td>culture & I.D, Antibiotic susceptibility test(MIC)</td>
									</tr>

									<tr>
										<th>기타 검사</th>
										<td>Gram stain, Wet smear, Legionella Ag, 분자진단검사 / 코로나바이러스-19 검사</td>
									</tr>
									
									<tr>
										<th>분자진단검사</th>
										<td>코로나바이러스-19 검사</td>
									</tr>

									<tr>
										<th>병리검사</th>
										<td>동결절편검사</td>
									</tr>
								</tbody>

							 </table>
						</div>

					</div>
					<!--//tab-1 End-->

					<!--tab2-->
					<div id="tab-2" class="tab-content tab_common">

						<div class="content_inner01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td rowspan="2" class="td_title"><img src="<c:url value='/user/img/check_room2/B_title.png'/>" class="c_img2" alt="센터이미지"/>
											<b class="center_img_bt2">센터이미지 보기</b></td>
										<td class="td_up">
											<div>
												<p>대구경북검사센터</p>
												<span>대구경북검사센터는 대구·경북 지역을 대표하는 고품격<br/>
												검사센터로, 맞춤형 검사 서비스를 통해 일선 병·의원의<br/>
												임상적 진단을 지원합니다.</span>
											</div>
										</td>
									</tr>

									<tr>
										<td class="td_down">
											<p>센터 소개</p>
											 <ul>
													<li>1. 철저한 정도관리 및 검체 안정성 확보</li>
													<li>2. 고객 맞춤형 검체검사 결과 서비스 제공</li>
													<li>3. 분자진단 검사 분야 ONE DAY 검사 실시</li>
													<li>4. 대구 · 경북 지역의 신종 감염병 대응에 기여</li>
											 </ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room04">
							<p>검사분야</p>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/2A_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>진단검사의학부</p>
											<span>최첨단 검사실 자동화 시스템 및 24시간 검사실 운영을 통해 신속하고 정확한 검사<br/>
											결과를 제공합니다.</span>
											<b>[임상화학]  간기능 검사·신장기능 검사·지질 관련 검사·당뇨병 관련 검사·염증 관련<br/>
											검사·약물 검사 등</b>
											<b>[면역학] 간염바이러스 검사·종양표지자 검사·갑상선기능 검사·성호르몬 검사·<br/>
											알레르기 관련 검사 등</b>
											<b>[요검경학]  일반 소변 검사·마약 소변 검사·정액 검사 등</b>
											<b>[혈액학] 일반혈액 및 혈액형 검사·핼액응고 관련 검사·비특이 항체  검사·체액 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/2A_sub01.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2A_sub02.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2A_sub03.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2A_sub04.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2A_sub05.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2A_sub06.png'/>" alt="이미지"/></li>
							</ul>
						</div>

						<div class="check_room room05">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/2B_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자진단검사부</p>
											<span>분자생물학적 기술을 통해 각종 질환을 진단하며, ONE DAY 검사 시스템 운영으로<br/>
											 24시간내 결과를 보고합니다.</span>
											<b><!--코로나바이러스감염증-19 분자진단 검사, 폐렴 원인균 및 호흡기바이러스 PCR 검사,<br/>
											Mycoplasma pneumoniae Macrolide 내성 검사, <i style="font-style: italic;">Helicobacter pylori</i><br/> 
											(클라리스로마이신 내성 포함) 검사, 세균성 뇌수막염 PCR 검사, 급성설사 원인균 PCR<br/>
											검사, MTB-Realtime PCR 검사, STI multiplex Real-time PCR 검사, HPV 유전자형<br/>
											Real-time PCR 검사 등-->
											SARS-CoV-2 PCR 검사, MERS-CoV PCR 검사, Zika virus PCR 검사, 폐렴 원인균 및 호흡기바이러스 PCR 검사,
											<i style="font-style:italic;"> Helicobacter pylori</i> (Clarithromycin 내성 포함) 검사, MTB real-time PCR 검사, STI multiplex real-time PCR 검사,
											HPV 유전자형 real-time PCR 검사, Influenza A&B virus PCR 검사, CMV real-time PCR 정량 검사, EBV real-time PCR 정량 검사,
											HBV PCR 정성 및 정량 검사, HCV PCR 정성 및 정량 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/2B_sub01.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2B_sub02.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2B_sub03.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2B_sub04.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2B_sub05.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2B_sub06.png'/>" alt="이미지"/></li>

							</ul>
						</div>

						<div class="check_room room06">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/2C_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>병리검사부</p>
											<span>병리검사 분야에 디지털 및 AI 등 최신기술을 접목시켜 차원 높은 병리검사<br/>
											서비스를 제공하고 있습니다.</span>
											<b> 분자병리 검사(FISH), 면역조직화학염색 검사(PD-L1), 면역조직화학염색 검사<br/>
											(IHC Stain) 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/2C_sub01.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2C_sub02.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2C_sub03.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2C_sub04.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2C_sub05.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/2C_sub06.png'/>" alt="이미지"/></li>
							</ul>
						</div>


						<div class="check_room room07">
							<p>ONE DAY 검사 시스템</p>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/oneday_bg.png'/>" alt="검사실이미지"/></th>
										<td>
											<span>분자진단 검사 분야 ONE DAY 검사시스템을 운영합니다.</span>
											<b>※ ONE DAY 검사 시스템이란?</b>
											<small class="td_small">국내 최초 자동화 된 분자진단 검사 시스템을 구축하여 검체수거부터 결과보고까지 24시간<br/>
											안에 완료되는 씨젠의료재단만의 특화된 검사 시스템입니다.</small>

											<ul>
												<li><img src="<c:url value='/user/img/check_room2/oneday_ico01.png'/>" alt="원데이 아이콘"/>
													<small>당일 검체 수거</small>
												</li>

												<li><img src="<c:url value='/user/img/check_room2/oneday_ico02.png'/>" alt="원데이 아이콘"/>
													<small>24시간 내 결과 보고</small>
												</li>

												<li><img src="<c:url value='/user/img/check_room2/oneday_ico03.png'/>" alt="원데이 아이콘"/>
													<small>질환의 신속한 처치 및 처방</small>
												</li>

											</ul>
										</td>
									</tr>
								</tbody>
							</table>

						</div>


					</div>
					<!--//tab-2 End-->

					<!--tab3-->
					<div id="tab-3" class="tab-content tab_common">

						<div class="content_inner01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td rowspan="2" class="td_title"><img src="<c:url value='/user/img/check_room2/C_title.png'/>" class="c_img3" alt="센터이미지"/>
											<b class="center_img_bt3" style="bottom:34px;">센터이미지 보기</b></td>
										<td class="td_up">
											<div>
												<p>광주호남검사센터</p>
												<span>2020년 6월 광주광역시 남구 행암동에 개원한 광주호남<br/>
												검사센터는 최신검사 시스템과 우수한 인력을 갖춘<br/>
												검체검사 전문수탁기관입니다.</span>
											</div>
										</td>
									</tr>

									<tr>
										<td class="td_down">
											<div>
											<p>센터 소개</p>
											 <ul>
													<li>1. 고객 맞춤형 검사 서비스<span>실시간 검체 운송 및 검사,24시간 검사실 운영</span></li>
													<li>2. 검사 및 학술 지원 시스템<span>전문상담 체계를 통한 고객 요청에 적극 대응</span></li>
													<li>3. 지속적 검사 품질 관리<span>특화된 정도관리 시스템 적용으로, 지속적 검사 품질 관리</span></li>
											 </ul>
											 </div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room08">
							<p>검사분야</p>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/3A_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>진단검사의학부</p>
											<span>최첨단 검사실 자동화 시스템 및 24시간 검사실 운영을 통해 신속하고 정확한 검사<br/>
											결과를 제공합니다.</span>
											<b>[임상화학]  간기능 검사·신장기능 검사·지질 관련 검사·당뇨병 관련 검사·염증 관련<br/>
											검사·약물 검사 등</b>
											<b>[면역학] 간염바이러스 검사·종양표지자 검사·갑상선기능 검사·성호르몬 검사·<br/>
											알레르기 관련 검사 등</b>
											<b>[요검경학]  일반 소변 검사·마약 소변 검사·정액 검사 등</b>
											<b>[혈액학] 일반혈액 및 혈액형 검사·핼액응고 관련 검사·비특이 항체  검사·체액 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/3A_sub01.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/3A_sub02.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/3A_sub03.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/3A_sub04.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/3A_sub05.png'/>" alt="이미지" /></li>
								<li><img src="<c:url value='/user/img/check_room2/3A_sub06.png'/>" alt="이미지" /></li>
							</ul>
						</div>

						<div class="check_room room09">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/3B_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자진단검사부</p>
											<span>분자생물학적 기술을 통해 각종 질환을 진단하며, ONE DAY 검사 시스템 운영으로<br/>
											 24시간내 결과를 보고합니다.</span>
											<b><!--코로나바이러스감염증-19 분자진단 검사, 폐렴 원인균 및 호흡기바이러스 PCR 검사,<br/>
											Mycoplasma pneumoniae Macrolide 내성 검사, Helicobacter pylori<br/>
											(Clarithromycin 내성 포함) 검사, 세균성 뇌수막염 PCR 검사, 급성설사 원인균 PCR<br/>
											검사, MTB-Realtime PCR 검사, STI multiplex Real-time PCR 검사, HPV 유전자형<br/>
											Real-time PCR 검사 등-->
											SARS-CoV-2 PCR 검사, MERS-CoV PCR 검사, Zika virus PCR 검사, 폐렴 원인균 및 호흡기바이러스 PCR 검사,
											<i style="font-style:italic;"> Helicobacter pylori</i> (Clarithromycin 내성 포함) 검사, MTB real-time PCR 검사, STI multiplex real-time PCR 검사,
											HPV 유전자형 real-time PCR 검사, Influenza A&B virus PCR 검사, CMV real-time PCR 정량 검사, EBV real-time PCR 정량 검사,
											HBV PCR 정성 및 정량 검사, HCV PCR 정성 및 정량 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/3B_sub01.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3B_sub02.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3B_sub03.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3B_sub04.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3B_sub05.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3B_sub06.png'/>" alt="이미지"/></li>

							</ul>
						</div>

						<div class="check_room room10">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/3C_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>병리검사부</p>
											<span>병리검사 분야에 디지털 및 AI 등 최신기술을 접목시켜 차원 높은 병리검사<br/>
											서비스를 제공하고 있습니다.</span>
											<b> 분자병리 검사(FISH), 면역조직화학염색 검사(PD-L1), 면역조직화학염색 검사<br/>
											(IHC Stain), 동결절편 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/3C_sub01.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3C_sub02.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3C_sub03.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3C_sub04.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3C_sub05.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/3C_sub06.png'/>" alt="이미지"/></li>
							</ul>
						</div>


					</div>
					<!--//tab-3 End-->

					<!--tab5-->
					<div id="tab-5" class="tab-content tab_common">

						<div class="content_inner01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td rowspan="2" class="td_title"><img src="<c:url value='/user/img/check_room2/e_title_20240107.png'/>" class="c_img5" alt="센터이미지"/>
											<b class="center_img_bt5">센터이미지 보기</b></td>
										<td class="td_up">
											<div>
												<p>대전충청검사센터</p>
												<span>진단검사·분자진단·미생물·병리 검사등<br/>
												환자 질병의 진단을 위한 검체 검사 결과를 제공하며,<br/>
												대전충청 지역 최대 규모와 최신 검사장비를 갖춘<br/>
												질병검사 전문의료기관입니다.</span>
											</div>
										</td>
									</tr>

									<tr>
										<td class="td_down">
											<p>센터 소개</p>
											 <ul>
													<li>1. 검체 안정성 확보와 철저한 정도관리를 통해 정확한 검사 결과 제공</li>
													<li>2. 실시간 검체 운송과 검사 시행으로, 보다 빠른 결과 제공</li>
													<li style="letter-spacing:-0.04em;">3. 초기 진단 및 치료를 위해 응급 검사 서비스 제공</li>
													<li>4. 대전·충청 지역의 산학협력으로 지역 의료 발전에 기여</li>
											 </ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room04">
							<p>검사분야</p>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/5A_subsub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>진단검사의학부</p>
											<span>검사실 자동화 시스템(Total Laboratory Automation TLA) 24시간 운영으로<br/>
											신속한 검사결과를 제공합니다.</span>
											<b>[임상화학] 간·신장 기능, 고지혈증, 당뇨, 요화학검사 등</b>
											<b>[면역학] 심혈관질환, 호르몬, 당뇨, 갑상선, 골대사, 바이러스 감염증, 종양표지자,<br/>
											알러지 검사 등</b>
											<b>[혈액학] 일반혈액, 혈액응고, 수혈의학 검사 등</b>
											<b>[요경검학] 일반 소변 및 마약 소변 검사·정액 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/5A_sub0707.jpg'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5A_sub0202.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5A_sub0303.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5A_sub0404.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5A_sub0505.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5A_sub0606.png'/>" alt="이미지"/></li>
							</ul>
						</div>

						<div class="check_room room05">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/5B_subsub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>분자진단검사부</p>
											<span>최첨단 분자생물학적 기술(Real-time PCR · Sequencing 등)을 통해 다양한 감염병<br/>
											원인균과 바이러스에 대한 정보를 제공합니다. 핵산 추출·분주·증폭 전 과정 자동화<br/>
											시스템을 운영하며, 단계별 철저한 공간 구분 관리로 핵산 오염을 방지하여 정확한 검사를 수행합니다.</span>
											<b><!--코로나바이러스감염증-19 분자진단 검사, 폐렴 원인균 및 호흡기바이러스 PCR 검사,<br/>
											Mycoplasma pneumoniae Macrolide 내성 검사, <i style="font-style: italic;">Helicobacter pylori</i><br/> 
											(클라리스로마이신 내성 포함) 검사, 세균성 뇌수막염 PCR 검사, 급성설사 원인균 PCR<br/>
											검사, MTB-Realtime PCR 검사, STI multiplex Real-time PCR 검사, HPV 유전자형<br/>
											Real-time PCR 검사 등-->
											SARS-CoV-2 PCR 검사, 폐렴 원인균, 호흡기바이러스 PCR 검사,<i style="font-style:italic;"> Helicobacter pylori</i> (Clarithromycin 내성 유전자 포함),
											HPV 유전자형 real-time PCR 검사, Influenza A&B virus, 간염 바이러스, 세균·바이러스성 뇌수막염, 급성설사 원인균·바이러스 검출 및
											MP(Marcrolide) 내성검사를 위한 분자진단검사</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/5B_sub0707.jpg'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5B_sub0202.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5B_sub0303.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5B_sub0404.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5B_sub0505.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5B_sub0606.png'/>" alt="이미지"/></li>

							</ul>
						</div>
						
						<div class="check_room room05">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/5C_subsub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>미생물검사부</p>
											<span>감염병 환자의 진단과 치료를 목적으로, 미생물 배양·향균제 감수성 검사를 수행하며<br/>
											자동화 장비와 질량분석기법을 이용한 신속한 균종 동정 결과를 제공합니다.</span>
											<b style="letter-spacing:-0.3px;">일반세균·결핵·진균 등 미생물 배양, 동정 및 향균제 감수성 검사,
											개생충 및 분변 잠혈 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/5C_sub0707.jpg'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5C_sub0202.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5C_sub0303.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5C_sub0404.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5C_sub0505.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5C_sub0606.png'/>" alt="이미지"/></li>

							</ul>
						</div>
						
						<div class="check_room room05" style="margin:60px 0 30px 0;">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/5D_subsub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>병리검사부</p>
											<span>인공지능·디지털 등 최신 기술을 병리 검사 분야에 적용하고 있습니다.<br/>
											또한, Daily consensus conference 및 Monthly QI 등 지속적 질관리와 함께 병원 별 결과판독 병리전문의를
											지정하여, 신뢰할 수 있는 병리 검사 서비스를 제공합니다.</span>
											<b>조직, 세포 및 Special 염색, 동결절편 검사 등</b>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/5D_sub0707.jpg'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5D_sub0202.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5D_sub0404.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5D_sub0505.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5D_sub0606.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/5D_sub0808.jpg'/>" alt="이미지"/></li>

							</ul>
						</div>
						
						<div class="check_ff">
							<img src="<c:url value='/user/img/check_room2/ff_01.jpg'/>" class="ff_img01" alt="이미지"/>
							<p>검사분야</p>
							<img src="<c:url value='/user/img/check_room2/ff_02.jpg'/>" class="ff_img02" alt="이미지"/>
						</div>
						
<%-- 						<div class="check_fp">
							<ul class="left_ul">
								<li>
									<p>01. 검사 자동화</p>
									<span>최신 검사실 자동화(TLA) 시스템 가동</span>
								</li>
								
								<li>
									<p>03. 실시간 검사</p>
									<span>모바일 현장 접수, 실시간 운송, 24시간 검사 수행을 통한 검 체 안정성 확보</span>
								</li>
							</ul>
							
							<ul class="right_ul">
								<li>
									<p>02. 대량 검체 분석</p>
									<span>중부권 최대 규모 분석 역량 보유</span>
								</li>
								
								<li>
									<p>04. 검사 소요 시간(TAT) 단축</p>
									<span>주 · 야간 검사실 운영 및 응급 검사 지원</span>
								</li>
							</ul>
						
							<img src="<c:url value='/user/img/check_room2/fp.png'/>" alt="이미지"/>
						</div> --%>

					</div>
					<!--//tab-5 End-->

					<!--tab4-->
					<div id="tab-6" class="tab-content tab_common">

						<div class="content_inner01">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td rowspan="2" class="td_title"><img src="<c:url value='/user/img/check_room2/D_title.png'/>" class="c_img4" alt="센터이미지"/>
											<b class="center_img_bt4">센터이미지 보기</b></td>
										<td class="td_up">
											<div>
												<p>Seegene Korean Clinical Laboratories (SKL)</p>
												<span>Seegene Korean Clinical Laboratories (SKL)은<br/>
												 2019년 9월 6일 카자흐스탄 알마티에 개원한<br/>
												 (재)씨젠의료재단의 첫 번째 해외 검사센터로, <br/> 
												 분자진단 검사를 비롯한 의료 서비스를 실시합니다.</span>
											</div>
										</td>
									</tr>

									<tr>
										<td class="td_down">
											<p>센터 소개</p>
											 <ul>
													<li>1. 24시간 검사실 운영 및 응급 검사 시스템 구축</li>
													<li>2. 분자진단 검사 분야 Multiplex Real Time PCR 유전자 검사 수행</li>
													<li>3. 교차 오염 방지 위한 양압과 음압의 공조시스템 완벽 구축</li>
													<li>4. ISO 15189와 CAP 인증 등의 추진을 통한 검사 품질 관리</li>
													
											 </ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="check_room room11">
							<p>검사실 안내</p>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/4A_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<span>본원에서 파견된 진단검사 전문 인력이 최신 검사 인프라를 활용해 검체검사<br/>
											서비스를 제공합니다.</span>
											<ul>
											<li>
												<b>진단검사의학실</b> : 혈액학·임상화학·면역학·특수면역학 분야에서 하루 총 10,000건의<br/>
												검사를 처리할 수 있습니다.
											</li>
											
											<li>
												<b>분자진단검사실</b> : 양압 및 음압의 공조시스템을 갖추고, 최신 진단기법인 Real-time<br/>
												PCR 검사법을 이용한 분자진단 검사를 실시합니다.
											</li>
											</ul>
											<small>※ 이미지 출처 : 카자흐스탄 국영TV(QAZAQSTAN) 보도(2019.09.12)</small>
										</td>
									</tr>
								</tbody>
							</table>

							<ul class="check_room_gallery">
								<li><img src="<c:url value='/user/img/check_room2/4A_sub01.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/4A_sub02.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/4A_sub03.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/4A_sub04.png'/>" alt="이미지"/></li>
								<li><img src="<c:url value='/user/img/check_room2/4A_sub05.png'/>" alt="이미지"/></li>
							</ul>
						</div>

						<div class="check_room room12">
							<p>주요실적</p>
							<ul>
								<li class="room12_li">1. 카자흐스탄 민간의료기관 최초로 WHO 기준 BSL 3등급 시설인가 및 정부 지정 코로나19 검사기관으로 정식 승인</li>
								<li class="room12_li">2. 카자흐스탄의 감염병 확산 방지를 위해 코로나19 분자진단 검사 실시</li>
							</ul>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room2/4B_sub.png'/>" alt="검사실이미지"/></th>
										<td>
											<p>코로나19 분자진단 검사 </p>
											<span>SKL 검사센터는 카자흐스탄의 코로나바이러스감염증-19(COVID-19) 확산을<br/>
											방지 하기 위해 분자진단 검사와 신속한 결과 보고를 통해 국가방역체계에<br/>
											중요한 역할을 하며 국가적 위기 사태 종식에 기여하고 있습니다.</span>
											<small>※ 이미지 출처 : 카자흐스탄 알마티TV 보도(2020.03.31)</small>

											<ul>
												<li><img src="<c:url value='/user/img/check_room2/4B_sub01.png'/>" alt="SKL이미지"/>
												</li>

												<li><img src="<c:url value='/user/img/check_room2/4B_sub02.png'/>" alt="SKL이미지"/>
												</li>

												<li><img src="<c:url value='/user/img/check_room2/4B_sub03.png'/>" alt="SKL이미지"/>
												</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>

						</div>


					</div>
					<!--//tab-4 End-->
						
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
	
		<!--부산팝업-->
<div id="modal_p1" class="modal">
<div id="popup">
	<div class="popup_title">
		<span id="paper_name">부산경남검사센터</span>
		<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
	</div>

	<div class="popup_inner">
		<!-- banner_slide-->
									<div class="slide1">

										<ul class="panel1">
											<li class="banner1 on"></li>
											<li class="banner2"></li>
											<li class="banner3"></li>
											<li class="banner4"></li>
											<li class="banner5"></li>
											<li class="banner6"></li>
											<li class="banner7"></li>
											<li class="banner8"></li>
											<li class="banner9"></li>
											<li class="banner10"></li>
											<li class="banner11"></li>
											<li class="banner12"></li>
											<li class="banner13"></li>
											<li class="banner14"></li>
											<li class="banner15"></li>
											<li class="banner16"></li>
											<li class="banner17"></li>
											<li class="banner18"></li>
											<li class="banner19"></li>
											<li class="banner20"></li>
											<li class="banner21"></li>
											<li class="banner22"></li>
											<li class="banner23"></li>
											<li class="banner24"></li>
											<li class="banner25"></li>
											<li class="banner26"></li>
											<li class="banner27"></li>
											<li class="banner28"></li>
											<li class="banner29"></li>
											<li class="banner30"></li>
											<li class="banner31"></li>
											<li class="banner32"></li>
											<li class="banner33"></li>
											<li class="banner34"></li>
										</ul>

										<ul class="dot1">
											<li class="on thum1"></li>
											<li class="thum2"></li>
											<li class="thum3"></li>
											<li class="thum4"></li>
											<li class="thum5"></li>
											<li class="thum6"></li>
											<li class="thum7"></li>
											<li class="thum8"></li> 
											<li class="thum9"></li>
											<li class="thum10"></li>
											<li class="thum11"></li>
											<li class="thum12"></li>
											<li class="thum13"></li>
											<li class="thum14"></li>
											<li class="thum15"></li>
											<li class="thum16"></li>
											<li class="thum17"></li>
											<li class="thum18"></li>
											<li class="thum19"></li>
											<li class="thum20"></li>
											<li class="thum21"></li>
											<li class="thum22"></li>
											<li class="thum23"></li>
											<li class="thum24"></li>
											<li class="thum25"></li>
											<li class="thum26"></li>
											<li class="thum27"></li>

										</ul>

										<div class="arrow_area">
											<div class="next1"></div>
											<div class="prev1"></div>

										</div>

									</div><!--banner_slide End-->
	</div>

</div>

<div class="popup_bg"></div>

</div>
<!--//popup End--------------------------------------------------------------------------------------------->

		<!--대구팝업-->
<div id="modal_p2" class="modal">
<div id="popup">
	<div class="popup_title">
		<span id="paper_name">대구경북검사센터</span>
		<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
	</div>

	<div class="popup_inner">
		<!-- banner_slide-->
									<div class="slide2">

										<ul class="panel2">
											<li class="banner1 on"></li>
											<li class="banner2"></li>
											<li class="banner3"></li>
											<li class="banner4"></li>
											<li class="banner5"></li>
											<li class="banner6"></li>
											<li class="banner7"></li>
											<li class="banner8"></li>
											<li class="banner9"></li>
											<li class="banner10"></li>
											<li class="banner11"></li>
											<li class="banner12"></li>
											<li class="banner13"></li>
											<li class="banner14"></li>
											<li class="banner15"></li>
											<li class="banner16"></li>
											<li class="banner17"></li>
											<li class="banner18"></li>
											<li class="banner19"></li>
											<li class="banner20"></li>
											<li class="banner21"></li>
											<li class="banner22"></li>
											<li class="banner23"></li>
											<li class="banner24"></li>
											<li class="banner25"></li>
											<li class="banner26"></li>
											<li class="banner27"></li>
											<li class="banner28"></li>
											<li class="banner29"></li>
											<li class="banner30"></li>
											<li class="banner31"></li>
											<li class="banner32"></li>
											<li class="banner33"></li>
											<li class="banner34"></li>
											<li class="banner35"></li>
											<li class="banner36"></li>
											<li class="banner37"></li>
											<li class="banner38"></li>
											<li class="banner39"></li>
											<li class="banner40"></li>
										</ul>

										<ul class="dot2">
											<li class="on thum1"></li>
											<li class="thum2"></li>
											<li class="thum3"></li>
											<li class="thum4"></li>
											<li class="thum5"></li>
											<li class="thum6"></li>
											<li class="thum7"></li>
											<li class="thum8"></li>
											<li class="thum9"></li>
											<li class="thum10"></li>
											<li class="thum11"></li>
											<li class="thum12"></li>
											<li class="thum13"></li>
											<li class="thum14"></li>
											<li class="thum15"></li>
											<li class="thum16"></li>
											<li class="thum17"></li>
											<li class="thum18"></li>
											<li class="thum19"></li>
											<li class="thum20"></li>
											<li class="thum21"></li>
											<li class="thum22"></li>
											<li class="thum23"></li>
											<li class="thum24"></li>
											<li class="thum25"></li>
											<li class="thum26"></li>
											<li class="thum27"></li>
											<li class="thum28"></li>
											<li class="thum29"></li>
											<li class="thum30"></li>
											<li class="thum31"></li>
											<li class="thum32"></li>
											<li class="thum33"></li>
											<li class="thum34"></li>

										</ul>

										<div class="arrow_area">
											<div class="next2"></div>
											<div class="prev2"></div>

										</div>

									</div><!--banner_slide End-->
	</div>

</div>

<div class="popup_bg"></div>

</div>
<!--//popup End--------------------------------------------------------------------------------------------->

		<!--대전팝업-->
<div id="modal_p5" class="modal">
<div id="popup">
	<div class="popup_title">
		<span id="paper_name">대전충청검사센터</span>
		<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
	</div>

	<div class="popup_inner">
		<!-- banner_slide-->
									<div class="slide5">

										<ul class="panel5">
											<li class="banner1 on"></li>
											<li class="banner2"></li>
											<li class="banner3"></li>
											<li class="banner4"></li>
											<li class="banner5"></li>
											<li class="banner6"></li>
											<li class="banner7"></li>
											<li class="banner8"></li>
											<li class="banner9"></li>
											<li class="banner10"></li>
											<li class="banner11"></li>
											<li class="banner12"></li>
											<li class="banner13"></li>
											<li class="banner14"></li>
											<li class="banner15"></li>
											<li class="banner16"></li>
											<li class="banner17"></li>
											<li class="banner18"></li>
											<li class="banner19"></li>
											<li class="banner20"></li>
											<li class="banner22"></li>
											<li class="banner23"></li>
											<li class="banner24"></li>
											<li class="banner25"></li>
											<li class="banner26"></li>
											<li class="banner27"></li>
											<li class="banner28"></li>
										</ul>

										<ul class="dot5">
											<li class="on thum1"></li>
											<li class="thum2"></li>
											<li class="thum3"></li>
											<li class="thum4"></li>
											<li class="thum5"></li>
											<li class="thum6"></li>
											<li class="thum7"></li>
											<li class="thum8"></li>
											<li class="thum9"></li>
											<li class="thum10"></li>
											<li class="thum11"></li>
											<li class="thum12"></li>
											<li class="thum13"></li>
											<li class="thum14"></li>
											<li class="thum15"></li>
											<li class="thum16"></li>
											<li class="thum17"></li>
											<li class="thum18"></li>
											<li class="thum19"></li>
											<li class="thum20"></li>
											<li class="thum22"></li>
											<li class="thum23"></li>
											<li class="thum24"></li>
											<li class="thum25"></li>
											<li class="thum26"></li>
											<li class="thum27"></li>
											<li class="thum28"></li>
										</ul>

										<div class="arrow_area">
											<div class="next5"></div>
											<div class="prev5"></div>

										</div>

									</div><!--banner_slide End-->
	</div>

</div>

<div class="popup_bg"></div>

</div>
<!--//popup End--------------------------------------------------------------------------------------------->

		<!--광주팝업-->
<div id="modal_p3" class="modal">
<div id="popup">
	<div class="popup_title">
		<span id="paper_name">광주호남검사센터</span>
		<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
	</div>

	<div class="popup_inner">
		<!-- banner_slide-->
									<div class="slide3">

										<ul class="panel3">
											<li class="banner1 on"></li>
											<li class="banner2"></li>
											<li class="banner3"></li>
											<li class="banner4"></li>
											<li class="banner5"></li>
											<li class="banner6"></li>
											<li class="banner7"></li>
											<li class="banner8"></li>
											<li class="banner9"></li>
											<li class="banner10"></li>
											<li class="banner11"></li>
											<li class="banner12"></li>
											<li class="banner13"></li>
											<li class="banner14"></li>
											<li class="banner15"></li>
											<li class="banner16"></li>
											<li class="banner17"></li>
											<li class="banner18"></li>
											<li class="banner19"></li>
											<li class="banner20"></li>
											<li class="banner21"></li>
											<li class="banner22"></li>
											<li class="banner23"></li>
											<li class="banner24"></li>
										</ul>

										<ul class="dot3">
											<li class="on thum1"></li>
											<li class="thum2"></li>
											<li class="thum3"></li>
											<li class="thum4"></li>
											<li class="thum5"></li>
											<li class="thum6"></li>
											<li class="thum7"></li>
											<li class="thum8"></li>
											<li class="thum9"></li>
											<li class="thum10"></li>
											<li class="thum11"></li>
											<li class="thum12"></li>
											<li class="thum13"></li>
											<li class="thum14"></li>
											<li class="thum15"></li>
											<li class="thum16"></li>
											<li class="thum17"></li>
											<li class="thum18"></li>

										</ul>

										<div class="arrow_area">
											<div class="next3"></div>
											<div class="prev3"></div>

										</div>

									</div><!--banner_slide End-->
	</div>

</div>

<div class="popup_bg"></div>

</div>
<!--//popup End--------------------------------------------------------------------------------------------->

<!--부산팝업-->
<div id="modal_p4" class="modal">
<div id="popup">
	<div class="popup_title">
		<span id="paper_name">Seegene Korean Clinical Laboratories (SKL)</span>
		<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>
	</div>

	<div class="popup_inner">
		<!-- banner_slide-->
									<div class="slide4">

										<ul class="panel4">
											<li class="banner1 on"></li>
											<li class="banner2"></li>
											<li class="banner3"></li>
											<li class="banner4"></li>
											<li class="banner5"></li>
											<li class="banner6"></li>
											<li class="banner7"></li>
											<li class="banner8"></li>
											<li class="banner9"></li>
											<li class="banner10"></li>
											<li class="banner11"></li>
											<li class="banner12"></li>
											<li class="banner13"></li>
											<li class="banner14"></li>
											<li class="banner15"></li>
											<li class="banner16"></li>
											<li class="banner17"></li>
											<li class="banner18"></li>
											<li class="banner19"></li>
											<li class="banner20"></li>
											<li class="banner21"></li>
											<li class="banner22"></li>
											<li class="banner23"></li>
											<li class="banner24"></li>
											<li class="banner25"></li>
											<li class="banner26"></li>
											<li class="banner27"></li>
											<li class="banner28"></li>
											<li class="banner29"></li>
											<li class="banner30"></li>					
										</ul>

										<ul class="dot4">
											<li class="on thum1"></li>
											<li class="thum2"></li>
											<li class="thum3"></li>
											<li class="thum4"></li>
											<li class="thum5"></li>
											<li class="thum6"></li>
											<li class="thum7"></li>
											<li class="thum8"></li>
											<li class="thum9"></li>
											<li class="thum10"></li>
											<li class="thum11"></li>
											<li class="thum12"></li>
											<li class="thum13"></li>
											<li class="thum14"></li>
											<li class="thum15"></li>
											<li class="thum16"></li>
											<li class="thum17"></li>
											<li class="thum18"></li>
											<li class="thum19"></li>
											<li class="thum20"></li>
											<li class="thum21"></li>
											<li class="thum22"></li>
											<li class="thum23"></li>
											<li class="thum24"></li>
											<li class="thum25"></li>
											<li class="thum26"></li>
											<li class="thum27"></li>
											<li class="thum28"></li>
											<li class="thum29"></li>
											<li class="thum30"></li>
										</ul>

										<div class="arrow_area">
											<div class="next4"></div>
											<div class="prev4"></div>

										</div>

									</div><!--banner_slide End-->
	</div>

</div>

<div class="popup_bg"></div>

</div>
<!--//popup End--------------------------------------------------------------------------------------------->
	
	
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
	
		
		
		$(document).ready(function(){

			$(".tab-link").click(function(){
				
				$(".tab-link").removeClass('current');
				$(this).addClass('current');
				var view = $(this).data('view');
				$(".tab-content").removeClass('current');
				$(".tab-content").hide();
				$("#tab-"+view).show();
				$("#tab-"+view).addClass('current');
			});
			
// 			$("#tab-1").show();
			
			checkHash();
		});
	
	</script>
</body>
</html>
