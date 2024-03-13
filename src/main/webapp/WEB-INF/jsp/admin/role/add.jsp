<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no,initial-scale=1"/>
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>

		<link rel="stylesheet" href="<c:url value='/lib/bootstrap/css/bootstrap.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/summernote/summernote.min.css'/>">

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_01_write.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
		
		<script src="<c:url value='/lib/fontawesome-free/js/all.min.js'/>"></script>
		<script src="<c:url value='/lib/popper/umd/popper.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>"></script>
		<script src="<c:url value='/lib/summernote/summernote.min.js'/>"></script>


		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>

		
		<!-- 페이지 네이션 -->
		<title>씨젠의료재단 관리자 페이지</title>
	</head>

	<body>

		<!--wrap-->
		<div id="wrap">
			<!--header-->
			<jsp:include page="../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area">
					<form id="addForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">권한 그룹 정보</h1>
						<table>
							<colgroup>
								<col width="75px;"/>
								<col width="*"/>
							</colgroup>
							<tbody>
								<tr>
									<th colspan="1">권한 ID</th>
									<td>
										<input type="text" class="form-control text_title" name="roleName" placeholder="권한 ID를 입력해주세요." id="roleName">
										<input type="hidden" value="false" id="checkId">
										<button type="button" class="btn btn-info" id="btnCheckId">중복확인</button>
									</td>
								</tr>
								<tr>
									<th colspan="1">설명</th>
									<td><textarea class="form-control" rows="3" cols="100" id="roleDesc" name="roleDesc" style="resize:none;"></textarea></td>
								</tr>
	
							</tbody>
						</table>
					</form>
						
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">접근 메뉴</h1>
					<table>
						<colgroup>
							<col width="20%">
							<col width="10%">
							<col width="65%">
						</colgroup>
						<thead>
							<tr>
								<th>메뉴 명</th>
								<th>읽기 권한</th>
								<th>쓰기 권한</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="parent" items="${menus}">
								<tr>
									<td><c:out value="${parent.menuName}"/></td>
									<td>-</td>
									<td>-</td>
								</tr>
								<c:forEach var="child" items="${parent.childs}">
									<tr>
										<td> &nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${child.menuName}"/></td>
										<td>
											<label for="menu-read-<c:out value="${child.seq}"/>">읽기 권한</label>
											<input type="checkbox" class="_readRole" id="menu-read-<c:out value='${child.seq}'/>" data-seq="<c:out value='${child.seq}'/>" data-parent-seq="<c:out value='${parent.seq}'/>">
										</td>
										<td>
											<label for="menu-write-<c:out value="${child.seq}"/>">쓰기 권한</label>
											<input type="checkbox" class="_writeRole" id="menu-write-<c:out value='${child.seq}'/>"data-seq="<c:out value='${child.seq}'/>" data-parent-seq="<c:out value='${parent.seq}'/>">
										</td>
									</tr>
								</c:forEach>
							</c:forEach>

						</tbody>
					</table>
						
						

					<table>
						<tr>
							<td colspan="2">
								<span class="notice_write_ok _list" >취소</span>
								<span class="notice_write_cancel _add">
									<img src="<c:url value='/admin/img/notes.svg' />" alt="등록아이콘">등록</span>
							</td>
						</tr>
					</table>
				</div>
				<!--/notice_area End-->

			</div>
			<!--//container End-->
			<form id="hiddenForm" method="get">
				<input type="hidden" name="searchOption" value="<c:out value='${sparam.searchOption}'/>"/>
				<input type="hidden" name="searchKeyword" value="<c:out value='${sparam.searchKeyword}'/>"/>
				<input type="hidden" name="currentPage" value="<c:out value="${sparam.currentPage }"/>"/>
			</form>

		<!--footer-->
		<jsp:include page="../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			//아이디 키업 이벤트
			$("#roleName").keyup(function(event){
				var str = $(this).val();
				str = str.replace(/[^A-Za-z0-9]/gm, "");
				$(this).val(str);
				
				$("#checkId").val(false);
				$("#btnCheckId").show();
				
				return false;
			});
			
			//아이디 중복 확인
			$("#btnCheckId").click(function(){
				let roleName = $("#roleName").val();
				
				if(roleName.length < 4){
					alert('ID는 4자리 이상 입니다.');
					return;
				}
				
				axios.get('<c:url value="/admin/role/checkRoleId.json"/>',{
						params: {
							roleName: roleName
						}
					})
					.then(function (res) {
						if(res.data.result){
							$("#btnCheckId").hide();
							$("#checkId").val(true);
						}else{
							alert('동일한 ID가 존재 합니다.');
							$("#btnCheckId").show();
							$("#checkId").val(false);
						}
					})
					.catch(function (error) {
						console.log(error);
					})
					.then(function () {
					});
			});
			
			
			//읽기 권한 체인지 이벤트
			$("._readRole").change(function(){
				if(!$(this).is(":checked")){
					let dom = "#menu-write-"+$(this).data('seq'); 
					$(dom).prop("checked", "");
				}
				
			});
			
			//쓰기 권한 체인지 이벤트
			$("._writeRole").change(function(){
				if($(this).is(":checked")){
					let dom = "#menu-read-"+$(this).data('seq'); 
					$(dom).prop("checked", "checked");
				}
			});
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					roleName: {required:true, minlength:4}
				},
				submitHandler: function(form) {
					let checkId = $("#checkId").val();
					
					if(checkId != true && checkId != 'true'){
						alert('권한 ID 중복체크를 해주세요.');
						$("#roleName").focus();
						return false;
					}
					
					let readSeqs = [];
					let writeSeqs = [];
					let parentSeqs = [];
					
					$("._readRole").each(function(item){
						if($(this).is(":checked")){
							readSeqs.push($(this).data('seq'));
							parentSeqs.push($(this).data('parentSeq'));
						}
					});
					
					if(readSeqs.length == 0){
						alert('부여된 권한이 없습니다.');
						return false;
					}
					
					$("._writeRole").each(function(item){
						if($(this).is(":checked")){
							writeSeqs.push($(this).data('seq'));
							parentSeqs.push($(this).data('parentSeq'));
						}
					});
					
					
					let param = $('#addForm').serializeObject();
					param.readSeqs = readSeqs;
					param.writeSeqs = writeSeqs;
					param.parentSeqs = parentSeqs;
					
					if(!CommonUtil.isEmpty(param.comment)){
						param.comment = CommonUtil.toBr(param.comment);
					}
					
					axios.post("<c:url value='/admin/role/addRole.write' />", param)
					  .then(function (res) {
					    if(res.data.result == 1){
					    	alert('등록 되었습니다.');
					    	let roleName = $("#roleName").val();
					    	location.href="<c:url value='/admin/role/" + roleName + ".view' />";
					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});
			
			//추가버튼 이벤트 추가
			$("._add").click(function(){
				$("#addForm").submit();
			});
			
			//목록으로 가기 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/role/index.do' />").submit();
			});
			
		});
		
	
	</script>



	</body>
</html>

