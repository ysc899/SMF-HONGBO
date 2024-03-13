<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags"%>

<!--header-->
<div class="login_header_center">

	<sec:authorize access="isAnonymous()">
		<div id="login_box02" class="login_box02">
			<form method="post" action="" name="register" id="formLogin">
				<sec:csrfInput />
				<table>
					<tbody>
						<tr>
							<td>
								<input type="text" name="userId" placeholder="아이디" class="table_id" id="loginHeaderId"/>
							</td>
						</tr>

						<tr>
							<td>
								<input type="password" name="pwd" placeholder="비밀번호" id="pwd">
							</td>
						</tr>

						<tr>
							<td>
								<button type="button" name="로그인" value="로그인" id="btnLogin">로그인</button>
							</td>
						</tr>
					</tbody>
				</table>

					<input type="checkbox" id="idsave03" name="idsave" class="idsave02">
					<label for="idsave03">ID 저장하기</label>
			</form>
		</div>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<div id="login_box_on02" class="login_box_on02">
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


<!--//header End-->
</div>
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

			<c:forEach items="${childMenu.childs}" var="l3Menu">
				<c:if test='${not empty l3Menu.menuUrl && fn:startsWith(nowURI, l3Menu.menuUrl)}'>
					<c:set var="l3MenuSeq" value="${l3Menu.seq }" scope="request"/>
					<c:set var="l3MenuName" value="${l3Menu.menuName }" scope="request"/>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
</c:forEach>


<script type="text/javascript">


	$(document).ready(function(){
		
		
		
		var cookid = getId();
		var cookpw = getPw();
		if(cookid && !CommonUtil.isEmptyString(cookid)){
			$("#loginHeaderId").val(cookid);
			if(cookpw && !CommonUtil.isEmptyString(cookpw)){
				$("#pwd").val(cookpw);
			}
			$("#idsave03").prop("checked", "checked");
		}
		
		$("#pwd").keydown(function(evt){
			if(evt.keyCode == 13){
				$("#btnLogin").trigger('click');
			}
		});
		
		$("#btnLogin").click(function(){
			var param = $('#formLogin').serializeObject();
			
			if(CommonUtil.isEmptyString(param.userId) || CommonUtil.isEmptyString(param.pwd)){
				alert('회원님의 로그인 정보를 정확히 입력해 주세요.');
				return;
			//}else if(param.pwd.length > 8){
			//	alert('패스워드는 8자리 이하만 가능합니다.');
			//	return;
			}
			axios.post("<c:url value='/auth/userLogin.do' />", param)
				.then(function (res) {
					
					if(res.data.resultCode.code == 7){
						if(param.idsave){
							saveUserId(param.userId);
							saveUserPw(param.pwd);
						}
						
						window.open(res.data.resultCode.callUrl, '_blank'); 
						window.location.reload();
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
		
		$("._logout").click(function(){
			if(confirm('로그아웃 하시겠습니까?')){
				$("#logoutForm").submit();
			}
		});
		
		
		<sec:authorize access="isAuthenticated()">
			<c:if test="${not empty trmsUrl}">
			$("._goTrms").click(function(){
				
				
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
				
				
				
				
// 				window.open('<c:out value="${trmsUrl}"/>', '_blank'); 
			});
			</c:if>
		</sec:authorize>
		
		
		
	});

</script>


