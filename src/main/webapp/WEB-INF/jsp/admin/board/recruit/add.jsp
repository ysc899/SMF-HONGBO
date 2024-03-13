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
					<form id="addForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 등록</h1>
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
									<th>입력 방식 여부</th>
									<td>
										<label for="inputTypeFlag">신규 방식</label>
										<input type="checkbox" id="inputTypeFlag" checked="checked">
									</td>
									<th>표출 여부</th>
									<td>
										<label for="viewFlag">표출</label>
										<input type="checkbox" id="viewFlag" checked="checked">
									</td>
								</tr>
								<tr>
									<th>채용 종류</th>
									<td>
										<select class="form-control" id="codeRecruitTP" name="codeRecruitTP">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.recruitTPCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
									<th>채용 상태</th>
									<td>
										<select class="form-control" id="codeRecruitST" name="codeRecruitST">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.recruitSTCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
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
								<tr>
									<th>타이틀</th>
									<td colspan="3">
										<input type="text" class="form-control text_title" name="title" placeholder="등록될 타이틀을 입력해주세요." id="title">
									</td>
								</tr>
								<tr class="_inputNType">
									<th>내용</th>
									<td class="write_note" colspan="3"><div id="contentSummernote"></div></td>
								</tr>
								<tr class="_inputYType">
									<th>내용 타이틀</th>
									<td class="write_note" colspan="3">(재)씨젠의료재단 <input type="text" class="form-control text_title" name="contentTitle" placeholder="내용을 입력해주세요." id="title"> 전문인력채용</td>
								</tr>
								<tr class="_inputYType">
									<th>채용 부문</th>
									<td class="write_note" colspan="3">(재)씨젠의료재단 <input type="text" class="form-control text_title" name="contentComment" placeholder="내용을 입력해주세요." id="title"> 도전적이고 진취적인 우수인재를 모십니다.</td>
								</tr>
							</tbody>
						</table>
					</form>
					
					<h1 class="_inputYType"><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">업무내용 등록</h1>
					<table class="_inputYType">
						<colgroup>
							<col width="50px;"/>
							<col width="10%;"/>
							<col width="10%;"/>
							<col width="10%;"/>
							<col width="10%;"/>
							<col width="*;"/>
							<col width="10%;"/>
							<col width="10%;"/>
							<col width="20%;"/>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>채용부문</th>
								<th>근무지역</th>
								<th>담당 업무</th>
								<th>근무시간</th>
								<th>필수 요건</th>
								<th>우대 요건</th>
								<th>채용인원</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="tbodyTask">
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<button type="button" class='btn btn-default' id="btnAddTask">업무 등록</button>
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
		
		<!-- 모달  -->
		<!-- 업무 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalAddTask">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">업무 등록</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="addTaskForm">
				    	<table class="table">
				    		<tbody>
				    			<tr>
				    				<th>채용 부문</th>
				    				<td><input type="text" class="form-control text_title" name="taskSection" placeholder="채용 부문을 입력해주세요." id="taskSection"></td>
				    			</tr>
				    			<tr>
				    				<th>근무지역</th>
				    				<td><input type="text" class="form-control text_title" name="taskLoc" placeholder="근무 지역을 입력해주세요." id="taskLoc"></td>
				    			</tr>
				    			<tr>
				    				<th>담당 업무</th>
				    				<td><input type="text" class="form-control text_title" name="taskAssigned" placeholder="담당 업무를 입력해주세요." id="taskAssigned"></td>
				    			</tr>
				    			<tr>
				    				<th>근무시간</th>
				    				<td><textarea class="form-control" rows="3" cols="100" id="taskTime" name="taskTime" style="resize:none;"></textarea></td>
				    			</tr>
				    			<tr>
				    				<th>필수요건</th>
				    				<td><textarea class="form-control" rows="3" cols="100" id="taskRequire" name="taskRequire" style="resize:none;"></textarea></td>
				    			</tr>
				    			<tr>
				    				<th>우대요건</th>
				    				<td><textarea class="form-control" rows="3" cols="100" id="taskOption" name="taskOption" style="resize:none;"></textarea></td>
				    			</tr>
				    			<tr>
				    				<th>채용 인원</th>
				    				<td><input type="text" class="form-control text_title" name="taskApes" placeholder="채용 인원을 입력해주세요." id="taskApes"></td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalAddTask">등록</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 출처 등록 끝-->
		

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		//등록된 채용 업무들
		var taskInfos = [];
	
		function printTaskList(){
			
			$("#tbodyTask").html('');
			
			var sourceHtml = '';
			for(idx in taskInfos){
				var item = taskInfos[idx]; 
				sourceHtml += '<tr>';
				sourceHtml += '	<td>'+item.row+'</td>';
				sourceHtml += '	<td>'+item.taskSection+'</td>';
				sourceHtml += '	<td>'+item.taskLoc+'</td>';
				sourceHtml += '	<td>'+item.taskAssigned+'</td>';
				sourceHtml += '	<td>'+item.taskTime+'</td>';
				sourceHtml += '	<td>'+item.taskRequire+'</td>';
				sourceHtml += '	<td>'+item.taskOption+'</td>';
				sourceHtml += '	<td>'+item.taskApes+'</td>';
				sourceHtml += '	<td><button class="btn btn-warning _btnRemoveTask" data-row="'+ item.row +'">삭제</td>';
				sourceHtml += '</tr>';
			}
			
			$("#tbodyTask").html(sourceHtml);
		}
		
		//채용 업무 삭제 이벤트
		$(document).on('click', '._btnRemoveTask',function(){
			var row = $(this).data('row');
			taskInfos.splice(--row, 1);
			for(idx in taskInfos){
				taskInfos[idx].row = Number(idx) +1;
			}
			printTaskList();
		});
		
	
		$(document).ready(function(){
			
			
			//텍스트 에디터 설정
			$('#contentSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 400,
				toolbar: [
					  ['style', ['style']],
					  ['font', ['bold', 'underline', 'clear']],
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
			
			//달력 설정
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
			    autoclose: true
			}).on('changeDate', function(selected){
				var endDate = new Date(selected.date.valueOf());
				$("#startDate").datepicker('setEndDate', endDate);
			});
			
			$("._inputNType").hide();
			
			//입력 방식 체인지 이벤트
			$("#inputTypeFlag").change(function(){
				if($(this).is(":checked")){
					//신규 입력 방식
					$("._inputNType").hide();
					$("._inputYType").show();
					
				}else{
					//구형 입력 방식
					$("._inputNType").show();
					$("._inputYType").hide();
				}
			});
			
			$("#btnAddTask").click(function(){
				//입력값 초기화
				$("#taskSection").val('');
				$("#taskLoc").val('');
				$("#taskAssigned").val('');
				$("#taskRequire").val('');
				$("#taskOption").val('');
				$("#taskApes").val('');
				$("#taskTime").val('');
				
				$("#modalAddTask").modal('show');
			});
			

			$("#addTaskForm").validate({
				rules:{
					taskSection: {required:true},
					taskLoc: {required:true},
					taskAssigned: {required:true},
					taskRequire: {required:true},
					taskApes: {required:true},
					taskTime: {required:true}
				},
				submitHandler: function(form) {
					
					var param = $('#addTaskForm').serializeObject();
										
					if(!CommonUtil.isEmpty(param.taskRequire)){
						param.taskRequire = CommonUtil.toBr(param.taskRequire);
					}
					
					if(!CommonUtil.isEmpty(param.taskTime)){
						param.taskTime = CommonUtil.toBr(param.taskTime);
					}
					if(!CommonUtil.isEmpty(param.taskOption)){
						param.taskOption = CommonUtil.toBr(param.taskOption);
					}
					param.row = taskInfos.length +1;
					param.seq = 0;
					
					taskInfos.push(param);
					printTaskList();
					$("#modalAddTask").modal('hide');
					
				}
			});
			
			//업무 등록 버튼 이벤트
			$("#btnModalAddTask").click(function(){
				$("#addTaskForm").submit();
			});
			
			
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					title: {required:true},
					startDate: {required:true},
				},
				submitHandler: function(form) {
					
					var param = $('#addForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}
					
					if(param.codeRecruitTP == -1){
						alert('채용 종류를 선택 하세요.');
						return;
					}
					if(param.codeRecruitST == -1){
						alert('채용 상태를 선택 하세요.');
						return;
					}
					
					//표시여부
					var isViewFlag = $("#viewFlag").is(":checked");
					if(isViewFlag){
						param.viewFlag = 'Y';
					}else{
						param.viewFlag = 'N';
					}
					
					
					//출력 여부
					var isInputType = $("#inputTypeFlag").is(":checked");
					if(isInputType){
						param.inputTypeFlag = 'Y';
						
						if(CommonUtil.isEmpty(param.contentTitle)){
							alert('내용 타이틀을 입력하세요.');
							return;
						}
						if(CommonUtil.isEmpty(param.contentComment)){
							alert('채용 부문을 입력하세요.');
							return;
						}
						
						if(taskInfos.length == 0){
							alert('업무내용이 없습니다.');
							return;
						}
						
						param.taskInfoJSON = JSON.stringify(taskInfos);
						
						
					}else{
						param.inputTypeFlag = 'N';
						var content = $('#contentSummernote').summernote('code');
						if(content == '<p><br></p>'){
							alert('내용이 없습니다.');
							return;
						}
						param.content = content;
						
					}
					
					axios.post("<c:url value='/admin/board/recruit/addRecruit.write' />", param)
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/board/recruit/" + res.data.result + ".view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/board/recruit/" + res.data.result + ".view' />").submit();

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
				$("#hiddenForm").attr('action', "<c:url value='/admin/board/recruit/index.do' />").submit();

			});
			
		});
	</script>


	</body>
</html>

