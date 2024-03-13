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
		<link rel="stylesheet" href="<c:url value='/lib/bootstrap-datepicker-master/css/bootstrap-datepicker3.min.css'/>">

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
		
				<!-- 데이터 피커 -->
		<script src="<c:url value='/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap-datepicker-master/locales/bootstrap-datepicker.ko.min.js'/>"></script>
		
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>
		
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
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 리스트</h1>
						<div class="select_box">
						
							<form id="searchForm" method="get">
								<input type="button" value="검색" class="search_bt" id="btnSearch">
								<input type="text" class="search_content" name="searchKeyword" id="inputKeyword" value="<c:out value='${ result.option.searchKeyword}'/>">
								<select class="kind2" name="searchOption" id="optSearch">
									<option value="" >전체</option>
									<option value="userId">접속자 ID</option>
									<option value="ip">IP</option>
								</select>
								<div style="display: flex; float: right; padding-right:10px;" >
									<span style="padding-top:7px;">시작일</span>
									<div class="input-group date">
									    <input type="text" class="form-control _datepicker" name="startDate" autocomplete="off" id="searchStartDate" value="<c:out value='${ result.option.startDate}'/>">
									    <div class="input-group-addon">
									        <span class="glyphicon glyphicon-th"></span>
									    </div>
									</div>
									<span style="padding-top:7px;">종료일</span>
									<div class="input-group date">
									    <input type="text" class="form-control _datepicker" name="endDate" autocomplete="off" id="searchEndDate" value="<c:out value='${ result.option.endDate}'/>">
									    <div class="input-group-addon">
									        <span class="glyphicon glyphicon-th"></span>
									    </div>
									</div>
								</div>
								
								<input type="hidden" name="currentPage" id="currentPage" >
							</form>
						</div>
						
						<table>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:*">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>접속 IP</th>
									<th>OS</th>
									<th>브라우저</th>
									<th>해상도 X</th>
									<th>해상도 Y</th>
									<th>접속자ID</th>
									<th>접속일시</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="item" items="${result.content }" >
									<tr class="_row" data-seq="<c:out value="${item.seq }"/>">
										<td><c:out value="${item.row }"/></td>
										<td><c:out value="${item.ip }"/></td>
										<td><c:out value="${item.os }"/></td>
										<td><c:out value="${item.browser }"/></td>
										<td><c:out value="${item.screenWidth }"/></td>
										<td><c:out value="${item.screenHeight }"/></td>
										<td><c:out value="${item.regUserId }"/></td>
										<td><fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value = "${item.regDate}" /></td>
									</tr>
								</c:forEach>
								
								<c:if test="${result.totalElements == 0 }">
									<tr>
										<td colspan="8">검색 결과가 없습니다.</td>
									</tr>
								</c:if>
							</tbody>

						</table>

						<div class="page_box">
							<div id="page-selection"></div>

							

							<c:if test="${writeFlag == 'true' || writeFlag == true }">
								<button id="btnRemoves" type="button" class="btn btn-danger" style="float:right; display: none;" ><i class="fas fa-trash"></i>&nbsp;로그삭제</button>
								<button id="btnExcel" type="button" class="btn btn-success" style="float:right; display: none;margin-right:5px;" ><i class="fas fa-download"></i>&nbsp;엑셀 다운로드</button>
							</c:if>
						</div>
				</div>
				<!--/notice_area End-->

			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
			<!-- 모달  -->
		<!-- 출처 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalRemoves">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">로그 삭제</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="addSourceForm">
				    	<table class="table">
				    		<tbody>
								<tr>
									<th>시작일</th>
									<td>
										<div class="input-group date">
										    <input type="text" class="form-control _datepicker" name="startDate" autocomplete="off" id="startDate">
										    <div class="input-group-addon">
										        <span class="glyphicon glyphicon-th"></span>
										    </div>
										</div>
									</td>
									<th>종료일</th>
									<td>
										<div class="input-group date">
										    <input type="text" class="form-control _datepicker" name="endDate" autocomplete="off" id="endDate">
										    <div class="input-group-addon">
										        <span class="glyphicon glyphicon-th"></span>
										    </div>
										</div>
									</td>
								</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalRemove">삭제</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 출처 등록 끝-->

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
			

			//검색용 달력 설정
			$('#searchStartDate').datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    autoclose: true
			}).on('changeDate', function(selected){
				var startDate = new Date(selected.date.valueOf());
				$("#searchEndDate").datepicker('setStartDate', startDate);
			});
			$("#searchEndDate").datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    clearBtn: true,
			    autoclose: true
			}).on('changeDate', function(selected){
				if(selected.date){
					var endDate = new Date(selected.date.valueOf());
					$("#searchStartDate").datepicker('setEndDate', endDate);
				}else{
					$("#searchStartDate").datepicker('setEndDate', '');
				}
			});
			
			
			//쓰기 권한 체크 하여 관련 버튼들 뷰 설정
			<c:if test="${writeFlag == 'true' || writeFlag == true }">
				
			//달력 설정
			//로그 삭제용 달력 설정
			$('#startDate').datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    autoclose: true
			}).on('changeDate', function(selected){
				var startDate = new Date(selected.date.valueOf());
				$("#endDate").datepicker('setStartDate', startDate);
			});
			$("#endDate").datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    clearBtn: true,
			    autoclose: true
			}).on('changeDate', function(selected){
				if(selected.date){
					var endDate = new Date(selected.date.valueOf());
					$("#startDate").datepicker('setEndDate', endDate);
				}else{
					$("#startDate").datepicker('setEndDate', '');
				}
			});
			
			$("#btnRemoves").show();
			$("#btnRemoves").click(function(){
				$("#modalRemoves").modal('show');
			});
			
			$("#btnExcel").show();
			$("#btnExcel").click(function(){
				let param = $('#searchForm').serializeObject();
				
				if(CommonUtil.isEmpty(param.startDate) || CommonUtil.isEmpty(param.endDate)){
					alert('시작일과 종료일을 설정해 주세요.');
					return;
				}
				param.currentPage = 1;
				axios({
					method: 'GET',
					url: "<c:url value='/admin/log/device/excel.do' />",
					params: param,
					responseType: 'arraybuffer' // 가장 중요함
				})	
				.then(function(response){
					
					var link = document.createElement('a');
					var blob = new Blob([response.data], { type: response.headers['content-type'] });
					var fileName = "접속_디바이스_로그_"+param.startDate+"-"+param.endDate +'.xlsx';
					
					if (window.navigator.msSaveOrOpenBlob) { // IE 10+
						window.navigator.msSaveOrOpenBlob(blob, fileName)
					} else { // not IE
						let link = document.createElement('a')
						link.href = window.URL.createObjectURL(blob)
						link.target = '_self'
						if (fileName) link.download = fileName
						link.click()
					}
				});
			});
			
			$("#btnModalRemove").click(function(){
				let startDate = $('#startDate').val();
				let endDate = $('#endDate').val();
				
				if(confirm(startDate+ '와 '+endDate+'일 사이의 접속 디바이스 로그가 삭제됩니다.\n삭제시 복구 할 수 없습니다.\n접속 디바이스 로그를 삭제 하시겠습니까?')){
					
					let param = {
						startDate: startDate,
						endDate: endDate
					}
					
					axios.post("<c:url value='/admin/log/device/removes.delete' />", param)
					  .then(function (res) {
				    	alert(res.data.result+'건의 접속 디바이스 로그가 삭제 되었습니다.');
				    	location.href="<c:url value='/admin/log/device/index.do' />";
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
				}
			});
			
			</c:if>
			
			
		});
		
		
		
	
	
	</script>



  </body>
  </html>

