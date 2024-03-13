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
									<th>카테고리</th>
									<td>
										<select class="form-control" id="category" name="category">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.categoryCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
									<th>출력 순서</th>
									<td>
										<select class="form-control" id="printOrder" name="printOrder">
											<option value="-1">==선택==</option>
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
									<th>URL</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="url" placeholder="등록될 URL을 입력해주세요." id="url" value="<c:out value='${result.url }'/>">
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
				<input type="hidden" name="codeCategoryType" value="<c:out value="${sparam.codeCategoryType }"/>"/>
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

			let selectCount = size+1;

			for(var idx = 1; idx <= selectCount; idx++){
				$("#printOrder").append("<option value='"+idx+"'>"+ idx +"</option>");
			}

			$("#printOrder").val(1).attr("selected", "selected");
		}

		function getPrintSize(){
			let langCode = $("#codeLang").val();
			let categoryCode =  $("#category").val();

			if(langCode == -1 || categoryCode == -1){
				return;
			}


			//언어코드에 대한 출력 순서 정보를 가져온다
			let url = "<c:url value='/admin/promotion/ebook/maxPrintOrder.json' />";

			axios.get(url,{
				params: {
					lang: langCode,
					category: categoryCode
				}
			})
					.then(function (res) {
						setPrintOrder(res.data.result);
					})
					.catch(function (error) {
						console.log(error);
					});
		}
	
		$(document).ready(function(){
			
			//언어코드 초기화
			$("#codeLang").val('<c:out value="${result.codeLangType}"/>').attr("selected", "selected");
			$("#category").val('<c:out value="${result.codeCategoryType}"/>').attr("selected", "selected");
			//출력순서 관련 처리
			setPrintOrder(<c:out value="${defaultInfo.maxPrintOrder}"/>);
			$("#printOrder").val(<c:out value="${result.printOrder}"/>).attr("selected", "selected");

			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			$('.my-pond-thum').filepond();
			
			
			
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
					title: {required:true},
					url: {required:true, url:true}
				},
				submitHandler: function(form) {
					
					let param = $('#editForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					if(param.category == -1){
						alert('카테고리를 선택 하세요');
						return;
					}
					
					
					
					let fd = new FormData(document.getElementById('editForm'));
					
					var thumFile = $(".my-pond-thum").filepond('getFiles');

					if(thumFile.length > 0){
						if(!CommonUtil.fileCheckImage(thumFile[0].fileExtension)){
							alert('이미지 파일만 업로드 가능합니다.');
							return;
						}else{
							fd.append('thumFile', thumFile[0].file);
						}
					}
					
					
					
					axios.post("<c:url value='/admin/promotion/ebook/editeBook.edit' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('수정 되었습니다.');
 					    	location.href="<c:url value='/admin/promotion/ebook/${result.seq}.view' />";
 							$("#hiddenForm").attr('action', "<c:url value='/admin/promotion/ebook/${result.seq}.view' />").submit();

					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});


			//언어코드 체인지 이벤트
			$("#codeLang").change(function(){
				//언어코드가 선택 되었고
				let langCode = $(this).val();

				if(langCode == -1){
					alert('언어코드를 선택 하세요.');
					return;
				}
				getPrintSize();
			});
			//카테고리 체인지 이벤트
			$("#category").change(function(){
				//언어코드가 선택 되었고
				let categoryCode = $(this).val();

				if(categoryCode == -1){
					alert('카테고리를 선택 하세요.');
					return;
				}
				getPrintSize();
			});
			
			//추가버튼 이벤트 추가
			$("._add").click(function(){
				$("#editForm").submit();
			});
			
			//목록으로 가기 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/promotion/ebook/${result.seq}.view' />").submit();

			});
			
		});
	</script>


	</body>
</html>

