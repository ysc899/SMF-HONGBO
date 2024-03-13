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
		<script src="<c:url value='/lib/summernote/lang/summernote-ko-KR.min.js'/>"></script>
		
		<script src="<c:url value='/lib/summernote-image-attribute-editor-master/summernote-image-attributes.js'/>"></script>
		
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
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>

		<style type="text/css">
		
/* 		@font-face { */
/* 		  font-family: 'GmarketSansTTFMedium'; */
/* 		  font-style: normal; */
/* 		  font-weight: 400; */
/* 		  font-display: auto; */
/* 		  src: url("<c:url value='/user/font/GmarketSansTTFMedium.eot'/>"); */
/* 		  src: url("<c:url value='/user/font/GmarketSansTTFMedium.eot?#iefix'/>") format('embedded-opentype'), */
/* 		       url("<c:url value='/user/font/GmarketSansTTFMedium.svg#GmarketSansTTFMedium'/>") format('svg'), */
/* 		       url("<c:url value='/user/font/GmarketSansTTFMedium.ttf'/>") format('truetype'), */
/* 		       url("<c:url value='/user/font/GmarketSansTTFMedium.woff'/>") format('woff'), */
/* 		       url("<c:url value='/user/font/GmarketSansTTFMedium.woff2'/>") format('woff2'); */
/* 		  font-weight: normal; */
/* 		  font-style: normal; */
/* 		} */
		
		</style>

		
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
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">급여 고시  등록</h1>
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
									<td>
										<select class="form-control" id="codeLang" name="codeLang">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.langCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>급여 고시 번호</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="payrollNoticeNumber" placeholder="등록될 급여 고시 번호를 입력해주세요." id="noticeNumber"/>
									</td>
								</tr>
								<tr>
									<th>타이틀</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="title" placeholder="등록될 타이틀을 입력해주세요." id="title"/>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td class="write_note" colspan="3"><div id="contentSummernote"></div></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">
										<input type="file" class="my-pond-files" name="files" multiple/>
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
	
		//샘플링한 파일 명들
		var appendFileNames = [];
	
	
		$(document).ready(function(){
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			
			$('.my-pond-files').filepond();
			$('.my-pond-files').on('FilePond:addfile', function(e) {
				//doc 에서 pdf를 자동 섬네일 등록으로 변경
				var files = $(".my-pond-files").filepond('getFiles');
				
				for(idx in files){
					
					if(files[idx].file.type == 'application/pdf' && files[idx].file.size < 5000000){
						var fileName = files[idx].file.name;
						
						if(_.contains(appendFileNames, fileName) == false){
							
							appendFileNames.push(fileName);
							
							var fd = new FormData();
							
							fd.append('files', files[idx].file);
							
							axios.post("<c:url value='/admin/util/pdf2Image.json' />", fd,{headers : {
								'Content-Type' : 'multipart/form-data'
							}})
							  .then(function (res) {
								  var target = res.data.result;
								  
								  var content = $('#contentSummernote').summernote('code');
								  var thumContent = '';
								  for(var i in target){
									  thumContent += '<img src="'+ target[i] +'" data-filename="'+ i +'_' +fileName +'" style="width: 687px;"><br>';
								  }
								  $("#contentSummernote").summernote("code", thumContent + content);
								  
							  })
							  .catch(function (error) {
							    console.log(error);
							  });
							
						}
					}
				}
				
				
			});
			//파일 업로드 설정 끝
			//텍스트 에디터 설정
			$('#contentSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 400,
				lang : 'ko-KR',
 				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica', 'Impact', 'Tahoma', 'Times New Roman', 'Verdana', '맑은 고딕', '나눔고딕', '바탕체', '궁서체'],
				
				toolbar: [
					  ['style', ['style']],
					  ['font', ['bold', 'italic', 'underline', 'clear']],
					  ['fontsize', ['fontsize']],
					  ['fontname', ['fontname']],
					  ['color', ['color']],
					  ['para', ['ul', 'ol', 'paragraph']],
					  ['table', ['table']],
					  ['insert', ['link', 'picture', 'video']],
					  ['view', ['fullscreen', 'codeview', 'help']],
					],
				imageAttributes: {
				  	icon: '<i class="note-icon-pencil"/>',
					figureClass: 'figureClass',
					figcaptionClass: 'captionClass',
					captionText: 'Caption Goes Here.',
					manageAspectRatio: true // true = Lock the Image Width/Height, Default to true
				},
// 				lang: 'en-US',
				popover: {
					image: [
						['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],,
						['float', ['floatLeft', 'floatRight', 'floatNone']],
						['remove', ['removeMedia']],
						['custom', ['imageAttributes']],
					],
				},
			});
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					title: {required:true},
					noticeNumber: {required:true, minlength:2, maxlength:100}
				},
				submitHandler: function(form) {
					
					var param = $('#addForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					
					if(param.codeCenter == -1){
						alert('센터 를 선택 하세요.');
						return;
					}
					
					
					var noticeFiles = $(".my-pond-files").filepond('getFiles');
					
					var fd = new FormData(document.getElementById('addForm'));
					
					for(idx in noticeFiles){
						fd.append('files', noticeFiles[idx].file);
					}
					
					//출력 여부
					var isPrint = $("#payrollNoticeFlag").is(":checked");
					if(isPrint){
						fd.append('payrollNoticeFlag', 'Y');
					}else{
						fd.append('payrollNoticeFlag', 'N');
					}
					
					var content = $('#contentSummernote').summernote('code');
					if(content == '<p><br></p>'){
						alert('내용이 없습니다.');
						return;
					}
					
					fd.append('content', content);
					
					axios.post("<c:url value='/admin/board/payrollNotice/addPayrollNotice.write' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/board/notice/" + res.data.result + ".view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/board/payrollNotice/" + res.data.result + ".view' />").submit();

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
				$("#hiddenForm").attr('action', "<c:url value='/admin/board/payrollNotice/index.do' />").submit();

			});
			
		});
	</script>


	</body>
</html>

