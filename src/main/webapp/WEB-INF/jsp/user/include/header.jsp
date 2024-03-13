<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags"%>
<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-215858T0EG"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-215858T0EG');
</script>
</head>
<!--header-->
<header>
	<c:choose>
		<c:when test="${not empty logos.leftLogo }">
			<c:choose>
				<c:when test="${not empty logos.leftLogo.url }">
					<img src="<c:out escapeXml="false" value='${logos.leftLogo.logoImage }'/>" class="left_logo_click _leftLogoClick" data-url="<c:out value='${logos.leftLogo.url }'/>"	alt="좌측로고" />
				</c:when>
				<c:otherwise>
					<img src="<c:out escapeXml="false" value='${logos.leftLogo.logoImage }'/>" class="left_logo" alt="좌측로고" />	
				</c:otherwise>
			</c:choose>
			
		</c:when>
		<c:otherwise>
		
			 
			<%-- <img src="<c:url value='/user/img/logo_left.png'/>" class="left_logo"	alt="좌측로고" /> --%>
			     <img src="<c:url value='/user/img/logo_new_2023.png'/>" class="left_logo"	alt="좌측로고" />
			<%-- <img src="<c:url value='/user/img/logo_left_1.png'/>" class="left_logo"	alt="좌측로고" />
			     <img src="<c:url value='/user/img/logo_left_2.png'/>" class="left_logo"	alt="우측로고" />  --%>
			
			
		</c:otherwise>
	</c:choose>
<%-- 	<img src="<c:url value='/user/img/logo_left2.png'/>" onClick="window.open('https://www.seegenemedical.com')" class="left_logo"	alt="좌측로고" /> --%>
		<c:choose>
			<c:when test="${not empty logos.centerLogo }">
				<h1 class="logo"><a href="<c:url value='/'/>" style="background: url('<c:out escapeXml="false" value='${logos.centerLogo.logoImage }'/>') no-repeat 0 0;"></a></h1>
			</c:when>
			<c:otherwise>
				<h1 class="logo"><a href="<c:url value='/'/>"></a></h1>
			</c:otherwise>
		</c:choose>
<%-- 		<h1 class="logo"><a href="<c:url value='/'/>"></a></h1> --%>
			<div class="search">

				<b class="search_bar"></b>
				<form id="headerSearchForm" method="get" action="">
				<select name="searchOption" id="search_arrow">
					<option value="test">검사항목 조회</option>
					<option value="all">전체</option>
				</select>

				<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요." id="headerSearchWord">
				<img src="<c:url value='/user/img/search.png'/>" alt="검색아이콘" class="_headerSearchBtn">
				</form>
			</div>

	<nav id="menu_bar">

		<ul>
	 	<c:forEach items="${menus.topMenus}" var="parentMenu" varStatus="status">
	 		<li class="hvr-bounce-to-bottom gnb_on0<c:out value='${status.count }'/>">
				<a href="javascript:void(0);"><c:out value="${parentMenu.menuName }"/></a>
			</li>
		</c:forEach>

			<!--검사결과조회-->
			<li onclick="location.href='#'" id="not_gnb" class="not_gnb">
				<a href="#" class="test_text">검사결과조회</a>
			</li>

		</ul>

	<sec:authorize access="isAnonymous()">
		<div id="login_box">
			<form method="post" action="" name="register" id="formLogin">
				<sec:csrfInput />
				<table>
					<tbody>
						<tr>
							<td>
								<input type="text" name="userId" maxlength="18" placeholder="아이디" class="table_id" id="headerId"/>
							</td>
						</tr>

						<tr>
							<td>
								<input type="password" name="pwd" maxlength="20" placeholder="비밀번호" id="pwd">
							</td>
						</tr>

						<tr>
							<td>
								<button type="button" name="로그인" value="로그인" id="btnLogin">로그인</button>
							</td>
						</tr>
					</tbody>
				</table>

					<input type="checkbox" id="idsave" name="idsave">
					<label for="idsave">ID 저장하기</label>
					<br>
					<input type="checkbox" id="I_DID" name="I_DID">
					<label for="I_DID" style="display:none" >DID 사용</label>

			</form>
		</div>
		</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<div id="login_box_on">
		<sec:authentication property="principal.name" var="userName" />
		<sec:authentication property="principal.trmsUrl" var="trmsUrl" />
			<p>
				<span class="user_name"><c:out value="${userName }"/></span><br/>님 환영합니다.
			</p>

	<c:choose>
		<c:when test="${not empty trmsUrl}">
		<input type="button" value="검사결과조회" id="goTrms" class="_goTrms">
		</c:when>
		<c:otherwise>
			<br/><br/><br/>
		</c:otherwise>
	 </c:choose>
		 
			<a href="javascript:void(0);" class="_logout" >로그아웃</a>
		</div>
		<form action="/auth/logout.do" method="post" id="logoutForm">
			<sec:csrfInput />
		</form>
	</sec:authorize>
	</nav>

	<!--gnb menu-->
	<div class="header_gnb" style="display:none;">
		<div class="gnb_inner">
			<img src="<c:url value='/user/img/sub/popup_bg.png'/>" class="gnb_bg" alt="주메뉴배경"/>
				<div class="gnb_center">

				<c:forEach items="${menus.topMenus}" var="parentMenu" varStatus="parentStatus">
					<ul class="img_ul">
						<li><img src="<c:url value='/user/img/gnb_sil.png'/>" alt="주메뉴실선" class="gnb_sil"/></li>
					</ul>
				
					<ul class="g_sub_menu gnb_off0<c:out value='${parentStatus.count}'/>">
					<c:forEach items="${parentMenu.childs}" var="childMenu">
						<c:choose>
							<c:when test='${not empty childMenu.childs}'>
								<li data-flag="n" class="li_bt">
									<a href="javascript:void(0);"><c:out value="${childMenu.menuName }"/><span class="g_more"></span></a>
										<ul class="off">
											<c:forEach items="${childMenu.childs}" var="l2Child">
												<li><a href="<c:url value='${l2Child.menuUrl }'/>">- <c:out value="${l2Child.menuName }"/></a></li>
											</c:forEach>
										</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="<c:url value='${childMenu.menuUrl }'/>"><c:out value="${childMenu.menuName }"/></a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</ul>
				</c:forEach>

				</div>
		</div>
	</div>
	<!--//gnb menu End-->

<!--//header End-->
</header>
<!--//header End-->

<!-- 현재 메뉴 정보 찾기 -->
<c:set var="nowURI" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<!-- 상위 메뉴 찾기 -->
<c:forEach items="${menus.topMenus}" var="parentMenu">
	<c:forEach items="${parentMenu.childs}" var="childMenu">
		<c:if test='${not empty childMenu.menuUrl && fn:startsWith(nowURI, fn:replace(childMenu.menuUrl, "/index.do", ""))}'>
			<c:set var="parentMenuSeq" value="${parentMenu.seq }" scope="request"/>
			<c:set var="parentMenuName" value="${parentMenu.menuName }" scope="request"/>
			<c:set var="childMenuSeq" value="${childMenu.seq }" scope="request"/>
			<c:set var="childMenuName" value="${childMenu.menuName }" scope="request"/>
		</c:if>
	</c:forEach>
</c:forEach>

<form id="headerHiddenTestForm">
	<input type="hidden" name="searchFlag" value="Y"/>
	<input type="hidden" name="searchKeyword" value="Y" id="headerHiddenTestSearchKeyword"/>
</form>
<form id="headerHiddenAllSearchForm">
	<input type="hidden" name="searchKeyword" value="Y" id="headerHiddenAllSearchKeyword"/>
</form>





	<!-- 로그인비밀번호변경팝업 -->
	
<div id="pw_modal" class="pw_modal" style="display:none;">
<div id="popup">
	<div class="popup_title">

		<span id="paper_name">비밀번호가 초기화 되었습니다.</span>

<%-- 		<b class="close_bt _pwModalClose"><img src="<c:url value='/user/img/sub/close.png'/>" alt="닫기버튼"/></b>  --%>
	</div>
	<div class="popup_inner">
		<form id="formChangePw">
			<input type="hidden" name="userId" id="changePwId" value=""/>
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
					<th>기존 비밀번호</th>
					<td><input type="password" name="nowPw"/></td>
				</tr>
			
				<tr>
					<th>신규 비밀번호</th>
					<td><input type="password" name="newPw"/></td>
				</tr>
				
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="newPwCheck"/></td>
				</tr>
			</tbody>
		</table>
		</form>	
		<div class="ok_area">
			<span id="btnChangePw">확인</span>
		</div>
					
	</div>

</div>

<div class="popup_bg _changePwArea"></div>
</div>



<script type="text/javascript">


	$(document).ready(function(){
		
		var cookid = getId();
		var cookpw = getPw();
		if(cookid && !CommonUtil.isEmptyString(cookid)){
			$("#headerId").val(cookid);
			if(cookpw && !CommonUtil.isEmptyString(cookpw)){
				$("#pwd").val(cookpw);
			}
			$("#idsave").prop("checked", "checked");
		}
		
		$("#pwd").keydown(function(evt){
			if(evt.keyCode == 13){
				$("#btnLogin").trigger('click');
			}
		});
		
		$("#btnLogin").click(function(){
			var param = $('#formLogin').serializeObject();
			var I_DID = $("input:checkbox[id='I_DID']").is(":checked") == true ? "Y" : "N";
			param["I_DID"] = I_DID;
			
			if(CommonUtil.isEmptyString(param.userId) || CommonUtil.isEmptyString(param.pwd)){
				alert('회원님의 로그인 정보를 정확히 입력해 주세요.');
				return;
			//}else if(param.pwd.length > 8){
			//	alert('패스워드는 8자리 이하만 가능합니다.');
			//	return;
			}
			axios.post("<c:url value='/auth/userLogin.do" + "?I_DID=" + I_DID + "' />", param)
				.then(function (res) {
					
					if(res.data.resultCode.code == 7){
						if(param.idsave){
							saveUserId(param.userId);
							saveUserPw(param.pwd);
						}
						location.replace(res.data.resultCode.callUrl);
// 						window.open(res.data.resultCode.callUrl, '_blank'); 
// 						window.location.reload();
					}else if(res.data.resultCode.code == 1){
						alert('이용자 패스워드가 다릅니다.');
					}else if(res.data.resultCode.code == 2){
						alert('이용자 ID가 존재하지 않습니다.');
					}else if(res.data.resultCode.code == 3){
						alert('사용가능한 병원기초자료가 없습니다.');
					}else if(res.data.resultCode.code == 8){
						$("#changePwId").val(res.data.resultCode.callUrl);
						$("#pw_modal").show();
					}
				 
				})
				.catch(function (error) {
					console.log(error);
				});
		});
		
		
// 		$("._pwModalClose").click(function(){
// 			$("#pw_modal").hide();
// 			window.location.reload();
// 		});
// 		$("._changePwArea").click(function(){
// 			$("#pw_modal").hide();
// 			window.location.reload();
// 		});
		
		
		$("#btnChangePw").click(function(){
			var param = $('#formChangePw').serializeObject();
			
			if(CommonUtil.isEmptyString(param.nowPw)){
				alert('기존 비밀번호를 입력해 주세요.');
				return;
			}
			if(CommonUtil.isEmptyString(param.newPw)){
				alert('신규 비밀번호를 입력해 주세요.');
				return;
			}
			if(CommonUtil.isEmptyString(param.newPwCheck)){
				alert('비밀번호 확인을 입력해 주세요.');
				return;
			}
			
			if(CheckPassword(param.newPw)){
				
				if(!param.newPw == param.newPwCheck){
					alert('신규 비밀번호와 비밀번호 확인이 일치 하지 않습니다.');
					return;
				}
				
				axios.post("<c:url value='/auth/changeUserPw.do' />", param)
				.then(function (res) {
					if(res.data.resultCode.code == 7){
						alert('비밀번호가 변경되었습니다.');
						location.replace(res.data.resultCode.callUrl);
					}else if(res.data.resultCode.code == -9){
						alert('로그인 정보가 없습니다.');
					}else if(res.data.resultCode.code == -8){
						alert('신규 비밀번호와 비밀번호 확인이 일치 하지 않습니다.');
					}else if(res.data.resultCode.code == -7){
						alert('존재하지 않는 사용자 입니다.');
					}
				 
				})
				.catch(function (error) {
					console.log(error);
				});
				
			}
		});
		
		
		$("._logout").click(function(){
			if(confirm('로그아웃 하시겠습니까?')){
				$("#logoutForm").submit();
			}
		});
		
		
		<sec:authorize access="isAuthenticated()">
			<c:if test="${not empty trmsUrl}">
			$("._goTrms").click(function(){
// 				window.open('<c:out value="${trmsUrl}"/>', '_blank');
				axios.get("<c:url value='/goTrms.json' />")
				.then(function (res) {
					if(!CommonUtil.isEmpty(res.data.result)){
						//window.open(res.data.result, '_blank');
						location.replace(res.data.result);
					}
				
				})
				.catch(function (error) {
					console.log(error);
				});

			});
			</c:if>
		</sec:authorize>
		
		
		//상단 검색 관련
		$("#headerSearchWord").keydown(function(evt){
			if(evt.keyCode == 13){
				$("._headerSearchBtn").trigger('click');
				return false;
			}
		});
		
		$("._headerSearchBtn").click(function(){
			var param = $('#headerSearchForm').serializeObject();
			
			if(param.searchOption == 'test'){
				$("#headerHiddenTestSearchKeyword").val(param.searchKeyword);
				$("#headerHiddenTestForm").attr('action', "<c:url value='/task/test/index.do' />").submit();
			}else{
				$("#headerHiddenAllSearchKeyword").val(param.searchKeyword);
				$("#headerHiddenAllSearchForm").attr('action', "<c:url value='/search/index.do' />").submit();
			}
		});
		
		
		
		//왼쪽 베너 클릭 관련
		$("._leftLogoClick").click(function(){
			var logoUrl = $(this).data('url');
			if(!CommonUtil.isEmpty(logoUrl)){
				window.open(logoUrl, '_blank');
			}
		});
		
		
	});

</script>


