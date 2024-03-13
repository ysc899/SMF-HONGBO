
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Language" content="ko" >
	<title>:: 씨젠의료재단 관리자페이지::</title>

	<link type="text/css" rel="stylesheet" href="<c:url value='/admin/css/login.css'/>"/>
	
	<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>

</head>
<body>
	<!--wrap-->
	<div id="wrap">

		<div class="login_box">

			<!--login 메인 배경-->
			<div class="bg_area">
				<p>Seegenmadical</br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Administrator Page</p>
				<ul>
					<li onClick="window.open('https://www.seegenemedical.com/index.jsp','resizable=yes,resize=1,scrollbars=1,status=1'); return false"></li>
					<li onClick="window.open('http://mail.mf.seegene.com/login.php?back_url=%2F','resizable=yes,resize=1,scrollbars=1,status=1'); return false"></li>
					<li onClick="window.open('http://sgtown.seegenemedical.com/sw_admin/login.php','resizable=yes,resize=1,scrollbars=1,status=1'); return false"></li>
				</ul>
			</div>
			<!--//login 메인배경 끝-->

			<!--login창-->
			<div class="login">
				<p class="title">Login</p>

				<form id="loginForm" name="loginForm" method="post" action="<c:url value='/auth/login.do'/>">
					<sec:csrfInput />
					<input type="text" placeholder="User ID" id="id" name="j_username" maxlength="10">

					<input type="password" placeholder="Password" maxlength="25" id="password" name="j_password" >
<!-- 											   onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }" > -->

					<input type="button" value="로그인" class="login_button" id="btnLogin">
<!-- 					<input type="button" value="로그인" class="login_button" id="btnLogin" onclick="javascript:actionLogin()"> -->
				</form>

				<span>COPYRIGHT&copy; SEEGENE MEDICAL FOUNDATION. ALL RIGHT RESERVED.</span>

			</div>
			<!--//login창 끝-->

		</div>


	</div>
	<!--//wrap End-->
<!-- //전체 레이어 끝 -->

	<script type="text/javascript">
	
	//파라미터 조회
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	
	
	$(document).ready(function(){
		
		if(getParameterByName('fail')){
			alert('관리자 접속정보를 확인하세요.');
		}
		
		
		$("#btnLogin").click(function(){
			actionLogin();
		})
		
		$("#password").keydown(function(evt){
			if(evt.keyCode == 13){
				actionLogin();
			}
		});
		
	});
	
	
	function actionLogin() {

		let id = $("#id").val();
		let pass = $("#password").val();
		
		if(id === ''){
			alert('아이디를 입력하세요.');
			return false;
		}
		
		if(pass === ''){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		$("#loginForm").submit();
		
	}
	</script>
</body>
</html>