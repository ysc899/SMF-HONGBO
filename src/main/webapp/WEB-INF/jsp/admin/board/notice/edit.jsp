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
						<sec:csrfInput />
						<input type="hidden" name="seq" value="<c:out value='${result.seq }'/>"/>
						
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">공문 수정</h1>
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
									<th>공지 여부</th>
									<td>
										<label for="printFlag">공지</label>
										<input type="checkbox" id="noticeFlag">
									</td>
								</tr>
								<tr>
									<th>센터</th>
									<td colspan="3">
										<select class="form-control" id="codeCenter" name="codeCenter">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.centerCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>로그인 여부</th>
									<td colspan="3">
										<select class="form-control" id="codeCenter" name="loginYn">
											<option value="-1">==선택==</option>
											<c:if test="${result.loginYn == 'Y' }">
										    <option value="Y" selected="selected">로그인</option>
										    <option value="N">비로그인</option>
										    </c:if>
										    <c:if test="${result.loginYn == 'N' }">
										    <option value="Y">로그인</option>
										    <option value="N" selected="selected">비로그인</option>
										    </c:if>																														
										</select>
									</td>
								</tr>
								<tr>
									<th>공문번호</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="noticeNumber" placeholder="등록될 공문번호를 입력해주세요." id="noticeNumber" value='<c:out value="${result.noticeNumber }"/>'>
									</td>
								</tr>
								<tr>
									<th>타이틀</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="title" placeholder="등록될 타이틀을 입력해주세요." id="title" value='<c:out value="${result.title }"/>'>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td class="write_note" colspan="3"><div id="contentSummernote"></div></td>
								</tr>
							</tbody>
						</table>
					</form>

					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">첨부파일</h1>
					<table>
						<colgroup>
							<col style="width:50px;">
							<col style="width:50px;">
							<col style="width:*;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th colspan="2">파일 이름</th>
								<th>파일 크기</th>
								<th>다운로드 수</th>
								<th>기능</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${result.fileList }" varStatus="status">
								<tr>
									<td><c:out value="${status.count }"/></td>
									<td colspan="2"><a href="<c:url value='/admin/board/notice/download/${result.seq }/${item.seq }.do'/>"><c:out value="${item.fileName}"/></a></td>
									<td><c:out value="${item.fileSize}"/></td>
									<td><c:out value="${item.downCnt}"/></td>
									<td><button class="btn btn-warning _fileDel" data-seq="<c:out value='${item.seq}'/>" data-row="<c:out value='${status.count}'/>" >삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="2">첨부파일<br>추가</th>
								<td colspan="4">
									<input type="file" class="my-pond-files" name="files" multiple/>
								</td>
							</tr>
						</tfoot>
					</table>


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
	
		//삭제 파일 리스트
		var deleteFiles = [];
		
		var seq = <c:out value='${result.seq }'/>;
	
		$(document).ready(function(){
			
			
			//언어코드 초기화
			$("#codeLang").val('<c:out value="${result.codeLangType}"/>').attr("selected", "selected");
			//센터코드 초기화
			$("#codeCenter").val('<c:out value="${result.codeCenterType}"/>').attr("selected", "selected");
			
			//공지 여뷰 처리
			if('<c:out value="${result.noticeFlag}"/>' == 'Y' ){
				$("#noticeFlag").prop("checked", "checked");
			}
			
			//내용 관련 처리
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
				lang: 'en-US',
				popover: {
					image: [
						['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],,
						['float', ['floatLeft', 'floatRight', 'floatNone']],
						['remove', ['removeMedia']],
						['custom', ['imageAttributes']],
					],
				},
			});
			$("#contentSummernote").summernote("code", CommonUtil.unescapeHtml('<c:out value="${result.content }"/>'));
			
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			
			$('.my-pond-files').filepond();
			//파일 업로드 설정 끝
			
			//파일 삭제 클릭 이벤트
			$("._fileDel").click(function(){
				$(this).parent().parent().remove();
				deleteFiles.push($(this).data('seq'));
			});
			
			
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
					title: {required:true},
					noticeNumber: {required:true, minlength:2, maxlength:100}
				},
				submitHandler: function(form) {
					
					var param = $('#editForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					
					if(param.codeCenter == -1){
						alert('센터 를 선택 하세요.');
						return;
					}
					
					
					var noticeFiles = $(".my-pond-files").filepond('getFiles');
					
					var fd = new FormData(document.getElementById('editForm'));
					
					for(idx in noticeFiles){
						fd.append('files', noticeFiles[idx].file);
					}
					
					//출력 여부
					var isPrint = $("#noticeFlag").is(":checked");
					if(isPrint){
						fd.append('noticeFlag', 'Y');
					}else{
						fd.append('noticeFlag', 'N');
					}
					
					var content = $('#contentSummernote').summernote('code');
					if(content == '<p><br></p>'){
						alert('내용이 없습니다.');
						return;
					}
					
					fd.append('content', content);
					
					fd.append('deleteFileJSON', JSON.stringify(deleteFiles));
					
					axios.post("<c:url value='/admin/board/notice/editNotice.edit' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result){
					    	alert('수정 되었습니다.');
//  					    	location.href="<c:url value='/admin/board/notice/" + seq + ".view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/board/notice/" + seq + ".view' />").submit();

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
				$("#hiddenForm").attr('action', "<c:url value='/admin/board/notice/" + seq + ".view' />").submit();

			});
			
		});
	</script>


	</body>
</html>

