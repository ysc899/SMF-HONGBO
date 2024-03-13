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
	<link href="<c:url value='/user/css/02_sub02_A_en.css'/>" type="text/css" rel="stylesheet"/>

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
					<p>Diagnostic Laboratory Center</p>
					<span>
										: Performs diagnosis, analysis and R&D in life and environmental science <br/>by introducing special equipment for the health of mankind.
									</span>
				</div>

				<div class="check_room room01">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room/A_01.png'/>" alt="검사실이미지"/></th>
							<td>
								<p>Clinical Chemistry</p>
								<!-- <span>Chemical method using serum and body fluids are used for diagnosis and observation of a variety of diseases.</span> -->
								<%--											<b>&nbsp;&nbsp;• Liver function tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Lipid tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Renal function tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Diabetes test</b>--%>
								<%--											<b>&nbsp;&nbsp;• Urine chemistry tests, etc.</b>--%>
								<b>Liver function tests, Lipid tests, Renal function tests, Diabetes test, Urine chemistry tests, etc.</b>

								<span class="check_roombt check_popupbt" style="margin-bottom:25px;">Equipment</span>
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
								<p>Hematology</p>
								<!-- <span>Observing the increase and decrease in the numbers of blood cell and morphological changes, the Team performs basic
                                 and essential tests for the diagnosis of hematologic diseases. And tests are related to blood coagulation and transfusion
                                 medicine as well.</span> -->
								<%--											<b>&nbsp;&nbsp;• Complete blood cell count tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Coagulation tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Blood Bank tests, etc.</b>--%>
								<b>Complete blood cell count tests, Coagulation tests, Blood Bank tests, etc.</b>

								<span class="check_roombt check_popupbt2">Equipment</span>
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
								<p style="margin-bottom:20px;">Microbiology</p>
								<!-- <span>The Team isolates and identifies causative pathogens by using the samples collected from patients infected with various microorganisms such as bacteria, fungi, viruses
                                 and parasites, and then reports the results of antimicrobial susceptibility
                                  test to provide information for appropriate prescription of patients. All testing procedure, result analysis and reporting
                                   process are conducted in accordance to Clinical and Laboratory Standards Institute (CLSI) Guideline. </span> -->
								<b>Gram stain, Bacteria culture & identification, Mycobacterium tuberculosis culture,<br/> Fungus culture, Virus culture, Parasite, etc.</b>
								<%--											   <table class="b_table">--%>
								<%--											   	<tbody>--%>
								<%--											   	 <tr>--%>
								<%--											   	  <td><b>&nbsp;&nbsp;• Gram stain</b></td>--%>
								<%--											   	  <td><b>&nbsp;&nbsp;• Bacteria culture & identification</b></td>--%>

								<%--											   	 </tr>--%>

								<%--											   	 <tr>--%>
								<%--											   	  <td><b>&nbsp;&nbsp;• Mycobacterium tuberculosis culture</b></td>--%>
								<%--											   	  <td><b>&nbsp;&nbsp;• Fungus culture</b></td>--%>
								<%--											   	 </tr>--%>
								<%--											   	 --%>
								<%--											   	 <tr>--%>
								<%--											   	  <td><b>&nbsp;&nbsp;• Virus culture</b></td>--%>
								<%--											   	  <td><b>&nbsp;&nbsp;• Parasite, etc.</b></td>--%>
								<%--											   	 </tr>--%>

								<%--											   	</tbody>--%>
								<%--											   </table>--%>

								<span class="check_roombt check_popupbt3" style="margin-top:20px;">Equipment</span>
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
								<p style="margin-top:20px;">Radioimmunology</p>
								<!-- <span>The Team performs tumor marker test, congenital anomaly tests, hepatitis tests, allergy tests, and various endocrine diagnostic tests
                                 using radioactive isotope (RIA) labeled antigens and antibodies.</span> -->
								<%--											<b>&nbsp;&nbsp;• Pituitary hormone tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Tumor markers tests</b>--%>
								<%--											<b>&nbsp;&nbsp;• Adrenocortical function tests, etc.</b>--%>
								<b>Pituitary hormone tests, Tumor markers tests, Adrenocortical function tests, etc.</b>
								<span class="check_roombt check_popupbt4" style="margin-top:20px;">Equipment</span>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!--//tab-1 End-->

			<!--tab2-->
			<div id="tab-2" class="tab-content tab_common _contentView">

				<div class="sub_summury02 sub_summury_text">
					<p>Life & Environmental Science Center</p>
					<span>
										: Performs diagnosis, analysis and R&D in life and<br/> environmental science by introducing special equipment for the health of mankind.
						<!-- Perform diagnosis, analysis and<br/>
                        R&D in life and environmental science by introducing special equipment for the health of mankind. -->
									</span>
				</div>

				<div class="check_room room01">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<%-- <th><img src="<c:url value='/user/img/check_room/B_01.jpg'/>" alt="검사실이미지"/></th> --%>
							<th><img style="width: 510px; height: 300px;" src="<c:url value='/user/img/homepage_en_7.jpg'/>" alt="검사실이미지"/></th>
							<td>
								<p>Industrial hygiene analysis</p>
								<b>• Biological exposure monitoring in the workplace,</b>
								<b>• Environmental exposure measurement and sample</b>
								<b>• analysis, Occupational hygiene consultation </b>

								<span class="check_roombt check_popupbt6">Equipment</span>
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
								<p>Metabolomic analysis / Trace elements analysis</p>

								<!--
                                <span>The team sets the state-of-the-art physicochemical analyzers and specialized facilities for the analysis of biological samples.
                                Also It conducts the clinical analysis, national research projects and designated projects in the field of clinic, environment and health.</span>
                                -->
								<b>• [Metabolomic analysis]<br/>
									Newborn screening tests, Lysosomal storage disease screening tests,<br/>
									Catecholamines and related neurotransmitters assays, Vitamins assays, Drug concentration
									and&therapeutic drug monitoring assays</b>
								<br/>
								<b>• [Trace elements analysis]<br/>
									Analysis of hazardous heavy metals and trace elements in bio-samples,
									Dialysis fluid analysis, Water silicate tests, Biological exposure monitoring in the workplace (heavy metals)</b>



								<!-- 											<b style="display:inline;">ㆍTest for congenital metabolic disorders (55 types for Tandom mass,<br/> -->
								<!-- 											 6 types for the Ministry of Welfare)</b> -->
								<!-- 											<b>ㆍCatecholamine test</b> -->
								<!-- 											<b>ㆍVitamin test</b> -->
								<!-- 											<b>ㆍTest of hazardous heavy metals in biological specimen</b> -->
								<!-- 											<b>ㆍTest of hazardous heavy metals in environmental specimen</b> -->
								<!-- 											<b>ㆍClinical index metal test</b> -->
								<!-- 											<b>ㆍTest service for research</b> -->

								<span class="check_roombt check_popupbt7">Equipment</span>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<!--
						<div class="check_room room03">
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<th><img src="<c:url value='/user/img/check_room/B_03.jpg'/>" alt="검사실이미지"/></th>
										<td>
											<p style="line-height:1.2em;background:url(/user/img/sub/red_bar2.png) no-repeat 0 5px;">Special medical diagnosis</p>

											<b>[Special medical diagnosis] biological exposure indicator test</b>
											<b>[Special medical diagnosis] consultation service of occupational medicine specialist</b>

										</td>
									</tr>
								</tbody>
							</table>

						</div>
-->
			</div>
			<!--//tab-2 End-->

			<!--tab3-->
			<div id="tab-3" class="tab-content tab_common _contentView">

				<div class="sub_summury03 sub_summury_text">
					<p>Molecular Diagnosis Center</p>
					<span>
									: Diagnoses various diseases using molecular biological technologies (realtime PCR, sequencing, NGS, etc.), and<br/>
									 striving to develop new genetic diagnostics.
									</span>
				</div>

				<div class="check_room room01">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room/C_01.jpg'/>" alt="검사실이미지"/></th>
							<td>
								<p>Molecular Microbiology</p>
								<!-- <span>The team has implemented ‘ONE DAY Diagnostic System’ which reports <br/>
                                the results of molecular diagnostics in a single day for the first time in Korea<br/>
                                and are certified by a national standardized quality control agency for <br/>
                                keeping continuous quality management clinical diagnostics technology to perform laboratory test. </span> -->
								<b>COVID-19 tests, MERS-CoV PCR tests, Zika virus PCR tests,<br/>
									Pneumonia bacteria and respiratory virus tests, <I>Helicobacter pylori</I><br/>
									(including Clarithromycin resistance) tests, diarrhea bacteria and<br/>
									virus PCR tests, MTB real-time PCR tests, STI multiplex real-time<br/>
									PCR tests, HPV genotype real-time PCR tests, Influenza A&B virus<br/>
									PCR tests, CMV real-time PCR tests, EBV real-time PCR tests, HBV<br/>
									PCR tests, HCV PCR tests, etc.
								</b>
								<span class="check_roombt check_popupbt8">Equipment</span>
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
								<p>Molecular Genetics</p>
								<span>: Performs genetic testing for the selection of medicine related to various genetic diseases and cancer,<br/>
											 and provides high-quality test results by thorough evaluation.</span>
								<b>Genetic disease tests, prenatal genetic tests and genetic tests for infants,<br/>
									cancer gene tests, pharmacogenetic tests, DNA identification tests, etc.<br/>
								</b>
								<span class="check_roombt check_popupbt9">Equipment</span>
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
								<p>Cytogenetics</p>
								<span>: Provides high-quality cytogenetic test results such as blood tumor FISH Panel tests,<br/>
											 based on the state-of-the-art automated karyotype analysis system.
												</span>
								<b>Prenatal chromosome tests, congenital chromosome tests,<br/>
									Hematologic tumor chromosome tests, prenatal FISH test,<br/>
									hematologic tumor FISH test, tissue FISH test, etc.<br/>
								</b>
								<b>Chromosomal Microarray Analysis, CMA</b>


								<span class="check_roombt check_popupbt10">Equipment</span>
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
							<th><img style="width: 510px; height: 300px;" src="<c:url value='/user/img/homepage_en_11.jpg'/>" alt="검사실이미지"/></th>
							<td>
								<p>Molecular diagnostics research</p>
								<span>: Develops new tests and conducts clinical research to standardize the diagnostic algorithm for various diseases.
											</span>
								<b>[Clinical research]<br/>
									<!-- &nbsp;• Develop reagents for new tests based on trained manpower and<br/>
                                    &nbsp;&nbsp;&nbsp;patented technology in molecular diagnosis<br/>
                                    &nbsp;• Develop reagents for treating genetic diseases and infectious diseases <br/>
                                    &nbsp;• Strict quality control of diagnostic reagents based on standardized production and QC process  -->
									• Conducts clinical researches for the standardization of the algorithm for diagnosis of genes<br/>
									&nbsp;&nbsp;and bacteria that cause various diseases<br/>
									• Performs clinical research on in vitro medical devices<br/>
									• Conducts cooperative researches with leading research institutions and hospitals at domestic<br/>
									&nbsp;&nbsp;and abroad
								</b>
								<br/>
								<b>&nbsp;&nbsp;[R&D]<br/>
									<!-- &nbsp;• Conduct clinical researches for the standardization of the algorithm<br/>
                                    &nbsp;&nbsp;&nbsp;for diagnosis of genes and bacteria that cause various diseases<br/>
                                    &nbsp;• Perform clinical research on in vitro medical devices<br/>
                                    &nbsp;• Conduct cooperative researches with leading research institutions and<br/>
                                    &nbsp;&nbsp;&nbsp;hospitals at domestic and abroad -->
									• Develops reagents for new tests based on trained manpower and patented technology in<br/>
									&nbsp;&nbsp;molecular diagnosis<br/>
									• Develops reagents for treating genetic diseases and infectious diseases<br/>
									• Strict quality control of diagnostic reagents based on standardized production and <br/>
									&nbsp;&nbsp;QC process
								</b>
								<!-- <span class="check_roombt check_popupbt11">Equipment</span> -->
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<div class="check_room room05">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room/C_04.JPG'/>" alt="검사실이미지"/></th>
							<td>
								<p>Next-Generation Sequencing (NGS)</p>
								<span>: Diagnoses genetic diseases and evaluates prognosis with Next-Generation Sequencing (NGS). It can quickly report a large amount of genetic information by amplifying and analyzing a large number of nucleotide sequences at the same time.</span>

								<b>Hereditary disorder panel, metagenomics analysis, <br/>
									whole exome sequencing (WES) and whole genome sequencing (WGS) analysis
								</b>

								<span class="check_roombt check_popupbt11">Equipment</span>
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
					<p>Diagnostic Immunology Center</p>
					<span>
										: Investigates diagnostic values to provide better immunological assays through<br/>
										  a total laboratory automation (TLA) system and special immunological methods
									</span>
				</div>

				<div class="check_room room01">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<%-- <th><img src="<c:url value='/user/img/check_room/D_01.jpg'/>" alt="검사실이미지"/></th> --%>
							<th><img style="width: 510px; height: 300px;" src="<c:url value='/user/img/homepage_en_12.jpg'/>" alt="검사실이미지"/></th>
							<td>
								<p style="margin-bottom:20px;">Immunology</p>
								<span>: Conducts automated immunological tests through a state-of-the-art TLA system</span>
								<b>Cardiovascular disease, Hormone, Drug, <br/>
									Bone metabolism, Tumor markers tests, etc.</b>
								<span class="check_roombt check_popupbt12" style="margin-top:20px;margin-bottom:0;">Equipment</span>
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
								<p style="margin-bottom:20px;">Special lmmunology</p>
								<span>
											: Specialized in</br>
											</span>
								<b>• Autoimmune assays: autoantibody tests with various cell lines such as AIT, ANA, ANCA, <br/>&nbsp;&nbsp;FTA-ABS, Islet cell and LKM, etc.</br>
									• Latent tuberculosis assays: T-SPOT.TB & QuantiFERON-TB tests</br>
									• Antibodies assays for infectious diseases including COVID-19 </br>
									• Cellular immunological assays: Flow cytometry, ELISpot test, PBMCs separation and storage</br>
								</b>
								<b>Prenatal screening, autoantibodies, latent tuberculosis,<br/>
									Immunoglobulin, flow cytometry, allergy tests, etc.
								</b>
								<span class="check_roombt check_popupbt13" style="margin-top:20px;margin-bottom:0;">Equipment</span>
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
					<p>Pathology Center</p>
					<span>
										: Provides pathological services using latest advances in pathology.
									</span>
				</div>

				<div class="check_room room01">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th><img src="<c:url value='/user/img/check_room/E_01.jpg'/>" alt="검사실이미지"/></th>
							<td>
								<p>Surgical pathology</p>
								<span>: Pathological diagnosis of tissues obtained by resection or biopsy</span>
								<b>
									Gross examination, microscopic examination,<br/>
									special stainings, and immunohistochemistry
								</b>

								<span class="check_roombt check_popupbt14" style="margin-top:20px;">Equipment</span>
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
								<p>Cytopathology</p>
								<b>
									Exfoliative cytology (pap smear, sputum, urine and body fluid) and fine needle aspiration<br/>
									cytology : FNAB, FNAC (thyroid, breast, salivary glands, lymph nodes, lung and chest,<br/>
									liver and abdomen)
								</b>

								<span class="check_roombt check_popupbt15" style="margin-top:20px;">Equipment</span>
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
								<p>Immunopathology</p>
								<span>: Uses antigen-antibody reaction to analyze cellular protein expression patterns<br/>
											: Enables more accurate diagnosis, determining a treatment plan and estimating prognosis
											</span>
								<b>
									More than 60 antibodies (PD-L1, etc.)
								</b>

								<span class="check_roombt check_popupbt16">Equipment</span>
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
								<p>Molecular pathology</p>
								<span>: Extracts nucleic acids from tissues and cells from the pathological lesion and analyzes molecular changes at the gene level</span>
								<b>FISH (<I>Her-2</I>, <I>c-myc</I>, <I>ALK</I> gene rearrangement, <I>ROS1</I> gene rearrangement)</b>
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

<!---------------------------------------------------------popup_Area --------------진단검사의학센터------------------------------>

<!--popup1-->
<div id="modal" class="modal">
	<div id="popup">
		<div class="popup_title">
			<span id="paper_name">Clinical Chemistry</span>
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
			<span id="paper_name">Hematology</span>
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
			<span id="paper_name">Microbiology</span>
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
			<span id="paper_name">Radioimmunology</span>
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
			<span id="paper_name">Industrial Hygiene Analysis</span>
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
			<span id="paper_name">Metabolomic & Inorganic Analysis</span>
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
			<span id="paper_name">Molecular Microbiology</span>
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
			<span id="paper_name">Molecular Genetics</span>
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
			<span id="paper_name">Cytogenetics</span>
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
			<span id="paper_name">NGS</span>
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
			<span id="paper_name">Immunology</span>
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
			<span id="paper_name">Special lmmunology</span>
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
			<span id="paper_name">Histopathology</span>
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
			<span id="paper_name">Cytopathology</span>
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
			<span id="paper_name">Immunopathology</span>
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
				<img src="/user/img/check_room/popup_tree_2.png"></img>
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
						<th>[구분]</th>
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
						<td>행정업무(결과처리),폐활량&청력검사</td>
						<td>간호사</td>
						<td>-</td>
						<td>02-2218-9198</td>
					</tr>

					<tr>
						<td>김상화</td>
						<td>행정업무(결과처리),폐활량검사</td>
						<td>간호사</td>
						<td>-</td>
						<td>02-2218-9196</td>
					</tr>
					<tr>
						<td>신윤정</td>
						<td>행정업무(결과처리)</td>
						<td>간호사</td>
						<td>-</td>
						<td>02-2218-9197</td>
					</tr>

					<tr>
						<td>황보기량</td>
						<td>채혈,검체관리</td>
						<td>임상병리사</td>
						<td>-</td>
						<td>02-2218-9198</td>
					</tr>
					<tr>
						<td>김희선</td>
						<td>채혈,검체관리</td>
						<td>임상병리사</td>
						<td>-</td>
						<td>02-2218-9198</td>
					</tr>

					<tr>
						<td>최현준</td>
						<td>분석(무기/유기)</td>
						<td>분석사</td>
						<td>-</td>
						<td>02-2218-9197</td>
					</tr>

					<tr>
						<td>장지원</td>
						<td>분석(무기/유기)</td>
						<td>산업위생관리기사</td>
						<td>-</td>
						<td>02-2218-9196</td>
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
