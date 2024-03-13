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
					<form id="addForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 등록 - 기본 정보</h1>
						<table>
							<colgroup>
								<col width="20%;"/>
								<col width="*;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>센터</th>
									<td>
										<select id="selectCenter" name="codeCenterType" class="form-control">
											<option value="-1">==선택==</option>
											<c:forEach items="${defaultInfo.centerCodes}" var="item">
												<option value='<c:out value="${item.slaveCode }"/>'><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>
										<select id="selectPart" name="codePartType" class="form-control">
											<option value="-1">==선택==</option>
											<c:forEach items="${defaultInfo.partCodes}" var="item">
												<option value='<c:out value="${item.slaveCode }"/>'><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>대표원장</th>
									<td>
										<label for="masterFlag">대표원장 여부</label>
										<input type="checkbox" id="masterFlag">
									</td>
								</tr>
								<tr>
									<th>출력 순서</th>
									<td>
										<select id="selectPrintOrder" name="printOrder" class="form-control">
											<option value="1">1</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>섬네일 이미지</th>
									<td>
										<input type="file" class="my-pond-thum" name="thumImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
								<tr>
									<th>팝업 이미지</th>
									<td>
										<input type="file" class="my-pond-content" name="contentImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
							</tbody>
						</table>
						<c:forEach var="item" items="${defaultInfo.langCodes }" >
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"> 의료진 <c:out value="${item.slaveCodeName }"/> 정보</h1>
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="*;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_name" placeholder="등록될 의료진의 <c:out value="${item.slaveCodeName }"/> 이름을 입력해주세요." id="<c:out value="${item.slaveCode }"/>_name">
									</td>
								</tr>
								<tr>
									<th>직위</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_position" placeholder="등록될 의료진의 <c:out value="${item.slaveCodeName }"/> 직위를 입력해주세요." id="<c:out value="${item.slaveCode }"/>_position">
									</td>
								</tr>
								<tr>
									<th>학위</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_degree" placeholder="등록될 의료진의 <c:out value="${item.slaveCodeName }"/> 학위을 입력해주세요." id="<c:out value="${item.slaveCode }"/>_degree">
									</td>
								</tr>
								<tr>
									<th>전문분야</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_specialty" placeholder="등록될 의료진의 <c:out value="${item.slaveCodeName }"/> 전문분야를 입력해주세요." id="<c:out value="${item.slaveCode }"/>_specialty">
									</td>
								</tr>
							</tbody>
						</table>
						</c:forEach>
						</form>
						
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"> 의료진  약력 리스트</h1>
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="50px;"/>
								<col width="*;"/>
								<col width="100px;"/>
								<col width="100px;"/>
								<col width="100px;"/>
							</colgroup>
							<thead>
								<tr>
									<th>언어종류</th>
									<th>현재여부</th>
									<th>내용</th>
									<th>보조내용</th>
									<th>출력 순서</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody class="_historyContent">
							</tbody>
						</table>
						
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"> 의료진  약력 추가</h1>
						<form id="addHistoryForm">
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="*;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>언어 코드</th>
									<td>
										<select id="historySelectLang" name="codeLangType" class="form-control">
											<c:forEach items="${defaultInfo.langCodes}" var="item">
												<option value='<c:out value="${item.slaveCode }"/>'><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>현재 여부</th>
									<td>
										<label for="historyNowFlag">현재 여부</label>
										<input type="checkbox" id="historyNowFlag">
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><input type="text" class="form-control text_title" name="content" id="historyContent" placeholder="약력 내용을 입력 하세요" ></td>
								</tr>
								<tr>
									<th>보조 내용</th>
									<td><input type="text" class="form-control text_title" name="comment" id="historyComment" placeholder="약력 보조 내용을 입력 하세요" ></td>
								</tr>
								<tr>
									<th>출력 순서</th>
									<td>
										<select id="historySelectPrintOrder" name="printOrder" class="form-control">
											<option value='1'>1</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="button" class="btn btn-default" id="btnHistoryAdd">추가</button>
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
			<form id="hiddenForm" method="get">
				<input type="hidden" name="searchOption" value="<c:out value='${sparam.searchOption}'/>"/>
				<input type="hidden" name="searchKeyword" value="<c:out value='${sparam.searchKeyword}'/>"/>
				<input type="hidden" name="currentPage" value="<c:out value="${sparam.currentPage }"/>"/>
			</form>
			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
		

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
		//언어코드 json
		let langCodes = [];
		<c:forEach var="item" items="${defaultInfo.langCodes }" >
			langCodes.push({
				code : '<c:out value="${item.slaveCode}"/>',
				name : '<c:out value="${item.slaveCodeName}"/>'
			});
		</c:forEach>
	
		//의료진 약력 정보
		let staffsHistory = [];
		
		function setHistoryForm(){
			$("#historyContent").val('');
			$("#historyComment").val('');
			setHistoryPrintOrder($("#historySelectLang").val());
		}
		function setHistoryPrintOrder(lang){
			$("#historySelectPrintOrder").empty();
			
			let isNow = $("#historyNowFlag").is(":checked");
			let nowFlag = 'N';
			if(isNow){
				nowFlag = 'Y';
			}
			
			let size =  _.filter(staffsHistory, function(t){return t.codeLangType == lang && t.nowFlag == nowFlag}).length +1;
			
			for(var idx = 1; idx <=size ; idx++){
				$("#historySelectPrintOrder").append('<option value="'+idx+'">'+idx+'</option>');
			}
			
			$("#historySelectPrintOrder").val(size).attr("selected", "selected");
		}
		
		function printHistory(){
			$("._historyContent").html('');
			
			let content = '';
			for(var idx in staffsHistory){
				let item = staffsHistory[idx];
				
				var langName = _.filter(langCodes, function(t){return t.code == item.codeLangType})[0].name;
				
				content += '<tr>'; 
				content += '	<td>' +langName + '</td>'; 
				content += '	<td>' +item.nowFlag + '</td>'; 
				content += '	<td>' +item.content + '</td>'; 
				content += '	<td>' +item.comment + '</td>'; 
				content += '	<td>' +item.printOrder + '</td>'; 
				content += '	<td><button class="btn btn-default _btnRemoveHistory" data-idx="'+ idx +'">삭제</button></td>'; 
				content += '</tr>'; 
				
			}
			
			$("._historyContent").html(content);
		};
	
		
		//채용 업무 삭제 이벤트
		$(document).on('click', '._btnRemoveHistory',function(){
			let idx = $(this).data('idx');
			
			let target = staffsHistory[idx];
			
			staffsHistory.splice(idx, 1);
			
			_.each(_.filter(staffsHistory, function(t){
				return t.codeLangType == target.codeLangType && t.nowFlag == target.nowFlag && t.printOrder > target.printOrder;
			}), function(t){ t.printOrder-- });
			printHistory();
			
			setHistoryPrintOrder($("#historySelectLang").val());
			
		});
		
		
		function getStaffsPrintOrder(){
			let center = $("#selectCenter").val();
			let part = $("#selectPart").val();
			let isMaster = $("#masterFlag").is(":checked");
			if(center == -1 || part == -1){
				return;
			}
			
			
			//언어코드에 대한 출력 순서 정보를 가져온다
			let url = "<c:url value='/admin/status/staffs/maxPrintOrder.json' />";

			axios.get(url,{
					params: {
						center: center,
						part: part,
						master: isMaster
					}
				})
			  .then(function (res) {
				  setPrintOrder(res.data.result);
			  })
			  .catch(function (error) {
			    console.log(error);
			  });
			
		}
		
		// 출력 순서 변경 이벤트
		function setPrintOrder(size){
			$("#selectPrintOrder").empty();
			
			let selectCount = size+1;
			
			for(var idx = 1; idx <= selectCount; idx++){
				$("#selectPrintOrder").append("<option value='"+idx+"'>"+ idx +"</option>");
			}
			
			$("#selectPrintOrder").val(selectCount).attr("selected", "selected");
		}
		
		
	
		$(document).ready(function(){
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			$('.my-pond-thum').filepond();
			$('.my-pond-content').filepond();
			
			$("#historyNowFlag").change(function(){
				setHistoryPrintOrder($("#historySelectLang").val());
			});
			
			$("#selectCenter").change(function(){
				getStaffsPrintOrder();
			});
			$("#selectPart").change(function(){
				let center = $("#selectCenter").val();
				
				if(center == -1){
					alert('센터를 선택 하세요.');
					$("#selectPart").val("-1").attr("selected", "selected");
					return;
				}
				getStaffsPrintOrder();
			});
			
			//대표원장 여부 체크 이벤트
			$("#masterFlag").change(function(){
				getStaffsPrintOrder();
			});
			
			
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					<c:forEach var="item" items="${defaultInfo.langCodes }" >
					<c:out value="${item.slaveCode }"/>_name: {required:true, minlength:2, maxlength:30},
					<c:out value="${item.slaveCode }"/>_position: {required:true, minlength:2, maxlength:100},
					<c:out value="${item.slaveCode }"/>_degree: {required:true, minlength:2, maxlength:30},
					<c:out value="${item.slaveCode }"/>_specialty: {required:true, minlength:2, maxlength:100},
					</c:forEach>
				},
				submitHandler: function(form) {
					
					let param = $('#addForm').serializeObject();
					
					if(param.codeCenterType == '-1' || param.codeCenterType == -1){
						alert('센터를 선택 하세요');
						return;
					}
					
					if(param.codePartType == '-1' || param.codePartType == -1){
						alert('부서를 선택 하세요');
						return;
					}
					
					
					if(staffsHistory.length == 0){
						alert('약력을 입력해주세요.');
						return;
					}
					
					//사용자 정보 처리
					let userInfo = {};
					<c:forEach var="item" items="${defaultInfo.langCodes}">
						userInfo["<c:out value='${item.slaveCode}'/>"] = {
							codeLangType: "<c:out value='${item.slaveCode}'/>"
						};
					</c:forEach>
					
					let keys = _.keys(param);
					for(var idx in keys){
						let sp = keys[idx].split('_');
						if(sp.length >= 2){
							if(_.contains(_.keys(userInfo),sp[0])){
								userInfo[sp[0]][sp[1]] = param[keys[idx]];
							}
						}
					}
					
					let userInfoArray = [];
					for(var idx in userInfo){
						userInfoArray.push(userInfo[idx]);
					}
					
					let fd = new FormData();
					fd.append('codeCenterType', param.codeCenterType);
					fd.append('codePartType', param.codePartType);
					fd.append('printOrder', param.printOrder);
					let isMaster = $("#masterFlag").is(":checked");
					if(isMaster){
						fd.append('masterFlag', 'Y');
					}else{
						fd.append('masterFlag', 'N');
					}
					
					
					var thumFile = $(".my-pond-thum").filepond('getFiles');
					var contentFile = $(".my-pond-content").filepond('getFiles');
					
					if(thumFile.length == 0){
						alert('섬네일 이미지는 필 수 입니다.');
						return;
					}
					
 					if(thumFile.length > 0){
 						if(!CommonUtil.fileCheckImage(thumFile[0].fileExtension)){
 							alert('이미지 파일만 업로드 가능합니다.');
 							return;
 						}else{
 							fd.append('thumFile', thumFile[0].file);
 						}
 					}
 					
					if(contentFile.length == 0){
						alert('팝업 이미지는 필 수 입니다.');
						return;
					}
					
 					if(contentFile.length > 0){
 						if(!CommonUtil.fileCheckImage(contentFile[0].fileExtension)){
 							alert('이미지 파일만 업로드 가능합니다.');
 							return;
 						}else{
 							fd.append('contentFile', contentFile[0].file);
 						}
 					}
					
					
					fd.append('staffsInfoJSON', JSON.stringify(userInfoArray));
					fd.append('staffsHistoryJSON', JSON.stringify(staffsHistory));
					
					
					axios.post("<c:url value='/admin/status/staffs/addStaffs.write' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/status/staffs/" + res.data.result + ".view' />";
							$("#hiddenForm").attr('action', "<c:url value='/admin/status/staffs/" + res.data.result + ".view' />").submit();

					    }else if(res.data.result == -9){
					    	alert('섬네일 파일을 확인하세요.');
					    }else if(res.data.result == -8){
					    	alert('팝업 파일을 확인하세요.')
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
			
			//입력값 검증 설정
			$("#addHistoryForm").validate({
				rules:{
					content: {required:true, minlength:2, maxlength:100},
					comment: { maxlength:100},
				},
				submitHandler: function(form) {
					
					let param = $('#addHistoryForm').serializeObject();
					
					let isNow = $("#historyNowFlag").is(":checked");

					if(isNow){
						param.nowFlag = 'Y';
					}else{
						param.nowFlag = 'N';
					}
					
					staffsHistory.push(param);
					printHistory();
					setHistoryForm();
				}
			});
			
			//약력 추가 버튼 클릭 이벤트
			$("#btnHistoryAdd").click(function(){
				$("#addHistoryForm").submit();
			});
			
			//약력 언어코드 변경 이벤트
			$("#historySelectLang").change(function(){
				setHistoryPrintOrder($(this).val());
			});
			
			//목록으로 가기 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/status/staffs/index.do' />").submit();

			});
			
		});
	</script>


	</body>
</html>

