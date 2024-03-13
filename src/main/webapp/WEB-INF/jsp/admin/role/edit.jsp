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
					<form id="editForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">관리자  수정</h1>
						<table>
							<colgroup>
								<col width="10px;"/>
								<col width="300px"/>
							</colgroup>
							<tbody>
								<tr>
									<th>권한명</th>
									<td>
										<c:out value="${result.role.roleName }"/>
										<input type="hidden" name="roleName" id="roleName" value='<c:out value="${result.role.roleName }"/>'>
									</td>
								</tr>
								<tr>
									<th>설명</th>
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
								<span class="notice_write_ok _cancel" >취소</span>
								<span class="notice_write_cancel _edit">
									<img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">수정</span>
							</td>
						</tr>
					</table>
				</div>
				<!--/notice_area End-->

			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		<form id="hiddenForm" method="get">
			<input type="hidden" name="searchOption" value="<c:out value='${sparam.searchOption}'/>" />
			<input type="hidden" name="searchKeyword" value="<c:out value='${sparam.searchKeyword}'/>" />
			<input type="hidden" name="currentPage" value="<c:out value="${sparam.currentPage }"/>" />
		</form>
	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		//role 메뉴 체크 처리
		function settingRoleMenu(){
			
			<c:forEach var="parent" items="${result.roleMenus}">
				<c:forEach var="child" items="${parent.childs}">
					<c:if test="${child.readFlag == 'Y' }">  
						var domId = '#menu-read-<c:out value="${child.menuAdminSeq}"/>'
						$(domId).prop("checked", "checked");
					</c:if>
					<c:if test="${child.writeFlag == 'Y' }">  
						var domId = '#menu-write-<c:out value="${child.menuAdminSeq}"/>'
						$(domId).prop("checked", "checked");
					</c:if>
				</c:forEach>
			</c:forEach>
			
		}
	
	
		$(document).ready(function(){
			
			let roleName = '<c:out value="${result.role.roleName }"/>';
			
			if(roleName == ''){
				alert('존재하지 않는 권한 입니다.');
				location.href="<c:url value='/admin/role/index.do' />";
			}
			
			
			let firstRoleDesc = '<c:out escapeXml="false" value="${result.role.roleDesc }"/>';
			$("#roleDesc").val(CommonUtil.toEnter(firstRoleDesc));
			
			
			//role 메뉴 체크 처리
			settingRoleMenu();
			
			
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
			$("#editForm").validate({
				rules:{
				},
				submitHandler: function(form) {
					
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
					
					let param = $('#editForm').serializeObject();
					param.readSeqs = readSeqs;
					param.writeSeqs = writeSeqs;
					param.parentSeqs = parentSeqs;
					
					if(!CommonUtil.isEmpty(param.comment)){
						param.comment = CommonUtil.toBr(param.comment);
					}
					
					axios.post("<c:url value='/admin/role/editRole.edit' />", param)
					  .then(function (res) {
					    if(res.data.result == 1){
					    	alert('수정 되었습니다.');
// 					    	location.href="<c:url value='/admin/role/" + param.roleName + ".view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/role/" + param.roleName + ".view' />").submit();

					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});
			
			//추가버튼 이벤트 추가
			$("._edit").click(function(){
				$("#editForm").submit();
			});
			
// 			//섬머노트 설정
// 			$('#comment').summernote({
// 				placeholder: '',
// 				tabsize: 2,
// 				height: 200
// 			});
			//목록으로 가기 이벤트
			$("._cancel").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/role/${result.role.roleName }.view' />").submit();

			});
			
		});
		
	
	</script>



	</body>
</html>

