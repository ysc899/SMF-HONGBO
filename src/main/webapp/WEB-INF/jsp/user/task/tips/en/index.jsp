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
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/03_sub03_en.css'/>" type="text/css" rel="stylesheet"/>
	
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
					</div>

					<!--sub_story-->
					<div class="sub_story">
						<ul class="tabs">
							<li class="tab-link current no_bottom _tab_1" data-tab="tab-1" data-link="1">Blood</li>
							<li class="tab-link no_bottom _tab_2" data-tab="tab-2" data-link="2">Urine test</li>
							<li class="tab-link no_bottom _tab_3" data-tab="tab-3" data-link="3">Body fluid test</li>
							<li class="tab-link no_bottom _tab_4" data-tab="tab-4" data-link="4">Microbiological test</li>
							<li class="tab-link _tab_5" data-tab="tab-5" data-link="5" style="border-left:1px solid #ccc; line-height: 1.3em;">Test for congenital metabolic<br/>abnormalities test</li>
							<li class="tab-link _tab_6" data-tab="tab-6" data-link="6" style="border-left:0px solid #ccc;">Cytopathology test</li>
							<li class="tab-link _tab_7" data-tab="tab-7" data-link="7">Histopathology test</li>
							<li class="tab-link _tab_8" data-tab="tab-8" data-link="8">Cytogenetic test</li>
						</ul>
						
						<!--tab menu01-->
						<div id="tab-1" class="tab-content current">

							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:120px;">Blood</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul>
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>


							<div class="inner_content">
								<h1>Blood</h1>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td><b>Time of collection : </b>As the test result may vary according to change of physiological conditions such as meal and 
											exercies, it is general principle to collect blood on an empty stomach in the morning. For outpatients, collect at lest
											2 hours after a meal. After a strenuous exercise rest enough before collectio. If the same test is repeated for a patient,
											it is desirable to collect under the same condition and at the same time. 
											</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td>Generally, when collecting blood at the same time for various tests (whole blood, plasma, serum, etc.), calculate the
											quantity of blood to be collected in advance. Please refer to the quantity of specimen by test item.</td>
										</tr>
										<tr>
											<td colspan="2">
												<table>
													<tr>
														<th>Whole blood</th>
														<td>Collect quantity required for the test</td>
													</tr>
													<tr>
														<th>Serum (plasma)</th>
														<td>Collect about 3 times more than the required serum (plasma)</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="n_td">3)</td>
											<td>Do not apply Tourniquet for more than one minute, and collect the blood at a moderate speed to avoid bubbles.
											Concentration and hemolysis of blood may affect the test result.</td>
										</tr>
										<tr>
											<td class="n_td">4)</td>
											<td>Please check the specimen container by test item and collect it in the designated container. For continuous collection
											of blood in several tubes, please follow the "Blood collection sequence" as blow.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">

								<p>Collection sequence</p>

								<table>
									<tbody>

										<tr>
											<td class="n_td">5)</td>
											<td>In case of blood collection using a syringe, dispense the blood slowly so that the blood flows down the wall of the test
											container. (To avoid hemolysis)</td>
										</tr>

										<tr>
											<td class="n_td">6)</td>
											<td>Use an appropriate container for each anticoagulants it. As Silica particles are added inside wall of SST, shake the SSt
											like an anticoagulant tube.</td>
										</tr>

										<tr>
											<td class="n_td">7)</td>
											<td>Blood specimen should be collected and separated into serum or plasma (3000 rpm, for 10 minutes). The specimen
											should be refrigerated if it is difficult to collect on the same day.</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content4">

								<h1>Factors that cause errors in test result</h1>
								
								<b style="margin-bottom: 5px;">1. Bacterial Test</b>
								<span>If the anticoagulant and the blood are not mixed sufficiently, the hematological test will result in inaccurate results due to
								partial clotting. Therefore, when collecting blood in a container with anticoagulant, mix it well (1-2 minutes) and request 
								as soon as possible.</span>
								
								<b style="margin-bottom: 5px; padding-top:20px;">2. Hemolysis</b>
								<span>The reaction of hemoglobin with the intracellular substances due to hemolysis affects the result, causing increase of the
								value. therefore, attention should be paid when collecting and dispensing the blood. When collecting the blood with a 
								syringe, do not pull the piston too hard and open the tube's cap and remove the needle to pour down slowly into the
								wall of tube. In addition, centrifuge the specimen after 20 minutes after the collection.</span>

								<p class="red_table_title">Test items which the results are affected by hemolyzed specimen</p>
								<table>
									<tbody>

										<tr>
											<th>Increase</th>
											<th>Decrease</th>
										</tr>

										<tr>
											<td>Total protein, K, Iron, Inorganic P, Amylase, AST, ALT, LDH, Cholesterol etc.</td>
											<td class="no_right">Bilirubin, Lipase, APC  etc.</td>
										</tr>
									</tbody>
								</table>
								
								<b style="margin-bottom: 5px; padding-top:20px;">3. Hyperlipidemia turbidity</b>
								<span>Blood collected right after a meal may be turbid of Such turbidity may affect the lipid test, resulting in correct result(Increase).
								Therefore, according to the specimen, the blood collection should be performed after 12 hours fasting.</span>

								<p class="red_table_title">Test items affecting the result of postprandial blood sampling</p>
								<table>
									<tbody>

										<tr>
											<th>Increase</th>
											<th>Decrease</th>
										</tr>

										<tr>
											<td>Amount of urine. glucose(blood, urin). Trglyceride. Uric acid.
											Amylase. Insulin. Cholesterol. Lipoprotein. Catecholamine. 
											Aldosterone. VMA, Vitamin etc.</td>
											<td class="no_right">Hb, Hct, WBC, Total protein, Albumin, Iron etc.</td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>
						<!--//tab menu01 End-->

						<!--tab menu02-->
						<div id="tab-2" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:95px;">Urine test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:825px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>
						

							<div class="inner_content">

								<h1>Urine Test</h1>

								<table>
									<tbody>

										<tr>
											<td class="n_td">1)</td>
											<td><b>Random urine : </b>Take the medication urine of the first urine in the morning and request as soon as possible.
											Please refrigerate the specimen until transportation.</td>
										</tr>

										<tr>
											<td class="n_td">2)</td>
											<td><b>24 hours urine : </b> Urinate and discardat 08:00 in the morning. Collect 24 hours urine untill 08:00 next morning in a
											collection bag (Include urine at stool). Most the specimen can be stored in refrigerated condition. However, if it is 
											mandatory to add preservatives (refer to next page), first add it into the collection bag to collect the specimen.
											Mix well about 10ml of the 24 hours urine in a container for request (Fill in the volume of urine)</td>
										</tr>

									</tbody>
								</table>

							</div>

							<div class="inner_content2">
								<h1>Body fluid test</h1>
								<p>Pleural Ascitic, and Joint Fluid. which are easily coagulated after collection (excluding CSF), may cause a large error in cell
								count or chemistry test items when coagulated.</p>
								

								<table>
									<tbody>
										<tr>
											<th style="border-right: 1px solid #ccc;">Specimen container</th>
											<th>Test item</th>
										</tr>

										<tr>
											<td style="border-right: 1px solid #ccc;">EDTA tube</td>
											<td class="no_right">Body fluid analysis, Some of Chemistry items</td>
										</tr>
										<tr>
											<td style="border-right: 1px solid #ccc;">Plain tube</td>
											<td class="no_right">Chemistry items(If not clotted). Cytological test</td>
										</tr>
									</tbody>
								</table>
							</div>


							<div class="inner_content3">
								<p class="red_table_title">Available urine preservative by test item</p>
								<table>
									<thead>
										<tr>
											<th rowspan="2">Test name</th>
											<th colspan="7">24 hours urine preservative</th>
										</tr>
										<tr>
											<th>No preservative</th>
											<th>Toluene</th>
											<th>6N HCL</th>
											<th>50% Acetic acid</th>
											<th>Boric acid</th>
											<th>Na2 CO3</th>
											<th>HNO3</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>17-Kestosteroids</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>17-OHCS</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td class="red">5-HIAA*</td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td>Alodosterone</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Aluminum(Al)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td>Arsenic(As)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td>RUN</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Cadmium(Cd)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>calcium(Ca)</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td class="red">Catecholamine*</td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td class="red">Chloride(Cl)</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Citrate</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Cobalt(Co)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Copper(Cu)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td>Cortisol</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Creatine</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Creatinine</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Cyclic AMP(cAMP)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td class="red">HVA(Homovanilic acid)*</td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Hydroxyproline, free</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Hydroxyproline, total</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
										</tr>
										<tr>
											<td>Lead(Pb)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td>Magnesium(Mg)</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Mercury(Hg)</td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td class="red">Metanephrine*</td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Microablumin</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Osmolality</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Oxalate</td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Porphobilinogen</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Potassium(K)</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Protein E.P</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Protein, total</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Uric acid</td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td class="red">VMA(Vanillymandelic acid)*</td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>Zinc(Zn)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
										</tr>
										<tr>
											<td>δ-ALA</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시"/></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="8">
												(<span style="color:#f46611;">*</span>:Preservative essential, <img src="<c:url value='/user/img/sub/check_on.png'/>" style="vertical-align:-4px;" alt="체크표시"/>
												 : Recommended, <img src="<c:url value='/user/img/sub/check_on2.png'/>" style="vertical-align:1px;" alt="체크표시"/> : Possible)
											</td>
										</tr>
									</tfoot>
								</table>
							</div>

						</div>
						<!--//tab menu02 End-->

						<!--tab menu03-->
						<div id="tab-3" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:75px;">Body fluid test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:825px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>
							<div class="inner_content">
								<h1>Body fluid test</h1>
								<span><b>Body fluid : </b> Pleural, Ascitic, and Joint Fluid, which are easily coagulated after collection (excluding CSF), may cause a large
								error in cell count or chemistry test items when coagulated.</span>
								
								<ul>
									<li><b>Use of Edta bottle : </b> Some of Chemistry items</li>
									<li><b>Use of Plain tube : </b> Chemistry item (If not clotted). Cytological test</li>
									<li><b>Use of Heparin tube : </b> when detecting crystal in join fluid</li>
								</ul>
								
							</div>

						</div>
						<!--//tab menu03 End-->

						<!--tab menu04-->
						<div id="tab-4" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:50px;">Microbiological test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:825px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide.</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>

							<div class="inner_content">
								<h1>Microbiological test</h1>
								<h3>General precautions for microbiological test</h3>
								
								<h4>1. General Bacteriology test</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Fill in the clinical findings, suspected organisms, the type of specimen, the time of collection, and whether an
										antibiotic was administered in a request form. Further more make sure not to miss the information as the test
										operation differs according to the type of specimen and location of sampling.</li>
										<li>· Microbial specimens should be collected in a designated sterile container, and the operation should be performed aseptically.</li>
										<li>· Keep BHI in the refrigerator and Thioglycollate broth at room temperature. Thioglycollate broth should be replaced
										if the purple layer at the top of Tioglycollate broth occupies more than 1/3.</li>
										<li>· Use the Transport Medium for swab samples (ex. pus, discharge, etc.). When requesting a Gram stain at the same time, 
										take it on two swabs and put it in a transport medium.</li>
										<li>· All bacteriological specimens should be sent to our laboratory immediately after collection but keep them in a refrigerator 
										in an unavoidable case.</li>
										<li>· Specimen must be kept at room temperature for Meningococcus, Gonococcus culture.</li>
										<li>· In case of urine culture test, the colony is counted. Therefore, please note that if specimen collection is not appropriate
										there is no need to do the test. (Clean the urine tool well, then take the medium urine, and keep it refrigerated)</li>
										<li>· The date of report is as follows.</li>
									</ul>
									<ul style="padding-left:10px;">
										<li><b>①</b>Blood culture: 3 ~ 7 days (Final report takes 7 days)</li>
										<li><b>②</b>Culture except blood: 2 ~ 3 days later</li>
										<li><b>③</b>Culture of Mycobacterium tuberculosis: Interim report after 4 weeks (Final report 8 weeks)</li>
										<li><b>④</b>Fungal culture: Interim report every week (Final report 3 Weeks)</li>
									</ul>
								</div>
								<h4>2. Mycobacterium tuberculosis test</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li><b>Sputum:</b> Take the first sputum once in the morning. It is advisable to repeat the procedure for 3 ~ 5 days before the
										treatment begins. (Completely seal the container to prevent the specimen from flowing out of the container)</li>
										<li><b>Urine:</b> Take the first urine in the morning. 24 hours urine is not suitable.</li>
										<li><b>Gastric juice:</b>Collect after fasting for over 8 hours.</li>
										<li><b>Body fluid:</b> Collect asptically like general bacterial test</li>
									</ul>
								</div>
								
								<h3>Precautions for each specimen</h3>
								<h4>1. Urine</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Midstream urine, urine from catheter and suprapubic aspiration urine are used for bacterial culture.</li>
										<li>· The best specimen is the midstream urine, of the first urine in the morning. Wash the surroundings of urethra with
										soap water and then discard the first few ml and take 10ml of medium urine in an aseptic container.</li>
										<li>· Catheter urine may cause a nosocomial infection. Therefore, it is performed only for the patient who cannot urinate 
										or who requires aseptic operation.</li>
										<li>· Suprapubic aspiration is performed for the infant who is difficult to collect the urine or in the case of suspected
										anaerobic bacteria.</li>
										<li>· Foley Catheter tip is not cultured as the of urethra is contaminated with normal flora.</li>
										<li>· 24 hours urine is not cultured.</li>
										<li>· Refrigerate the specimen if it is delayed over 2 hours.</li>
									</ul>
								</div>
								<h4>2. Wound infection and abscess</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Purulent specimen collected with a syringe is recommended but a swab specimen taken from deep part of the
										lesion is acceptable.</li>
										<li>· Generally, two swab specimens are required for bacterial culture.</li>
										<li>· Refrigerate when delayed, but keep at room temperature when bacteria are anaerobically cultured</li>
									</ul>
								</div>
								<h4>3. Sputum, Tracheal aspirate and Throat</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Rinse the mouth with water and cough deeply before breakfast early in the morning, and take 5~10ml of sputum.</li>
										<li>· In case of having dry cough, inhale spray with 15% saline and 10% glycerin to induce sputum.</li>
										<li>· If the specimen contains saliva as determine the quality follows.</li>
									</ul>
								</div>
								
								<p>&lt;Murray and Washington's grading system for assessing the quality of sputum samples&gt; </p>

								<table>
									<thead>
										<tr>
											<th>Grade</th>
											<th>Epithelial cell</th>
											<th>WBC</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>&gt;25</td>
											<td>&lt;10</td>
										</tr>
										<tr>
											<td>2</td>
											<td>&gt;25</td>
											<td>10-25</td>
										</tr>
										<tr>
											<td>3</td>
											<td>&gt;25</td>
											<td>&gt;25</td>
										</tr>
										<tr>
											<td>4</td>
											<td>10-25</td>
											<td>&gt;25</td>
										</tr>
										<tr>
											<td>5</td>
											<td>&lt;10</td>
											<td>&gt;25</td>
										</tr>
										<tr>
											<td>6</td>
											<td>&lt;10</td>
											<td>&lt;10</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="3">
												★(Clinical Microbioloby Procedure Handbook. Washington DC: ASM, 2004: 3.2.1-3.2.1.19)<br/>
												Grade 1-3,6 : Unacceptable<br/>
												grade 4-6 : Acceptable
											</td>
										</tr>
									</tfoot>
								</table>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Put a cotton swab between tonsils and mucous membranes so that they do not reach the oral mucosa or the mucous
										membranes while pressing tongue with tongue depressor and ask the patient to pen the mouth with "ah" sound and
										gently rub the posterior pharynx or inflammatory tonsils to collect the specimen</li>
										<li>· If delivery is delayed, keep it in refrigerator (The specimen to detect Bordetella pertussis at room temperature)</li>
									</ul>
								</div>
								
								<h4>4. Stool</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· The stool specimen is good for Bacteriological test related to infectious diarrhea, but can be replaced with rectal
										swab specimen.</li>
										<li>· Collect the specimen in a clean container with a good stopper to avoid contamination by urine or toilet paper.</li>
										<li>· Collect the specimen which contains pus, blood and mucus.</li>
									</ul>
								</div>
								
								<h4>5. Blood</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Wait for one to two minutes to dry after thoroughly disinfecting the vascular skin with iodophor, iodine tincture,
										and chlorhexidine to collect the blood.</li>
										<li>· It is best to collect before having the chills but since the time is unpredictable.. Therefore, take immediately after fever
										and collect specimen 2~3 times from other areas at the same itme.</li>
										<li>· Do not collect blood only once from adult.</li>
										<li>·<b style="padding-left:2px;">Blood:</b>The appropriate ratio of the medium to blood is from 1:5 to 1:10. Usually, 10 ml of blood is collected from
										the vein once, and then the same amount is divided into the medium for aerobic and anaerobic culture to inoculate.</li>
										<li>· For children, take 1 to 5 ml of blood (No more than 1% of total blood volume) to inoculate the aerobic culture bottle.</li>
										<li>· the inoculated blood culture bottles should be kept at room temperature until they arrive at the laboratory.</li>
									</ul>
								</div>
								
								<h4>6. Genitourinary tracts</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Get into the cervix in one to two seconds and rub the wall for 10~30 seconds to collect and put it in a transportation medium.</li>
										<li>· Don't store the specimen to identify Neisseria gonorrhea in a refrigerator but at room temperature.</li>
										<li>· To diagnose C. trachomatis or gonorrhoeae in a male, put a cotton swab 2~4 cm into the urethra at least 2 hours 
										after urination and rotate for about 6 seconds to collect the urethral test specimen.</li>
									</ul>
								</div>
								
								<h4>7. Body fluid</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· For Cerebrospinal fluid, use the specimen from the second aseptic tube after skin disinfection as blood culture for
										gram stain and culture. (First aseptic tube: biochemical and serological test, third aseptic tube: for cell count)</li>
										<li>· Collect at least 0.5ml of Cerebrospinal fluid and make sure to keep at room temperature.</li>
										<li>· Take body fluids such as pleural fluid, ascites, pericardial fluid, and joint fluid with a syringe and sterilize the skin in 
										the same way as blood culture to collect specimen.<br/>
										Sterilize the skin in the same manner as blood culture and collect specimens.
										</li>
									</ul>
								</div>
								
								<h4>8. Catheter tip</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Intra-arterial or intravenous catheter</li>
										<li>· Intravenous catheter tip should be sterilized with 70% alcohol, aseptically removed, cut into 2 ~ 3 inches at the end
										and transported in aseptic screw cap tube. If delivery is delayed, it should be kept in a refrigerator.</li>
										<li>· Indwelling urethral catheter tip, catheter tip in a saline or transportation medium, catheter tip smeared on a slide 
										are not suitable for culture.</li>
									</ul>
								</div>
								
								<h4>9. Anaerobic</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· After aspiring with a syringe, bend the needle and cover with a rubber stopper to prevent exposure to the air.</li>
										<li>· Pharynx, nasopharynx, oral mucosa, sputum, bronchial washing solution, contents of stomach and intestine, stool,
										 rectal swab, urine collected by catheter, swab specimen from vagina and cervix, cerebrospinal fluid, and specimens
										 in the surface of bed sore and mucous membrane are not suitable for anaerobic bacteria culture.</li>
									</ul>
								</div>
								
								<h4>10. Fungal test</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· If the KOH mount specimen is skin, hair or keratin, the potassium hydroxide dissolves the keratin in these specimens
										to facilitate the observation of fungi, because the cell fragments cover the fungal particles.</li>
										<li>· After cleaning the keratinous area with 70% alcohol and scraping its outer layer with a sterilized blade and scratching
										the specimen from the infected area inside the keratin, wrap it with paper and put it in a sterilized container to request.</li>
										<li>· First, wipe the skin with 70% alcohol and remove the bacterial flora. Then, if there is a ringworm, scrap out the outer
										part of red circle. If there is no red circle, scrap out the most infected area.</li>
										<li>· In order to obtain the most suitable specimen, aseptically collect the most damaged lesion before the antimicrobial treatment.</li>
										<li>· Take sufficient quantities and repect sampling as much as possible</li>
									</ul>
								</div>
								
								<h4>11. Mycobacterium tuberculosis test</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li><b>· Sputum</b></li>
										<li class="pl10">- Collect the first morning sputum once in a sterile container.</li>
										<li class="pl10">- It is recommended to repeat the test for 2-3 consecutive days</li>
										<li class="pl10">- Swab specimen is not appropriate for the cultivation of acid-fast bacterium. Due to the hydrophobicity of the acid-fast
										bacterium, migration from the swab specimen to the medium is not easy, resulting in limited volume of specimen.</li>
										<li class="pl10">- Pooled sputum, which is a collection of sputum, is not suitable due to increased contamination.</li>
										
										<li><b>· Urine</b></li>
										<li class="pl10">- Collect the midstream urine of the first morning urine in an aseptic container for 2~3 consecutive days</li>
										<li class="pl10">- For 24 hours urine, a small amount of urine is unsuitable.</li>
										<li class="pl10">- Collection with a catheter is only limited when the midstream urine cannot be obtained.</li>
										
										<li><b>· Body fluid</b></li>
										<li class="pl10">- Use Sodium polyanethol sulfonate (SPS) anticoagulant to collect the blood containing fluid.</li>
										<li class="pl10">- At least 5ml of cerebrospinal fluid is needed as it contains only a few acid-fast bacteria.</li>
										
										<li><b>· Tissue, pus, etc.</b></li>
										<li class="pl10">- Specimen exposed to formalin is unsuitable for smearing and culture.</li>
										<li class="pl10">- Tissues should not be placed in saline or wrapped with gauze, but the microscopic biopsy specimens can be
										transported in small quantities of sterile saline.</li>
									</ul>
								</div>
								
								<h4>12. Virus test</h4>
								<div class="sub_summury01_inner2">
									<ul>
										<li>· Use a designated container for virus test as the microbial contamination may affect virus isolation.</li>
										<li>· Keep specimen for virus test refrigerated immediately after collection. (However, keep blood specimen at room temperature)</li>
										<li>· Aseptically collect and put in a sterile container to request</li>
										<li>· Record the clinically suspected viruses and site of sampling together.</li>
									</ul>
								</div>
							</div>
						</div>
						<!--//tab menu04 End-->

						<!--tab menu05-->
						<div id="tab-5" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1>Test for congenital metabolic<br/>abnormalities test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:765px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>
							
							<div class="inner_content">

								<h1>Test for congenital metabolic abnormalities</h1>
								<div class="sub_summury01_inner2">
									<ul>
										<li style="margin-bottom:20px;"><b>Time for blood sampling : </b> The recommended blood sampling period is between 48 hours and 1 week after birth.<br/>
										In the case of premature infant and low birth weight infant, blood sampling is performed 5 to 7 days after birth.<br/>
										Later, when the feeding condition improves, collect the blood specimen again.<br/>
										If the feeding condition does not improve, it is necessary to collect 5 to 7 days and 1 month after birth.</li>
										
										<li><b>Blood sampling paper : </b> Do not touch or contaminate the sampling area of the filter paper. If something is written
										on this area with ink or pen or it is stained with cosmetics or amino-acid, screening test may be inaccurate. Therefore, 
										it must be kept in good condition. Handling the paper after the sampling.
										</li>
									</ul>
									
									<ul>
										<li><b>①</b> Avoid direct sunlight or hot places after sampling and dry naturally in a cool and dark place</li>
										<li><b>②</b> Allow to dry thoroughly for at least 3 to 4 hours</li>
									</ul>
								</div>

							</div>
						</div>
						<!--//tab menu05 End-->

						<!--tab menu06-->
						<div id="tab-6" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:50px;">Cytopathology test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:825px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>
							
							
						
							<div class="inner_content">

								<h1>Cytopathology test</h1>
								
								<h3>Precautions on gynecological test</h3>
								<table>
									<tbody>

										<tr>
											<td class="n_td">1.</td>
											<td>Do not use lubricant or talcum powder on instruments or gloves when sampling the specimens. Use warm saline to add moisture. </td>
										</tr>

										<tr>
											<td class="n_td">2.</td>
											<td>Do not perform biopsy or induce other trauma before sampling. (Dilution or masking of blood may interfere with diagnosis)</td>
										</tr>

										<tr>
											<td class="n_td">3.</td>
											<td>If swap is used for sampling, take the specimens from the vaginal fornix and cervix and smear them thoroughly on a slide.</td>
										</tr>

										<tr>
											<td class="n_td">4.</td>
											<td>When sampling is made with Pap brush or Cytobrush, avoid excessive bleeding (it may interfere with diagnosis)</td>
										</tr>
										<tr>
											<td class="n_td">5.</td>
											<td>Refrain from intravaginal medication and do not use contraceptive pill at least 24 hours prior to sampling</td>
										</tr>
										<tr>
											<td class="n_td">6.</td>
											<td>To prevent detached cells from deteriorating, be sure to fix them immediately (within 2 seconds) after thinly
											smearing them on the cleaned surface of a slide. (If it is dried in the air after smearing, it causes denaturation of cells and diagnosis is impossible)</td>
										</tr>
										<tr>
											<td class="n_td">7.</td>
											<td>If a malignant tumor is suspected clinically, but the result is negative, repeat or perform biopsy because sampling 
											and smear fixing may have been inappropriate.</td>
										</tr>
										<tr>
											<td class="n_td">8.</td>
											<td>Cytological test may lead to difficulty in diagnosis due to lack of prior knowledge and careless handling when
											sampling, storing and fixing of specimen. For precise diagnosis, please make sure to carefully read the precautions
											such as sample collection, fixation and storage condition before sending the specimen for test.</td>
										</tr>
									</tbody>
								</table>

							</div>

							<div class="inner_content2">

								<h3>Smear sampling of cell specimen and how to request (process)</h3>

								<ul>
									<li><b>1. Gynecological test</b>
										<ul>
											<li>· Smear immediately in 2 seconds on a slide after sampling from uterine cervix. Fix tightly with Cytofixer or fix it in 95% 
											Ethyl alcohol for more than one hour.</li>
										</ul>
									</li>
									<li><b>2. Sputum</b>
										<ul>
											<li>· Request with patient's sputum not saliva.</li>
										</ul>
									</li>
									<li><b>3. Accumulated sputum (for 3~5 days)</b>
										<ul>
											<li>· Take the first sputum of the morning once a day and by sampling day</li>
										</ul>
									</li>
									<li style="margin-top:10px;"><b style="display:unset;">4. </b>Take body fluid as much as possible (More than 10ml) (Pleural & Ascitic fluid, Urine, Bronchial washing etc.)
									</li>
									<li><b>5. FNA (Find Needle Aspiration)</b>
										<ul>
											<li>· Immediately smear the aspirated specimen on a slide (multiple sheets, if possible) and fix it in 95% Ethyl Alcohol for
											more than one hour and send us the remaining specimens.</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
						
						<!--tab menu07-->
						<div id="tab-7" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:50px;">Histopathology test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:825px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>


							<div class="inner_content">

								<h1>Histopathology test</h1>
								<ul>
									<li>· Normally, the specimen (biopsy or extracted tissus) is fixed with 10% formalin.</li>
									<li>· The fixative is put 10-15 times of tissue and placed at room temperature for 12-14 hours.</li>
									<li>· Place the tissue sampled from different part of the tissue to be distinguished in a separator container.</li>
									
									<li>· <b style="padding-left:2px;">Stomach biopsy tissue:</b> Attach the biopsy tissue to the filter paper by number and fix it in a bottle containing the fixative.</li>
									<li>· Avoid unnecessary actions on the extracted tissues and put sufficient amount of fixative so that they do not dry out after extraction.</li>
									<li>· Please use a specimen container with a wide opening and list the patient's personal details and the client's name on the back of the container.</li>
									<li>· Please include the patient's name, gender, age, and requested hospital, date of collection, sampling site, 
									clinical diagnosis, medical history and surgical findings of the clinician.</li>
								</ul>
								
								<h3>Prerequisite to histopathology request</h3>
								<table>
									<tbody>
										<tr>
											<td class="n_td">1.</td>
											<td>Please fill in the hospital name, patient's name, age, gender and chart number on the container.</td>
										</tr>

										<tr>
											<td class="n_td">2.</td>
											<td>Please make sure to fill in the hospitals name, patient's name, age, gender, date of collection,
											clinical diagnosis, medical history and previous biopsy and especially clinical findings,
											because they are very important for accurate diagnosis.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--//tab menu07 End-->

						<!--tab menu08-->
						<div id="tab-8" class="tab-content">
							<div class="sub_summury01">
								<div class="sub_summury01_inner">
									<h1 style="padding-left:65px;">Cytogenetic test</h1>
								</div>

								<div class="sub_summury01_inner2">
									<ul style="width:825px;">
										<li><b>1.</b>Refer to the quantity of specimen listed in this test guide. If it is stored the urine (24 hours urine),<br/>
											please send only the required quantity in the container and make sure to write the total quantity of urine.
										</li>
										<li><b>2.</b>Please collect specimen in the designated container. If a special container is needed, ask for it in advance before the collect the specimen.</li>
										<li><b>3.</b>If the specimen is smeared on a side, please write the name, gender and age with a bandage and a pencil.</li>
										<li><b>4.</b>To request a consecutive test, be sure to write the time of consecutive test and the name of medication taken.</li>
									</ul>
								</div>
							</div>
							<div class="inner_content">

								<h1>Cytogenetic test</h1>
								<ul>
									<li><b>1. Precautions on Requesting Chromosome Test</b>
										<ul>
											<li>· <b style="padding-left:2px;">Amniotic fluid : </b> Discard the first two to three drops to prevent the maternal cell contamination</li>
											<li>· If specimen contains excessive blood or the color of amniotic fluid is brownish, cultivation may fail. Therefore, monthers
											should be fully informed in advance.</li>
											<li>· conical tube or heparin bottle is commonly used for the specimen. Wrap and seal the specimen with a foil when sending
											the syringe together.</li>
											<li>· Specify the gestational age and the purpose of the test on the request form.</li>
										
										</ul>
									</li>
									<li><b>2. Chorion</b>
										<ul>
											<li>· Collect the specimen in an exclusive container provided by the laboratory.</li>
											<li>· If only maternal cells without Villi are collected, the Cytogenetic Team will observe them under a microscope and notify
											the client through the phone for rechecking.</li>
										</ul>
									</li>
									<li><b>3. Aborted tissue</b>
										<ul>
											<li>· Collect the specimen in an exclusive container containing the phosphate buffer supplied by the laboratory.<br/>
											(If a specimen is treated with formalin, chromosome test cannot be performed.)</li>
											<li>· the specimen collected from the chorion and skin tissus (size: W x L 1cm) has a high success rate.</li>
											<li>· Because aborted tissues are easily contaminated with high rate of culture failure, it is necessary to sufficiently explain
											to the caregiver in advance.</li>
										</ul>
									</li>
									<li><b>4. Blood and bone marrow</b>
										<ul>
											<li>· Take 2 ~ 3ml of specimen in a sodium heparin bottle and pay attention to avoid contamination and coagulation.</li>
											<li>· The clinical information of the patient is necessary because the culture method may vary.</li>
										</ul>
									</li>
									<li><b>5. FISH test</b>
										<ul>
											<li>· For the test of chromosomal abnormity, please specify the chromosome number. In case of prenatal test, it is possible
											only when requested with the cultivation method</li>
											<li>· For diagnosis of microdeletion disease, detailed clinical information of the patient as well as its disease name is required.</li>
										</ul>
									</li>
								
								</ul>
							</div>

						</div>
						<!--//tab menu08 End-->
					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
<%-- 			<jsp:include  page="../../../include/rolling.jsp"></jsp:include > --%>

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
