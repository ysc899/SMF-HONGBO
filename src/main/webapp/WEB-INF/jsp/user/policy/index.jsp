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
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" >
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/seegene_policy.css'/>" type="text/css" rel="stylesheet"/>
	
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
	<jsp:include page="../include/login_header.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	<!--wrap-->
	<div id="wrap">
		
		<!-- banner_bg-->
		<div class="banner_bg">
			<h1>개인정보 취급방침</h1>
		</div>
		<!--banner_bg End-->
		<!--container-->
			<div id="container">

					<div class="sub_story">

						<div class="sub_guideline01">
							<p>씨젠의료재단의 개인정보취급방침입니다. (최종개정일 : 2020년 11월)</p>
							<span>'(재)씨젠의료재단'은 (이하 '회사'는)<br/>
							<br/>
							고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br/>
							회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br/>
							<br/>
							회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br/>
							<br/>
							본 방침은 : 2009 년 06 월 30 일 부터 시행됩니다.</span>
						</div>

						<div class="sub_guideline02 toggle_guide">
							<!-- <p>Section 1.윤리지침과 생명윤리법</p> -->

							<ul class="off">

								<li>
									<p class="more_story">수집하는 개인정보 항목<span></span></p>
									<div class="answer">
										<p>- 회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
										<br/>
										<b>수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 휴대전화번호 , 이메일 , 회사명 , 주소, 전화번호, 이동전화번호 , 주민등록번호 , 학력 , 면허번호, 이메일, 서비스 이용기록 , 접속 로그 ,
										쿠키 , 접속 IP 정보 , 요양기관번호, 사업자등록번호, 출신교</b><br/>
										<br/>
										<b>개인정보 수집방법 : 홈페이지(회원가입, 게시판 등)</b>
									</div>
								</li>


								<li>
									<p class="more_story">개인정보의 수집 및 이용목적<span></span></p>
									<div class="answer">
										<p>- 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
										<br/>
										<b>서비스 제공에 관한 문의 사항에 대한 답변 및 접속통계 자료</b>
										<b>회원 관리 : 회원제 서비스 이용에 따른 본인확인 , 불만처리 등 민원처리 , 고지사항 전달</b>
										<b>마케팅 및 광고에 활용 : 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</b>
									</div>
								</li>


								<li>
									<p class="more_story">개인정보의 보유 및 이용기간<span></span></p>
									<div class="answer">
										<p style="margin-bottom:10px;">- 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.</p>
										<p><span style="visibility:hidden;">-</span> 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한
										기간 동안 회원정보를 보관합니다.</p>
										<br/>
										<b>보존 항목 : 요양기관번호, 사업자등록번호, 출신교 등</b>
										<b>보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률</b>
										<b>보존 기간 : 5년</b><br/>
										<br/>
										<b>계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)</b>
										<b>대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)</b>
										<b>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)</b>
										<b>신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)</b>
										<b>의무기록에 관한기록 5년</b>
									</div>
								</li>


								<li>
									<p class="more_story">개인정보의 파기절차 및 방법<span></span></p>
									<div class="answer">
										<p style="margin-bottom:10px;">- 회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.</p>
										<p><span style="visibility:hidden;">-</span> 파기절차 및 방법은 다음과 같습니다.</p>
										<br/>
										<b>파기절차 : 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함)</b>
										<b>내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.</b>
										<b>별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.</b>
										<b>파기방법 : 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</b>
									</div>

								</li>


								<li>
									<p class="more_story">개인정보 제공<span></span></p>
									<div class="answer">
										<p style="margin-bottom:10px;">- 회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다.</p>
										<p><span style="visibility:hidden;">-</span> 다만, 아래의 경우에는 예외로 합니 다.</p>
										<br/>
										<b>이용자들이 사전에 동의한 경우</b>
										<b>법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</b>
									</div>

								</li>


								<li>
									<p class="more_story">수집한 개인정보의 위탁<span></span></p>
									<div class="answer">
										<p style="margin-bottom:10px;">- 회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다.</p>
										<p><span style="visibility:hidden;">-</span> 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습
										니다.</p>
									</div>

								</li>


								<li>
									<p class="more_story">이용자 및 법정대리인의 권리와 그 행사방법<span></span></p>
									<div class="answer">
										<p style="margin-bottom:10px;">- 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하 거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.</p>
										<p style="margin-bottom:10px; line-height: 1.3em;"><span style="visibility:hidden;">-</span> 이용자 혹은 만 14세 미만 아동의 개인정보 조회-수정을 위해서는‘개인정보변경’(또는‘회원정보수정’등)
										을 가입해지(동의철회)를 위해서는 “회원탈퇴”의사를 <br/>
										&nbsp;&nbsp;해당 담당자에게 연락하여 본인 확인<span style="visibility:hidden;">-</span> 절차를 거친 후 정정 또는 탈퇴가 가능합니다.<br/>
										&nbsp;&nbsp;혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.</p>

										<p style="margin-bottom:10px;line-height: 1.3em;"><span style="visibility:hidden;">-</span> 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용
										또는 제공하지 않습니다.<br/><span style="visibility:hidden;">-</span> 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자
										에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.</p>

										<p style="margin-bottom:10px;line-height: 1.3em;"><span style="visibility:hidden;">-</span> oo는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “oo가 수집하는 개인정보의
										보유 및 이용기간”에 명시된 바에 따라 처리하고 <br/>
										&nbsp;&nbsp;그 외의용도로 열람 또는 이용할 수 없도록<span style="visibility:hidden;">-</span> 처리하고
										있습니다.</p>
									</div>

								</li>


								<li>
									<p class="more_story">개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<span></span></p>
									<div class="answer">
										<p style="margin-bottom:10px;">- 회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다.</p>
										<p style="margin-bottom:10px;"><span style="visibility:hidden;">-</span> 쿠키란 oo의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하
										드디스크에 저장됩니다.</p>
										<p><span style="visibility:hidden;">-</span> 회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.</p>
										<br/>
										<p>1. 쿠키 등 사용 목적</p><br/>
										<b>회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적,
										각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
										귀하는 쿠키 설치에<br/> 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로
										써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할
										수도 있습니다.</b><br/>
										<br/>
										<p>2. 쿠키 설정 거부 방법</p><br/>
										<b>예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠
										키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</b><br/>
										<br/>
										<p>- 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
										단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</p>
									</div>

								</li>


								<li>
									<p class="more_story">개인정보보호책임자의 지정<span></span></p>
									<div class="answer">
										<p>- 우리 재단의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 우리 재단은 아래와 같이
										개인정보관리책임자 혹은 담당부서를 두고 있다.</p>
										<br/>
										<p>1. 개인정보관리책임자</p>
										<br/>
										<b>성 명 : 한규섭</b>
										<b>직 위 : 대표의료원장</b>
										<b>소 속 : 재단법인 씨젠의료재단 전문의</b>
										<b>연락처 : 02-2218-9100</b>
										<b>이메일 : kshan@mf.seegene.com</b><br/>
										<br/>
										<p>2. 개인정보취급책임자</p>
										<br/>
										<b style="color:#666; padding-left:0; background:none;">① 정책임자</b>
										<b>성 명 : 홍창식</b>
										<b>직 위 : 상무이사</b>
										<b>소 속 : 재단법인 씨젠의료재단 검사관리본부</b>
										<b>연락처 : 02-2218-9011</b>
										<b>이메일 : hongco@mf.seegene.com</b><br/>
										<br/>
										<!-- <b style="color:#666; padding-left:0; background:none;">② 부책임자</b>
										<b>성 명 : 박성태</b>
										<b>직 위 : 차장(부팀장)</b>
										<b>소 속 : 재단법인 씨젠의료재단 검사관리본부</b>
										<b>연락처 : 02-2218-9044</b>
										<b>이메일 : doksa1498@mf.seegene.com</b><br/>
										<br/> -->
										<b style="color:#666; padding-left:0; background:none;">② 부책임자</b>
										<b>성 명 : 김건민</b>
										<b>직 위 : 대리</b>
										<b>소 속 : 재단법인 씨젠의료재단 검사관리본부</b>
										<b>연락처 : 02-2218-9122</b>
										<b>이메일 : medikkm@mf.seegene.com</b><br/>
										<br/>
										<p>3. 개인정보보안책임자</p>
										<br/>
										<b style="color:#666; padding-left:0; background:none;">① 정책임자</b>
										<b>성 명 : 백기성</b>
										<b>직 위 : 이사</b>
										<b>소 속 : 재단법인 씨젠의료재단 정보지원본부</b>
										<b>연락처 : 02-2218-9012</b>
										<b>이메일 : smith2013@mf.seegene.com</b><br/>
										<br/>
										<b style="color:#666; padding-left:0; background:none;">② 부책임자</b>
										<b>성 명 : 김윤영</b>
										<b>직 위 : 차장(팀장)</b>
										<b>소 속 : 재단법인 씨젠의료재단 정보지원본부</b>
										<b>연락처 : 02-2218-9055</b>
										<b>이메일 : yykim@mf.seegene.com</b>
										<br/>
										<br/>
										<p style="margin-bottom:10px;">귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자
										혹은 담당부서로 신고하실 수 있습니다.</p>
										<p style="margin-bottom:10px;">회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을
										드릴 것입니다.</p>
										<p style="margin-bottom:10px;">기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
										<br/>
										<b style="color:#666; padding-left:0; background:none;">① 경찰청 사이버안전국(<a style="color:#666;" href="https://cyberbureau.police.go.kr" target="_blank">https://cyberbureau.police.go.kr</a>) / (국번없이) 182</b>
										<b style="color:#666; padding-left:0; background:none;">② 대검찰청 사이버수사과(<a style="color:#666;" href="https://cybercid.spo.go.kr" target="_blank">https://cybercid.spo.go.kr</a>) / (국번없이) 1301</b>
										<b style="color:#666; padding-left:0; background:none;">③ 개인정보 침해신고센터(<a style="color:#666;" href="https://privacy.kisa.or.kr" target="_blank">https://privacy.kisa.or.kr</a>) / (국번없이) 118</b>
										<b style="color:#666; padding-left:0; background:none;">④ 개인정보 분쟁조정위원회(<a style="color:#666;" href="https://www.kopico.go.kr" target="_blank">https://www.kopico.go.kr</a>) / 1833-6972</b>
									</div>

								</li>
							</ul>
						</div>
					</div>

			</div>
			<!--//container End-->
			<jsp:include  page="../include/rolling.jsp"></jsp:include >

		<div id="top_bt">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../include/footer.jsp"></jsp:include >
		<!--//footer End-->
	</div>
	
	<!--//wrap End-->

	<!--quick-menu-->
	<jsp:include  page="../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../include/fixed_header.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
