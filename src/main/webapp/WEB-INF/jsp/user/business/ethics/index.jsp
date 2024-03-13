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
    <meta property="og:image" content="<c:url value="/user/img/sub/01sub_img_sim.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub04_A.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub04_B.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub04_C.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/01_sub04_D.css'/>" type="text/css" rel="stylesheet"/>
	
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
						<p class="central_tab"><c:out value="${childMenuName }"/></p>
					</div>

					<div class="sub_story">
						<ul class="h_tabs">
							<c:forEach items="${lv3Menu }" var="item" varStatus="status">
								<li class="_tab-link _tab_<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>" data-view="<c:out value="${fn:substringAfter(item.menuUrl, '#') }"/>"><c:out value="${item.menuName }"/></li>
							</c:forEach>
<!-- 							<li class="_tab-link _tab_summary" data-view="summary">개요</li> -->
<!-- 							<li class="_tab-link _tab_step" data-view="step">심의절차</li> -->
<!-- 							<li class="_tab-link _tab_guideline" data-view="guideline">윤리지침</li> -->
<!-- 							<li class="_tab-link _tab_document" data-view="document">심의신청 제출서류</li> -->
						</ul>
						
						<!--tab menu01-->
						<div class=" _contentView _view_summary" style="text-align: center;">
							<div class="sub_summury01">
								<p>기관생명윤리위원회</p>
									<span>
										인간의 존엄과 가치를 침해하거나 인체에 위해를 끼치는 것을 방지함으로<br/>
										생명윤리 및 안전을 확보하고 국민의 건강과 삶의 질 향상에 이바지
									</span>
							</div>
	
							<div class="sub_summury02 sub_ani01">
								<p>01. 목적</p>
								<img src="<c:url value='/user/img/sub/line.png'/>" alt="동그라미랑라인"/>
									<div>
										<span>
											「생명윤리 및 안전에 관한 법률」 (이하 “생명윤리법”)은 인간과 인체유래물 등을 연구할 때,<br/>
											인간의 존엄과 가치를 침해하거나 인체에 위해(危害)를 끼치는 것을 방지함으로써 생명 윤리 및 안전을 확보하고<br/>
											국민의 건강과 삶의 질 향상에 이바지 함을 목적으로 합니다.
										</span>
									</div>
							</div>
	
							<div class="sub_summury03 sub_ani02">
								<p>02. 생명윤리법에 따른 기관생명윤리위원회</p>
								<img src="<c:url value='/user/img/sub/line.png'/>" alt="동그라미랑라인"/>
									<div>
										<span>
											「생명윤리법」에 따른 “기관생명윤리위원회(이하 ‘기관위원회’)”는 인간 또는 인체 유래물을 대상으로 하는 연구 등을 하는 생명윤리 및<br/>
											 안전의 확보가 필요한 기관에서 연구계획서 심의 및 수행 중 연구과정 및 결과에 대한 조사, 감독 등을 통한 연구자 및 연구대상자 등을<br/>
											 적절히 보호할 수 있도록 설치된 자율적·독립적 윤리 기구를 말합니다.
										 </span>
									</div>
							</div>
	
							<div class="sub_summury04 sub_ani03">
								<p>03. 법률적 근거</p>
								<img src="<c:url value='/user/img/sub/line.png'/>" alt="동그라미랑라인"/>
									<div>
										<span>
											생명윤리법은 법 제10조제1항에서 각 기관에서 수행되는 연구 및 활동에 대한 생명윤리 및 안전의 확보를 위해 기관위원회를 설치하도록 규정하고 있습니다.
										</span>
									</div>
							</div>
	
							<div class="sub_summury05 sub_ani04">
								<p>04. 심의 대상</p>
								<img src="<c:url value='/user/img/sub/line.png'/>" alt="동그라미랑라인"/>
									<div>
										<span>인간대상 연구</span>
										<b>생명윤리법 제2조제1호에 근거하는'인간대상연구'는 사람을 대상으로 물리적으로 개입하거나 의사소통,대인접촉 등의 상호작용을 통하여<br/>
											수행하는 연구,또는 개인을 식별할 수 있는 정보를 이용하는 연구로서 보건복지부령으로 정하는 연구를 말합니다.</b>
										<span>인체유래물연구</span>
										<b>생명윤리법 제2조제11호 및 제12호 근거하여 인체유래물연구란 인체로부터 수집하거나 채취한 조직·세포·혈액·체액 등 인체 구성물 또는<br/>
										이들로부터 분리된 혈청,혈장,염색체,DNA,RNA,단백질 등을(연구자) 직접 조사·분석하여 수행하는 연구를 말합니다.</b>
									</div>
							</div>
						</div>
						<!--//tab01 End-->
						
						<!--tab menu01-->
						<div class=" _contentView _view_step">
							<p><img src="<c:url value='/user/img/sub/01sub_img_sim.jpg'/>" class="sub_ani05" alt="심의절차이미지" /></p>
						</div>
						<!--//tab01 End-->
						
						
						<!--tab menu01-->
						<div class=" _contentView _view_guideline">
							<div class="sub_guideline01">
								<p style="margin-top: 0px;">연구자를 위한 윤리지침 (제정일 : 2018.10.23.)</p>
								<span>본 지침은 연구자가 연구를 실시하고자 할 때 관련된 역할과 책임을 상세히 정하는 것을 목적으로 한다.<br/>
								연구자는 윤리적으로 연구를 수행하기 위해 연구와 관련한 생명윤리 및 안전에 관한 법률 및 의료법, 약사법, 의료기기법, 의약품 등의<br/>
								 안전에 관한 규칙과 같은 관련 법규들을 준수해야 한다. </span>
							</div>

							<div class="sub_guideline02 toggle_guide sub_ani06">
								<p style="margin-top: 0px;">Section 1.윤리지침과 생명윤리법</p>
	
								<ul class="off">
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅰ. 윤리지침의 목적·범위와 연구자의 역할·책임<span></span></p>
										<div>
											<p>1. 윤리지침의 목적</p>
											<b>「생명윤리 및 안전에 관한 법률」 (이하 ‘생명윤리법’)에 근거하여 연구자가 인간과 인체유래물 등을 연구할 때 필요한 역할과 책임의
											기본적인 원칙 및 방향을 제시하고,<br/>씨젠의료재단 기관생명윤리위원회 (Institutional Review Board, 이하 ‘위원회’)를 이용 시 준수해야
											할 사항을 정하는 것을 목적으로 한다.</b><br/>
											<br/>
	
											<p>2. 연구윤리와 생명윤리</p>
											<b>1) 연구윤리</b><br/>
											<small>연구윤리란 책임 있는 연구 수행을 위해 기본적으로 준수해야 할 바람직한 규범으로, 연구를 수행함에 있어 진실성 유지와 생명윤리,
											연구분야의 윤리규범 준수 등을<br/> 주요 내용으로 한다.</small><br/>
											<b>2) 연구윤리의 범위</b><br/>
											<span>- 과학연구에서의 진실성 : 과학연구의 전 과정에서 속임수, 부주의, 자기기만 등으로 인해 정확성과 객관성에 결함이 있는 연구를
											수행하지는 않았는지 여부와 관련된다.</span><br/>
											<span>- 논문저자 표시 등 공로 배분의 공정성 : 과학 활동의 결과인 논문 발표 시 연구 참여자간 실질적인 기여도에 따라 공로를 합당하게
											배분하였는지 여부와 관련된다.</span><br/>
											<span>- 연구실 문화의 민주성 : 대부분의 연구 활동이 이루어지는 연구실 내부에서 나타날 수 있는 연구 환경에 관한 문제와 관련된다.</span><br/>
											<span>- 특정 연구대상이나 연구방법에서의 윤리성 : 생물학, 의학, 심리학 등의 연구 분야에 주로 적용되는 문제로서 인간 대상 실험과
											동물 실험 윤리 등<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생명윤리가 가장 큰 이슈가 된다.</span><br/>
											<span>- 과학자의 사회적 책임성 : 전문직업인으로서 사회 일반과의 관계에서 책임있는 자세로 행동하였는지와 관련된다.</span><br/>
											<br/>
	
											<p>3. 연구자의 역할과 책임의 필요성</p>
											<b>1) 연구자는 연구의 자유와 자율성에 따라 연구를 수행하되 다음 각 호의 사항을 준수해야 한다.</b>
											<span>- 연구대상자의 인격 존중 및 공정한 대우</span><br/>
											<span>- 연구대상자의 개인 정보 및 사생활의 보호</span><br/>
											<span>- 사실에 기초한 정직하고 투명한 연구의 진행</span><br/>
											<span>- 전문 지식을 사회에 환원할 경우 전문가로서 학문적 양심 견지</span><br/>
											<span>- 새로운 학술적 결과를 공표하여 학문의 발전에 기여</span><br/>
											<span>- 자신 및 타인의 저작물 활용 시 적절한 방법으로 출처를 밝히는 등 선행 연구자의 업적 인정·존중</span><br/>
											<span>- 연구계약의 체결, 연구비의 수주 및 집행 과정의 윤리적 책임 견지</span><br/>
											<span>- 연구비 지원기관의 이해관계에 영향을 받지 않고, 연구결과물에 연구와 관련된 모든 이해관계 명시</span><br/>
											<span>- 지속적인 연구윤리교육의 참여</span><br/>
	
											<b class="b_top">2) 정직성과 책임의 원칙에 따라 연구윤리 지침을 준수해야 한다.</b>
											<b>3) 연구윤리 관련 연구자의 역할과 책임은 모든 학문 분야를 막론하고 연구자에게 기본적으로 요구된다.</b>
										</div>
									</li>
	
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅱ. 「생명윤리 및 안전에 관한 법률」의 목적 및 기본 원칙<span></span></p>
										<div>
											<p>1. 「생명윤리 및 안전에 관한 법률」의 목적</p>
											<b>생명윤리법은 인간대상연구 또는 인체유래물연구 수행 시 준수하여야 하는 기본적인 법률을 말한다. 인간과 인체유래물 등을 연구할 때
												 인간의 존엄과 가치를 침해하거나<br/>인체에 위해(危害)를 끼치는 것을 방지함으로써 생명윤리 및 안전을 확보하고 국민의 건강과 삶의 질
												 향상에 이바지함을 목적으로 한다. (생명윤리법 제1조)</b><br/>
											 <br/>
	
											<p>2. 「생명윤리 및 안전에 관한 법률」의 기본원칙</p>
											<b>인간과 인체유래물 등을 연구하는 연구자는 생명윤리법 제1조의 목적에 근거하여 다음과 같은 기본 원칙(생명윤리법 제3조(기본 원칙))을
												 준수해야 한다.</b><br/>
											<br/>
											<b>1) 이 법에서 규율하는 행위들은 인간의 존엄과 가치를 침해하는 방식으로 하여서는 아니 되며, 연구대상자등의 인권과 복지는
											우선적으로 고려되어야 한다.</b>
											<b>2) 연구대상자등의 자율성은 존중되어야 하며, 연구대상자등의 자발적인 동의는 충분한 정보에 근거하여야 한다.</b>
											<b>3) 연구대상자등의 사생활은 보호되어야 하며, 사생활을 침해할 수 있는 개인정보는 당사자가 동의하거나 법률에 특별한 규정이 있는 
											경우를 제외하고는 비밀로서 보호되어야 한다.</b>
											<b>4) 연구대상자등의 안전은 충분히 고려되어야 하며, 위험은 최소화되어야 한다.</b>
											<b>5) 취약한 환경에 있는 개인이나 집단은 특별히 보호되어야 한다.</b>
											<b>6) 생명윤리와 안전을 확보하기 위하여 필요한 국제 협력을 모색하여야 하고, 보편적인 국제기준을 수용하기 위하여 노력하여야 한다.</b>
										</div>
									</li>
								</ul>
	
							</div>

							<div class="sub_guideline03 toggle_guide sub_ani07">
								<p>Section 2.위원회의 심의</p>
								<ul class="off">
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅰ. 위원회<span></span></p>
										<div>
											<b>위원회란 인간과 인체유래물 등을 연구할 때 연구의 윤리적·과학적 타당성 등을 확보할 수 있도록 교육·연구 기관 또는 병원 등에 설치하는 독립적인 위원회이다.</b><br/>
										</div>

									</li>
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅱ. 위원회 기능 및 업무<span></span></p>
										<div>
											<p>1.심의</p>
											<b>1) 이 법에서 규율하는 행위들은 인간의 존엄과 가치를 침해하는 방식으로 하여서는 아니 되며, 연구대상자등의 인권과 복지는 우선적으로 고려되어야 한다.</b>
											<b>2) 연구대상자등의 자율성은 존중되어야 하며, 연구대상자등의 자발적인 동의는 충분한 정보에 근거하여야 한다.</b>
											<b>3) 연구대상자등의 사생활은 보호되어야 하며, 사생활을 침해할 수 있는 개인정보는 당사자가 동의하거나 법률에 특별한 규정이 있는 경우를 제외하고는 비밀로서 보호되어야 한다.</b>
											<b>4) 연구대상자등의 안전은 충분히 고려되어야 하며, 위험은 최소화되어야 한다.</b>
											<b>5) 취약한 환경에 있는 개인이나 집단은 특별히 보호되어야 한다.</b>
											<b>6) 생명윤리와 안전을 확보하기 위하여 필요한 국제 협력을 모색하여야 하고, 보편적인 국제기준을 수용하기 위하여 노력하여야 한다.</b>

											<p class="p_top">2. 조사·감독</p>
											<b>해당 기관에서 수행 중인 연구의 진행과정 및 결과에 대한 조사·감독</b>

											<p class="p_top">3. 생명윤리 및 안전을 위한 다음의 활동</p>
											<b>1) 해당 기관의 연구자 및 종사자 교육</b>
											<b>2) 취약한 연구대상자 등의 보호 대책 수립</b>
										</div>
									</li>
	
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅲ. 위원회 심의 대상<span></span></p>
										<div>
											<p>1. 연구</p>
											<b>‘연구(Research)’란 일반화할 수 있는 지식을 발전시키거나 그에 기여할 수 있도록 고안된 연구개발 및 시험, 평가를 포함하는 체계적인
											조사를 말한다.</b><br/>
											<br/>

											<p>2. 위원회 심의 대상인 연구</p>
											<b>1) 인간대상연구</b><br/>
											<span>- 연구대상자를 직접 조작하거나 연구대상자의 환경을 조작하여 자료를 얻는 연구(중재연구)</span><br/>
											<span>- 연구대상자의 행동관찰, 대면설문조사 등으로 자료를 얻는 연구(상호작용연구)</span><br/>
											<span>- 연구대상자를 직·간접적으로 식별할 수 있는 정보를 이용하는 연구(개인정보 이용 연구)(생명윤리법 제2조제1호, 동법 시행규칙 제2호제1항)</span><br/>
											<span style="display:inline-block;">- 다만, 국가나 지방자치단체가 공공복리나 서비스 프로그램을 검토·평가하기 위해 직접 또는 위탁하여 수행하는 연구와 「초·중등교육법」<br/>
											 제2조 및 「고등교육법」 제2조에 따른 학교와 보건복지부장관이 정하여 고시하는 교육기관에서 통상적인 교육실무와 관련하여 하는 연구는 인간대상 연구에 미포함<br/>
											(생명윤리법 시행규칙 제2조제2항)</span><br/>
											<span>- 그러나 연구자가 심의가 필요하다고 판단한 경우 위원회에 심의를 요청 가능(생명윤리법 시행규칙 제2조제3항)</span><br/>
											<br/>

											<b>2) 인체유래물연구</b>
											<span style="display:inline-block;">- 인체유래물이란 인체로부터 수집하거나 채취한 조직·세포·혈액·체액 등 인체 구성물 또는이들로부터 분리된 혈청, 혈장, 염색체, DNA, RNA, 단백질 등<br/>(생명윤리법 제2조제11호)</span><br/>
											<span>- 인체유래물연구는 인체유래물을 직접 조사·분석하는 연구이다. (생명윤리법 제2조제12호)</span><br/>
										</div>
									</li>
	
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅳ. 심의와 심의면제<span></span></p>
										<div>
											<p>1. 심의</p>
											<b>인간대상연구 또는 인체유래물연구 등을 수행하려는 연구자는 연구를 수행하기 전에 위원회의 심의를 받아야 한다. (생명윤리법 제15조, 제36조)</b><br/>
											<b>1) 심의 절차</b><br/>
											<img src="<c:url value='/user/img/sub/01sub_img_sim3.jpg'/>" style="width:1020px; padding-left:10px;" alt="심의절차이미지"/>

											<b>2) 심의 종류</b>
											<span style="display:inline-block;">- 정규심의 : 연구의 위험도가 최소위험을 넘는 경우, 정기적인 대면회의에서 논의를 통해 심의결과를 결정한다. 이 때, 심의를 위해
											사전에 위원들에게 연구과제 및<br/> 심의자료를 배부하여 검토를 진행한다.</span><br/>
											<span>- 신속심의 : 연구의 위험도가 최소위험 이하 수준일 경우, 전문성을 갖추고 경험이 많은 소수의 위원에게 위원회의 심의 권한을 위임하여 심의한다.</span><br/>
											<span style="display:inline-block;">* 최소위험(Minimal risk)이란 연구에 의해 생길 수 있는 위해 또는 불편의 가능성 및 정도가 정상적인 건강인의 일상생활이나 일상적 신체검사, 심리검사보다<br/>크지 않은 경우를 의미한다.</span><br/>
											<br/>

											<p>2. 심의면제</p>
											<b>1) 심의면제</b><br/>
											<span>- 연구대상자, 인체유래물 기증자 및 공공에 미치는 위험이 미미한 경우로서 보건복지부령으로 정한 기준에 맞는 연구는 위원회의 심의를 면제할 수 있다.</span><br/>
											<span>- 다만, 심의면제라 하더라도 위원회의 확인 절차를 받아야 한다.</span><br/>
											<span style="display:inline-block;">- 심의면제가 가능한 연구라도 취약한 환경에 있는 연구대상자(이하 ‘취약한 연구대상자’)를 대상으로 하는 연구는 위원회의 심의를
											받아야 한다. <br/>(생명윤리법 시행규칙 제13조제2항)</span><br/>
											<br/>
											<b>2) 심의면제가 가능한 연구 종류</b><br/>

											<span>- 인간대상연구</span><br/>
											<br/>

											<small>(1) 연구대상자 등을 직접 조작하거나 그 환경을 조작하는 연구 중 다음에 해당하는 연구</small><br/>
											<i>가. 약물투여, 혈액채취 등 침습적 행위를 하지 않는 연구</i><br/>
											<i>나. 신체적 변화가 따르지 않는 단순 접촉 측정장비 또는 관찰장비만을 사용하는 연구</i><br/>
											<i>다.「식품위생법 시행규칙」 제3조에 따라 판매 등이 허용되는 식품 또는 식품 첨가물을 이용하여 맛이나 질을 평가하는 연구</i><br/>
											<i>라.「화장품법」 제8조에 따른 안전기준에 맞는 화장품을 이용하여 사용감 또는 만족도 등을 조사하는 연구</i><br/>
											<br/>

											<small>(2) 연구대상자 등을 직접 대면하더라도 연구대상자 등이 특정되지 않고, 「개인정보 보호법」 제23조에 따른 민감정보를 수집하거나
											기록하지 않는 연구</small><br/>
											<br/>

											<small>(3) 연구대상자 등에 대한 기존의 자료나 문서를 이용하는 연구</small><br/>
											<br/>

											<span>- 인체유래물연구</span><br/>
											<br/>

											<small>(1) 연구자가 개인정보를 수집· 기록하지 않는 연구 중 다음의 연구</small><br/>
											<i>가. 인체유래물은행이 수집·보관하고 있는 인체 유래물과 그로부터 얻은 유전정보(이하“인체유래물등”이라 한다)를 제공받아 사용하는
											연구로서 인체유래물 등을<br/>제공한 인체유래물은행을 통하지 않으면 개인정보를 확인할 수 없는 연구</i><br/>
											<i>나. 의료기관에서 치료 및 진단을 목적으로 사용하고 남은 인체유래물 등을 이용하여 정확도 검사 등 검사실 정도관리 및 검사법 평가
											등을 수행하는 연구</i><br/>
											<i>다. 인체유래물을 직접 채취하지 않는 경우로서 일반 대중이 이용할 수 있도록 인체유래물로부터 분리·가공된 연구재료(병원체, 세포주
											등을 포함)를 사용하는 연구</i><br/>
											<i>라. 연구자가 인체유래물 기증자의 개인식별정보를 알 수 없으며, 연구를 통해 얻어진 결과가 기증자 개인의 유전적 특징과 관계가 없는
											연구(단, 배아줄기세포주를 이용한 연구는 제외)</i><br/>
											<br/>

											<small>(2) 「초·중등교육법」 제2조 및 「고등교육법」 제2조에 따른 학교와 보건복지부장관이 정하는 교육기관에서 통상적인 교육과정의 범위에서 실무와 관련하여 수행하는 연구</small><br/>

											<small style="line-height:1.5em;">(3) 공중보건상 긴급한 조치가 필요한 상황에서 국가 또는 지방자치단체가 직접 수행하거나 위탁한 연구<br/>(단, 연구를 수행하는 기관의 장은 공용위원회에 연구 종료 전 연구의 진행 상황을
											통보하여야 한다.)</small><br/>
										</div>
									</li>
								</ul>
							</div>

							<div class="sub_guideline04 toggle_guide sub_ani08">
								<p>Section 3.연구의 수행과 위원회 절차</p>
								<ul class="off">
									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅰ. 신청 전의 고려사항<span></span></p>
										<div>
											<p>1. 위원회 심의 전, 서류 준비 시 주의사항</p>
											<b>1) 연구 수행에 따른 위원회 절차</b>
											<img src="<c:url value='/user/img/sub/sub_project.jpg'/>" alt="윤리지침 설명도" class="sub_img" />

											<b>연구 수행 및 기관위원회 절차 그림</b>
											<b>2) 신청단계 필요한 서류</b>
											<span>- 기본 제출서류는 대체로 다음과 같다.</span><br/>
											<br/>
											<span>(1) 연구계획서</span><br/>
											<span>(2) 설명문 및 동의서(해당되는 경우)</span><br/>
											<span>(3) 연구에 이용하기 위해 연구대상자로부터 얻는 정보의 목록(증례기록서, 실험일지, 연구 노트, 기록카드 및 설문지 등)(해당되는 경우)</span><br/>
											<span>(4) 연구대상자 모집관련 문서(해당되는 경우)</span><br/>
											<span>(5) 위원회에 의해 요구되는 보고서나 그 외의 양식(해당되는 경우)</span><br/>
											<span>(6) 연구자 이력서</span><br/>
											<span>(7) 생명윤리 관련 교육 수료증</span><br/>
											<span>(8) 연구책임자의 생명윤리준수서약서</span><br/>
											<br/>
											<b>3) 제출 서류 준비 시 주의사항</b>
											<span>- 연구계획서, 설명문 및 동의서 등 제출 서류 간의 내용은 모두 일치하도록 작성한다.</span><br/>
											<span>- 이력서와 생명윤리 관련 교육수료증은 최근 2년 이내의 것으로 제출한다.</span><br/>
											<span>- 인체유래물연구 시 인체유래물연구의 동의서는 법정서식인 ‘생명윤리법 시행규칙 별지 제34호서식 인체유래물 연구 동의서’로 제출한다.</span><br/>
											<span>- 인체유래물을 구입하거나 제공받은 경우 MTA(물질양도각서) 사본 등 관련 증빙서류를 제출한다.</span><br/>
											<span>- 책임연구자의 서명이 필요한 문서는 직접 친필 서명하여 제출한다.</span><br/>
											<br/>
											<br/>
											<p>2. 이해상충의 공개</p>
											<b>1) 이해상충(COI: Conflict of interest)</b>
											<span>- 이해상충이란 전문직 종사자의 일차적 관심사에 관한 전문적 판단이 이차적 이해로 인해 부당하게 영향을 받거나 받을 수 있는 조건 또는 상황을 말한다.</span><br/>
											<br/>
											<b>2) 이해상충 공개 방법</b>
											<span>- 연구를 시작하기 전에 연구자는 연구결과에 영향을 미칠 수 있는 이해관계를 모두 공개해야 한다.</span><br/>
											<span>- 연구자는 이해상충 공개 시, 다음과 같은 사항을 고려해야 한다.</span><br/>
											<br/>
											<span>(1) 지원기관의 보조금·연구기기·자문 또는 사례금 형태로 상당한 금액 제공 여부</span><br/>
											<span>(2) 지원기관의 지분이익이나 스톡옵션 등 경제적 이익에 대한 권리 제공 여부</span><br/>
											<span>(3) 지원기관에 공식·비공식 직함 소지 여부</span><br/>
											<span>(4) 연구대상에 대한 지식재산권 소지 여부</span><br/>
											<span>(5) 본인 또는 배우자의 직계가족이 소속된 회사가 위에서 기술된 것과 같은 관계를 가지는지 여부</span><br/>

										</div>
									</li>

									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅱ. 연구 설계 시의 고려사항<span></span></p>
										<div>
											<p>1. 위험과 이익의 평가</p>
											<b>1) 연구 수행 시 연구대상자에게 미치는 위험(Risk)과 이익(Benefit)</b>
											<span style="display:block;">- 위험은 연구 참여로 인해 연구 대상자에게 미치는 건강, 심리, 복지, 사회적인 측면의 부정적 결과다. 이득은 연구 참여로 얻게 될 건강, 심리, 복지, 사회적 측면의 <br/>
											긍정적인 결과다. 연구 참여시 연구대상자에게는 감수해야 하는 손상이나, 불편, 비용 등이 발생할 수 있으므로 수행하고자 하는 연구에는 연구대상자 또는 사회에 미치는 <br/>
											위험에 상응하는 기대되는 이익이 있어야 한다.</span><br/>
											<b>2) 연구 관련 위험으로 신체적/심리적/사회적 위험을 고려해야 한다.</b>
											<b>3) 연구 관련 이익으로 연구의 직접적/간접적 이익(사회적 이익)을 고려해야 한다.</b><br/>
											<br/>
											<p>2.취약한 연구대상자 보호</p>
											<b>1) 취약한 연구대상자</b>
											<span>- 해당 연구의 연구자와의 관계, 대상자의 심리적, 물리적 상황 등으로 인하여 자발적 연구 참여 결정에 부당한 영향을 받을 가능성이 높은 사람을 말한다.</span><br/>
											<span style="display:block;">- 취약한 연구대상자는 충분한 정보가 주어지더라도, 해당 정보를 이해하고 판단하는데 문제가 있거나, 강압이나 부당한 영향을 받아 자율적인 의사결정을 할 수 없어<br/>적절한 참여 동의가 어려울 수 있다.</span><br/>
											<span style="display:block;">- 취약한 연구대상자는 다른 연구대상자들과 동일한 연구 환경에 노출되더라도 취약성으로 인해 더 높은 위험에 처하거나 더 많은 부담을 받을 수 있으므로<br/> 특별한 보호가 필요하므로 더욱 주의 하여 취약한 연구대상자들이 특별히 보호받을 수 있도록 연구를 설계해야 한다.</span><br/>

											<b>2) 대리인의 동의</b>
											<span style="display:block;">- 미성년자 또는 치매환자 등과 같이 연구대상자가 연구 참여에 대한 동의능력이 없는 경우, 연구대상자를 대신하여 연구 참여 유무에 대한 결정을 내릴 수 있는 <br/>법정대리인의 동의가 필요하다.</span><br/>
											<br/>
											<b>3) 미성년자의 경우</b>
											<span>- 미성년자의 경우(만18세 미만)는 법정대리인의 동의가 필요하다.</span><br/>
											<span style="display:block;">- 연구대상자가 미성년자인 경우 법정대리인(부모)으로부터 동의를 취득해야 하지만, 미성년자가 이해능력이 있다면 법정대리인 동의 외에 <br/>본인의 동의도 함께 받는 것이 바람직하다.</span><br/>
											<br/>
											<br/>
											<p>3. 연구대상자의 개인정보보호 및 비밀보장</p>
											<b>1) 개인정보, 개인식별정보, 민감정보</b>
											<span>- 개인정보란 개인식별정보, 유전정보 또는 건강에 관한 정보 등 개인에 관한 정보를 말한다.</span><br/>
											<span>- 개인식별정보란 연구대상자와 인체유래물의 기증자의 성명·주민등록번호 등 개인을 식별할 수 있는 정보를 말한다.</span><br/>
											<span style="display:block;">- 민감정보는 사상·신념, 노동조합·정당의 가입·탈퇴, 정치적 견해, 건강, 성 생활 등에 관한 정보, 그 밖에 정보주체의 사생활을 현저히
											침해할 우려가 있는 개인정보로서<br/>개인정보보호법 시행령으로 정하는 정보를 말한다.</span><br/>

											<b>2) 비밀보장의 중요성</b>
											<span style="display:block;">- 비밀보장 의무 : 연구대상자등의 사생활은 보호되어야 하며, 사생활을 침해할 수 있는 개인정보는 당사자가 동의하거나 법률에 특별한
											규정이 있는 경우를 제외하고는 비밀로서<br/>보호되어야 한다.</span><br/>
											<span style="display:block;">- 개인정보보호와 비밀보장의 중요성 : 개인정보 노출 및 사생활 침해는 연구대상자에게 신체적, 정신적, 사회적 불이익 및 위험을 줄 수
											있고 특히 사회적 낙인으로 작용할 우려가 있으므로, 연구는 불필요한 정보가 수집되지 않도록 설계되어야 하며, 개인정보 등의 수집이
											불가피하다면 관리 과정에서 유출 되지 않도록 안전대책을 수립하여야 한다.</span><br/>

											<b>3) 개인정보 보호 방법</b>
											<span>- 자료의 관리자, 관리방법, 보관기간, 파기방법 등의 구체적인 계획을 수립하고 준수하는 것이 중요하다.</span><br/>
											<span>- 개인정보 보호대책의 한 방법인 익명화는 개인식별정보를 영구적으로 삭제하거나 개인식별정보의 전부 또는 일부를 해당 기관의 고유식별기호로 대체하는 것을 말한다.</span><br/>

										</div>
									</li>


									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅲ. 연구 수행 시의 고려사항<span></span></p>
										<div>
											<p>1. 연구대상자 선정 및 모집의 고려사항</p>
											<b>1) 선정기준과 제외기준</b>
											<span>- 연구자는 과학적으로 연구목적에 부합되는 연구대상자 선정 및 제외기준을 수립하여야 한다.</span><br/>
											<span>- 선정기준 : 연구의 특성에 맞게 연구대상자의 의학적, 인구학적, 심리적, 사회적 특성의 세부사항까지 적절하게 정해야 한다.</span><br/>
											<span>- 제외기준 : 연구로 인한 연구대상자의 위험과 이익을 고려하여 정하고 연구 계획의 비뚤림(bias)을 초래하는 경우에는 연구대상자를 제외하는 것이 필요하다.</span><br/>
											<br/>
											<b>2) 연구대상자 모집과정 시 주의점</b>
											<span>- 연구대상자가 연구에 자발적으로 참여할 수 있도록 모집방안을 마련해야 한다.</span><br/>
											<span>- 모집담당자는 모집하는 과정에서 잠재적인 이익을 부풀리고 위험을 축소하여 정보를 제공 하지 않도록 주의가 필요하다.</span><br/>
											<span>- 모집담당자는 금전적 보상을 유인책으로 연구에 참여를 독려하지 않도록 주의해야 한다.</span><br/>
											<br/>
											<p>2. 연구대상자 동의 과정의 고려사항</p>
											<b>1) 충분한 정보에 의한 동의</b>
											<span>- 인간대상연구와 인체유래물연구 수행 시 반드시 사전에 대상자 본인으로부터 연구참여에 대한 동의를 받아야 하며, 다음의 요소를 고려해야 한다.</span><br/>
											<span style="display:block;">(1) 충분한 정보 제공 : 연구자는 연구 목적, 연구의 위험과 이익을 포함한 연구에 대한 정보, 연구 절차 및 방법, 해당 연구 외에 선택 가능한 대안 등 연구와 관련된 <br/>충분한 정보를 제공해야 한다.</span><br/>
											<span style="display:block;">(2) 이해 : 연구자는 연구대상자가 연구정보에 대한 충분한 이해능력과 의사결정능력을 갖추었는지를 확인해야 한다. 연구자는 연구대상자에게 연구에 대한 설명을 하고 동의를 <br/>획득하는 과정 중에 제공한 정보의 중요사항을 이해하였는지 확인해야 한다.</span><br/>
											<span>(3) 자발성 : 연구자는 연구대상자가 자발적으로 참여하도록 해야 하며, 연구대상자에게 강압 또는 부당한 영향이 미치지 않도록 주의해야 한다.</span><br/>
											<br/>
											<b>2) 동의 획득 시 설명 내용 및 주의사항</b>
											<span>(1) 인간대상연구의 목적</span><br/>
											<span>(2) 연구대상자의 참여 기간, 절차 및 방법</span><br/>
											<span>(3) 연구대상자에게 예상되는 위험 및 이득</span><br/>
											<span>(4) 개인정보 보호에 관한 사항</span><br/>
											<span>(5) 연구 참여에 따른 손실에 대한 보상</span><br/>
											<span>(6) 개인정보 제공에 관한 사항</span><br/>
											<span>(7) 동의의 철회에 관한 사항</span><br/>
											<span>(8) 그 밖에 위원회가 필요하다고 인정하는 사항</span><br/>
											<br/>
											<span>(1) 동의서에 서명하는 사람은 ‘연구대상자 본인’이어야 하며, 동의서를 설명한 후, 연구대상자가 주변사람들과 상의할 수 있는 충분한 시간을 주어야 한다.</span><br/>
											<span>(2) 연구대상자가 궁금한 사항이 있으면 언제든 질문할 수 있도록 연구자 연락처를 제공하여야 하며, 이해하기 쉬운 용어를 사용한다.</span><br/>
											<span>(3) 연구대상자가 외국인인 경우에는 연구대상자가 사용하는 모국어를 통해 연구에 대해 설명 하고, 동의를 획득하는 것이 원칙이다.</span><br/>
											<span>동의서 설명문 및 동의서는 가능한 연구대상자의 모국어로 작성하여 제공하는 것이 바람직하며, 필요한 경우 통역자가 동의 획득 과정에 참여할 수도 있다.</span><br/>
											<span>(4) 글을 읽을 수 없는 경우는 공정한 입회자가 동의과정에 참여하며, 치매나 고령으로 인해 인지능력이 저하되었거나 미성년자의 경우는 법정대리인의 동의가 필요하다.</span><br/>
											<br/>
											<b>3) 서면동의면제</b>
											<span>- 다음 요건을 모두 충족하는 경우에는 위원회의 승인을 받아 서면동의 면제가 가능하다. 다만, 법정대리인의 서면동의는 면제가 불가하다.</span><br/>
											<span>(1) 연구대상자의 동의를 받는 것이 연구 진행과정에서 현실적으로 불가능하거나 연구의 타당성에 심각한 영향을 미친다고 판단되는 경우</span><br/>
											<span>(2) 연구대상자의 동의 거부를 추정할 만한 사유가 없고, 동의를 면하여도 연구대상자에게 미치는 위험이 극히 낮은 경우</span><br/>
											<br/>
											<br/>
											<p>3. 관련된 심의 절차 사항</p>
											<b>1) 연구계획 변경 시</b>
											<span style="display:block;">- 연구 절차의 변경, 연구대상자 추가, 연구자 교체 등 승인된 연구계획서에 변경이 필요한 경우, 연구자는 먼저 위원회에 계획변경심의를 신청하고 심의를 받은 후 변경사항을<br/>수행한다.</span><br/>
											<br/>
											<b>2) 지속심의</b>
											<span style="display:block;">- 연구자는 주기적으로 연구진행과정을 위원회에 보고하여야 한다. 이는 지속적인 보고를 통해 연구의 위험과 이익을 재평가함으로써
											연구대상자의 권리와 복지를 보호하기 위한 절차이다. 연구자는 위원회로부터 기존에 승인받은 승인유효기간(최대 1년)이 만료되기
											전에 연구 기간 연장을 위해 위원회에 지속심의를 신청하고, 연구대상자 모집현황, 연구의 단계 등을 보고하여야 한다.</span><br/>
											<br/>
											<b>3) 중대한 이상반응 보고</b>
											<span style="display:block;">- 연구대상자의 사망 등 연구의 참여가 대상자의 생명을 위협하는 경우, 입원 또는 입원기간의 연장을 초래하는 경우, 지속적인 장애나
											기능 저하를 초래하는 경우, 기타 중요한 의학적 사건 등이 발생하는 경우 연구자는 위원회에 중대한 이상반응 보고를 해야 한다.</span><br/>
											<br/>
											<b>4) 연구계획 위반·이탈 시</b>
											<span style="display:block;">- 연구자는 위원회가 승인한 연구계획서에 따라 연구를 수행해야 할 의무가 있다. 연구진행 중 연구계획서 미준수나 관련규정 위반이
											발생하였을 경우 <br/>연구자는 위원회에 위반·이탈보고를 해야 한다.</span><br/>
											<span>- 연구대상자 보호를 위해 불가피하게 연구계획서와 다르게 연구를 수행한 경우에도, 연구자는 그 사유와 조치결과에 대한 보고서를
											작성하여 위원회에게 보고해야 한다.</span><br/>


										</div>
									</li>


									<li>
										<p style="margin-top: 0px;" class="more_story">Ⅳ. 연구 종료 시의 고려사항<span></span></p>
										<div>
											<p>1. 종료보고 및 결과보고</p>
											<span>- 연구자는 위원회에 연구 종료 및 결과에 대한 사항을 위원회에 보고해야 한다.</span><br/>
											<span>- 결과보고서는 논문, 학술대회 발표자료 등으로 대체할 수 있다.</span><br/>
											<br/>
											<p>2. 연구자료 보관 및 폐기</p>
											<span>- 연구자료 보관 방법</span><br/>
											<span>(1) 연구자는 연구와 관련한 사항을 기록·보관해야 한다.</span><br/>
											<span style="display:block;">(2) 연구계획서, 위원회 심의결과, 서면동의서(또는 서면동의 면제 승인서), 개인정보의 수집·이용 및 제공 현황, <br/>연구종료보고서는 연구가 종료된 시점으로부터 3년 간 보관해야 한다.</span><br/>
											<br/>
											<span>- 개인정보 파기 방법</span><br/>
											<span>(1) 보관기간이 지난 문서 중 개인정보에 관한 사항은 「개인정보 보호법 시행령」 제16조에 따라 파기해야 한다. (전자적 파일-영구 삭제, 기록물-파쇄 또는 소각)</span><br/>
											<span>(2) 개인정보에 관한 사항을 3년 이상 보관하고자 할 경우, 위원회의 심의를 거쳐 보관기간을 연장할 수 있다.</span><br/>
											<br/>
											<span>- 인체유래물 보존 및 폐기 방법</span><br/>
											<span>(1) 인체유래물 연구자는 동의서에서 정한 기간이 지난 인체유래물을 폐기해야 한다.</span><br/>
											<span>(2) 인체유래물을 보존하는 중에 인체유래물 기증자가 보존기간의 변경이나 폐기를 요청하는 경우에는 요청에 따라야 한다.</span><br/>
											<span>(3) 인체유래물연구자가 부득이한 사정으로 인하여 인체유래물등을 보존할 수 없는 경우에는 위원회의 심의를 거쳐 인체유래물등을 처리하거나 이관해야 한다.</span><br/>

										</div>
									</li>


									<li>
										<p style="margin-top: 0px;" class="more_story">자료출저<span></span></p>
										<div>
											<span>1) 기관생명윤리위원회 정보포털 홈페이지 www.irb.or.kr</span><br/>
											<span>2) 씨젠의료재단 표준운영지침 제5판</span><br/>
										</div>
									</li>

									<li>
										<p style="margin-top: 0px;" class="more_story">부칙<span></span></p>
										<div>
											<p>(시행일)</p>
											<span style="padding:0;">이 규정은 2018년 10월 23일부터 시행한다.</span>
										</div>
									</li>

								</ul>
							</div>
						</div>
						<!--//tab01 End-->
						
						
						<!--tab menu01-->
						<div class=" _contentView _view_document">
							<!--sub_apply01-->
							<div class="sub_apply01">
								<img src="<c:url value='/user/img/sub/sim_n_01.jpg'/>" alt="심의신청이미지1"/>
	
								<div class="apply_table01">
									<p>정규/신속 심의</p>
									<img src="<c:url value='/user/img/red_bar2.png'/>" alt="레드바"/>
									<table>
										<tbody>
	
											<tr>
												<td>1.연구계획심의의뢰서</td>
												<td>9.증례기록서</td>
											</tr>
	
											<tr>
												<td>2.연구계획서</td>
												<td>10.동의면제 사유서 (해당되는 경우)</td>
											</tr>
	
											<tr>
												<td>3.연구계획서 요약</td>
												<td>11.설명문 및 동의서 (해당되는 경우)</td> 
											</tr>
	
											<tr>
												<td>4.이해상충서약서</td>
												<td>12.타 위원회에서 심의되었을 경우,심의통보서 사본 (해당되는 경우)</td>
											</tr>
	
											<tr>
												<td>5.생명윤리준수서약서</td>
												<td>13.연구비내역서 (해당되는 경우)</td> 
											</tr>
	
											<tr>
												<td>6.연구자 이력서</td>
												<td>14.연구대상자 모집관련 문서 (해당되는 경우)</td>
											</tr>
	
											<tr>
												<td>7.연구윤리교육 이수증</td>
												<td>15.위원회에 의해 요구되는 보고서나 그 외의 양식 (해당되는 경우)</td>
											</tr>
	
											<tr>
												<td>8.신속심의 의뢰서 (해당되는 경우)</td>
												<td></td>
											</tr>
	
	
										</tbody>
									</table>
								</div>
							</div>
							<!--//sub_apply01 End-->
	
	
							<!--sub_apply02-->
							<div class="sub_apply02">
	
								<div class="apply_table02">
									<p>심의면제</p>
									<img src="<c:url value='/user/img/red_bar2.png'/>" alt="레드바"/>
									<table>
										<tbody>
	
											<tr>
												<td>1.연구계획심의 의뢰서</td>
											</tr>
	
											<tr>
												<td>2.연구계획서</td>
											</tr>
	
											<tr>
												<td>3.연구계획서 요약</td>
											</tr>
	
											<tr>
												<td>4.심의면제 신청서</td>
											</tr>
	
											<tr>
												<td>5.동의면제 사유서</td>
											</tr>
	
											<tr>
												<td>6.이해상층서약서</td>
											</tr>
											
											<tr>
												<td>7.연구자 이력서</td>
											</tr> 
											
											<tr>
												<td>8.연구윤리교육 이수증</td>
											</tr>  
	
										</tbody>
									</table>
	
								</div>
	
								<div class="apply_table02">
									<p>연구계획 변경 심의</p>
									<img src="<c:url value='/user/img/red_bar2.png'/>" alt="레드바"/>
									<table>
										<tbody>
											
											<tr>
												<td>1.연구계획변심의 의뢰서</td>
											</tr>
	
											<tr>
												<td>2.변경대비표</td>
											</tr>
	
											<tr>
												<td>3.변경된 연구계획서 (변경내용표시)</td>
											</tr>
	
											<tr>
												<td>4.연구 중 발생한 중대한 이상반응에 대한 보고서</td>
											</tr>
	
											<tr>
												<td>5.기타 변경된 서류 (설명문 및 동의서 등,해당되는 경우)</td>
											</tr>
	
										</tbody>
									</table>
	
								</div>
								<img src="<c:url value='/user/img/sub/sim_n_02.jpg'/>" alt="심의신청이미지2"/>
							</div>
							<!--//sub_apply02 End-->
	
	
							<!--sub_apply03-->
							<div class="sub_apply03">
								<img src="<c:url value='/user/img/sub/sim_n_03.jpg'/>" alt="심의신청이미지3" />
	
								<div class="apply_table03">
									<p>재심의</p>
									<img src="<c:url value='/user/img/red_bar2.png'/>" alt="레드바"/>
									<table>
										<tbody>
	
											<tr>
												<td>1.보완 전 후 변경대비표</td>
											</tr>
	
											<tr>
												<td>2.보완 심의 신청서</td>
											</tr>
	
											<tr>
												<td>3.보완된 연구계획서 (보완된 사항 표시)</td>
											</tr>
	
											<tr>
												<td>4.기타 보완된 서류</td>
											</tr>
	
										</tbody>
									</table>
	
								</div>
	
								<div class="apply_table03">
									<p>지속심의</p>
									<img src="<c:url value='/user/img/red_bar2.png'/>" alt="레드바"/>
									<table>
										<tbody>
	
	 										<tr>
												<td>1.지속심의 의뢰서</td>
											</tr>
	
											<tr>
												<td>2.중간보고 보고서</td>
											</tr>
	
											<tr>
												<td>3.연구윤리교육 이수증</td>
											</tr>
	
											<tr>
												<td>4.기타 </td>
											</tr>
										</tbody>
									</table>
	
								</div>
	
								<div class="apply_table03">
									<p>종료보고</p>
									<img src="<c:url value='/user/img/red_bar2.png'/>" alt="레드바"/>
									<table>
										<tbody>

 	 										<tr>
												<td>1.종료심의 의뢰서</td>
											</tr>
											
											<tr>
												<td>2.종료결과보고서</td>
											</tr>
											
											<tr>
												<td>3.인체유래물관리대장</td>
											</tr>
											
											<tr>
												<td>4.연구계획 위반/이탈 보고서 (해당되는 경우)</td>
											</tr>
											
											<tr>
												<td>5.기타 </td>
											</tr> 
										</tbody>
									</table>
	
								</div>

							</div>
						</div>
						<!--//tab01 End-->
						
					</div>

			</div>
			<div class="gray_bg2 _contentView _view_program"></div>
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
	
	function checkHash(){
		
		if (document.location.hash != ""){     //받아올 해시가 있으면
				var arrHash = new Array();
				var hash = document.location.hash;
				arrHash = hash.split("#");
				
				$("._tab_"+ arrHash[1]).trigger('click');
				
			}else{
				$("._tab-link").first().trigger('click');
			}
		}
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
		});
		
		
		
		$(document).ready(function(){
			$("._tab-link").click(function(){
				
				$("._tab-link").removeClass('current');
				$(this).addClass('current');
				var view = $(this).data('view');
				$("._contentView").hide();
				$("._view_"+view).show();
			});
			
			
			checkHash();
		});
	
	</script>
</body>
</html>
