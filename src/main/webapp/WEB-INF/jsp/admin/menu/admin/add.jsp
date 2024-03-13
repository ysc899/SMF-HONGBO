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
		<!-- underscore -->
		<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>

		
		<!-- 페이지 네이션 -->
		<title>씨젠의료재단 관리자 페이지</title>
	</head>

	<body>

		<!--wrap-->
		<div id="wrap">
			<!--header-->
			<jsp:include page="../../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area">
					<form id="addForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">관리자 메뉴 등록</h1>
						<table>
							<colgroup>
								<col width="75px;"/>
								<col width="*;"/>
								<col width="75px;"/>
								<col width="300px;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>메뉴명</th>
									<td>
										<input type="text" class="form-control text_title" name="menuName" placeholder="등록될 메뉴명을 입력해주세요." id="menuName">
									</td>
									<th>상위 메뉴</th>
									<td>
										<select class="form-control" id="parent" name="parent">
											<option value="-1">==선택==</option>
											<option value="0">최상위 메뉴</option>
											<c:forEach var="item" items="${defaultInfo.parentList}">
												<option value="<c:out value='${item.seq }'/>"><c:out value="${item.menuName }"/></option>
											</c:forEach>
										</select>
									</td>
									
								</tr>
								<tr>
									<th>출력 순서</th>
									<td colspan="3">
										<select class="form-control" name="menuOrder" id="menuOrder" style="width:276px;">
											<option>1</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>URL</th>
									<td colspan="3"><input type="text" class="form-control text_title" name="url" placeholder="메뉴 URL를 입력 하세요" id="url" value="/admin/"></td>
								</tr>
							</tbody>
						</table>
					</form>

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
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		// 부모 메뉴 정보
		let parentMenuInfos =[];
		// 부모 메뉴 정보 파싱
		function parseParentMenu(){
			parentMenuInfos = [];
			
			<c:forEach var="item" items="${defaultInfo.parentList}">
				parentMenuInfos.push({
					seq: <c:out value='${item.seq }'/>,
					menuName: "<c:out value="${item.menuName }"/>",
					cnt: <c:out value='${item.cnt }'/>
				});
			</c:forEach>
			
		}
		// 출력 순서 변경 이벤트
		function setMenuPrintOrder(seq){
			$("#menuOrder").empty();
			
			let selectCount = 0;
			if(seq == 0){
				selectCount = parentMenuInfos.length;
			}else{
				selectCount = _.find(parentMenuInfos, function(item){return item.seq == seq}).cnt;
				//selectCount = parentMenuInfos.find(item => item.seq == seq).cnt;
			}
			selectCount++;
			
			for(var idx = 1; idx <= selectCount; idx++){
				$("#menuOrder").append("<option value='"+idx+"'>"+ idx +"</option>");
			}
			
			$("#menuOrder").val(selectCount).attr("selected", "selected");
		}
	
	
		$(document).ready(function(){
			
			parseParentMenu();
			
			//상위 메뉴 체인지 이벤트
			$("#parent").change(function(){
				
				let parentSeq = $(this).val();
				
				if(parentSeq > -1){
					setMenuPrintOrder(parentSeq);
				}
				
				if(parentSeq == 0){
					$("#url").attr("disabled", true);
				}else{
					$("#url").removeAttr("disabled");
				}
				
			});
			
			
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					menuName: {required:true}
				},
				submitHandler: function(form) {
					
					let param = $('#addForm').serializeObject();
					
					if(param.parent == -1){
						alert('상위 메뉴를 선택 하세요');
						$("#parent").focus();
						return false;
					}else if(param.parent > 0){
						let url = $("#url").val();
						if(!param.url.startsWith('/admin')){
							alert('URL은 /admin 으로 시작 해야 합니다.');
							$("#url").focus();
							return false;
						}
						if(!param.url.endsWith('/index.do')){
							alert('URL은 /index.do 로 끝나야 합니다.');
							$("#url").focus();
							return false;
						}
					}
					
					
					axios.post("<c:url value='/admin/menu/admin/addMenu.write' />", param)
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/menu/admin/" + res.data.result + ".view' />";
 							$("#hiddenForm").attr('action', "<c:url value='/admin/menu/admin/" + res.data.result + ".view' />").submit();

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
				$("#hiddenForm").attr('action', "<c:url value='/admin/menu/admin/index.do' />").submit();

			});
			
		});
		
	
	</script>



	</body>
</html>

