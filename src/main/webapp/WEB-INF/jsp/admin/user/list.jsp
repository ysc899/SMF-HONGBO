<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no,initial-scale=1"/>
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>

		<link rel="stylesheet" href="<c:url value='/lib/bootstrap/css/bootstrap.min.css'/>">

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_00.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
		
		<script src="<c:url value='/lib/fontawesome-free/js/all.min.js'/>"></script>
		<script src="<c:url value='/lib/popper/umd/popper.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>"></script>
		
		<!-- 페이지 네이션 -->
		<script src="<c:url value='/lib/twbs-pagination/jquery.twbsPagination.js'/>"></script>
		
		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>
		
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
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">관리자 관리</h1>
						<div class="select_box">
						
							<form id="searchForm" method="get">
								<input type="button" value="검색" class="search_bt" id="btnSearch">
								<input type="text" class="search_content" name="searchKeyword" id="inputKeyword" value="<c:out value='${ result.option.searchKeyword}'/>">
								<select class="kind" name="searchOption" id="optSearch">
									<option value="" >전체</option>
									<option value="id">ID</option>
									<option value="name">이름</option>
								</select>
								<input type="hidden" name="currentPage" id="currentPage" value="<c:out value='${result.option.currentPage }'/>">
							</form>
						</div>
						
						<table>
							<colgroup>
								<col style="width:50px;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>최종 접속일</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="item" items="${result.content }">
									<tr class="_row" data-id="<c:out value="${item.userId }"/>">
										<td><c:out value="${item.row }"/></td>
										<td><a href="javascript:void(0);" style="color:#000;"><c:out value="${item.userId }"/></a></td>
										<td><c:out value="${item.name }"/></td>
										<td><c:out value="${item.contact }"/></td>
										<td><c:out value="${item.email }"/></td>
										<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.lastLoginDate}" /></td>
									</tr>
								</c:forEach>
								
								<c:if test="${result.totalElements == 0 }">
									<tr>
										<td colspan="6">검색 결과가 없습니다.</td>
									</tr>
								</c:if>
							</tbody>

						</table>

						<div class="page_box">
							<div id="page-selection"></div>

							

							<c:if test="${writeFlag == 'true' || writeFlag == true }">
								<button id="btnAddAdmin" type="button" class="btn btn-default" style="float:right; display: none;" ><i class="fas fa-user-plus"></i>&nbsp;관리자 추가</button>
							</c:if>
						</div>
				</div>
				<!--/notice_area End-->

			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		//선택 박스 값 설정
		$("#optSearch").val('<c:out value="${result.option.searchOption }"/>').attr("selected", "selected");
		
		
		let paginationEventFlag = true;
		
		//페이지 네이션
		$('#page-selection').twbsPagination({
			totalPages: <c:out value="${result.totalPages}"/>,
			startPage : <c:out value="${result.option.currentPage }"/>,
			visiblePages: 5,
			onPageClick: function (event, page) {
				if(paginationEventFlag){
					//init 시 발생 하는 이벤트
					paginationEventFlag = false;
				}else{
					search(page);
				}
			}
		});
		
		function search(page){
			$("#currentPage").val(page);
			$("#searchForm").submit();
		}
		
		
		$(document).ready(function(){
			$("#btnSearch").click(function(){
				search(1);
			});
			$("#inputKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search(1);
				}
			});
			
			$("._row").click(function(){
				let id = $(this).data('id');
// 				location.href="<c:url value='/admin/user/" + id + ".view' />";
				
				$("#searchForm").attr('action', "<c:url value='/admin/user/" + id + ".view' />").submit();

			});
			
			//쓰기 권한 체크 하여 관련 버튼들 뷰 설정
			if(writeFlag){
				$("#btnAddAdmin").show();
				$("#btnAddAdmin").click(function(){
// 					location.href="<c:url value='/admin/user/addAdmin.write' />";
					$("#searchForm").attr('action', "<c:url value='/admin/user/addAdmin.write' />").submit();
				});
			}
			
			
		});
		
		
		
	
	
	</script>



  </body>
  </html>

