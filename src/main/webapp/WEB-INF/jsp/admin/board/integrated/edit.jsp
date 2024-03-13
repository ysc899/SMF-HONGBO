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
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 수정</h1>
						<table>
							<colgroup>
								<col width="10%;"/>
								<col width="90%;"/>
							</colgroup>
							<tbody>
							 <tr>
									<th>언어코드</th>
									<td colspan="3">
										<select class="form-control" id="langType" name="langType">
											<option value="-1">==선택==</option>											
											<option value="ko">한국어</option>
											<option value="en">영어</option>
										</select>
									</td>
								</tr>
								<tr>
								<c:if test='${option.optNotiFlag == "Y" }'>
									<th>공지여부</th>
									<td>
										<label for="noticeFlag">공지</label>
										<input type="checkbox" id="noticeFlag">
									</td>
								</c:if>
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
								<c:if test='${option.optThumFlag == "Y" }'>
								<tr>
									<th>섬네일</th>
									<td>
										<img id="imgThum" src="<c:out value='${result.thumImageBase64}'/>">
									</td>
								</tr>
								<tr>
									<th>섬네일 변경</th>
									<td>
										<input type="file" class="my-pond-thum-files" name="thumFile" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
								</c:if>
								<c:if test="${masterSeq == 2}">
								<tr>
									<th>검사코드</th>
									<td>
										<input type="text" placeholder="검사 코드를 검색 해주세요." style="width: 400px;" id="srchOnClickGcd" disabled="disabled" value='<c:out value="${result.oneClickGcd }"/> / <c:out value="${result.oneClickGnm }"/>  '>
										<input type="hidden" name="oneClickGcd" id="oneClickGcd" value='<c:out value="${result.oneClickGcd }"/>'>
										<input type="hidden" name="oneClickGnm" id="oneClickGnm" value='<c:out value="${result.oneClickGnm }"/>'>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class='btn btn-default' id="btnAddTestSelect">검사코드 검색</button>
								</td>
								</tr>
								</c:if>
							</tbody>
						</table>
						
						<c:if test='${option.optFileFlag == "Y" }'>
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">첨부파일</h1>
						<table>
							<colgroup>
								<col style="width:50px;">
								<col style="width:50px;">
								<col style="width:*;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:10%;">
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
								<c:forEach var="item" items="${result.files }" varStatus="status">
									<tr>
										<td><c:out value="${status.count }"/></td>
										<td colspan="2"><a href="<c:url value='/admin/board/integrated/${masterSeq}/download/${result.seq }/${item.seq }.do'/>"><c:out value="${item.fileName}"/></a></td>
										<td><c:out value="${item.fileSize}"/></td>
										<td><c:out value="${item.downCnt}"/></td>
										<td><button type="button" class="btn btn-warning _fileDel" data-seq="<c:out value='${item.seq}'/>" data-row="<c:out value='${status.count}'/>" >삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="2">첨부파일 추가</th>
									<td colspan="4">
										<input type="file" class="my-pond-files" name="files" multiple/>
									</td>
								</tr>
							</tfoot>
						</table>
						</c:if>
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
				<input type="hidden" id="masterSeq" value="${masterSeq}"/>
			</form>
		<!--footer-->
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		

	</div>
	<!--//wrap End-->
		<!-- 검사코드 검색 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalTestCodeSearch">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">검사코드 검색</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<div class="select_box">
						<input type="text" class="search_content" name="searchKeyword" id="modalTestCodeSearchKeyword" placeholder="검색어를 입력하세요.">
						<input type="button" value="검색" class="search_bt" id="btnModalTestCodeSearch">
					</div>
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:*">
							<col style="width:15%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th style="text-align:center;font-weight:600;">검사코드</th>
								<th style="text-align:center;font-weight:600;">검사항목</th>
								<th style="text-align:center;font-weight:600;">검체</th>
								<th style="text-align:center;font-weight:600;">검사방법</th>
							</tr>
						</thead>
						<tbody class="modallistBody">
						</tbody>
					</table>
					<div class="page_box">
						<div id="page-selection"></div>
					</div>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		
		
		<!-- 검사코드 검색 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalAddTestCodeSearch">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">검사코드 검색 등록</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="addTestCodeSearchForm">
				    	<table class="table">
				    		<tbody>
				    			<tr>
				    				<th>검사코드</th>
				    				<td><input type="text" class="form-control text_title" name="testCode" placeholder="등록될 검사코드를 입력해주세요." id="searchTestCode" disabled="disabled"></td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalAddTestSearchCord">등록</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>

	
	<script type="text/javascript">
	
		//삭제 파일 리스트
		var deleteFiles = [];
		
		var seq = <c:out value='${result.seq }'/>;
	
		$(document).ready(function(){
			
			$("#langType").val('<c:out value="${result.langType}"/>').attr("selected", "selected");
			
			<c:if test='${option.optNotiFlag == "Y" }'>
			if('<c:out value="${result.noticeFlag}"/>' == 'Y' ){
				$("#noticeFlag").prop("checked", "checked");
			}
			</c:if>
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			
			<c:if test='${option.optThumFlag == "Y" }'>
			$('.my-pond-thum-files').filepond();
			</c:if>
			<c:if test='${option.optFileFlag == "Y" }'>
			$('.my-pond-files').filepond();
			
			//파일 삭제 클릭 이벤트
			$("._fileDel").click(function(){
				$(this).parent().parent().remove();
				deleteFiles.push($(this).data('seq'));
			});
			
			
			</c:if>
			
			
			//텍스트 에디터 설정
			$('#contentSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 400,
				toolbar: [
					  ['style', ['style']],
					  ['font', ['bold', 'italic','underline', 'clear']],
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
			
			
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
					title: {required:true},
				},
				submitHandler: function(form) {
					
					var fd = new FormData(document.getElementById('editForm'));
					var param = $('#editForm').serializeObject();
					
					if(param.langType == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					
					var content = $('#contentSummernote').summernote('code');
					if(content == '<p><br></p>'){
						alert('내용이 없습니다.');
						return;
					}
					fd.append('content', content);
					
					<c:choose>
						<c:when test='${option.optNotiFlag == "Y" }'>
							//공지 여부
							var isNoti = $("#noticeFlag").is(":checked");
							if(isNoti){
								fd.append('noticeFlag', 'Y');
							}else{
								fd.append('noticeFlag', 'N');
							}
						</c:when>
						<c:otherwise>
							fd.append('noticeFlag', 'N');
						</c:otherwise>
					</c:choose>
					
					<c:if test='${option.optThumFlag == "Y" }'>
						//섬네일 처리
						var thumFiles = $(".my-pond-thum-files").filepond('getFiles');
						
						if(thumFiles.length > 0){
							if(!CommonUtil.fileCheckImage(thumFiles[0].fileExtension)){
								alert('이미지 파일만 업로드 가능합니다.');
								return;
							}
							fd.append('thumFile', thumFiles[0].file);
						}
					</c:if>
					
					<c:if test='${option.optFileFlag == "Y" }'>
						//첨부파일 처리
						var files = $(".my-pond-files").filepond('getFiles');
						
						for(idx in files){
							fd.append('files', files[idx].file);
						}
						
						fd.append('deleteFileJSON', JSON.stringify(deleteFiles));
					</c:if>
					
					if($("#srchOnClickGcd").val() ==""){
						alert("검사코드는 필수 입력 입니다.");					
						return;	
					}
					
					axios.post("<c:url value='/admin/board/integrated/${masterSeq}/editBoardIntegrated.edit' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('수정 되었습니다.');
//  					    	location.href="<c:url value='/admin/board/integrated/${masterSeq}/${result.seq}.view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/board/integrated/${masterSeq}/${result.seq}.view' />").submit();

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
				$("#hiddenForm").attr('action', "<c:url value='/admin/board/integrated/${masterSeq}/${result.seq}.view' />").submit();

			});
			
			//검사코드 검색 등록 버튼 이벤트
			$("#btnAddTestSelect").click(function(){
				$("#modalTestCodeSearch").modal('show');
			});
			
			//검사코드 검색 팝업 검색 이벤트
			$("#btnModalTestCodeSearch").click(function(){
				searchTestCode();
			});
			
			
			let testCodeSearchList = [];
			
			//테스트 코드 검색
			function searchTestCode(){
				let url = "<c:url value='/admin/health/searchTestCodeList.json' />";
				axios.get(url,{
						params: {
							searchKeyword: $("#modalTestCodeSearchKeyword").val()
						}
					})
				  .then(function (res) {
					  testCodeSearchList = res.data.result;
					  printTestCodeSearchList(1);
					  
					  
					  let totalPage = 0;
					  
					  if(testCodeSearchList.length > 0){
						totalPage = Math.floor(testCodeSearchList.length / 10) ;
					
						if((testCodeSearchList.length % 10 ) > 0){
							totalPage++;
						}
					}
					  
					//페이지 네이션
					$('#page-selection').twbsPagination({
						totalPages: totalPage,
						startPage : 1,
						visiblePages: 5,
						onPageClick: function (event, page) {
							printTestCodeSearchList(page);
						}
					});
					  
					  
				  })
				  .catch(function (error) {
				    console.log(error);
				  });
			}
			
			function printTestCodeSearchList(page){
				
				if(testCodeSearchList.length == 0){
					$(".modallistBody").html('<tr><td colspan="4">검색결과가 없습니다.</td></tr>');
					return;
				}
				
				
				var startCursor = (page -1) * 10;
				var endCursor = startCursor + 10;
				
				if(endCursor > testCodeSearchList.length){
					endCursor = testCodeSearchList.length;
				}
				
				let contentHtml = '';
				for(startCursor; startCursor < endCursor; startCursor++){
					let item = testCodeSearchList[startCursor];
					
					contentHtml +='<tr class="_rowTestCodeSearch" data-testcode="' +item.f010gcd+ '" data-testname="' +item.f010fkn+ '">';
					contentHtml +='	<td>'+item.f010gcd+'</td>';
					contentHtml +='	<td><a href="javascript:void(0);">'+item.f010fkn+'</a></td>';
					contentHtml +='	<td>'+item.f010tnm+'</td>';
					contentHtml +='	<td>'+item.f010msnm+'</td>';
					contentHtml +='</tr>';
				}
				$(".modallistBody").html(contentHtml);
			}
			
			$(document).on('click', '._rowTestCodeSearch',function(){
				$("#srchOnClickGcd").val($(this).data('testcode')+" / "+$(this).data('testname'));
				$("#oneClickGcd").val($(this).data('testcode'));
				$("#oneClickGnm").val($(this).data('testname'));
				
				$("#modalTestCodeSearch").modal('hide');
				
			});
		});
	</script>


	</body>
</html>

