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
	<link href="<c:url value='/user/css/03_sub03.css'/>" type="text/css" rel="stylesheet"/>
	
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
						<ul class="tabs">
							<li class="tab-link current no_bottom _tab_1" data-tab="tab-1" data-link="1">진단혈액검사</li>
							<li class="tab-link no_bottom _tab_2" data-tab="tab-2" data-link="2">선천성대사이상검사</li>
							<li class="tab-link no_bottom _tab_3" data-tab="tab-3" data-link="3">선천성기형아검사</li>
							<li class="tab-link no_bottom _tab_4" data-tab="tab-4" data-link="4">세포유전학검사</li>
							<li class="tab-link no_bottom _tab_5" data-tab="tab-5" data-link="5">분자진단검사</li>
							<li class="tab-link _tab_6" data-tab="tab-6" data-link="6">진단미생물검사</li>
							<li class="tab-link _tab_7" data-tab="tab-7" data-link="7">바이러스배양검사</li>
							<li class="tab-link _tab_8" data-tab="tab-8" data-link="8">세포병리검사</li>
							<li class="tab-link _tab_9" data-tab="tab-9" data-link="9">조직&면역병리검사</li>
							<li></li>
						</ul>
						
						<!--tab menu01-->
						<div id="tab-1" class="tab-content current">

							<div class="inner_content">

								<h1>진단혈액검사</h1>
								<p>일반혈액검사(CBC)</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>혈액 3mL을 채취하여 즉시 8~10회 부드럽게 EDTA 혈액을 전도혼합해야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>항응고제(EDTA)와 혈액량의 비율이 적합하지 않거나, 혼합이 불충분할 경우 clot 및 dilution(과다 항응고제에 의한 혈구수와
											hematocrit의 수치 및 cell morphology와 </br>염색에 영향)이 생겨 결과의 오차가 발생할 수 있습니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">

								<p>혈액도말표본검사</p>

								<b>말초혈액을 도말하여 각 혈구의 수, 형태 이상여부를 검사하여 빈혈, 백혈병 등의 여러 혈액질환을 진단합니다.</b>
								<img src="<c:url value='/user/img/sub/03sub_img02.jpg'/>" alt="혈액도말표본검사이미지" />

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>2장의 깨끗한 Slide glass를 준비합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>하나의 Slide glass를 왼손의 엄지와 중지 사이에 들고 우측 상단에서 1.5cm 정도 떨어진 곳에 혈액 한방울을 올려놓습니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>Spreader glass(미는 Slide glass)를 오른손의 엄지와 중지 사이에 잡습니다.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>Slide glass에 올려놓은 혈액 방울이 Spreader glass 뒷면에 닿게 하여 혈액이 균일하게 퍼지게 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>Spreader slide와 Slide glass 사이의 각을 약 30~40도로 유지하며 Slide glass를 지탱하고 있는 왼손 엄지를 향하여 Spreader slide를 일정 속도로 밀어줍니다.</br>
			     						미는 속도가 느리면 도말이 얇게 되고 빠르면 두껍게 됩니다. 너무 얇게 도말 되면 백혈구는 도말 끝부분으로 이동하는 경향이 있으므로 주의해야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">6)</td>
											<td>도말한 Slide는 공기 중에 건조시키고 오염되지 않도록 주의합니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content3">

								<p>혈액응고검사 : <span>citrate 혈액</span></p>

								<b>Citrate는 칼슘을 제거하여 항응고 작용을 나타내므로 응고인자들이 들어있기 때문에 PT(prothrombin time) 및
								 aPTT(activated partial thromboplastin time) 등 혈액응고검사(coagulation test)에 쓰입니다.</b>

								 <table>
									 <tbody>

										 <tr>
											 <td class="n_td">1)</td>
											 <td>혈액응고 검사는 sodium citrate tube에 채혈 된 혈액을 사용하며, 19~21 게이지 바늘 (소아는 23게이지 나비바늘)을 사용하여 venipuncture에 의하여 또는 indwelling catheter로부터 검체를
			      						채취합니다. 만약 Vacutainer가 사용된다면 두번째 용기를 coagulation 검체로 이용하여야 합니다.</td>
										 </tr>

										 <tr>
											 <td class="n_td">2)</td>
											 <td>항응고제는 3.2% sodium citrate를 사용하며 검체와 항응고제의 비율은 9:1 (10.9-1.9mMol/L)이고, 채혈량은 sodium citrate tube에 표시되어 있습니다. 채혈량을 정확히 지켜주십시오.
			      						비율이 정확하지 않을 경우 검사결과가 달라질 수 있습니다.</td>
										 </tr>

										 <tr>
											 <td class="n_td">3)</td>
											 <td>채혈한 후 즉시 3~4회 혼합해주어야 합니다. 신속히 잘 혼합하지 않으면 혈액의 일부분에서 응고가 발생하여 미세한 응고덩어리(microclot)가 생기고 그만큼 응고인자가 감소되어 검사결과에 오류를
			     						초래할 수 있습니다.</td>
										 </tr>

										 <tr>
											 <td class="n_td">4)</td>
											 <td>채취된 검체는 4시간 안에 검사가 이루어져야 하며 그렇지 못할 경우 냉장(2~6℃), 2,500g에서 15분간 원심 분리 후 platelet-poor plasma를 분리하여 냉동 보관합니다.</td>
										 </tr>

									 </tbody>
								 </table>

							</div>

							<div class="inner_content4">

								<p>혈액응고 검사용 검체 채취 : <span>Indwelling catheter를 통한 채혈</span></p>

								<b>Indwelling catheter를 통해 채혈할 때에는 heparin에 의한 오염을 고려하여 생리식염수 5mL로 씻어(flushing) 낸 후 처음 혈액 5mL(혹은 line volume의 6배)는 버리고, 그 이후의 혈액을 응고 검사용으로
								이용합니다. Normal saline lock(capped off venous port)에서는 dead volume의 2배만큼 버려야 합니다. 만약 예상치 못한 혈액응고 검사 결과가 나오면 새로이 채혈하여 검사 하거나 resin을 이용하여
								heparin을 제거 후 다시 검사합니다.</b>

								<p class="red_table_title">※ 항응고제(anticoagulant)에 따른 검사 종류</p>
								<table>
									<tbody>

										<tr>
											<th>항응고제</th>
											<th>작용기전</th>
											<th class="no_right">Monitor 검사</th>
										</tr>

										<tr>
											<td>와파린(Coumadin)</td>
											<td class="table_left">- 비타민K 관련 인자 억제 : Factor II, VII, IX, X<br/>
											- 반감기 40시간</td>
											<td class="no_right">PT</td>
										</tr>

										<tr>
											<td>헤파린<br/>(Unfractionated heparin UFH)</td>
											<td class="table_left">- Factor X 의 차단<br/>
											- 출혈 합병시 황산프로타민 투여</td>
											<td class="no_right">aPTT, ACT, TT, Anti-factor Xa</td>
										</tr>

										<tr>
											<td>저분자량헤파린<br/>(Low Molecular Weight<br/> Heparin LMWH)</td>
											<td class="table_left">- Dalteparin, enxaparin 등</br>
											- 신장으로 배설되므로 신부전시에는 주의해야함</br>
											- 반감기가 길어서 하루에 1~2회 피하주사로 투여</br>
											- 황산프로타민에 의해 부분적으로 억제된다.</br>
											- 헤파린보다 Xa 길항 효과가 더 뛰어나다.</br>
											- 출혈성 부작용이 더 적다.</br>
											- 용량-반응 관계가 예측 가능</td>
											<td class="no_right">Anti-factor Xa, aPTT 검사 불필요</td>
										</tr>

										<tr>
											<td>아스피린(Aspirin)</td>
											<td class="table_left">- 혈소판 기능을 불활성화 시킴</br>
											- 수술 전 일주일동안 복용 중단</br>
											- Desmopressin (DDAVP)가 출혈 시간을 정상화 시킬 수 있음</td>
											<td class="no_right">Platelet drug response assay</td>
										</tr>

									</tbody>
								</table>

							</div>

						</div>
						<!--//tab menu01 End-->

						<!--tab menu02-->
						<div id="tab-2" class="tab-content">

							<div class="inner_content">

								<h1>선천성대사이상검사</h1>
								<p>채취시기</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>선천성대사이상검사는 생후 48~72시간에 하는 것이 가장 적합합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>위중한 환아의 경우 즉시 채취하여 검사하고, 2주 후 재채혈하여 재검합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>수혈을 해야 하는 경우 수혈받기 전 검체가 필요합니다. 불가능한 경우 생후 24~48시간에 채취하여 최종 수혈 후 14일째의 검체를 재채취합니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">
								<p>채혈방법</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>란셋으로 신생아 발꿈치의 외측부를 찔러 혈액을 흐르게 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>처음 나온 혈액 한 방울은 거즈로 닦아내고 혈액이 커다란 방울이 되게 한 후 채혈지에 있는 4개의 원 안에 떨어뜨려 뒷면까지 충분히 흡수 되도록 채취합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>발뒤꿈치를 너무 심하게 눌러서 혈액을 채취하면 조직액으로 인해 비정상적인 검사소견을 보일 수가 있으므로 주의합니다.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>채취 시 손에 묻은 요오드, 알코올, 패트로늄 젤리, 대변, 소변, 핸드로션은 검사의 결과에 영향을 미칠 수 있으니 주의합니다.</td>
										</tr>

									</tbody>
								</table>

								<img src="<c:url value='/user/img/sub/03sub_img03.jpg'/>" style="max-width: 1080px;" alt="이미지"/>

							</div>

							<div class="inner_content3">
								<p>혈액여지 취급법</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>채혈 후 평평한 냉암소에서 3~4시간 완전히 건조시킵니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>신생아의 출생일자, 성별, 채혈일자, 수유상태 등 특이사항을 반드시 기재합니다.</td>
										</tr>

									</tbody>
								</table>

								<small>- 열이나 습기, 직사광선에 직접 노출되지 않도록 합니다.</small><br/>
								<small>- 채취된 여지가 겹쳐져서 혈액이 다른 곳에 접촉되지 않도록 주의합니다.</small><br/>
								<small>- 채취된 여지에 우유나 아스팔탐이 들어있는 음료수가 오염되는 경우 심각한 대사질환으로 오판될 수 있으므로 주의합니다.</small>
							</div>

							<div class="inner_content4">
								<p>올바른 채혈</p>
								<table>
									<colgroup>
										<col width="25%"/>
										<col width="75%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검체 예</th>
											<th>채혈 시 주의 사항</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><img src="<c:url value='/user/img/sub/03sub_img04.png'/>" alt="채혈이미지"/></td>
											<td class="n_td">- 천자 후 혈액의 큰 방울이 형성되면 채혈지의 앞면에 묻혀 뒷면까지 충분히 스며들도록 해주세요.<br/>
											- 같은 방법으로 4개의 원을 완전히 채워주세요.</td>
										</tr>

									</tbody>
								</table>

								<p>부적합 채혈</p>
								<table>
									<colgroup>
										<col width="25%"/>
										<col width="75%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검체 예</th>
											<th>채혈 시 주의 사항</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img05.png'/>" style="max-width: 200px;" alt="채혈이미지" />
												<p>[혈액량이 부족한 경우]</p>
											</td>
											<td class="n_td">- 천자 후 혈액의 큰 방울이 형성되기 전에 소량을 자주 채혈지에 묻히지 말아주세요.<br/>
											- 혈액이 원내에 충분히 흡수되기 전, 뒷면까지 흡수되기 전에 채혈을 끝내지 마세요.</td>
										</tr>

										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img06.png'/>" style="max-width: 200px;" alt="채혈이미지"/>
												<p>[긁히거나 마모된 경우]</p>
										</td>
											<td class="n_td">- Capillary tube 혹은 기타 기구를 이용해서 채혈지에 혈액을 흡수시키지 않도록 유의해 주세요. </td>
										</tr>

										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img07.png'/>" style="max-width: 200px;" alt="채혈이미지" />
												<p>[충분히 건조되지 않은 경우]</p>
											</td>
											<td class="n_td">- 음지에서 최소한 4시간 이상 건조시켜주세요.<br/>
											- 건조되기 전에 채혈지를 겹쳐 놓지 마세요. </td>
										</tr>

										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img08.png'/>" style="max-width: 200px;" alt="채혈이미지" />
												<p>[희석, 변색, 오염된 경우]</p></td>
											<td class="n_td">- 혈액 채취 부위를 과도하게 압박하지 말아주세요.<br/>
											- 장갑을 끼고 채혈하세요.<br/>
											- 맨손, 또는 알콜, 용액, 살균제, 핸드로션, 파우더 등을 바르고 채혈할 경우 채혈지원 부위가 오염될 수 있습니다.<br/>
											- 채혈지에 직사광선이나 열을 피해주세요.</td>
										</tr>

										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img09.png'/>" style="max-width: 200px;" alt="채혈이미지" />
												<p>[혈청고리를 보일 경우]</p>
											</td>
											<td class="n_td">- 동일한 원에 혈액을 반복해서 묻히지 말아주세요.<br/>
											- 채혈한 용지가 용액 등 이물질로 오염되지 않도록 주의해주세요.</td>
										</tr>

										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img10.png'/>" style="max-width: 200px;" alt="채혈이미지"/>
												<p>[응고 혹은 층이진 경우]</p>
											</td>
											<td class="n_td">- 채혈지의 동일한 원에 혈액을 반복해서 묻히지 말아주세요.<br/>
											- 채혈지 양면에 혈액을 묻히지 말아주세요.<br/>
											- 채혈기구를 이용하여 채혈지에 묻히지 말아주세요. </td>
										</tr>

										<tr>
											<td>
												<img src="<c:url value='/user/img/sub/03sub_img11.png'/>" style="max-width: 200px;" alt="채혈이미지" />
												<p>[과도하게 스며든 경우]</p>
											</td>
											<td class="n_td">- 기구를 사용해서 과도한 양의 혈액을 채혈지에 묻히지 않도록 주의해 주세요.<br/>
											- 채혈지 양면에 혈액을 묻히지 말아주세요. </td>
										</tr>

									</tbody>
								</table>

							</div>

						</div>
						<!--//tab menu02 End-->

						<!--tab menu03-->
						<div id="tab-3" class="tab-content">
							<div class="inner_content">
								<h1>선천성기형아검사</h1>
								<p>준수사항</p>
								<span class="warning_text">※ 선천성기형아 검사의뢰서의 다음 기재사항은 반드시 작성하여 주십시오.</span>

									<div class="baby_inner01">
										<table>
											<tr>
												<td class="paper_bg"><img src="<c:url value='/user/img/inner/s_04.png'/>" alt="종이"/></td>
												<td>
													<ul>
														<li>실제 생년월일</li>
														<li>체중</li>
														<li>임신 주수 (LMP : 최종 월경일, BPD : 초음파)</li>
														<li>NT (nuchal translucency) 임신초기 검사인 경우</li>
														<li>과거력 (Down, NTD 출산아 경험, 인슐린의존성당뇨 등)</li>
														<li>태아 수</li>
														<li>흡연 유무</li>
														<li>재검의뢰 시 1차 결과, 기타소견 등</li>
													</ul>
												</td>
											</tr>
										</table>
									</div>

							</div>

							<div class="inner_content2">
								<p>통합적분석검사의 2가지의 분석 방법</p>
									<div class="baby_inner02">
										<img src="<c:url value='/user/img/sub/03sub_img13.jpg'/>" alt="이미지"/>
									</div>
							</div>

							<div class="inner_content3">
								<p>NIFTY검사 채취방법</p>
									<table>
										<tbody>
											<tr>
												<td class="n_td">1)</td>
												<td>전용용기에 6mL이상 채혈합니다.</td>
											</tr>

											<tr>
												<td class="n_td">2)</td>
												<td>8~10회 혼합하여 항응고제와 혈액을 충분히 혼합하되 거품이 생기지 않도록 주의합니다.</td>
											</tr>

											<tr>
												<td class="n_td">3)</td>
												<td>검체 채취 후 원심분리 없이 실온보관합니다.</td>
											</tr>

											<tr>
												<td class="n_td">4)</td>
												<td>검사의뢰서, 동의서(이름은 국문과 영문으로 작성), 유전자검사동의서, 보험위임장을 작성합니다.</td>
											</tr>

										</tbody>
									</table>

							</div>

							<div class="inner_content4">
								<p>임신 주수 별 검사종류</p>
									<table>
										<colgroup>
											<col width="20%"/>
											<col width="40%"/>
											<col width="40%"/>
										</colgroup>
										<tbody>
											<tr>
												<th>임신초기(10~13주)</th>
												<td>First double marker</td>
												<td>PAPP-A, hCG, NT</td>
											</tr>

											<tr>
												<th rowspan="2">임신중기(14~22주)</th>
												<td>Triple test</td>
												<td>AFP, hCG, uE3</td>
											</tr>

											<tr>
												<td>Quad test</td>
												<td>AFP, hCG, uE3, Inhibin-A</td>
											</tr>

											<tr>
												<th rowspan="2">임신초기+임신중기</th>
												<td>Integrated test</td>
												<td>임신초기 (PAPP-A, NT)<br/>
												임신중기 (AFP, hCG, uE3, Inhibin-A)</td>
											</tr>

											<tr>
												<td>Sequential test</td>
												<td>임신초기 (PAPP-A, hCG, NT)<br/>
												임신중기 (AFP, hCG, uE3, Inhibin-A)</td>
											</tr>

											<tr>
												<th>임신(10주~24주)</th>
												<td>NIFTY</td>
												<td>Fetal DNA</td>
											</tr>

										</tbody>
									</table>
							</div>
						</div>
						<!--//tab menu03 End-->

						<!--tab menu04-->
						<div id="tab-4" class="tab-content">

<!-- 							<div class="sub_summury01"> -->
<!-- 								<div class="sub_summury01_inner"> -->
<!-- 									<h1>세포유전학검사</h1> -->
<!-- 								</div> -->

<!-- 								<div class="sub_summury01_inner2"> -->
<!-- 									<ul style="width:720px;"> -->
<!-- 										<li><b>1.</b>검체는 무균적으로 채취해야 합니다.</li> -->
<!-- 										<li><b>2.</b>세포유전의뢰서 및 유전자검사동의서에 임상소견/의뢰목적 등의 임상정보를 기재해야 합니다.</li> -->
<!-- 										<li><b>3.</b>검체 채취부터 배양까지 24시간 이상이지연될 경우, 검사결과보고가 지연되거나<br/> 간혹 검사에 실패할 수도 있습니다.</li> -->
<!-- 										<li><b>4.</b>태아의 염색체 검사는 검체 채취 전에 검사읮 어확성 및 검사 한계에 대해 환자나 보호자에게<br/> 충분히 설명하여 동의를 얻은 후 검사를 시행하는 것이 바람직합니다.  </li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

							<div class="inner_content">
								<h1>세포유전학검사</h1>
								<div class="sub_summury01_inner2">
									<ul>
										<li><b>1.</b>검체는 무균적으로 채취해야 합니다.</li>
										<li><b>2.</b>세포유전의뢰서 및 유전자검사동의서에 임상소견/의뢰목적 등의 임상정보를 기재해야 합니다.</li>
										<li><b>3.</b>검체 채취부터 배양까지 24시간 이상이 지연될 경우, 검사결과 보고가 지연되거나  간혹 검사에 실패할 수도 있습니다.</li>
										<li><b>4.</b>태아의 염색체 검사는 검체 채취 전에 검사의 정확성 및 검사 한계에 대해 환자나 보호자에게 충분히 설명을 하여 동의를 얻은 후에 검사를 시행하는 것이 바람직합니다.  </li>
									</ul>
								</div>
								
								<p>말초혈액</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>Sodium heparin 용기에 혈액 5.0mL(소아 3.0mL)을 오염에 주의하여 채취합니다. 응고된 검체는 검사가 불가능하며, <br/>sodium heparin 이외의 항 응고제는 세포분열능 저하로 인하여 배양 실패 확률이 높습니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>환자의 임상소견 및 추정 진단에 따라 검사방법 자체가 달라지므로, 반드시 의뢰서에 소견 및 진단명을 기재합니다.  </td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>검체 채취부터 배양까지 24시간 이내에 진행될 수 있도록 운송합니다. <br/>(24시간 이내의 경우 세포분열능이 좋아 검사 소요일 내 보고율이 높으며, 24시간 이상일 경우 냉장 보관합니다.)</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>검체 보관 및 운송을 실온 상태로 유지합니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">

								<p>골수</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>혈액 종양질환에서는 세포 배양 시 혈액 검사 결과를 고려해서 적절한 세포 수를 배양해야 하므로 CBC 결과를 기재하거나 첨부하여 보내주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>다른 사항은 말초혈액 검체의 준수사항과 동일하므로 위 내용을 참조하시기 바랍니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content3">

								<p>태아조직</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
									
											<td>태아 조직의 경우 오염될 확률이 매우 높아 주의가 필요합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>무균적으로 채취한 조직을 본원에서 제공하는 전용 운송용 배지에 넣어 의뢰합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>자궁 내에서 사망한지 24시간 이상이 경과된 경우 배양에 실패할 확률이 높습니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content4">

								<p>양수</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>검체에 모체 세포가 혼입되는 것을 방치하기 위해 채취 시 처음의 소량(약 2mL 정도)은 반드시 버린 다음 <br/>약 20~30mL 정도의 양수를 채취하여 conical tube(50mL)로 옮겨 의뢰합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>임신 <span>15주~20주 사이에</span> 검사하는 것이 좋으며 오염에 주의하여 24시간 이내에 도착하는 것을 원칙으로 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>양수 내 태아 유래 세포가 적은 경우(원심 후 침전물이 육안으로 확인이 안 됨)와 육안적으로 검체의 색깔이 붉거나(혈액이 혼입되었음을 의미)<br/>짙은 갈색인 경우는 배양에 실패할 수도 있습니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content5">

								<p>융모막</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>융모막 20~40mg을 채취하여 본원에서 제공하는 융모막 전용 운송용 배지에 넣어 의뢰합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>Zoom-stereo microscope로 관찰하여 순수한 융모막으로 검사를 시행하며, 양이 적을 경우에는 <span>Direct method(직접법)</span>와 <span>Long term method(배양법)</span>을 <br/>병행할 수 없고, 단지 <span>Long term method</span> 만을
								      시행하기 때문에 모체 세포의 오염 가능성이 높아지고 결과가 지연되거나 혹은 배양에 실패할 수도 있습니다. </td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content6">

								<p>제대혈</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>제대혈 검체는 응고가 잘되므로 채취 후 즉시 여러 번 혼합하여 의뢰합니다. </td>
										</tr>

									</tbody>
								</table>

							</div>

						</div>
						<!--//tab menu04 End-->

						<!--tab menu05-->
						<div id="tab-5" class="tab-content">
							<div class="inner_content">

								<h1>분자진단검사</h1>
								<p>유의사항</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>분자진단 검사에서 가장 중요한 것은 적절한 검체와 오염의 방지입니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>감염질환 검사를 위한 검체는 채취 즉시 검사실로 보내주십시오. 만약 시간이 지연될 경우 검체는 아래와 같이 보관합니다.</td>
										</tr>

									</tbody>
								</table>

								<small>- 요, 객담, 호흡기 검체, 변, bacteria, virus 검사를 위한 검체는 ‘냉장보관’하여 정상 균무리의 증식을 막아야 합니다.</small><br/>
								<small>- 뇌척수액, 체액, 혈액 및 임균을 위한 검체는 ‘실온 보관’ 합니다.</small><br/>
								<small class="orange_small">&nbsp;&nbsp;(단, 분자미생물 단독의뢰일 경우 냉장보관)  </small>

								<table class="table2">
									<tbody>

										<tr>
											<td class="n_td">3)</td>
											<td>RNA virus를 의뢰한 검체 중 용혈 된 검체는 검사결과가 불안정하므로 주의하여 주시기 바랍니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">
								<p>채취방법</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>분자진담검사의 모든 혈액 및 골수는 원칙적으로 EDTA 용기를 사용합니다. <br/>
											항응고제 중 heparin은 Taq DNA polymerase (수정 전 : Taq. Polymerase)의 활성화를 억제하여 검사가 불가능합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>조직검체는 formalin 고정 없이 멸균 saline에 넣어 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>폐렴 및 호흡기바이러스의 검체</td>
										</tr>

									</tbody>
								</table>

								<small>- Nasopharyngeal aspirate (비인두흡인액) 및 nasopharyngeal swab (비인두 도말) : Nasopharyngeal aspirate가 nasopharyngeal swab보다<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 바이러스 분리율이 우수합니다.</small>
								<img src="<c:url value='/user/img/sub/03sub_img12.jpg'/>" style="max-width: 1058px;" alt="이미지" />
								<small>- Throat swab (인후도말) : Posterior pharynx tonsilla area 사이의 감염된 부위를 면봉으로 도말하여 adenovius의 분리에 이용할 수 있으며,<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 혀나 구강점막, 이, 잇몸이 닿지 않도록 합니다.</small><br/>
								<small>- Bronchoalveolar lavage (기관지 세척액) : 기관지내시경(bronchoscopy)를 하는 동안에 채취한 세척액을 사용합니다.</small>

								<table>
									<tbody>

										<tr>
											<td class="n_td">4)</td>
											<td>분자진단 검사용 모발 : 모근이 포함된 머리카락 5가닥 이상</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>구강상피세포 : 구강상피세포 채취용 키트의 면봉으로 구강 내 왼쪽, 오른쪽 부분을 각각 10회 이상 문지른 뒤 튜브에 넣고 밀봉합니다. <br/>(주의사항 : 면봉 부분은 다른 곳에 닿지 않도록 함)</td>
										</tr>

									</tbody>
								</table>


							</div>
						</div>
						<!--//tab menu05 End-->

						<!--tab menu06-->
						<div id="tab-6" class="tab-content">
							<div class="inner_content">

								<h1>진단미생물검사</h1>
								<p>유의사항</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>미생물검사 의뢰 시 임상소견 및 의심되는 균종, 검체의 종류 및 채취부위, 시간, 항균제 투여 여부 등을 반드시 기록하여 주십시오.<br/>
    					  			임상정보에 따라 일차 접종 배지의 종류, 배양조건, 동정을 요하는 균의 종류 등이 달라질 수 있습니다. </td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>모든 검체는 무균조작으로 채취하여 규정된 멸균 용기에 보관해야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>수송배지, 혈액 배양용 배지 등은 사용 전에 오염된 것, 마개가 열린 것, 유효기간이 경과된 것이 아닌지 검토하고 의심스러우면 새것으로 교환해야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>검체는 감염이 있는 부위에서 채취해야 하며, 인접부위에서 오염균이 들어 가지 않도록 주의하여 주십시오.</td>
										</tr>

										<tr>
											<td></td>
											<td>
												<span class="td_orange">※ 부적합검체</span>
													<div>
														<ul>
															<li>- 타액이 섞인 객담</li>
															<li>- 창상의 표면에서 채취된 검체</li>
															<li>- 깊은 농양까지 흡인바늘이 안들어 간 것을 모르고 채취한 검체 등</li>
															<li>- 요도 끝을 씻지 않고 채취한 소변</li>
															<li>- 질분비물로 오염된 자궁내 검체</li>
														</ul>
													</div>
											</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>의심되는 균이 가장 많이 배출되는 시기에 검체를 채취합니다. 바이러스는 급성기에, 세균은 항균제 치료가 시작되기 전에 검체를 채취하는 것이 좋습니다.</td>
										</tr>

										<tr>
											<td class="n_td">6)</td>
											<td>충분한 양의 검체를 채취합니다.</td>
										</tr>

										<tr>
											<td class="n_td">7)</td>
											<td>지연 시 요, 객담, 호흡기 검체, 변, bacteria, virus를 위한 검체는 냉장보관하여 정상균 무리의 증식을 막아야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">8)</td>
											<td>뇌척수액, 체액, 혈액 및 임균을 위한 검체는 실온보관합니다.</td>
										</tr>

										<tr>
											<td class="n_td">9)</td>
											<td>위 세척액, 요, 대변(<i>C.difficile</i> 검출을 위한 경우 제외), 인두 검체, 객담, 회장조루술, 결장 조루술 검체, 표재성 피부검체 등은 무산소성(혐기성)<br/> 배양을 하지 않습니다.</td>
										</tr>

										<tr>
											<td class="n_td">10)</td>
											<td>&nbsp;Gram stain과 배양검사를 동시에 의뢰할 경우에는 2개의 면봉에 검체를 각각 채취하여 수송배지에 넣어 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">11)</td>
											<td>&nbsp;혈액배양용기는 용기에 붙어있는 바코드가 보존되도록 발행된 바코드를 다른 위치에 세로로 부착합니다.</td>
										</tr>
										
										<tr>
											<td colspan="2">
												<div class="imgsample">
												<img src="<c:url value='/user/img/sub/usage_micro_sample1.png'/>" style="max-width: 1058px;" alt="이미지"/>
												<span style="text-align: center; width:241px; padding-top: 10px; color:#666; font-weight: 500; ">&lt; 바코드 바르게 붙인 모습 &gt;</span>
												</div>
											</td>
<!-- 											<td> -->
<!-- 												<div> -->
<!-- 												</div> -->
<!-- 											</td> -->
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">

								<p>뇨(Urine)</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>세균 배양을 하기 위한 중간뇨는 아침 첫뇨가 가장 좋으며, 무균용기에 10 mL정도 채취합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>상재균에 의한 오염을 방지하기 위해서 요도(외음부)주위를 깨끗이 세정하고, 멸균생리식염수로 충분히 세정합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>여성은 소변을 보는 동안 음순 부위를 두 손가락으로 벌린 상태를 유지하며, 처음 20 mL 정도의 요를 통과시킨 후 중간뇨를 멸균용기에 받습니다.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>남성은 소변을 보는 동안 피부 상재균의 오염을 막기 위해서 표피를 뒤로 당긴 상태를 유지하며, 처음 20 mL 정도의 요를 통과시킨 후 중간뇨를 멸균용기에 받습니다.</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>Catheter를 사용하면 감염의 우려가 있으므로 중간뇨를 받지 못하는 환자나 무균 조작이 반드시 필요한 환자만 사용하여 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">6)</td>
											<td>검사실로 즉시 보낼 수 없을 경우 냉장 보관하십시오.</td>
										</tr>

										<tr>
											<td class="n_td">7)</td>
											<td><i>Neisseria gonorrhoeae</i> 배양 검체는 실온 보관하십시오.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content3">

								<p>농(Pus)</p>

								 <table>
									 <tbody>

										 <tr>
											 <td class="n_td">1)</td>
											 <td>농은 주사기로 흡인하여 채취하는 것을 원칙으로 합니다.</td>
										 </tr>

										 <tr>
											 <td class="n_td">2)</td>
											 <td>주사기에 담긴 흡인액은 과잉의 공기를 제외한 후 주사침에 고무를 끼워 운송합니다.</td>
										 </tr>

										 <tr>
											 <td class="n_td">3)</td>
											 <td>주사기로 흡인액을 얻지 못하는 open pus의 경우 두 개의 멸균된 면봉으로 채취하여 수송배지에 넣습니다.</td>
										 </tr>

									 </tbody>
								 </table>

							</div>

							<div class="inner_content4">

								<p>객담(Sputum), 인후도말(Throat swab)</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>기침에 의한 객담은 아침 일찍 식사하기 전에 입안을 물로 헹구고 깊은 기침을 하여 5-10 mL을 받습니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>마른 기침을 할 경우 15% 식염수와 10% glycerin으로 만든 비말을 흡입하게 하여 유도 객담을 채취합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>검체는 검사실로 즉시 보낼 수 없을 경우에는 냉장보관 하십시오.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>객담배양검사는 2일 연속 시행하여 결과를 비교해 보거나, Gram stain 결과를 참조 하는 것이 원인균 판단에 도움이 됩니다.</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>세균성 폐렴이 의심될 경우에는 혈액 배양도 함께 실시하는 것이 권장됩니다.</td>
										</tr>

									</tbody>
								</table>

								<p class="red_table_title">※ Sputum 판정 (Adapted from Murray & Washington grading system for sputum)</p>
								<!--table-->
								<table class="content_table">
									<colgroup>
										<col width="20%"/>
										<col width="30%"/>
										<col width="30%"/>
										<col width="20%"/>
									</colgroup>
									<tbody>

										<tr>
											<th rowspan="2" style="padding:40px 0;">Grade</th>
											<th colspan="2">Number of cell / Low-Power field</th>
											<th rowspan="2">판정</th>
										</tr>

										<tr>
											<th>Epithelial cell</th>
											<th>WBC</th>
										</tr>

										<tr>
											<td>1</td>
											<td>> 25</td>
											<td>< 10</td>
											<td rowspan="3">Unacceptable</td>
										</tr>

										<tr>
											<td>2</td>
											<td>> 25</td>
											<td>10 - 25</td>
										</tr>

										<tr>
											<td>3</td>
											<td>> 25</td>
											<td>> 25</td>
										</tr>

										<tr>
											<td>4</td>
											<td>10 - 25</td>
											<td>> 25</td>
											<td rowspan="3">Acceptable</td>
										</tr>

										<tr>
											<td>5</td>
											<td>< 10</td>
											<td>> 25</td>
										</tr>

										<tr>
											<td>6</td>
											<td>< 10</td>
											<td>< 10</td>
										</tr>

									</tbody>
								</table>
								<!--//table-->

									<table>
										<tbody>

										<tr>
											<td class="n_td">6)</td>
											<td>Throat swab은 검체 채취 전 양치하고 면봉으로 후인두(posterior pharynx) 또는 염증이 있는 편도 부위를 세게 문질러 채취한 후 수송배지에 넣습니다.<br/>시간이 지연되는 경우 냉장보관합니다.</td>
										</tr>

									</tbody>
								</table>

							</div>

								<div class="inner_content5">
									<p>대변(Stool)</p>
									<table>
										<tbody>

											<tr>
												<td class="n_td">1)</td>
												<td>대변은 1-2g(콩알 2-3개 정도의 크기)을 채취하여 대변용기에 넣습니다. 대변을 채취할 수 없을 때에는 직장에서 면봉으로검체를 채취한 후 수송배지에 넣어주십시오.<br/>
												(<i>C. difficile</i> toxin A&B 검사와 동시 의뢰하는 경우 수송배지는 검사가 불가합니다.)</td>
											</tr>

											<tr>
												<td class="n_td">2)</td>
												<td>장염세균을 검사하기에 가장 좋은 검체는 급성기에 채취한 설사변으로 분변에 농, 혈액, 점액이 있는 부분을 채취합니다.</td>
											</tr>

											<tr>
												<td class="n_td">3)</td>
												<td>E.coli O157, Campylobacter jejuni 가 의심되는 경우 특수 감별배지를 사용하므로 반드시 검사의뢰서에 기록하여 주십시오.</td>
											</tr>

											<tr>
												<td class="n_td">4)</td>
												<td>Vibrio spp. 배양은 통상적으로 5-10월에 시행하며, 필요한 경우 검사의뢰서에 기록하여 주십시오.</td>
											</tr>

											<tr>
												<td class="n_td">5)</td>
												<td>분변배양검사를 위한 채취시기 및 횟수<br/>
													<small>- 동일한 환자에게 3번 이상 분변배양검사를 의뢰하시면 안됩니다.</small>
													<small>- 사전에 상담 없이 입원환자로부터 입원 3일 이후에 검체를 채취하면 안됩니다.</small>
													<small>- 대변에서  <i>C. difficile</i> 독소검사는 설사 증상이 있고, 항균제 치료 또는 노출된 경력이 있는 모든 환자에 대해 시행합니다. </small>
													<small>&nbsp;&nbsp;장내 병원균 검사가 필요한 입원 환자에게 실시하는 일반적인 미생물 배양 검사의 대안으로  <i>C. difficile</i> 독소검사를 고려할 수 있습니다.</small>
													<small>- 신생아의 약 70% 까지는 균주의 독소 생성 여부와 상관없이 무증상 단순 집락 상태 일 수 있기 때문에  <i>C. difficile</i> 의 양성 결과는 해석 시 주의를 요합니다.</small>
													
												</td>
											</tr>

										</tbody>
									</table>

								</div>
								
								<div class="inner_content5">
									<p>혈액(Blood)</p>
									<table>
										<tbody>

											<tr>
												<td class="n_td">1)</td>
												<td>채혈하려는 혈관 피부를 70% isopropyl alcohol로 잘 닦고 마르게 한 후 아이오도포어(iodophors), 글루콘산클로르헥시딘액(chlorhexidine gluconaste)<br/>
												 또는 2% iodine tincture로 안에서 밖으로 원을 그리며 1-2분간 요오드액이 마르기를 기다립니다.<br/>(단 글루콘산클로르헥시딘액은 2개월 미만 영아의 피부 소독에 사용하지 마십시오).</td>
											</tr>

											<tr>
												<td class="n_td">2)</td>
												<td>혈액 배양 시 정맥혈을 사용합니다.</td>
											</tr>

											<tr>
												<td class="n_td">3)</td>
												<td>성인의 혈액배양검사는 혈액 5.0 mL을 호기성과 혐기성 혈액배양용기에 각각 넣습니다.</td>
											</tr>

											<tr>
												<td class="n_td">4)</td>
												<td>소아의 혈액배양검사는 혈액 2.5 mL을 호기성과 혐기성 혈액배양용기에 각각 넣습니다.</td>
											</tr>

											<tr>
												<td class="n_td">5)</td>
												<td>열이 나는 경우 즉시 혈액배양을 시행하며 동시에 다른 부위에서 2-3회 혈액을 채혈하여 검사를 시행하는 것이 권장됩니다.(성인에서 1회 채혈은 하지 말아야 합니다.)
												</td>
											</tr>
											
											<tr>
												<td class="n_td">6)</td>
												<td>급성심내막염인 경우 즉시 혈액배양을 시행하고 항균제 투여 전 30분 내에 채혈을 하며, 아급성심내막염인 경우는 30분-1시간 간격을 두고 채혈합니다.</td>
											</tr>
											
											<tr>
												<td class="n_td">7)</td>
												<td>대부분 혈액 내에 간헐적으로 균이 출현하므로 발열 주기에 30분-1시간 간격으로 3회 채혈하는 것이 권장됩니다.<br/>그러나 항균제를 투여한 응급환자는 간격을 좁혀 채혈할 수 있습니다.</td>
											</tr>
											
											<tr>
												<td class="n_td">8)</td>
												<td>채혈한 용기는 실온에 보관하며, 최대한 신속하게 검사실로 보내야 합니다.</td>
											</tr>
											
											

										</tbody>
									</table>

								</div>

								<div class="inner_content6">
									<p>비뇨생식기(Genitourinary tracts)</p>
									<p class="red_table_title">성생식기 검체</p>
									<table>
										<tbody>
											<tr>
												<td class="n_td">1)</td>
												<td>자궁경관 도말: 자궁경검(speculum)을 따뜻한 물에 닦은 후 질 상재균의 오염을 최대한 피하여 자궁경검을 넣습니다.<br/> 
												질분비물과 점액을 닦아 낸 다음 자궁내막 선(endocervical gland)에서 나온 삼출물을 멸균된 면봉으로 돌려서 채취합니다.<br/>
												삼출물이 보이지 않으면 자궁경내막의 관에 면봉을 넣어 채취한 후 수송배지에 넣어 주십시오.</td>
											</tr>

											<tr>
												<td class="n_td">2)</td>
												<td>요도: 소변 2시간 후 질과 통하는 치골 결합부 쪽의 요도를 부드럽게 마사지하여 나오는 분비물을 면봉으로 채취합니다.<br/>
												분비물을 얻을 수 없을 때는 내요도 속에 면봉을 2-4 cm 깊이로 삽입하여 부드럽게 회전하여 채취한 후 수송배지에 넣어줍니다.</td>
											</tr>

											<tr>
												<td class="n_td">3)</td>
												<td>질: 질 관에서 윤활제를 바르지 않은 관경을 사용하여 소독된 피펫이나 면봉으로 점액이 많은 쪽의 검체를 채취합니다.</td>
											</tr>

											<tr>
												<td class="n_td">4)</td>
												<td>Group B <i>Streptococcus</i>(GBS) culture 산전 검사는 35-37주에 시행하며, vaginal과 rectal swab 검체로 검사를 시행합니다.</td>
											</tr>
										</tbody>
									</table>

									<p class="red_table_title">남성생식기 검체</p>
									<table>
										<tbody>
											<tr>
												<td class="n_td">1)</td>
												<td>전립선마사지액: 직장을 통해서 손가락으로 전립선을 마사지 한 후 멸균된 관이나 면봉으로 채취합니다.</td>
											</tr>

											<tr>
												<td class="n_td">2)</td>
												<td>요도분비액: 소변 2시간 후 내요도 속에 면봉을 2-4cm 깊이로 삽입하여 부드럽게 회전하여 채취한 후 수송배지에 넣어줍니다.</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="inner_content7">

									<p>뇌척수액(CSF), 체액(Body Fluid)</p>

									 <table>
										 <tbody>

											 <tr>
												 <td class="n_td">1)</td>
												 <td>주사기로 5-10 mL 흡인하여 채취합니다. 보통 3개의 용기에 받는데 첫번째 용기는 생화학 및 혈청학적 검사에,<br/>
												 두번째 용기는Gram stain 및 배양에, 세번째 용기는 cell count에 사용합니다.</td>
											 </tr>

											 <tr>
												 <td class="n_td">2)</td>
												 <td>CSF는 채취 즉시 검사실로 보내야 하며  <i>Meningococcus, Gonococcus</i> 는 낮은 온도에 예민하므로 실온 보관합니다. <br/>
												 이 외에도박테리아 배양을 위한 CSF검체는 실온보관하여 주십시오.</td>
											 </tr>
										 </tbody>
									 </table>


								</div>

								<div class="inner_content8">

									<p>혐기성배양</p>

									 <table>
										 <tbody>

											 <tr>
												 <td class="n_td">1)</td>
												 <td>주사기로 흡인한 후 끝에 고무마개를 끼우고 즉시 검사실로 운송합니다. <br/>부득이하게 면봉으로 채취한 경우 반드시 수송배지에 깊이 넣어서 보관하고 가능하면 즉시 접종하여야 합니다.</td>
											 </tr>

											 <tr>
												 <td class="n_td">2)</td>
												 <td>혐기성 배양이 필요한 검체<br/>
													<small>- 조직 깊숙이 있는 농양, 특히 악취가 있는 경우</small><br/>
													<small>- Gas gangrene 이나 gas 생성 괴사 조직</small><br/>
													<small>- 뇌, 폐, 간, 직장부위, 복강 내 또는 외경막하부위의 농양</small><br/>
													<small>- 사람이나 동물에 물린 검체</small><br/>
													<small>- 혈액 배양의 경우 통상적으로 호기성, 혐기성 배양을 동시에 실시하므로 따로 의뢰하지 않습니다.</small>
												 </td>
											 </tr>

										 </tbody>
									 </table>

								</div>

								<div class="inner_content9">

									<p>결핵균검사</p>

									<b>결핵균 배양을 위해서 다른 세균의 오염도를 최소한으로 낮추어야 하므로 채취 후 바로 검사합니다. <br/>여러 시간에 걸쳐 채취된 검체는 적합하지 않으며 지연될 경우 냉장보관합니다.</b>

									<table>
										<tbody>

											<tr>
												<td class="n_td">1)</td>
												<td>Sputum: 이른 아침 깊은 객담 5-10 mL 정도 필요하며 wax-free 용기에 채취합니다.<br/>
												연속하여 3일 동안 실시하는 것을 권장하며 여러 객담을 하나로 모아 만든 검체는 오염이 증가되므로 부적합합니다.</td>
											</tr>

											<tr>
												<td class="n_td">2)</td>
												<td>Urine: 이른 아침에 채취한 중간뇨를 최소 40 mL 이상 채취하며, 2-3일 연속 검사합니다.</td>
											</tr>

											<tr>
												<td class="n_td">3)</td>
												<td>Body fluids: 가능한 많은 양(최소 10-15 mL)을 멸균용기나 주사기로 채취합니다. 검체가 bloody한 경우에는 heparin tube에 넣습니다.</td>
											</tr>

											<tr>
												<td class="n_td">4)</td>
												<td>Bone marrow: 가능한 많은 양을 채취하여 heparin tube에 넣습니다.</td>
											</tr>

											<tr>
												<td class="n_td">5)</td>
												<td>Gastric lavage fluid: 5-10 mL 정도를 멸균용기에 채취하며, 아침에 일어난 직후 바로 채취하는 것이 좋습니다.(밤 사이에 삼킨 sputum을 채취하기 위함)</td>
											</tr>

											<tr>
												<td class="n_td">6)</td>
												<td>Tissue biopsy: 약 1g 정도의 tissue를 saline에 넣어 보냅니다.</td>
											</tr>

											<tr>
												<td class="n_td">7)</td>
												<td>기타검체: 오염되지 않게 채취하며, gastric juice와 같은 검체는 중화 처리해야 하므로 채취 즉시 보냅니다.</td>
											</tr>

										</tbody>
									</table>

								</div>

						</div>
						
						<!--tab menu07-->
						<div id="tab-7" class="tab-content">

							<div class="inner_content">

								<h1>바이러스배양검사</h1>
								<p>유의사항</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>바이러스 검체는 일반적으로 질병경과가 길수록 바이러스 검출률이 낮아지므로, 발병초기에 채취하여 주십시오. </td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>검체는 감염병소에서 무균상태로 채취하고 각 검체에 따른 용기를 사용하여 운송합니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>바이러스 검체는 UTM에 채취한 후 냉장보관하여 운송합니다.</td>
										</tr>

								<tr>
									<td class="n_td"></td>
									<td>
											<table class="content_table">
												<colgroup>
													<col width="25%"/>
													<col width="50%"/>
													<col width="25%"/>
												</colgroup>
												<thead>
													<tr>
														<th>질환</th>
														<th>바이러스</th>
														<th>검체</th>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>장염</td>
														<td>Rotavirus, Norovirus, Adenovirus</td>
														<td>대변</td>
													</tr>

													<tr>
														<td>상 • 하기도 감염</td>
														<td>RSV, Adenovirus, Parainfluenza virus, Influenza virus A, B</td>
														<td>비인두흡인물, 비인두면봉, 객담</td>
													</tr>

													<tr>
														<td>무균성 수막염</td>
														<td>Enterovirus, Mumps virus, Herpes simplex virus</td>
														<td>뇌척수액, 대변, 비인두흡입물</td>
													</tr>

													<tr>
														<td>뇌염</td>
														<td>Herpes simplex virus, Japanese encephalitis virus, Rabies virus</td>
														<td>뇌척수액, 뇌조직</td>
													</tr>

													<tr>
														<td>신증후성 출혈열</td>
														<td>Hantaan virus</td>
														<td>혈액</td>
													</tr>

													<tr>
														<td>소포성 홍반</td>
														<td>Herpes simplex virus, Varicella-zoster virus</td>
														<td>수포액, 찰과표본</td>
													</tr>

													<tr>
														<td>결막염</td>
														<td>Adenovirus, Herpes simplex virus, Enterovirus, Varicella-zoster virus</td>
														<td>결막찰과면봉</td>
													</tr>

													<tr>
														<td>태아 및 신생아 바이러스 감염</td>
														<td>Herpes simplex virus, CMV, Rubella virus, Enterovirus, Parvovirus B19</td>
														<td>뇌척수액, 수포액, 조직, 양수,소변</td>
													</tr>

													<tr>
														<td>파종성 바이러스 감염</td>
														<td>CMV, Herpes simplex virus, Varicella-zoster virus, Adenovirus</td>
														<td>기관지폐포세척액,조직, 뇌척수액</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

									<tr>
										<td class="n_td">4)</td>
										<td>바이러스 배양검사 검체별 안내</td>
									</tr>

									<tr>
										<td></td>
										<td>
											<table class="content_table">
												<colgroup>
													<col width="20%"/>
													<col width="30%"/>
													<col width="19%"/>
													<col width="31%"/>
												</colgroup>
												<thead>
												</thead>
												<tbody>
													<tr>
														<th>검체종류</th>
														<th>채취 및 검체량</th>
														<th>검체용기</th>
														<th>주의사항</th>
													</tr>

													<tr>
														<td>Stool</td>
														<td>3-5 g<br/>(설사변일 경우 5g)</td>
														<td rowspan="3">멸균용기</td>
														<td>- 발병후 4일 이내 검체 채취<br/>
															- 수막염은 발병 후 2일까지 검체가능<br/>
															- 기저귀 착용시 대변 긁어서 보냄
														</td>
													</tr>

													<tr>
														<td>Urine</td>
														<td>5.0 mL(신생아: 2.0-3.0 mL)</td>
														<td>- CMV 배양의 경우 UTM 용기사용</td>
													</tr>

													<tr>
														<td>CSF</td>
														<td>3.0-5.0 mL</td>
														<td>- 혈액이 혼입된 검체는 혈액 내에 존재하는<br/> 항체가 바이러스 배양을
														</td>
													</tr>

													<tr>
														<td>Rectal swab</td>
														<td>Swab을 rectum 내 2-4 cm 부위에서<br/>rug and rotation 방법으로 채취</td>
														<td rowspan="9">UTM</td>
														<td>- 대변을 채취하지 못할 경우 사용</td>
													</tr>

													<tr>
														<td>상부 호흡기</td>
														<td>
															① asopharyngeal aspirate<br/>
															② Nasopharyngeal Swab<br/>
															③ Throat swab<br/>
															바이러스 분리율 ①>②>③
														</td>
														<td>
															- 발병 후 수일 이내에 채취<br/>
															- Throat swab 보다는 Nasopharyngeal Swab이 오염이 적어서 좋음
														</td>
													</tr>

													<tr>
														<td>하부 호흡기</td>
														<td>Transtracheal aspirate Bronchial Washing
														</td>
														<td>
															- 발병 후 수일 이내에 채취<br/>
															- Sputum 도 사용할 수 있으나 aspirate<br/>보다 효율성이 떨어짐
														</td>
													</tr>

													<tr>
														<td>
															Skin, Mucous <br/>membrane lesion
														</td>
														<td>
															수포(vesicle)를 26 gauge 주사침이나 tuberculin syringe 또는 면봉을 사용하여 채취
														</td>
														<td>
															- 비궤양성 병소일 경우 면봉을 사용하여<br/>병소 부위를 문지른 후 수송배지에 넣음.<br/>
															- 주사기 이용시 transport media 배지에 넣음(흡인 및 배출과정 반복)
														</td>
													</tr>

													<tr>
														<td>Eye</td>
														<td>
															Conjunctiva:<br/>
															- 면봉을 소독된 생리 식염수에 적신 후 검체 채취<br/>
															- 두 번째 면봉으로 남아있는 물기를 제거
														</td>
														<td>- 운송배지에 사용된 면봉 모두를 넣음</td>
													</tr>

													<tr>
														<td>Cervical urethral</td>
														<td>면봉검체 사용</td>
														<td>-</td>
													</tr>

													<tr>
														<td>타액</td>
														<td>2.0-3.0 mL</td>
														<td>-</td>
													</tr>

													<tr>
														<td>Semen</td>
														<td>-</td>
														<td>- CMV 배양에 주로 이용</td>
													</tr>

													<tr>
														<td>Tissue</td>
														<td>-</td>
														<td>-</td>
													</tr>

													<tr>
														<td>Blood</td>
														<td>전혈 5.0-8.0 mL</td>
														<td>Heparin, Sod. citrate</td>
														<td>- 칼슘을 이용한 항응고제는<br/>바이러스 배양을 저해시킬 수 있음</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

								</tbody>
							</table>

							</div>

						</div>
						<!--//tab menu07 End-->

						<!--tab menu08-->
						<div id="tab-8" class="tab-content">

							<div class="inner_content">

								<h1>세포병리검사</h1>
								<p>유의사항</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>검체는 항상 신선하게 보존되어야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>2초 이내에 Slide 도말고정을 위해 Cytofixer(Spray)를 사용할 경우 압력에 의해 세포가 변성될 수 있으므로 30cm 거리에서 slide 전면에 골고루 분무하여 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>검체용기 및 slide에 환자명, 차트 번호, 채취날짜 등을 기입하여 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>세포 병리 검사 의뢰서에 환자 정보, 채취 부위, 병력, 담당 의사 등의 필수적 임상정보는 반드시 기재하여 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>Slide는 파손이나 분실되지 않도록 주의하여 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">6)</td>
											<td>기타 문의사항은 본원 병리센터에 문의하여 주십시오. (Tel. 1566-6500)</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">
								<p>검체별 도말표본 제작방법</p>
								<table>
									<thead>
										<colgroup>
											<col width="15%">
											<col width="15%">
											<col width="70%">
										</colgroup>
									</thead>

									<tbody>
										<tr>
											<th>구분</th>
											<th>검체종류</th>
											<th>제작방법</th>
										</tr>

										<tr>
											<td>부인과 세포검사<br/>(GY)</td>
											<td>질, 자궁경부,<br/>자궁내막</td>
											<td class="l_td">
												<span>① 검체를 Slide 위에 도말한 후 즉시 95% ethyl alcohol에 2시간 이상 고정하여 주십시오.</span>
												<span>② 액상자궁경부세포검사 : 채취된 brush의 stem 부분을 제거한 후 전용용기에 넣고 단단히 밀봉합니다.</span>
												<span>③ 검체 채취시 기구나 장갑에 윤활제 또는 Talcum powder를 사용하지 말고 수분이 필요한 경우는 warm saline을</span>
												<span class="padding_span">사용하십시오.</span>
												<span>④ 면봉으로 검체 채취를 할 경우 slide에 충분히 도말 후 즉시 고정하여 주십시오.</span>
												<span>⑤ Pap brush나 cytobrush로 검체를 채취할 경우 심한 출혈은 진단에 방해를 줄 수 있으므로 주의합니다.</span>
												<span>⑥ 검사 채취 24시간 전에는 Intravaginal medication(질내 치료) 또는 피임약의 사용을 금합니다.</span>
											</td>
										</tr>

										<tr>
											<td rowspan="5">비부인과 세포검사<br/>(Non-GY)</td>
											<td>객담</td>
											<td class="l_td">
												<span>① 횡경막에서부터 나오는 깊은 기침(deep cough)으로 객담을 사용합니다.</span>
												<span>② 병적인 부분(변색된 부분, 짙은 갈색 부분, 혈액이 있는 부분)을 채취하여 slide glass 위에 놓고 두장을 겹쳐서 도말한</span>
												<span class="padding_span">후 즉시 95% ethyl alcohol로 고정하여 주십시오.</span>
												<span>③ 객담 검사는 3~5일간 연속으로 시행할 때 암세포 발견율이 높습니다.</span>
											</td>
										</tr>

										<tr>
											<td>소변, 뇌수척액</td>
											<td class="l_td">
											<span>① 아침 첫 소변은 퇴행성 변화가 심하고 농축되어 적당하지 못하므로 중간소변을 채취합니다.</span>
											<span>② 1500 rpm에 5분간 원심분리하여 얻은 침전물에 egg albumin 1~2 drop을 넣어 혼합하고 slide에 도말한 후</span>
											<span class="padding_span">즉시 95% ethyl alcohol에 2시간 이상 고정하여 주십시오.</span>
											<span>③ 도말이 불가능한 경우 동일한 분량의 ethyl alcohol을 첨가해서 세포의 손상을 방지합니다.</span>
											</td>
										</tr>

										<tr>
											<td>흉수액, 복수액</td>
											<td class="l_td">
													<span>① 검체에 alcohol이나 formalin을 절대 넣지 마십시오.</span>
											    <span class="padding_span">(Alcohol은 세포를 둥글고 단단하게 만들고, formalin은 핵의 미세구조를 방해합니다.)</span>
													<span>② 1500 rpm에 15분 원심분리하여 얻은 침전물을 slide에 도말하여 즉시 95% ethyl alcohol에 2시간 이상</span>
													<span class="padding_span">고정하여 주십시오.</span>
											</td>
										</tr>

										<tr>
											<td>위액<br/>(pH가 낮은 검체)</td>
											<td class="l_td">
												<span>① 위액과 같이 pH가 낮은 검체는 세포가 변성되기 쉬우므로 즉시 slide에 도말하여 95% ethyl alcohol에 2시간</span>
												<span class="padding_span">이상 고정하여 주십시오.</span>
												<span>② 도말이 불가능한 경우 70% alcohol를 검체의 1/3~1/4정도 되도록 넣은 후 냉장보관하여 즉시 운송합니다.</span>
											</td>
										</tr>

										<tr>
											<td style="padding:25px 10px;">유두 분비물<br/>(nipple discharge)</td>
											<td class="l_td"><span>① 분비물 한 방울을 직접 slide 위에 도말한 후 즉시 95% ethyl alcohol에 2시간 이상 고정하여 주십시오.</span>
											</td>
										</tr>

										<tr>
											<td>세침흡인 세포검사<br/>(FNA)</td>
											<td>유방, 갑상선,<br/>림프절 등</td>
											<td class="l_td">
												<span>① 표본은 도말 후  즉시 95% ethyl alcohol에 2시간 이상 고정하여 주십시오.</span>
												<span>② 검체량이 적은 경우 주사바늘과 주사통을 생리 식염수로 세정하고 원심한 후 침전물을 도말하여  즉시</span>
												<span class="padding_span">95% ethyl alcohol에 2시간 이상 고정하여 주십시오.</span>
												<span>③ 검체가 많이 남아있는 경우 cell block 등으로 이용되오니 같이 보내 주십시오.</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
						<!--//tab menu08 End-->

						<!--tab menu09-->
						<div id="tab-9" class="tab-content">
							<div class="inner_content">

								<h1>조직&면역병리검사</h1>
								<p>조직병리검사의뢰서 작성방법</p>

								<b>환자의 이름, 생년월일, 성별, 병원명 및 등록번호, 채취날짜, 의뢰날짜, 채취부위, 채취방법, 의뢰검사명 등을 반드시 기재하여 주십시오.<br/>
								또한 환자의 병력 및 임상소견을 함께 기재하여 주시면 정확하고 신속한 진단에 도움이 됩니다.</b>

							</div>

							<div class="inner_content2">
								<p>고정방법</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>조직은 인체에서 분리되면 자가융해(Autolysis)가 발생합니다. 정확한 진단을 위해서 채취 즉시 고정액(10% Formalin)에 고정합니다.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>고정액은 10% 중성 Formalin으로 조직 크기의 10~20배 되게 사용하여 조직이 완전히 담기게 하고 12~14시간 실온에 고정합니다.</td>

										<tr>
											<td class="n_td">3)</td>
											<td>검체용기 입구는 넓어야 하며, 채취 부위가 다르거나 별도 구분이 필요한 경우, 각기 다른 용기에 담습니다.</td>
										</tr>

										<tr>
											<td class="n_td">4)</td>
											<td>고정액이없는 경우, Saline에 적신 거즈로 조직을 싸서 냉장 보관합니다. 최대한 빨리 고정액에 담아야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">5)</td>
											<td>검체용기는 조직이나 고정액이 새지 않도록 단단히 밀봉해야 합니다.</td>
										</tr>

										<tr>
											<td class="n_td">6)</td>
											<td>기타 문의사항은 본원 병리센터에 문의하여 주십시오. (Tel. 1566-6500)  </td>
										</tr>

										<tr>
											<td></td>
											<td>
												<table class="content_table">
													<thead>
														<colgroup>
															<col width="30%">
															<col width="70%">
														</colgroup>
													</thead>
													<tbody>
														<tr>
															<th>검체종류</th>
															<th>고정방법</th>
														</tr>

														<tr>
															<td>위, 대장, 자궁경부 등 작은 생검조직</td>
															<td class="l_td">생검의 수분을 제거하고 여과지에 붙여서 10% Formalin에 고정합니다.<br/>
															조직이 건조되지 않도록 주의하여 주십시오.</td>
														</tr>

														<tr>
															<td>자궁 등 큰 장기</td>
															<td class="l_td">큰 장기는 고정이 불충분한 경우가 있으므로 조직의 절단면을 아래로 하여 넣고, 고정액을 충분히 넣어 고정합니다.<br/>
															(조직 크기의 10-20배의 고정액)</td>
														</tr>

														<tr>
															<td>폐</td>
															<td class="l_td">기관지 말단에서 고정액을 주입하여 가능한 한 폐포를 부풀려 공기를 뺀 뒤 고정액에 고정합니다.</td>
														</tr>

														<tr>
															<td>소화관 등 점막 장기</td>
															<td class="l_td">절제 검체는 점막부위를 노출시켜서 얇은 거즈로 싸서 고정합니다.<br/>
															내시경 점막절제 검체는 점막면을 위로 하여 스티로폼 등에 편평한 상태를 유지하도록 펴서 핀 등으로 고정 후 10% Formalin에 고정합니다.</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content3">
								<p>검체포장 및 운반방법</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>검체 포장 방법 : 다음의 3단계로 포장합니다.</td>
										</tr>

										<tr>
											<td></td>
											<td>
												<b style="background:url(<c:url value='/user/img/sub/a_ico.png' />) no-repeat 0 1.5px;" >1차용기</b>
												<span>검체를 담는 용기로 고정액이 새지 않아야 합니다. 이 용기는 충분한 흡착물로 포장하여 용기가 파손되더라도 모든 용액이 흡착되도록 해 주십시오.</span>

												<b style="background:url(<c:url value='/user/img/sub/b_ico.png' />) no-repeat 0 1.5px;" >2차용기</b>
												<span>1차 용기를 싸서  보호하는 용기로 견고하며, 고정액이 새지 않도록 해 주십시오.</span>
												<span>다수의 1차 용기를 하나의 2차 용기에 넣을 경우에는 각각을 포장하여 서로 접촉하지 않도록 해 주십시오.</span>
												<span>1차 용기와 2차 용기 사이에 충분한 흡착물을 넣어서 이송 중에 고정액이 유출되어도 모두 흡착되어 외부 포장이 젖지 않도록 해 주십시오.</span>

												<b style="background:url(<c:url value='/user/img/sub/c_ico.png' />) no-repeat 0 1.5px;" >외부 포장</b>
												<span>2차 용기와 적절한 완충물을 함께 포장하는 것으로, 외부 포장은 이송 중에 발생할 수 있는 물리적 손상 등의 외부 영향으로 부터 내용물을 보호할 수 있도록 해 주십시오.</span>
												<span>포장 외부의 크기는 최소 10 x 10cm 이상 되도록 하여 주십시오.</span>
											</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>검체 운반 방법</td>
										</tr>

										<tr>
											<td></td>
											<td>
												<b style="background:url(/user/img/sub/a_ico.png) no-repeat 0 1.5px;">이송 직원은 병리 검체가 안전한 방법으로, 정해진 시간 내에 운송된다는 사실을 알려 주십시오.</b>
												<b style="background:url(/user/img/sub/b_ico.png) no-repeat 0 1.5px;">병리 검체의 종류, 수량, 포장 방법, 출발지, 출발 시각, 이송 중 보관 방법, 희망 보관 온도 등을 확인하여 송장에 기재하여 주십시오.</b>
												<b style="background:url(/user/img/sub/c_ico.png) no-repeat 0 1.5px;">이송이 완료되면, 이송직원은 위탁기관에게 완료 사실을 통보하여 주십시오.</b>
											</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content4">
								<h1>면역병리검사</h1>
								<p>주의사항</p>

								<p class="orange_p">※ PD-L1 pharm Dx 22 C3 immunohistochemistry 의뢰 시 주의사항</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td>전용의뢰서와 병리결과보고서를 함께 보내 주십시오.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>H&E slide 1장과 unstained slide 2장 이상을 보내주십시오. Unstained slide 제작 날짜를 표기 해 주시기 바랍니다.</td>
										</tr>

										<tr>
											<td class="n_td">3)</td>
											<td>Unstained slide는 냉장 상태를 유지해 주시기 바랍니다.</td>
										</tr>

									</tbody>
								</table>


							</div>

						</div>
						<!--//tab menu09 End-->

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
		}
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
		});
	
		
		
		$(document).ready(function(){
			
			
			$(".tab-link").click(function(){
				fnSetHash($(this).data('link'));
			});
			
			
			checkHash();
		});
	
	</script>
</body>
</html>
