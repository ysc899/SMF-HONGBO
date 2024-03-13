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
		<link rel="stylesheet" href="<c:url value='/lib/filepond-master/filepond.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/filepond-plugin-image-preview-master/filepond-plugin-image-preview.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/bootstrap-datepicker-master/css/bootstrap-datepicker3.min.css'/>">

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
		
		<!-- treeview -->
		<script src="<c:url value='/lib/bootstrap-treeview/dist/bootstrap-treeview.min.js'/>"></script>

		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		
		
		
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		<!-- underscore -->
		<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
		
		<!-- filepond 파일 업로드 관련 플러그인 -->
		<script src="<c:url value='/lib/filepond-polyfill-master/filepond-polyfill.js'/>"></script>
		<script src="<c:url value='/lib/filepond-master/filepond.min.js'/>"></script>
		<script src="<c:url value='/lib/filepond-plugin-image-preview-master/filepond-plugin-image-preview.min.js'/>"></script>
		<script src="<c:url value='/lib/filepond-plugin-file-validate-type-master/filepond-plugin-file-validate-type.min.js'/>"></script>
		
		<script src="<c:url value='/lib/filepond-master/filepond.jquery.js'/>"></script>
		
		<!-- 데이터 피커 -->
		<script src="<c:url value='/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap-datepicker-master/locales/bootstrap-datepicker.ko.min.js'/>"></script>
		
		
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
					<form id="editForm">
						<input type="hidden" name="seq" value="<c:out value='${result.seq }'/>"/>
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 수정</h1>
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="400px;"/>
								<col width="100px;"/>
								<col width="300px;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>언어코드</th>
									<td colspan="3">
										<select class="form-control" id="codeLang" name="codeLang">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.langCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>로고 종류</th>
									<td colspan="3">
										<select class="form-control" id="codeType" name="codeType">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.typeCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="name" placeholder="등록될 로고 이름을 입력해주세요." id="name" value="<c:out value='${result.name }'/>">
									</td>
								</tr>
								<tr style="display: none;" id="divUrl">
									<th>URL</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="url" placeholder="등록될 로고 URL을 입력해주세요." id="url" value="<c:out value='${result.url }'/>">
									</td>
								</tr>
								<tr>
									<th>로고 이미지 </th>
									<td colspan="3"><img src='<c:out escapeXml="false" value="${result.logoImage }"/>'></td>
								</tr>
								<tr>
									<th>로고 이미지 변경</th>
									<td colspan="3">
										<input type="file" class="my-pond-logo" name="logoImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
								<tr>
									<th>시작일</th>
									<td>
										<div class="input-group date">
										    <input type="text" class="form-control _datepicker" name="startDate" autocomplete="off" id="startDate" value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.startDate}" />'>
										    <div class="input-group-addon">
										        <span class="glyphicon glyphicon-th"></span>
										    </div>
										</div>
									</td>
									<th>종료일</th>
									<td>
										<div class="input-group date">
										    <input type="text" class="form-control _datepicker" name="endDate" autocomplete="off" id="endDate" value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.endDate}" />'>
										    <div class="input-group-addon">
										        <span class="glyphicon glyphicon-th"></span>
										    </div>
										</div>
									</td>
								</tr>
								<tr class="_checkArea">
									<th>기간 중복 확인</th>
									<td colspan="3">
										<button class="btn btn-default" type="button" id="btnDateCheck">중복확인</button>
										<input type="hidden" name="checkDate" id="checkDate"/>
									</td>
								</tr>
								
							</tbody>
						</table>
					</form>
					

					<table>
						<tr>
							<td colspan="2">
								<span class="notice_write_ok _list" >취소</span>
								<span class="notice_write_cancel _add">
									<img src="<c:url value='/admin/img/notes.svg' />" alt="등록아이콘">수정</span>
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
	
		/** 중복 확인 영역 설정용 */
		function showCheckArea(){
			
			let endDate = $("#endDate").val();
			
			if(!CommonUtil.isEmpty(endDate)){
				//중복 확인 값 설정
				$("#checkDate").val(-1);
				$("._checkArea").show();
			}else{
				//중복 확인 값 설정
				$("#checkDate").val(1);
				$("._checkArea").hide();
			}
			
		}
	
	
		$(document).ready(function(){
			
			//언어코드 초기화
			$("#codeLang").val('<c:out value="${result.codeLangType}"/>').attr("selected", "selected");
			//로고 종류 초기화
			$("#codeType").val('<c:out value="${result.codeLogoType}"/>').attr("selected", "selected");
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			$('.my-pond-logo').filepond();
			
			$("#codeType").change(function(){
				if($(this).val() == 'left'){
					$("#divUrl").show();
				}else{
					$("#divUrl").hide();
				}
			});
			
			if('<c:out value="${result.codeLogoType}"/>' == 'left'){
				$("#divUrl").show();
			}
			
			//달력 설정
			$('#startDate').datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    autoclose: true
			}).on('changeDate', function(selected){
				var startDate = new Date(selected.date.valueOf());
				$("#endDate").datepicker('setStartDate', startDate);
				showCheckArea();
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
				showCheckArea();
			});
			
			
			//중복 확인 값 설정
			$("#checkDate").val(1);
			$("._checkArea").hide();
			
			
			$("#btnDateCheck").click(function(){
				let startDate = $("#startDate").val();
				let endDate = $("#endDate").val();
				let langCode = $("#codeLang").val();
				let typeCode = $("#codeType").val();
				
				
				if(CommonUtil.isEmpty(startDate) || CommonUtil.isEmpty(endDate)){
					alert('시작일과 종료일을 설정 하세요.');
					return;
				}
				
				if(langCode == -1){
					alert('언어코드를 선택 하세요');
					return;
				}
				if(typeCode == -1){
					alert('로고 종류를 선택 하세요');
					return;
				}
				
				
				axios.get('<c:url value="/admin/main/logo/checkEditDate.json"/>',{
					params: {
						startDate: startDate,
						endDate: endDate,
						codeLang: langCode,
						codeType: typeCode,
						seq: <c:out value='${result.seq}'/>
					}
				})
				.then(function (res) {
					if(res.data.result){
						//중복 확인 값 설정
						$("#checkDate").val(1);
						$("._checkArea").hide();
					}else{
						alert('기간이 중복 됩니다.');
						showCheckArea();
						return;
					}
				})
				.catch(function (error) {
					console.log(error);
				})
				.then(function () {
				});
				
				
			});
			
			
			
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
					url: {url:true}
				},
				submitHandler: function(form) {
					
					let param = $('#editForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					
					if(param.codeType == -1){
						alert('로고 종류를 선택 하세요');
						return;
					}
					
					if(!CommonUtil.isEmpty(param.endDate)){
						if(param.checkDate == -1){
							alert('기간중복 확인을 해주세요.');
							return;
						}
					}
					
					
					let fd = new FormData(document.getElementById('editForm'));
					
					var logoFile = $(".my-pond-logo").filepond('getFiles');

					if(logoFile.length > 0){
						if(!CommonUtil.fileCheckImage(logoFile[0].fileExtension)){
							alert('이미지 파일만 업로드 가능합니다.');
							return;
						}
						
						
						fd.append('files', logoFile[0].file);
					}
					
					
					
					axios.post("<c:url value='/admin/main/logo/editLogo.edit' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result){
					    	alert('수정 되었습니다.');
//  					    	location.href="<c:url value='/admin/main/logo/${result.seq}.view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/main/logo/${result.seq}.view' />").submit();

					    }else{
					    	alert('기간이 중복됩니다.');
					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});
			
			//추가버튼 이벤트 추가
			$("._add").click(function(){
				$("#editForm").submit();
			});
			
			//목록으로 가기 이벤트
			$("._list").click(function(){
				history.back();
			});
			
		});
	</script>


	</body>
</html>

