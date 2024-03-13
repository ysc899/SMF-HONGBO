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
	<link href="<c:url value='/user/css/03_sub04.css'/>" type="text/css" rel="stylesheet"/>
	
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
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="tab-link _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-tab="tab-<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-link="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
						
						
<!-- 							<li class="tab-link current _tab_1" data-tab="tab-1" data-link="1">성매개감염질환 SET 검사</li> -->
<!-- 							<li class="tab-link _tab_2" data-tab="tab-2" data-link="2">산부인과 SET 검사</li> -->
<!-- 							<li class="tab-link _tab_3" data-tab="tab-3" data-link="3">질환별 SET 검사</li> -->
						</ul>
						
						<!--tab menu01-->
						<div id="tab-1" class="tab-content current">

							<div class="inner_content">
								<p>Multiplex PCR</p>
								<table>
									<colgroup>
										<col width="130px;"/>
										<col width="130px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="120px;"/>
									</colgroup>
									<thead>
										<tr>
											<th class="code_code">검사코드</th>
											<th class="name_code" colspan="2">검사명</th>
<!-- 											<th class="gender_code" style="border-left:none;"></th> -->
											<th class="th_60px">NG</th>
											<th class="th_60px">CT</th>
											<th class="th_60px">UU</th>
											<th class="th_60px">MG</th>
											<th class="th_60px">MH</th>
											<th class="th_60px">TV</th>
											<th class="th_60px">UP</th>
											<th class="th_60px">HSV1</th>
											<th class="th_60px">HSV2</th>
											<th class="th_60px">TP</th>
											<th class="th_60px">HD</th>
											<th class="th_60px">GV</th>
											<th class="th_60px">CA</th>
											<th class="th_120px">16s rRNA</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="number_code">71313</td>
											<td colspan="2">STI 7종 (Multiplex PCR)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<!-- <td class="td_null"></td> -->
										</tr>

										<tr>
											<td class="number_code">B9050</td>
											<td>STI 8종</td>
											<td rowspan="3" style="line-height:1.2em;">여성<br/>SET</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<!-- <td class="td_null"> </td> -->
										</tr>

										<tr>
											<td class="number_code">B9046</td>
											<td>STI 9종</td>
											<!-- <td>여성 SET</td> -->
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<!-- <td class="td_null"> </td> -->
										</tr>

										<tr>
											<td class="number_code">72020</td>
											<td>STI 12종</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td></td>
											<!-- <td class="td_null"> </td> -->
										</tr>

										<tr>
											<td class="number_code">B9029</td>
											<td>STI 16종</td>
											<td style="line-height:1.2em;">남성<br/>SET</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<!-- <td class="td_null"> </td> -->
										</tr>
									</tbody>
								</table>


								<p>Multiplex real-time PCR</p>
								<table>
									<colgroup>
										<col width="130px;"/>
										<col width="130px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="60px;"/>
										<col width="120px;"/>
									</colgroup>
									<thead>
										<tr>
											<th class="code_code">검진코드</th>
											<th class="name_code" colspan="2">검사명</th>
<!-- 											<th class="gender_code" style="border-left:none;"></th> -->
											<th class="th_60px">NG</th>
											<th class="th_60px">CT</th>
											<th class="th_60px">UU</th>
											<th class="th_60px">MG</th>
											<th class="th_60px">MH</th>
											<th class="th_60px">TV</th>
											<th class="th_60px">UP</th>
											<th class="th_60px">HSV1</th>
											<th class="th_60px">HSV2</th>
											<th class="th_60px">TP</th>
											<th class="th_60px">HD</th>
											<th class="th_60px">GV</th>
											<th class="th_60px">CA</th>
											<th class="th_120px">16s rRNA</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="number_code">71311</td>
											<td colspan="2">STI 7종 <br/>(Multiplex real-time PCR)</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<!-- <td class="td_null"></td> -->
										</tr>

										<tr>
											<td class="number_code">B9031</td>
											<td>STI 8종</td>
											<td rowspan="2" style="line-height:1.2em;">여성<br/>SET</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<!-- <td class="td_null"> </td> -->
										</tr>

										<tr>
											<td class="number_code">B9034</td>
											<td>STI 9종</td>
											<!-- <td>여성 SET</td> -->
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<!-- <td class="td_null"> </td> -->
										</tr>


										<tr>
											<td class="number_code">A9470</td>
											<td>STI 16종</td>
											<td rowspan="2" style="line-height:1.2em;">남성<br/>SET</td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td> </td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<!-- <td class="td_null"> </td> -->
										</tr>

										<tr>
											<td class="number_code">B9015</td>
											<td>STI 20종</td>
											<!-- <td>남성 SET</td> -->
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<td></td>
											<td></td>
											<td><img src="<c:url value='/user/img/sub/check_on2.png'/>" alt="체크표시" /></td>
											<!-- <td class="td_null"> </td> -->
										</tr>
									</tbody>
								</table>

								<p>SET 검사</p>
								<table>
									<colgroup>
										<col/>
										<col/>
										<col/>
									</colgroup>
									<thead>
										<tr>
											<th class="code_code2">검진코드</th>
											<th class="name_code2">검사명</th>
											<th class="gender_code2">검사항목</th>
										</tr>
									</thead>

									<tbody>

<!-- 										<tr> -->
<!-- 											<td class="number_code">72216</td> -->
<!-- 											<td >세균성질염 PCR 검사</td> -->
<!-- 											<td style="padding-left:15px; line-height: 1.3em; " class="ital"><i>Gardnerella vaginalis, Bacteroides fragilis, Mobiluncus curtisii, Atopobium vaginae,<br/> Mobiluncus mulieris</i></td> -->
<!-- 										</tr> -->

										<tr>
											<td class="number_code">72226</td>
											<td >생식기궤양 PCR 검사</td>
											<td style="padding-left:15px; line-height: 1.3em;" class="ital">HSV type 1, HSV type 2, <i>Haemophilus ducreyi,</i> Cytomegalovirus, <br/>
												<i>Treponema pallidum, Chlamydia trachomatis </i>LGV, Group B <i>Streptococcus</i>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
						<!--//tab menu01 End-->
						
							<!--tab menu02-->
						<div id="tab-2" class="tab-content">
							<div class="inner_content2">
								<p class="inner_title">산전 필수 검사</p>

								<!--table01-->
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>A3301</td>
											<td>산모 종합검사</td>
											<td class="f_14px">
												Protein, ALB, BUN, Creatinine, Glucose, AST, ALT,<br/>
												Cholesterol, TG, Urine16종, CBC8종, PT, aPTT,<br/>
												ABO 혈액형검사, Rh type, Ab screening test,<br/>
												HBsAg(정밀), HBs Ab(정밀), RPR정밀, HIV Ag/Ab,<br/>
												Rubella IgG, Rubella IgM, GBS
											</td>
											<td class="f_14px">
												Serum 1.0 mL<br/>
												EDTA W/B 3.0 mL<br/>
												Random Urine 10.0 mL<br/>
												Sod.citrate plasma 1.0 mL<br/>
												Vaginal-rectal swab<br/>
											</td>
										</tr>

										<tr>
											<td>A3302</td>
											<td>산모 기본검사</td>
											<td class="f_14px">
												Glucose, AST, ALT, Urine16종, CBC8종, PT, aPTT,<br/>
												ABO 혈액형검사, Rh type, Ab screening test, RPR정밀
											</td>
											<td class="f_14px">
												Serum 1.0 mL<br/>
												EDTA W/B 3.0 mL<br/>
												Random Urine 10.0 mL<br/>
												Sod.citrate plasma 1.0 mL
											</td>
										</tr>

										<tr>
											<td>A3303</td>
											<td>산모 혈액 기본검사</td>
											<td class="f_14px">
												CBC8종, PT, APTT, ABO 혈액형검사, Rh type, Ab screening test
											</td>
											<td class="f_14px">
												Serum 1.0 mL,<br/>
												EDTA W/B 3.0 mL<br/>
												Sod.citrate plasma 1.0 mL
											</td>
										</tr>
									</tbody>
								</table>
								<!--//table02 End-->


								<!--table02-->
								<p class="inner_title">선천성 기형아 선별검사 </p>
								<span class="star_text">* 전용의뢰서 작성</span>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>90027</td>
											<td>First double marker test</td>
											<td>PAPP-A, MS-hCG, NT</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90029</td>
											<td>Double marker test</td>
											<td>MS-AFP, MS-hCG</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90028</td>
											<td>Triple marker test</td>
											<td>MS-AFP, MS-hCG, uE3</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90100</td>
											<td>Quad test</td>
											<td>MS-AFP, MS-hCG, uE3, Inhibin A</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>99933</td>
											<td>Integrated test<br/>
												통합적검사 1차
											</td>
											<td>PAPP-A, NT</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>99934</td>
											<td>Integrated test<br/>
												통합적검사 2차
											</td>
											<td>AFP, hCG, uE3, Inhibin A</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>99935</td>
											<td>Sequential test<br/>
												순차적검사 1차
											</td>
											<td>PAPP-A, hCG, NT</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>99936</td>
											<td>Sequential test<br/>
												순차적검사 2차
											</td>
											<td>AFP, hCG, uE3, Inhibin A</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>A1006</td>
											<td>임신중독증 선별검사</td>
											<td>PAPP-A, PIGF</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>25000</td>
											<td>전자간증 위험도</td>
											<td>sFlt-1/PIGF ratio (전자간증 위험도)</td>
											<td>Serum 1.0 mL</td>
										</tr>

									</tbody>
								</table>
								<!--//table02 End-->

								<!--table03-->
								<p class="inner_title">TORCH 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>90030</td>
											<td>TORCH-IgG (HSV I)</td>
											<td class="ital">
												<i>Toxoplasma </i>IgG, Rubella IgG, CMV IgG, HSV type I IgG
											</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90180</td>
											<td>TORCH-IgG (HSV II)</td>
											<td class="ital">
												<i>Toxoplasma </i>IgG, Rubella IgG, CMV IgG, HSV type II IgG
											</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90031</td>
											<td>TORCH-IgM</td>
											<td class="ital">
												<i>Toxoplasma </i>IgM, Rubella IgM, CMV IgM, HSV IgM
											</td>
											<td>Serum 1.0 mL</td>
										</tr>

									</tbody>
								</table>
								<!--//table03 End-->

								<!--table04-->
								<p class="inner_title">성병관련 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>90594</td>
											<td>성병관련 검사 1</td>
											<td>RPR정밀, HIV Ag/Ab</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90595</td>
											<td>성병관련 검사 2</td>
											<td>TPLA정밀, FTA-ABS IgG, FTA-ABS IgM</td>
											<td>Serum 1.0 mL</td>
										</tr>

									</tbody>
								</table>
								<!--//table04 End-->

								<!--table05-->
								<p class="inner_title">습관유산 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>71005</td>
											<td>염색체 검사</td>
											<td>Chromosome analysis (부부가 함께 검사요망)<br/><span style="color:#d10000;">※전용의뢰서 작성</span></td>
											<td>Heparin W/B 5.0 mL</td>
										</tr>

										<tr>
											<td>90596</td>
											<td>면역학적 검사</td>
											<td>Anti cardiolipin Ab IgG, Anti cardiolipin Ab IgM, Lupus anticoagulant</td>
											<td>Serum 1.0 mL<br/>
												Sod.citrate plasma 1.0 mL
											</td>
										</tr>

										<tr>
											<td>90597</td>
											<td>내분비호르몬 검사</td>
											<td>T3, T4, TSH, Progesterone, Prolactin</td>
											<td>Serum 1.0 mL</td>
										</tr>

									</tbody>
								</table>
								<!--//table05 End-->

								<!--table06-->
								<p class="inner_title">종양표지자 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>90599</td>
											<td>자궁암 검사</td>
											<td>CA 125, CEA, SCC Ag, TPA</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>A0867</td>
											<td>난소암 검사</td>
											<td>CA 125, CEA, CA 72-4</td>
											<td>Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90601</td>
											<td>유방암 검사</td>
											<td>CA 15-3, CEA, TPA</td>
											<td>Serum 1.0 mL</td>
										</tr>

									</tbody>
								</table>
								<!--//table06 End-->

								<!--table07-->
								<p class="inner_title">골다공증 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>90602</td>
											<td>골다공증 검사 기본</td>
											<td>Ca, ALP, P, Corrected Ca++</td>
											<td>Serum 1.0 mL<br/>
												Random Urine 10.0 mL
											</td>
										</tr>
									</tbody>
								</table>
								<!--//table07 End-->

								<!--table07-->
								<p class="inner_title">불임원인호르몬 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>90598</td>
											<td>불임원인호르몬 검사</td>
											<td>E2, LH, FSH, Prolactin, Testosterone, Progesterone</td>
											<td>Serum 1.0 mL</td>
										</tr>
									</tbody>
								</table>
								<!--//table07 End-->

								<!--table07-->
								<p class="inner_title">HPV 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="65%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>72185</td>
											<td>HPV real time PCR</td>
											<td rowspan="2">Cervical swab</td>
										</tr>
										<tr>
											<td>74416</td>
											<td style="border-right:1px solid #ccc;">HPV real time PCR + Pap Stain</td>
										</tr>
									</tbody>
								</table>
								<!--//table07 End-->

								<!--table07-->
								<p class="inner_title">신생아 대사이상 검사</p>
								<table>
									<colgroup>
										<col width="15%"/>
										<col width="65%"/>
										<col width="20%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>05566</td>
											<td>선천성 대사이상 검사 (선별)</td>
											<td rowspan="2">혈액여지</td>
										</tr>
										<tr>
											<td>05561</td>
											<td style="border-right:1px solid #ccc;">리소좀축적병 (LSD) 선별검사</td>
										</tr>
									</tbody>
								</table>
								<!--//table07 End-->

								

								</div>
	
						</div>
						<!--//tab menu02 End-->
						
						<!--tab menu03-->
						<div id="tab-3" class="tab-content">
							<div class="inner_content3">

								<!--table01-->
								<table>
									<colgroup>
										<col width="10%"/>
										<col width="15%"/>
										<col width="45%"/>
										<col width="30%"/>
									</colgroup>
									<thead>
										<tr>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사항목</th>
											<th>검체정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>A3573</td>
											<td>혈액검사(45종)검사</td>
											<td class="f_14px">Protein, Albumin, Globulin, A/G ratio, BUN, Creatinine, B/C ratio,<br/>
											T.Bilirubin, AST, ALT, γ-GTP, Glucose, ALP,<br/>
 											Cholesterol, TG, Uric acid, CBC 8종, ABO, Rh, HBsAg,<br/>
 											HBs Ab, Urine 16종, RPR 정밀</td>
											<td class="f_14px">Serum 2.0 mL<br/>EDTA W/B 3.0 mL<br/>Random Urine 10.0 mL</td>
										</tr>

										<tr>
											<td>90612</td>
											<td>간기능검사</td>
											<td class="f_14px">Protein, Albumin, Globulin, A/G ratio, T. Bilirubin,<br/>
											 D. Bilirubin, AST, ALT, γ-GTP, LDH, ALP, Cholesterol</td>
											<td class="f_14px">Serum 2.0 mL</td>
										</tr>

										<tr>
											<td>90613</td>
											<td>신기능검사</td>
											<td class="f_14px">BUN, Creatinine, Ca, Pi, CCr, Albumin, Uric acid, Glucose, Urine 16종</td>
											<td class="f_14px">Serum 2.0 mL<br/>Random Urine 10.0 mL<br/>24'hr Urine 10.0 mL</td>
										</tr>

										<tr>
											<td>90614</td>
											<td>갑상선 기능검사</td>
											<td class="f_14px">T3, T4, TSH, FT4</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90615</td>
											<td>B형 간염 검사</td>
											<td class="f_14px">HBsAg, HBs Ab, HBeAg, HBe Ab, Anti-HBc total, HBc IgM</td>
											<td class="f_14px">Serum 2.0 mL</td>
										</tr>

										<tr>
											<td>90616</td>
											<td>심근경색 검사</td>
											<td class="f_14px">CPK, CK-MB, Myoglobin, LDH, LDH Isoenzyme, CRP, AST</td>
											<td class="f_14px">Serum 2.0 mL</td>
										</tr>

										<tr>
											<td>90617</td>
											<td>철 결핍성 빈혈 검사</td>
											<td class="f_14px">Fe, TIBC, UIBC, Ferritin, CBC 8종</td>
											<td class="f_14px">Serum 1.0 mL<br/>EDTA W/B 3.0 mL</td>
										</tr>

										<tr>
											<td>90618</td>
											<td>용혈성 빈혈 검사</td>
											<td class="f_14px">Haptoglobin, Coombs' direct, Coombs' indirect,<br/>
 											Transferrin, CBC 8종, Reticulocyte Count</td>
											<td class="f_14px">Serum 1.0 mL<br/>EDTA W/B 3.0 mL</td>
										</tr>

										<tr>
											<td>90619</td>
											<td>악성빈혈 검사</td>
											<td class="f_14px">Vit B12, Folate, CBC 8종, Reticulocyte count</td>
											<td class="f_14px">Serum 1.0 mL<br/>EDTA W/B 3.0 mL</td>
										</tr>

										<tr>
											<td>90620</td>
											<td>혈액 응고 검사</td>
											<td class="f_14px">PT, aPTT</td>
											<td class="f_14px">Sod.Citrate 1.0 mL</td>
										</tr>

										<tr>
											<td>90622</td>
											<td>당뇨병 검사</td>
											<td class="f_14px">Glucose (FBS), Glucose (PP2), Hb A1c, Urine 16종,<br/>
											Fructosamine, Insulin, C-Peptide</td>
											<td class="f_14px">NaF Plasma (FBS) 1.0 mL<br/>NaF Plasma (PP2) 1.0 mL<br/>
 											Serum 1.0 mL<br/> EDTA W/B 2.0 mL<br/>Random Urine 10.0 mL</td>
										</tr>

										<tr>
											<td>92388</td>
											<td>비만검사</td>
											<td class="f_14px">BUN, Creatinine, Uric acid, AST, ALT, Cholesterol, TG,<br/>
 											Urine 16종, TSH</td>
											<td class="f_14px">Serum 2.0 mL<br/>Random Urine 10.0 mL</td>
										</tr>

										<tr>
											<td>90623</td>
											<td>췌장 관련 검사</td>
											<td class="f_14px">Amylase, Lipase</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90624</td>
											<td>위염 관련 검사</td>
											<td class="f_14px">H.pylori Ab IgG,  H.pylori Ab IgM</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90625</td>
											<td>통풍 관련 검사</td>
											<td class="f_14px">Uric acid, ALP, RF, Ca, Pi</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90626</td>
											<td>고지혈증 관련 검사</td>
											<td class="f_14px">Cholesterol, TG, HDL-Cholesterol, LDL-Cholesterol,<br/>
 											Glucose, LP(a), Apolipo-A1/B</td>
											<td class="f_14px">Serum 2.0 mL</td>
										</tr>

										<tr>
											<td>90602</td>
											<td>골다공증 기본 검사</td>
											<td class="f_14px">Ca, ALP, Pi, Corrected Ca</td>
											<td class="f_14px">Serum 1.0 mL<br/>Random Urine 10.0 mL</td>
										</tr>

										<tr>
											<td>90605</td>
											<td>간암 검사</td>
											<td class="f_14px">AFP, CEA, TPA</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90606</td>
											<td>위암 검사</td>
											<td class="f_14px">CA 72-4, CEA, TPA</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>A0865</td>
											<td>췌장암 검사</td>
											<td class="f_14px">CA 19-9, CEA, CA 72-4</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90608</td>
											<td>담낭.담도암 검사</td>
											<td class="f_14px">CA 19-9, TPA, Ferritin</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>A0873</td>
											<td>대장.직장암 검사</td>
											<td class="f_14px">CEA, TPA, CA 72-4</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90610</td>
											<td>전립선암 검사</td>
											<td class="f_14px">PSA, PAP, CEA</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90599</td>
											<td>자궁암 검사</td>
											<td class="f_14px">CA 125, CEA, SCC Ag, TPA</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>A0867</td>
											<td>난소암 검사</td>
											<td class="f_14px">CA 125, CEA, CA 72-4</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

										<tr>
											<td>90601</td>
											<td>유방암 검사</td>
											<td class="f_14px">CA 15-3, CEA, TPA</td>
											<td class="f_14px">Serum 1.0 mL</td>
										</tr>

									</tbody>
								</table>
								<!--//table02 End-->
							</div>

						</div>
						<!--//tab menu03 End-->

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
