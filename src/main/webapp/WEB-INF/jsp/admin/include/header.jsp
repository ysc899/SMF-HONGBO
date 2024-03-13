<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>

<!--main_header-->
<div class="main_header">
	<ul>
		<sec:authentication property="principal.name" var="userName" />
		
		<li class="_editMyInfo"><img src="<c:url value='/admin/img/user.svg' />" alt="프로필"><c:out value="${userName }"/></li>
		<li class="_goUserPage">사용자 페이지</li>
		<li><a href="javascript:void(0);" class="_logout" style="color:#fff;">로그아웃</a></li>
	</ul>
	<form action="/auth/logout.do" method="post" id="logoutForm">
		<sec:csrfInput />
	</form>
</div>
<!--//main_header End-->
	<!-- 모달  -->
		<!-- 출처 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalMyEdit">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">비밀번호 수정</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="editMyInfoForm">
				    	<table class="table">
				    		<colgroup>
				    			<col width="150px;">
				    			<col width="*">
				    		</colgroup>
				    		<tbody>
				    			<tr>
				    				<th>현재 비밀번호</th>
									<td><input type="password" class="form-control text_title" name="nowpassword" placeholder="현재 비밀번호를 입력하세요." id="changeNowpassword"></td>
				    			</tr>
				    			<tr>
				    				<th>신규 비밀번호</th>
									<td><input type="password" class="form-control text_title" name="password" placeholder="신규 비밀번호를 입력하세요." id="changePassword"></td>
				    			</tr>
				    			<tr>
				    				<th>비밀번호 확인</th>
									<td><input type="password" class="form-control text_title" name="checkPassword" placeholder="비밀번호 확인"  id="changeCheckPassword"></td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalEditMyInfo">등록</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 출처 등록 끝-->


<script>
	$(document).ready(function(){
		$("._logout").click(function(){
			if(confirm('로그아웃 하시겠습니까?')){
				$("#logoutForm").submit();
			}
		});
		$("._goUserPage").click(function(){
			location.href="<c:url value='/index.do' />";
		});
		$("._editMyInfo").click(function(){
			
			$("#changeNowpassword").val('');
			$("#changePassword").val('');
			$("#changeCheckPassword").val('');
			$("#modalMyEdit").modal('show');
		});
		$("#btnModalEditMyInfo").click(function(){
			
			let nowPassword = $("#changeNowpassword").val();
			let newPassword = $("#changePassword").val();
			let newCheckPassword = $("#changeCheckPassword").val();
			if(CommonUtil.isEmpty(nowPassword)){
				alert('현재 비밀번호를 입력해 주세요.');
				return;
			}
			if(CommonUtil.isEmpty(newPassword)){
				alert('신규 비밀번호를 입력해 주세요.');
				return;
			}
			if(CommonUtil.isEmpty(newCheckPassword)){
				alert('비밀번호 확인을 입력해 주세요.');
				return;
			}
			
			if(newPassword.length < 6){
				alert('비밀번호는 6자리 이상이어야 합니다.');
				return;
			}
			
			if(newPassword !== newCheckPassword){
				alert('신규 비밀번호와 비밀번호 확인이 다릅니다.');
				return;
			}
			
			
			let param = {
				nowPassword : nowPassword,
				newPassword : newPassword,
				newCheckPassword: newCheckPassword
			};
			
			axios.post("<c:url value='/admin/util/editMyInfo.json' />", param)
			  .then(function (res) {
				  let editResult = res.data.result;
				  
			    if(editResult == 1){
			    	alert('수정 되었습니다.');
					$("#modalMyEdit").modal('hide');
					return;
			    }else if(editResult == -9){
			    	alert('존재하지 않는 사용자 입니다.');
			    }else if(editResult == -8){
			    	alert('현재 비밀번호가 다릅니다.');
			    }else if(editResult == -7){
			    	alert('신규 비밀번호와 비밀번호 확인이 다릅니다.');
			    }
			   
			  })
			  .catch(function (error) {
			    console.log(error);
			  });
			
			
		});
		
	});
</script>