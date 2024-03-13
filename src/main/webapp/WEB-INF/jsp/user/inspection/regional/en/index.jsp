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
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/02_sub03_A_en.css'/>" type="text/css" rel="stylesheet"/>

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
	<jsp:include page="../../../include/header_en.jsp" flush="true"></jsp:include>
	<%-- <jsp:include page="../../../include/login_header_en.jsp" flush="true"></jsp:include> --%>
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
			<p class="central_tab"><c:out value="${childMenuName }"/></p>
		</div>


		<div class="sub_story">
			<ul class="tabs">
				<li class="tab-link no_bottom _centerRow _centerMenu_1  _tab_1" data-view="1">Busan & Gyeongnam Laboratory Center</li>
				<li class="tab-link no_bottom _centerRow _centerMenu_2  _tab_2" data-view="2">Daegu & Gyeongbuk Laboratory Center</li>
				<li class="tab-link no_bottom _centerRow _centerMenu_3  _tab_3" data-view="3">Gwangju & Honam Laboratory Center</li>
				<li class="tab-link no_bottom _centerRow _centerMenu_5  _tab_5" data-view="5">Daejeon & Chungcheong Laboratory Center</li>
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
								<b class="center_img_bt1">View</b></td>
							<td class="td_up">
								<div>
									<p>Busan & Gyeongnam Laboratory Center</p>
									<span>
													: Busan & Gyeongnam Laboratory Center is a reference laboratory center representing Busan Metropolitan City and Gyeongsangnam-do.
													 It delivers high-quality testing results with routine laboratory tests, molecular diagnosis and pathological tests all day and night.
												</span>
								</div>
							</td>
						</tr>

						<tr>
							<td class="td_down">
								<p>Introduction</p>
								<ul>
									<li>1. Provides quick test results with real-time sample transport and testing.</li>
									<li>2. Implements a system for urgent tests.</li>
									<li style="font-weight:bold;margin-left:12px;"> ※ For inquiries on the urgent tests, call +82)1566-6500</li>
									<li>3. Reports test results within 24 hours by introducing the ONE DAY testing<br/>&nbsp;&nbsp;&nbsp;&nbsp;system.</li>
									<li>4. Pursues perfection in the quality of laboratory tests with a quality control.</li>
								</ul>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<div class="check_room room01">
					<p>Test areas</p>
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room2/1A_sub.png'/>" alt="검사실이미지"/></th>
							<td>
								<p>Laboratory Medicine</p>
								<span>: Provides quick and accurate test results with a state-of-the-art total<br/>
											 laboratory automation system and a 24-hour laboratory.</span>
								<div class="check_roomdiv">
									<div>
										<strong>[Clinical Chemistry]</strong>
										<b>Liver function tests, Lipid tests, Renal function tests, Diabetes test, <em style="margin-left:124px;display:inline-block"></em>Urine chemistry tests, etc.</b>
									</div>

									<div>
										<strong>[Immunology]</strong>
										<b>Cardiovascular disease, Hormone, Drug, Bone metabolism, Tumor markers <em style="margin-left:91px;display:inline-block;"></em>tests, etc.</b>
									</div>

									<div>
										<strong>[Microbiology]</strong>
										<b>Gram stain, Bacteria culture & identification, Mycobacterium tuberculosis <em style="margin-left:91px;display:inline-block;"></em>culture, Fungus culture, Virus culture, Parasite, etc.</b>
									</div>

									<div>
										<strong>[Hematology]</strong>
										<b>Complete blood cell count tests, Coagulation tests, Blood Bank tests, etc.</b>
									</div>
								</div>
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
								<p>Molecular Diagnosis</p>
								<span>: Diagnoses various diseases using molecular biological technologies and reports test
											 results within 24 hours by introducing the ONE DAY testing system.</span>
								<!-- <b><i style="font-size:15px;font-weight:600;">PCR검사</i> : 세균성 뇌수막염 PCR 검사, 급성설사 원인균 PCR 검사<br/> -->
								<br/>
								<!-- <b><i style="font-size:15px;font-weight:600;">Realtime PCR test</i> -->

								<div class="check_roomdiv2">
									<b>
										COVID-19 tests, MERS-CoV PCR tests, Zika virus PCR tests, Pneumonia bacteria and respiratory virus tests,
										<i style="font-style:italic;">Helicobacter pylori</i> (including Clarithromycin resistance) tests, Diarrhea bacteria and virus PCR tests,
										MTB real-time PCR tests, STI multiplex real-time PCR tests, HPV genotype real-time PCR tests,
										Influenza A&B virus PCR tests, CMV real-time PCR tests, EBV real-time PCR tests, HBV PCR tests, HCV PCR tests, etc.
									</b>
								</div>
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
								<p>Pathology</p>
								<span>Provides pathological services using latest advances in pathology.</span>

								<div class="check_roomdiv2">
									<b> FISH, PD-L1, Immunohistochemistry Stain, frozen section</b>
								</div>
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


				<%-- <div class="content_inner02">
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
                </div> --%>

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
								<b class="center_img_bt2">View</b></td>
							<td class="td_up">
								<div>
									<p>Daegu & Gyeongbuk Laboratory Center</p>
									<span>: Daegu & Gyeongbuk Laboratory Center is a high-quality laboratory center for Daegu Metropolitan City and Gyeongsangbuk-do. It supports the clinical diagnosis of hospitals and clinics with customized testing services.</span>
								</div>
							</td>
						</tr>

						<tr>
							<td class="td_down">
								<p>Introduction</p>
								<ul>
									<li>1. Provides accurate results by thoroughly controlling the quality and stability<br/>&nbsp;&nbsp;&nbsp;&nbsp; of samples.</li>
									<li>2. Operates the urgent test system and provides test results just like<br/>&nbsp;&nbsp;&nbsp;&nbsp;a clinical test room in hospitals and clinics.</li>
									<li>3. Provides quick test results with real-time sample transport and testing.</li>
									<li>4. Pursues localization and specialization of the laboratory testing and<br/>&nbsp;&nbsp;&nbsp;&nbsp;contributes to the development of medicine in Daegu and Gyeongbuk.</li>
								</ul>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<div class="check_room room04">
					<p>Test areas</p>
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room2/2A_sub.png'/>" alt="검사실이미지"/></th>
							<td>
								<p>Laboratory Medicine</p>
								<span>: Provides quick and accurate test results with a state-of-the-art total laboratory automation system and a 24-hour laboratory.</span>
								<div class="check_roomdiv">
									<div>
										<strong>[Clinical Chemistry]</strong>
										<b>Liver function tests, Lipid tests, Renal function tests, Diabetes test, <em style="margin-left:124px;display:inline-block"></em>Urine chemistry tests, etc.</b>
									</div>

									<div>
										<strong>[Immunology]</strong>
										<b>Cardiovascular disease, Hormone, Drug, Bone metabolism, Tumor markers <em style="margin-left:91px;display:inline-block;"></em>tests, etc.</b>
									</div>

									<div>
										<strong>[Hematology]</strong>
										<b>Complete blood cell count tests, Coagulation tests, Blood Bank tests, etc.</b>
									</div>
								</div>
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
								<p>Molecular Diagnosis</p>
								<span>: Diagnoses various diseases using molecular biological technologies and reports test results within 24 hours by introducing the ONE DAY testing system.</span>

								<div class="check_roomdiv2">
									<b>
										COVID-19 tests, MERS-CoV PCR tests, Zika virus PCR tests, Pneumonia bacteria and respiratory virus tests,
										<i style="font-style:italic;">Helicobacter pylori</i> (including Clarithromycin resistance) tests, Diarrhea bacteria and virus PCR tests,
										MTB real-time PCR tests, STI multiplex real-time PCR tests, HPV genotype real-time PCR tests,
										Influenza A&B virus PCR tests, CMV real-time PCR tests, EBV real-time PCR tests, HBV PCR tests, HCV PCR tests, etc.
									</b>
								</div>
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
								<p>Pathology</p>
								<span>Provides pathological services using latest advances in pathology.</span>

								<div class="check_roomdiv2">
									<b> FISH, PD-L1, Immunohistochemistry Stain</b>
								</div>
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


				<%-- <div class="check_room room07">
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

                </div> --%>


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
								<b class="center_img_bt3" style="bottom:34px;">View</b></td>
							<td class="td_up">
								<div>
									<p>Gwangju & Honam Laboratory Center
									</p>
									<span>: Gwangju & Honam Laboratory Center is established in June 2020 in Haengam-dong, Nam-gu, Gwangju Metropolitan City. It is the reference laboratory center with the state-of-the-art testing system and excellent manpower.</span>
								</div>
							</td>
						</tr>

						<tr>
							<td class="td_down">
								<div>
									<p>Introduction</p>
									<ul>
										<li>1. Conducts customized diagnosis tests by operating the laboratory 24 hours a<br/>&nbsp;&nbsp;&nbsp; day and introducing the urgent test system.</li>
										<li>2. Provides one-stop customer support services, as a central laboratory is <br/>&nbsp;&nbsp;&nbsp;&nbsp;available.</li>
										<li>3. Pursues perfection in the quality of laboratory tests with a quality control.</li>
									</ul>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<div class="check_room room08">
					<p>Test areas</p>
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room2/3A_sub.png'/>" alt="검사실이미지"/></th>
							<td>
								<p>Laboratory Medicine</p>
								<span>: Provides quick and accurate test results with a state-of-the-art total laboratory automation system and a 24-hour laboratory.</span>
								<div class="check_roomdiv">
									<div>
										<strong>[Clinical Chemistry]</strong>
										<b>Liver function tests, Lipid tests, Renal function tests, Diabetes test, <em style="margin-left:124px;display:inline-block"></em>Urine chemistry tests, etc.</b>
									</div>

									<div>
										<strong>[Immunology]</strong>
										<b>Cardiovascular disease, Hormone, Drug, Bone metabolism, Tumor markers <em style="margin-left:91px;display:inline-block;"></em>tests, etc.</b>
									</div>

									<div>
										<strong>[Hematology]</strong>
										<b>Complete blood cell count tests, Coagulation tests, Blood Bank tests, etc.</b>
									</div>
								</div>
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
								<p>Molecular Diagnosis</p>
								<span>: Diagnoses various diseases using molecular biological technologies and reports test results within 24 hours by introducing the ONE DAY testing system.</span>

								<div class="check_roomdiv2">
									<b>
										COVID-19 tests, MERS-CoV PCR tests, Zika virus PCR tests, Pneumonia bacteria and respiratory virus tests,
										<i style="font-style:italic;">Helicobacter pylori</i> (including Clarithromycin resistance) tests, Diarrhea bacteria and virus PCR tests,
										MTB real-time PCR tests, STI multiplex real-time PCR tests, HPV genotype real-time PCR tests,
										Influenza A&B virus PCR tests, CMV real-time PCR tests, EBV real-time PCR tests, HBV PCR tests, HCV PCR tests, etc.
									</b>
								</div>
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
								<p>Pathology</p>
								<span>Provides pathological services using latest advances in pathology.</span>

								<div class="check_roomdiv2">
									<b> FISH, PD-L1, Immunohistochemistry Stain, frozen section</b>
								</div>
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
								<b class="center_img_bt5">View</b></td>
							<td class="td_up">
								<div>
									<p>Daejeon & Chungcheong Laboratory Center</p>
									<span>: Daejeon & Chungcheong Laboratory Center, established to build a regional diagnostic testing system, provides high-quality testing services to Daejeon Metropolitan City and Chungcheong region</span>
								</div>
							</td>
						</tr>

						<tr>
							<td class="td_down">
								<p>Introduction</p>
								<ul>
									<li>1. Provides accurate testing results by thoroughly controlling the quality <br/>&nbsp;&nbsp;&nbsp;&nbsp;and stability of samples.</li>
									<li>2. Provides quick test results with real-time sample transport and testing.</li>
									<li>3. Operates the urgent test system and provides test results just like a clinical<br/>&nbsp;&nbsp;&nbsp;&nbsp;test laboratory in hospitals and clinics.</li>
									<li>4. Pursues localization and specialization of the laboratory testing and<br/>&nbsp;&nbsp;&nbsp;&nbsp;contributes to the development of medicine in to Daejeon Metropolitan City<br/>&nbsp;&nbsp;&nbsp;&nbsp;and Chungcheong region.</li>
								</ul>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<div class="check_room room04">
					<p>Test areas</p>
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room2/5A_subsub.png'/>" alt="검사실이미지"/></th>
							<td>
								<p>Laboratory Medicine</p>
								<span>: Provides quick and accurate test results with a state-of-the-art total laboratory automation system and a 24-hour laboratory.</span>
								<div class="check_roomdiv">
									<div>
										<strong>[Clinical Chemistry]</strong>
										<b>Liver function tests, Lipid tests, Renal function tests, Diabetes test, <em style="margin-left:124px;display:inline-block"></em>Urine chemistry tests, etc.</b>
									</div>

									<div>
										<strong>[Immunology]</strong>
										<b>Cardiovascular disease, Hormone, Drug, Bone metabolism, Tumor markers <em style="margin-left:91px;display:inline-block;"></em>tests, Allergy tests, etc.</b>
									</div>

									<div>
										<strong>[Hematology]</strong>
										<b>Complete blood cell count tests, Coagulation tests, Blood Bank tests, etc.</b>
									</div>

									<div>
										<strong>[Urinalysis]</strong>
										<b>Routine Urinalysis and Drug Urine tests, Semen analysis, etc.</b>
									</div>
								</div>
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
								<p>Molecular Diagnosis</p>
								<span>: Diagnoses various diseases using molecular biological technologies and reports test results within 24 hours by introducing the ONE DAY testing system.</span>
								<div class="check_roomdiv2">
									<b>
										COVID-19 tests, MERS-CoV PCR tests, Zika virus PCR tests, Pneumonia bacteria and respiratory virus tests,
										<i style="font-style:italic;">Helicobacter pylori</i> (including Clarithromycin resistance) tests, Diarrhea bacteria and virus PCR tests,
										MTB real-time PCR tests, STI multiplex real-time PCR tests, HPV genotype real-time PCR tests,
										Influenza A&B virus PCR tests, CMV real-time PCR tests, EBV real-time PCR tests, HBV PCR tests, HCV PCR tests, etc.
									</b>
								</div>
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
								<p>Microbiology</p>
								<span>: Microbiology laboratory offers various infectious disease diagnostic assays for bacteria, viruses, mycobacteria and fungi. Perform tests for pathogen culture and identification, antimicrobial susceptibility testing.
								</span>
								<div class="check_roomdiv2">
									<b>
										Gram stain, Bacteria culture & identification, Mycobacterium tuberculosis culture, Fungus culture, Virus culture, Parasite, etc.
									</b>
								</div>
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
								<p>Pathology</p>
								<span>: Provides pathological services using latest advances in pathology.
								</span>
								<div class="check_roomdiv2">
									<b>
										Pathology and Cytology tests , Special stain, frozen section tests, ect.
									</b>
								</div>
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
	<%--			<jsp:include  page="../../include/rolling.jsp"></jsp:include >--%>

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

<!--부산팝업-->
<div id="modal_p1" class="modal">
	<div id="popup">
		<div class="popup_title">
			<span id="paper_name">Busan & Gyeongnam Laboratory Center</span>
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
			<span id="paper_name">Daegu & Gyeongbuk Laboratory Center</span>
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
			<span id="paper_name">Daejeon & Chungcheong Laboratory Center</span>
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
			<span id="paper_name">Gwangju & Honam Laboratory Center</span>
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
//커밋 테스트
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
