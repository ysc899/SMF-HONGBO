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

		<link href="<c:url value='/admin/css/reset2.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_01_write.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		
		
		
		<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
		
		<script src="<c:url value='/lib/fontawesome-free/js/all.min.js'/>"></script>
		<script src="<c:url value='/lib/popper/umd/popper.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>"></script>
		<script src="<c:url value='/lib/summernote/summernote.js'/>"></script>
		
		<!-- treeview -->
		<script src="<c:url value='/lib/bootstrap-treeview/dist/bootstrap-treeview.min.js'/>"></script>
		<!-- 페이지 네이션 -->
		<script src="<c:url value='/lib/twbs-pagination/jquery.twbsPagination.js'/>"></script>
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
			<jsp:include page="../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area">
					<form id="addForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">One Click 건강정보 등록</h1>
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
									<th>타이틀</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="title" placeholder="등록될 타이틀을 입력해주세요." id="title">
									</td>
								</tr>
								<tr>
									<th>보조 타이틀</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="subTitle" placeholder="등록될 보조 타이틀을 입력해주세요." id="subTitle">
									</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="writer" placeholder="등록될 작성자를 입력해주세요." value="학술홍보팀" id="writer">
									</td>
								</tr>
								<tr>
									<th>검수자</th>
									<td>
										<input type="text" class="form-control text_title" name="inspector" placeholder="등록될 검수자를 입력해주세요." id="inspector" style="width:300px;">
									</td>
									<th>검수자 설명</th>
									<td>
										<input type="text" class="form-control text_title" name="inspectorCmt" placeholder="등록될 검수자 설명을 입력해주세요." id="inspectorCmt" style="width:300px;">
									</td>
								</tr>
								<tr>
									<th>섬네일</th>
									<td colspan="3">
										<input type="file" class="my-pond-thum" name="thumImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
								<tr>
									<th>내용 이미지</th>
									<td colspan="3">
										<input type="file" class="my-pond-content" name="contentImage" accept="image/png, image/jpeg, image/gif"/>
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
										<input type="checkbox" id="printFlag" checked="checked">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">One Click 건강정보 출처 등록</h1>
					<table>
						<colgroup>
							<col width="50px;"/>
							<col width="100px;"/>
							<col width="200px;"/>
							<col width="200px;"/>
							<col width="100px;"/>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>출처</th>
								<th>보조 설명</th>
								<th>URL</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="tbodySource">
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<button type="button" class='btn btn-default' id="btnAddSource">출처 등록</button>
								</td>
							</tr>
						</tfoot>
					</table>
					
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">One Click 검사코드 등록</h1>
					<table>
						<colgroup>
							<col width="50px;"/>
							<col width="100px;"/>
							<col width="400px;"/>
							<col width="100px;"/>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>검사코드</th>
								<th>검사명</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="tbodyTest">
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4">
									<button type="button" class='btn btn-default' id="btnAddTestSelect">검사코드 검색</button>
									<button type="button" class='btn btn-default' id="btnAddTestInfo">검사코드 수기 입력</button>
								</td>
							</tr>
						</tfoot>
					</table>

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
			<form id="hiddenForm" method="get">
				<input type="hidden" name="searchOption" value="<c:out value='${sparam.searchOption}'/>"/>
				<input type="hidden" name="searchKeyword" value="<c:out value='${sparam.searchKeyword}'/>"/>
				<input type="hidden" name="currentPage" value="<c:out value="${sparam.currentPage }"/>"/>
			</form>
			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
		<!-- 모달  -->
		<!-- 출처 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalAddSource">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">출처 등록</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="addSourceForm">
				    	<table class="table">
				    		<tbody>
				    			<tr>
				    				<th>출처</th>
				    				<td><input type="text" class="form-control text_title" name="source" placeholder="등록될 출처를 입력해주세요." id="source"></td>
				    			</tr>
				    			<tr>
				    				<th>보조 설명</th>
				    				<td><textarea class="form-control" rows="3" cols="100" id="sourceComment" name="comment" style="resize:none;"></textarea></td>
				    			</tr>
				    			<tr>
				    				<th>URL</th>
				    				<td><input type="text" class="form-control text_title" name="url" placeholder="등록될 출처 URL을 입력해주세요." id="sourceUrl"></td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalAddSource">등록</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 출처 등록 끝-->
		
		<!-- 검사코드 수기 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalAddTestCodeHard">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">검사코드 수기 등록</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="addTestCodeHardForm">
				    	<table class="table">
				    		<tbody>
				    			<tr>
				    				<th>검사코드</th>
				    				<td><input type="text" class="form-control text_title" name="testCode" placeholder="등록될 검사코드를 입력해주세요." id="testCode"></td>
				    			</tr>
				    			<tr>
				    				<th>검사명</th>
<!-- 				    				<td><input type="text" class="form-control text_title" name="testName" placeholder="등록될 검사명 입력해주세요." id="testName"></td> -->
				    				<td><div id="testName"></div></td>
				    			</tr>
				    			<tr>
				    				<th>보조 설명</th>
<!-- 				    				<td><textarea class="form-control" rows="3" cols="100" id="testComment" name="comment" style="resize:none;"></textarea></td> -->
				    				<td><div id="testComment"></div></td>
				    			</tr>
				    			<tr>
				    				<th>검체</th>
				    				<td><input type="text" class="form-control text_title" name="specimen" placeholder="등록될 검체를 입력해주세요." id="specimen"></td>
				    			</tr>
				    			<tr>
				    				<th>용량</th>
				    				<td><input type="text" class="form-control text_title" name="volume" placeholder="등록될 출용량을 입력해주세요." id="volume"></td>
				    			</tr>
				    			<tr>
				    				<th>검사 방법</th>
				    				<td><input type="text" class="form-control text_title" name="testMethod" placeholder="등록될 검사 방법을 입력해주세요." id="testMethod"></td>
				    			</tr>
				    			<tr>
				    				<th>검사일정</th>
				    				<td><input type="text" class="form-control text_title" name="testDay" placeholder="등록될 검사일을 입력해주세요." id="testDay"></td>
				    			</tr>
				    			<tr>
				    				<th>소요일</th>
				    				<td><input type="text" class="form-control text_title" name="processDay" placeholder="등록될 소요일을 입력해주세요." id="processDay"></td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalAddTestCordHard">등록</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
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
				    			<tr>
				    				<th>검사명</th>
<!-- 				    				<td><input type="text" class="form-control text_title" name="testName" placeholder="등록될 검사명 입력해주세요." id="searchTestName" disabled="disabled"></td> -->
				    				<td><div id="searchTestName"></div></td>
				    			</tr>
				    			<tr>
				    				<th>보조 설명</th>
<!-- 				    				<td><textarea class="form-control" rows="3" cols="100" id="searchTestComment" name="comment" style="resize:none;"></textarea></td> -->
				    				<td><div id="searchTestComment"></div></td>
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
		
		
		

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		//출처 정보를 담을 배열
		let sourceInfos = [];
		//검사 정보 인포
		let testInfos = [];
	
		//출처 리스트 출력
		function printSourceList(){
			$("#tbodySource").html('');
			
			let sourceHtml = '';
			for(idx in sourceInfos){
				let item = sourceInfos[idx]; 
				sourceHtml += '<tr>';
				sourceHtml += '	<td>'+ (item.seq + 1)+'</td>';
				sourceHtml += '	<td>'+item.source+'</td>';
				sourceHtml += '	<td>'+item.comment+'</td>';
				sourceHtml += '	<td>'+item.url+'</td>';
				sourceHtml += '	<td><button class="btn btn-warning _btnRemoveSource" data-seq="'+ item.seq +'">삭제</td>';
				sourceHtml += '</tr>';
			}
			
			$("#tbodySource").html(sourceHtml);
		}
		
		//출처 삭제 이벤트
		$(document).on('click', '._btnRemoveSource',function(){
			let sourceSeq = $(this).data('seq');
			sourceInfos.splice(sourceSeq, 1);
			for(idx in sourceInfos){
				sourceInfos[idx].seq = Number(idx);
			}
			printSourceList();
		});
		
		//검사코드 리스트 출력 메소드
		function printTestInfoList(){
			$("#tbodyTest").html('');
			
			let testInfoHtml = '';
			for(idx in testInfos){
				let item = testInfos[idx]; 
				
				testInfoHtml += '<tr>';
				testInfoHtml += '	<td>'+ (item.seq + 1)+'</td>';
				testInfoHtml += '	<td>'+item.testCode+'</td>';
				testInfoHtml += '	<td>'+item.testName+'</td>';
				testInfoHtml += '	<td><button class="btn btn-warning _btnRemoveTestInfo" data-seq="'+ item.seq +'">삭제</td>';
				testInfoHtml += '</tr>';
			}
			
			$("#tbodyTest").html(testInfoHtml);
		}
		
		//검사코드 삭제 이벤트
		$(document).on('click', '._btnRemoveTestInfo',function(){
			let testInfoSeq = $(this).data('seq');
			testInfos.splice(testInfoSeq, 1);
			for(idx in testInfos){
				testInfos[idx].seq = Number(idx);
			}
			printTestInfoList();
		});
	
	
		// 출력 순서 변경 이벤트
		function setPrintOrder(size){
			$("#printOrder").empty();
			
			let selectCount = size+1;
			
			for(var idx = 1; idx <= selectCount; idx++){
				$("#printOrder").append("<option value='"+idx+"'>"+ idx +"</option>");
			}
			
			$("#printOrder").val(1).attr("selected", "selected");
		}
		
		
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

			$("#searchTestCode").val($(this).data('testcode'));
// 			$("#searchTestName").val($(this).data('testname'));
			$("#searchTestName").summernote("code", $(this).data('testname'));
			$("#searchTestComment").summernote("code", '');
// 			$("#searchTestComment").val('');

			$("#modalAddTestCodeSearch").modal('show');
		});

	
		$(document).ready(function(){
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			
			$('.my-pond-thum').filepond();
			$('.my-pond-content').filepond();
			//파일 업로드 설정 끝
			
			
			//텍스트 에디터 설정
			$('#testName').summernote({
				placeholder: '',
				tabsize: 2,
				height: 100,
				toolbar: [
					  ['font', ['italic']],
					],
				lang: 'en-US',
			});
			$('#testComment').summernote({
				placeholder: '',
				tabsize: 2,
				height: 100,
				toolbar: [
					  ['font', ['italic']],
					],
				lang: 'en-US',
			});
			$('#searchTestName').summernote({
				placeholder: '',
				tabsize: 2,
				height: 100,
				toolbar: [
					  ['font', ['italic']],
					],
				lang: 'en-US',
			});
			$('#searchTestComment').summernote({
				placeholder: '',
				tabsize: 2,
				height: 100,
				toolbar: [
					  ['font', ['italic']],
					],
				lang: 'en-US',
			});
			
			
			
			//언어코드 체인지 이벤트
			$("#codeLang").change(function(){
				//언어코드가 선택 되었고
				let langCode = $(this).val();
				
				if(langCode == -1){
					alert('언어코드를 선택 하세요.');
					return;
				}
				
				//언어코드에 대한 출력 순서 정보를 가져온다
				
				let url = "<c:url value='/admin/health/maxPrintOrder.json' />";

				axios.get(url,{
						params: {
							lang: langCode
						}
					})
				  .then(function (res) {
					  setPrintOrder(res.data.result);
				  })
				  .catch(function (error) {
				    console.log(error);
				  });
				
			});
			
			//출처 등록 클릭 이벤트
			$("#btnAddSource").click(function(){
				$("#source").val('');
				$("#sourceComment").val('');
				$("#sourceUrl").val('');
				
				$("#modalAddSource").modal('show');
			});
			
			$("#addSourceForm").validate({
				rules:{
					source: {required:true},
					url: { url: true}
				},
				submitHandler: function(form) {
					
					let param = $('#addSourceForm').serializeObject();
										
					if(!CommonUtil.isEmpty(param.comment)){
						param.comment = CommonUtil.toBr(param.comment);
					}
					param.seq = sourceInfos.length;
					
					sourceInfos.push(param);
					printSourceList();
					$("#modalAddSource").modal('hide');
					
				}
			});
			
			//출처 등록 버튼 이벤트
			$("#btnModalAddSource").click(function(){
				$("#addSourceForm").submit();
			});
			
			
			//검사코드 검색 등록 버튼 이벤트
			$("#btnAddTestSelect").click(function(){
				$("#modalTestCodeSearch").modal('show');
			});
			//검사코드 검색 팝업 검색 이벤트
			$("#btnModalTestCodeSearch").click(function(){
				searchTestCode();
			});
			$("#inputKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					searchTestCode();
				}
			});
			
			
			
			//검사코드 수기 입력 버튼 이벤트
			$("#btnAddTestInfo").click(function(){
				
				$("#testCode").val('');
// 				$("#testName").val('');
				$("#testName").summernote("code", '');
				$("#testComment").summernote("code", '');

// 				$("#testComment").val('');
				$("#volume").val('');
				$("#specimen").val('');
				$("#testMethod").val('');
				$("#testDay").val('');
				$("#processDay").val('');
				
				$("#modalAddTestCodeHard").modal('show');
			});
			
			$("#addTestCodeHardForm").validate({
				rules:{
					testCode: {required:true},
// 					testName: {required:true},
					volume: {required:true},
					testMethod: {required:true},
					testDay: {required:true},
					processDay: {required:true},
				},
				submitHandler: function(form) {
					
					let param = $('#addTestCodeHardForm').serializeObject();
					
					let testName = $('#testName').summernote('code');
					if(CommonUtil.isEmpty(testName)){
						alert('검사명은 필수 입니다.');
						return;
					}
					param.testName = CommonUtil.toBr(testName);
					
					let testComment = $('#testComment').summernote('code');
					if(!CommonUtil.isEmpty(testComment)){
						param.comment = testComment;
					}
					
					
// 					if(!CommonUtil.isEmpty(param.comment)){
// 						param.comment = CommonUtil.toBr(param.comment);
// 					}
					param.seq = testInfos.length;
					param.hardFlag = 'Y';
					
					testInfos.push(param);
					printTestInfoList();
					$("#modalAddTestCodeHard").modal('hide');
					
				}
			});
			
			//검사코드 수기 등록 이벤트
			$("#btnModalAddTestCordHard").click(function(){
				$("#addTestCodeHardForm").submit();
			});
			
			//검사코드 검색 등록 이벤트
			$("#btnModalAddTestSearchCord").click(function(){
				
				let param = {
					testCode: $("#searchTestCode").val(),
					testName: '',
					comment: '',
				};
				
				let testName = $('#searchTestName').summernote('code');
				if(CommonUtil.isEmpty(testName)){
					alert('검사명은 필수 입니다.');
					return;
				}
				param.testName = CommonUtil.toBr(testName);
				
				let testComment = $('#searchTestComment').summernote('code');
				if(!CommonUtil.isEmpty(testComment)){
					param.comment = testComment;
				}
				
				param.seq = testInfos.length;
				param.hardFlag = 'N';
				
				testInfos.push(param);
				printTestInfoList();
				$("#modalAddTestCodeSearch").modal('hide');
				
			});
			
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					title: {required:true},
					subTitle: {required:true},
					writer: {required:true},
					inspector: {required:true},
					inspectorCmt: {required:true},
				},
				submitHandler: function(form) {
					
					let param = $('#addForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					
					var thumFiles = $(".my-pond-thum").filepond('getFiles');
					
					if(thumFiles.length == 0){
						alert('섬네일은 필수 입니다.');
						return;
					}
					
					if(!CommonUtil.fileCheckImage(thumFiles[0].fileExtension)){
						alert('이미지 파일만 업로드 가능합니다.');
						return;
					}
					
					
					var contentFiles = $(".my-pond-content").filepond('getFiles');
					
					if(contentFiles.length == 0){
						alert('내용 이미지는 필수 입니다.');
						return;
					}
					
					if(!CommonUtil.fileCheckImage(contentFiles[0].fileExtension)){
						alert('이미지 파일만 업로드 가능합니다.');
						return;
					}
					
					if(sourceInfos.length == 0){
						alert('출처 정보가 없습니다.');
						return;
					}
					
					if(testInfos.length == 0){
						alert('검사코드 정보가 없습니다.');
						return;
					}
					
					
					let fd = new FormData(document.getElementById('addForm'));
					
					fd.append('thumFile', thumFiles[0].file);
					fd.append('contentFile', contentFiles[0].file);
					
					//출력 여부
					let isPrint = $("#printFlag").is(":checked");
					if(isPrint){
						fd.append('printFlag', 'Y');
					}else{
						fd.append('printFlag', 'N');
					}
					
					
					fd.append('sourceJSON',JSON.stringify(sourceInfos));
					fd.append('testJSON',JSON.stringify(testInfos));
					
					
					axios.post("<c:url value='/admin/health/addHealthInfo.write' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/health/" + res.data.result + ".view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/health/" + res.data.result + ".view' />").submit();

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
				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/health/index.do' />").submit();

			});
			
		});
	</script>


	</body>
</html>

