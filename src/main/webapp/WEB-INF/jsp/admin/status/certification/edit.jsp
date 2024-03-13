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
									<th>센터</th>
									<td colspan="3">
										<select class="form-control" id="codeCenterType" name="codeCenterType">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.centerCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>분류</th>
									<td colspan="3">
										<select class="form-control" id="codeCertType" name="codeCertType">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.categoryCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>국내외 구분</th>
									<td colspan="3">
										<select class="form-control" id="codeCertLocType" name="codeCertLocType">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.certLocCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>타이틀</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="title" placeholder="수정될 타이틀을 입력해주세요." id="title" value="<c:out value='${result.title }'/>">
									</td>
								</tr>
								<tr>
									<th>발급기관</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="issuingAgency" placeholder="수정될 발급기간을 입력해주세요." id="issuingAgency" value="<c:out value='${result.issuingAgency }'/>">
									</td>
								</tr>
								<tr>
									<th>인증내역</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="content" placeholder="수정될 내용을 입력해주세요." id="content" value="<c:out value='${result.content }'/>">
									</td>
								</tr>
								<tr>
									<th>인증서 이미지</th>
									<td colspan="3"><img src='<c:out escapeXml="false" value="${result.fileContent }"/>'></td>
								</tr>
								<tr>
									<th>인증서 이미지 변경</th>
									<td colspan="3">
										<input type="file" class="my-pond-cert" name="certImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
								<tr>
									<th>섬네일 이미지</th>
									<td colspan="3"><img src='<c:out escapeXml="false" value="${result.thumFileContent }"/>'></td>
								</tr>
								<tr>
									<th>섬네일 이미지 변경</th>
									<td colspan="3">
										<input type="file" class="my-pond-thum" name="thumImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
								<tr>
									<th>출력 순서</th>
									<td>
										<select class="form-control" id="printOrder" name="printOrder">
											<option value="1">1</option>
										</select>
									</td>
									<th>출력 여부</th>
									<td>
										<label for="printFlag">출력 여부</label>
										<input type="checkbox" id="printFlag">
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
									<img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">수정</span>
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
	
		// 출력 순서 변경 이벤트
		function setPrintOrder(size){
			$("#printOrder").empty();
			
			let selectCount = size;
			
			for(var idx = 1; idx <= selectCount; idx++){
				$("#printOrder").append("<option value='"+idx+"'>"+ idx +"</option>");
			}
			
			$("#printOrder").val(1).attr("selected", "selected");
		}
		
		function getMaxOrder(){
			//언어코드가 선택 되었고
			let langCode = $("#codeLang").val();
			
			if(langCode == -1){
// 				alert('언어코드를 선택 하세요.');
				return;
			}
			
			let centerCode = $("#codeCenterType").val();
			if(centerCode == -1){
				return;
			}
			
			let certCode = $("#codeCertType").val();
			if(certCode == -1){
				return;
			}
			
			let certLocCode = 'korea';
			
			if(centerCode == 'seoul'){
				certLocCode = $("#codeCertLocType").val();
				if(certLocCode == -1){
					return;
				}
			}
			
			
			
			//언어코드에 대한 출력 순서 정보를 가져온다
			let url = "<c:url value='/admin/status/certification/maxPrintOrder.json' />";

			axios.get(url,{
					params: {
						lang: langCode,
						centerCode: centerCode,
						certCode: certCode,
						certLocCode: certLocCode
					}
				})
			  .then(function (res) {
				  
				  var size = res.data.result;
				  if(langCode != '<c:out value="${result.codeLangType}"/>' || 
						  centerCode != '<c:out value="${result.codeCenterType}"/>' ||
						  certCode != '<c:out value="${result.codeCertType}"/>' ||
						  certLocCode != '<c:out value="${result.codeCertLocType}"/>'
				  
				  ){
					  size++;
				  }
				  setPrintOrder(size);
			  })
			  .catch(function (error) {
			    console.log(error);
			  });
		}
	
		$(document).ready(function(){
			
			//언어코드 초기화
			$("#codeLang").val('<c:out value="${result.codeLangType}"/>').attr("selected", "selected");
			$("#codeCertType").val('<c:out value="${result.codeCertType}"/>').attr("selected", "selected");
			$("#codeCenterType").val('<c:out value="${result.codeCenterType}"/>').attr("selected", "selected");
			$("#codeCertLocType").val('<c:out value="${result.codeCertLocType}"/>').attr("selected", "selected");
			//출력순서 관련 처리
			setPrintOrder(<c:out value="${defaultInfo.maxOrder}"/>);
			$("#printOrder").val(<c:out value="${result.printOrder}"/>).attr("selected", "selected");
			//출력 여뷰 처리
			if('<c:out value="${result.printFlag}"/>' == 'Y' ){
				$("#printFlag").prop("checked", "checked");
			}
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			$('.my-pond-cert').filepond();
			$('.my-pond-thum').filepond();
			
			//언어코드 체인지 이벤트
			$("#codeLang").change(function(){
				getMaxOrder();
			});
			$("#codeCenterType").change(function(){
				getMaxOrder();
			});
			$("#codeCertType").change(function(){
				getMaxOrder();
			});
			$("#codeCertLocType").change(function(){
				getMaxOrder();
			});
			
			
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
					category: {required:true},
					title: {required:true},
					issuingAgency: {required:true},
				},
				submitHandler: function(form) {
					
					let param = $('#editForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					if(param.codeCertType == -1){
						alert('분류 를 선택 하세요');
						return;
					}
					if(param.codeCenterType == -1){
						alert('센터 를 선택 하세요');
						return;
					}
					
					
					let fd = new FormData(document.getElementById('editForm'));
					
					var certFile = $(".my-pond-cert").filepond('getFiles');
					var thumFile = $(".my-pond-thum").filepond('getFiles');

					if(certFile.length > 0){
						if(!CommonUtil.fileCheckImage(certFile[0].fileExtension)){
							alert('이미지 파일만 업로드 가능합니다.');
							return;
						}
						fd.append('certFile', certFile[0].file);
					}
					if(thumFile.length > 0){
						if(!CommonUtil.fileCheckImage(thumFile[0].fileExtension)){
							alert('이미지 파일만 업로드 가능합니다.');
							return;
						}else{
							fd.append('thumFile', thumFile[0].file);
						}
					}
					
					
					//출력 여부
					let isPrint = $("#printFlag").is(":checked");
					if(isPrint){
						fd.append('printFlag', 'Y');
					}else{
						fd.append('printFlag', 'N');
					}
					
					axios.post("<c:url value='/admin/status/certification/editCertification.edit' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('수정 되었습니다.');
//  					    	location.href="<c:url value='/admin/status/certification/${result.seq}.view' />";
 							$("#hiddenForm").attr('action', "<c:url value='/admin/status/certification/${result.seq}.view' />").submit();

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
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/status/certification/${result.seq}.view' />").submit();

			});
			
		});
	</script>


	</body>
</html>

