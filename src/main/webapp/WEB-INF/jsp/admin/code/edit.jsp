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


		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
				<!-- underscore -->
		<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
		
		
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
					<form id="editForm">
						<input type="hidden" name="seq" value='<c:out value="${result.seq }"/>'>
						<input type="hidden" name="masterCode" value='<c:out value="${result.masterCode }"/>'>
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 수정</h1>
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="*"/>
							</colgroup>
							<tbody>
								<tr>
									<th>코드</th>
									<td><c:out value="${result.masterCode }"/></td>
								</tr>
								<tr>
									<th>시스템 코드 여부</th>
									<td><c:out value="${result.systemCodeFlag}"/></td>
								</tr>
								<tr>
									<th>코드 이름</th>
									<td>
										<input type="text" name="masterCodeName" id="masterCodeName" value='<c:out value="${result.masterCodeName }"/>'>
									</td>
								</tr>
								<tr>
									<th>코드 설명</th>
									<td><textarea class="form-control" rows="3" cols="100" id="masterCodeDes" name="masterCodeDes" style="resize:none;"></textarea></td>
								</tr>
							</tbody>
						</table>
					</form>
						
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">하위 코드 메뉴</h1>
					<table>
						<colgroup>
							<col width="10%">
							<col width="25%">
							<col width="30%">
							<col width="10%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th>하위 코드</th>
								<th>하위 코드 이름</th>
								<th>하위 코드 설명</th>
								<th>코드 순서</th>
								<th>기능</th>
							</tr>
						</thead>
						<tbody id="tableSlaveList">
						</tbody>
						<c:if test="${result.systemCodeFlag eq 'N' }">
							<tfoot>
								<tr>
									<td colspan="5">
										<span class="notice_write_cancel _addSlave">
										<img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">추가</span>
									</td>
								</tr>
							</tfoot>
						</c:if>
					</table>

					<table>
						<tr>
							<td colspan="2">
								<span class="notice_write_ok _cancel" >취소</span>
								<span class="notice_write_cancel _edit">
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
		<jsp:include page="../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
		<!-- 모달  -->
		<c:if test="${result.systemCodeFlag eq 'N' }">
		<div class="modal fade" tabindex="-1" role="dialog" id="modalSlaveCodeAdd">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">하위 코드 추가</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
		    		<form id="slaveCodeAddForm">
			    	<table class="table">
			    		<tbody>
			    			<tr>
			    				<th>코드</th>
			    				<td><input type="text" name="slaveCode" id="mSlaveAddSlaveCode"></td>
			    			</tr>
			    			<tr>
			    				<th>코드 이름</th>
			    				<td><input type="text" name="slaveCodeName" id="mSlaveAddSlaveName"></td>
			    			</tr>
			    			<tr>
			    				<th>설명</th>
			    				<td><textarea class="form-control" rows="3" cols="100" id="mSlaveAddSlaveDes" name="slaveCodeDes" style="resize:none;"></textarea></td>
			    			</tr>
			    			<tr>
			    				<th>코드 순서</th>
			    				<td>
									<select name="codeOrder" id="mSlaveAddCodeOrder" class="form-control">
									</select>
			    				</td>
			    			</tr>
			    		</tbody>
			    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-secondary" style="float:left;" id="btnModalSlaveAdd">추가</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		</c:if>
		
		<div class="modal fade" tabindex="-1" role="dialog" id="modalSlaveCodeEdit">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">하위 코드 수정</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
		    		<form id="slaveCodeEditForm">
		    		<input type="hidden" name="slaveCode" id="mSlaveEditSlaveCode">
		    		<input type="hidden" name="idx" id="mSlaveEditIdx">
		    		<input type="hidden" name="seq" id="mSlaveEditSeq">
			    	<table class="table">
			    		<tbody>
			    			<tr>
			    				<th>코드</th>
			    				<td class="_mSlaveEditSlaveCode"></td>
			    			</tr>
			    			<tr>
			    				<th>코드 이름</th>
			    				<td><input type="text" name="slaveCodeName" id="mSlaveEditSlaveName" class="form-control"></td>
			    			</tr>
			    			<tr>
			    				<th>설명</th>
			    				<td><textarea class="form-control" rows="3" cols="100" id="mSlaveEditSlaveDes" name="slaveCodeDes" style="resize:none;"></textarea></td>
			    			</tr>
			    			<tr>
			    				<th>코드 순서</th>
			    				<td>
									<select name="codeOrder" id="mSlaveEditCodeOrder" class="form-control">
										
									</select>
			    				</td>
			    			</tr>
			    		</tbody>
			    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-secondary" style="float:left;" id="btnModalSlaveEdit">수정</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		
		<div class="modal fade" tabindex="-1" role="dialog" id="modalSlaveCodeLangEdit">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">다국어 수정</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
		    		<form id="slaveCodeEditLangForm">
		    		<input type="hidden" name="seq" id="mSlaveLangEditSeq">
		    		<input type="hidden" name="slaveCode" id="mSlaveLangEditSlaveCode">
			    	<table class="table">
			    		<thead>
			    			<tr>
			    				<th>언어명</th>
			    				<th>다국어 명</th>
			    			</tr>
			    		</thead>
			    		<tbody id="tableSlaveCodeLangEditBody">
			    			
			    		</tbody>
			    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-secondary" style="float:left;" id="btnModalSlaveLangEdit">수정</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
	var slaveCodes = [];
		<c:forEach var="slave" items="${result.slaveList}">
			slaveCodes.push({
				seq :"<c:out value="${slave.seq }"/>",
				slaveCode :"<c:out value="${slave.slaveCode }"/>",
				slaveCodeName: "<c:out value="${slave.slaveCodeName}"/>",
				slaveCodeDes: "<c:out value="${slave.slaveCodeDes}"/>",
				codeOrder: "<c:out value="${slave.codeOrder}"/>",
				newFlag: false,
				editFlag: false,
				langs:[]
			});
		</c:forEach>
	
		
		function printSlaveList(){
			$("#tableSlaveList").empty();
			
			var content = '';
			for(var idx in slaveCodes){
				var item = slaveCodes[idx];
				content +='<tr>';
				content +='	<td>'+item.slaveCode+'</td>';
				content +='	<td>'+item.slaveCodeName+'</td>';
				content +='	<td>'+item.slaveCodeDes+'</td>';
				content +='	<td>'+item.codeOrder+'</td>';
				if(item.newFlag){
					content +='	<td>';
					content +='		<button class="btn btn-default _btnSlaveTableRemove" data-idx="' + idx +'">삭제</button>';
					content +='    <button class="btn btn-default _btnSlaveTableEditLang" data-idx="' + idx +'">다국어 수정</button>';
					content +='	</td>';
				}else{
					content +='	<td>';
					content +='    <button class="btn btn-default _btnSlaveTableEdit" data-idx="' + idx +'">수정</button>';
					content +='    <button class="btn btn-default _btnSlaveTableEditLang" data-idx="' + idx +'">다국어 수정</button>';
					content +='	</td>';
				}
				content +='</tr>';
			}
			
			$("#tableSlaveList").html(content);
		}
		
		//신규 추가한 하위 코드 삭제 이벤트
		$(document).on('click', '._btnSlaveTableRemove',function(){
			var idx = $(this).data('idx');
			
			if(slaveCodes[idx].newFlag){
				
				var target = slaveCodes[idx];
				
				_.each(_.filter(slaveCodes, function(t){
					return t.codeOrder >= target.codeOrder;
				}),function(t){t.editFlag = true; t.codeOrder--});
				
				
				slaveCodes.splice(idx, 1);
			}
			
			
			printSlaveList();
		});
		
		//기존 코드 수정 이벤트
		$(document).on('click', '._btnSlaveTableEdit',function(){
			
			var idx = $(this).data('idx');
			
			if(!slaveCodes[idx].newFlag){
				var item = slaveCodes[idx];
				
				$("#mSlaveEditSlaveCode").val(item.slaveCode);
				$("._mSlaveEditSlaveCode").html(item.slaveCode);
				$("#mSlaveEditSlaveName").val(item.slaveCodeName);
				$("#mSlaveEditSlaveDes").val(CommonUtil.toEnter(item.slaveCodeDes));
				
				
				$("#mSlaveEditCodeOrder").empty();
				for(var idx2 = 1; idx2 <=slaveCodes.length ; idx2++){
					$("#mSlaveEditCodeOrder").append('<option value="'+ idx2 +'">'+idx2+'</option>');
				}
				
				
				$("#mSlaveEditCodeOrder").val(item.codeOrder);
				
				$("#mSlaveEditIdx").val(idx);
				$("#mSlaveEditSeq").val(item.seq);
				
				$("#modalSlaveCodeEdit").modal('show');
			}
		});
		
		//다국어 수정 이벤트
		$(document).on('click', '._btnSlaveTableEditLang',function(){
			
			var idx = $(this).data('idx');
			
			if(!slaveCodes[idx].newFlag){
				var item = slaveCodes[idx];
				
				
				if(item.langs.length == 0){
					axios.get("<c:url value='/admin/code/slave/${result.masterCode}/"+item.slaveCode+".json' />")
					  .then(function (res) {
						  var results = res.data.result;
						
						item.langs = [];
						
						for(var idx in results){
							item.langs.push({
								seq: results[idx].seq,
								codeLangType: results[idx].codeLangType,
								codeLangName: results[idx].codeLangName,
								infoName: results[idx].infoName,
							});
						}
						
						if(item.langs.length == 0){
							item.langs = [];
							<c:forEach var="item" items="${langCodes}">
							item.langs.push({
								seq: 0,
								codeLangType: "<c:out value='${item.slaveCode }'/>",
								codeLangName: '<c:out value="${item.slaveCodeName }"/>',
								infoName: '',
							});
							</c:forEach>
						}
						
						showSlaveCodeLangEdit(item);
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
				}else{
					showSlaveCodeLangEdit(item);
				}
			}else{
				var item = slaveCodes[idx];
				
				if(item.langs.length == 0){
					item.langs = [];
					<c:forEach var="item" items="${langCodes}">
					item.langs.push({
						seq: 0,
						codeLangType: "<c:out value='${item.slaveCode }'/>",
						codeLangName: '<c:out value="${item.slaveCodeName }"/>',
						infoName: '',
					});
					</c:forEach>
				}
				showSlaveCodeLangEdit(item);
			}
		});
		
		// 다국어 설정 팝업 표시
		function showSlaveCodeLangEdit(target){
			
			$("#mSlaveLangEditSeq").val(target.seq);
			$("#mSlaveLangEditSlaveCode").val(target.slaveCode);
	 		$("#tableSlaveCodeLangEditBody").empty();
	 		
	 		var content = '';
	 		for(var idx in target.langs){
	 			var item = target.langs[idx];
	 			content += '<tr>';
	 			content += ' <td>';
	 			content += ' 	<input type="hidden" name="seq_'+item.codeLangType +'" value="'+ item.seq +'"> ';
	 			content += ' 	<input type="hidden" name="codeLangType_'+item.codeLangType +'" value="'+ item.codeLangType +'"> ';
	 			content += ' 	<input type="hidden" name="codeLangName_'+item.codeLangType +'" value="'+ item.codeLangName +'"> ';
	 			content +=  item.codeLangName ;
	 			content += ' </td>';
	 			content += ' <td>';
	 			content += ' 	<input type="text" name="infoName_'+item.codeLangType +'" value="'+ item.infoName +'"> ';
	 			content += ' </td>';
	 			content += '</tr>';
	 		}
	 		$("#tableSlaveCodeLangEditBody").html(content);
	 		
			$("#modalSlaveCodeLangEdit").modal('show');
		}

		
	
	
		$(document).ready(function(){
			
			var seq = '<c:out value="${result.seq }"/>';
			
			if(seq == ''){
				alert('존재하지 않는 코드 입니다.');
				location.href="<c:url value='/admin/code/index.do' />";
			}
			
			
			var codeMasterDesc = '<c:out escapeXml="false" value="${result.masterCodeDes }"/>';
			$("#masterCodeDes").val(CommonUtil.toEnter(codeMasterDesc));
			
			printSlaveList();
			
			//시스템 코드가 아닐시 하위 코드 추가 이벤트 
			<c:if test="${result.systemCodeFlag eq 'N' }">
			
			//아이디 키업 이벤트
			$("#mSlaveAddSlaveCode").keyup(function(event){
				var str = $(this).val();
				str = str.replace(/[^A-Za-z0-9]/gm, "");
				$(this).val(str);
				
				return false;
			});
			
			
			$("._addSlave").click(function(){
				$("#mSlaveAddSlaveCode").val('');
				$("#mSlaveAddSlaveName").val('');
				$("#mSlaveAddSlaveDes").val('');
				
				$("#mSlaveAddCodeOrder").empty();
				for(var idx2 = 1; idx2 <=slaveCodes.length+1 ; idx2++){
					$("#mSlaveAddCodeOrder").append('<option value="'+ idx2 +'">'+idx2+'</option>');
				}
				
				
				$("#mSlaveAddCodeOrder").val(slaveCodes.length+1);
				
				$("#modalSlaveCodeAdd").modal('show');
			});
			
			//입력값 검증 설정
			$("#slaveCodeAddForm").validate({
				rules:{
					slaveCode: {required:true, minlength:2, maxlength:10},
					slaveCodeName: {required:true, minlength:2, maxlength:10},
				},
				submitHandler: function(form) {
					
					var param = $('#slaveCodeAddForm').serializeObject();
					
					if(!CommonUtil.isEmpty(param.slaveCodeDes)){
						param.slaveCodeDes = CommonUtil.toBr(param.slaveCodeDes);
					}
					
					var checkFlag = _.find(slaveCodes, function(t){
						return t.slaveCode == param.slaveCode;
					})
					if(checkFlag){
						alert('코드 값이 중복 됩니다.');
						return;
					}
					param.seq = 0;
					param.newFlag = true;
					param.editFlag = false;
					param.langs = []
					
					_.each(_.filter(slaveCodes, function(t){
						return t.codeOrder >= param.codeOrder;
					}),function(t){t.editFlag = true; t.codeOrder++});
					
					slaveCodes.push(param);
					printSlaveList();
					$("#modalSlaveCodeAdd").modal('hide');
					
				}
			});
			
			$("#btnModalSlaveAdd").click(function(){
				$("#slaveCodeAddForm").submit();
			});
			
			</c:if>
			//하위코드 관련 설정
			//하위코드 수정 관련 검증 설정
			$("#slaveCodeEditForm").validate({
				rules:{
					slaveCodeName: {required:true, minlength:2, maxlength:10},
				},
				submitHandler: function(form) {
					
					var param = $('#slaveCodeEditForm').serializeObject();
					
					if(!CommonUtil.isEmpty(param.slaveCodeDes)){
						param.slaveCodeDes = CommonUtil.toBr(param.slaveCodeDes);
					}
					
					var target = _.find(slaveCodes, function(t){
						return t.seq == param.seq;
					});
					
					target.slaveCodeName = param.slaveCodeName;
					target.slaveCodeDes = param.slaveCodeDes;
					
					if(target.codeOrder != param.codeOrder){
						_.each(_.filter(slaveCodes, function(t){
							return t.codeOrder <= target.codeOrder && t.seq != param.seq;
						}),function(t){t.editFlag = true; t.codeOrder++});
						_.each(_.filter(slaveCodes, function(t){
							return t.codeOrder <= param.codeOrder && t.seq != param.seq;
						}),function(t){t.editFlag = true; t.codeOrder--});
						
					}
					
					target.codeOrder = param.codeOrder;
					target.editFlag = true;
					
					printSlaveList();
					$("#modalSlaveCodeEdit").modal('hide');
					
				}
			});
			
			$("#btnModalSlaveEdit").click(function(){
				$("#slaveCodeEditForm").submit();
			});
			//하위코드 관련 설정 끝
			
			//하위코드 다국어 설정 관련
			$("#btnModalSlaveLangEdit").click(function(){
				var param = $('#slaveCodeEditLangForm').serializeObject();
				
				var parentSeq = param.seq;
				var parentCode = param.slaveCode;
				
				var target = _.find(slaveCodes, function(t){return t.seq == parentSeq && t.slaveCode == parentCode});
				target.editFlag = true;
				keys = _.keys(param);
				
				<c:forEach var="item" items="${langCodes}">
					var langTarget = _.find(target.langs, function(t){return t.codeLangType == "<c:out value='${item.slaveCode }'/>" && t.seq == param["seq_<c:out value='${item.slaveCode }'/>"]});
					langTarget.infoName = param["infoName_<c:out value='${item.slaveCode }'/>"];
				</c:forEach>
				
				$("#modalSlaveCodeLangEdit").modal('hide');
				
			});
			
			//하위코드 다국어 설정 관련 끝
			
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
					masterCodeName: {required:true, minlength:2, maxlength:10}
				},
				submitHandler: function(form) {
					
					var param = $('#editForm').serializeObject();
					
					if(!CommonUtil.isEmpty(param.masterCodeDes)){
						param.masterCodeDes = CommonUtil.toBr(param.masterCodeDes);
					}
					
					var slaveTarget = JSON.parse(JSON.stringify(slaveCodes));
					
					for(var idx in slaveTarget){
						if(slaveTarget[idx].langs.length > 0){
							slaveTarget[idx].langsJSON = JSON.stringify(slaveTarget[idx].langs);
						}
						delete slaveTarget[idx].langs;
					}
					param.slaveCodeJSON = JSON.stringify(slaveTarget);
					
					axios.post("<c:url value='/admin/code/editCode.edit' />", param)
					  .then(function (res) {
					    if(res.data.result){
					    	alert('수정 되었습니다.');
// 					    	location.href="<c:url value='/admin/code/${result.seq}.view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/code/${result.seq}.view' />").submit();

					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});
			
			//추가버튼 이벤트 추가
			$("._edit").click(function(){
				$("#editForm").submit();
			});
			
			//목록으로 가기 이벤트
			$("._cancel").click(function(){
				history.back();
			});
			
		});
		
	
	</script>



	</body>
</html>

