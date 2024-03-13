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
								<col width="100px;"/>
								<col width="*;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>본부장 여부</th>
									<td>
										<label for="directorFlag">본부장 여부</label>
										<input type="checkbox" id="directorFlag">
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text" class="form-control text_title" name="email" placeholder="담당자 이메일을 입력해주세요." id="email">
									</td>
								</tr>
								<tr class="_directorThum">
									<th>섬네일 이미지</th>
									<td>
										<input type="file" class="my-pond-thum" name="thumImage" accept="image/png, image/jpeg, image/gif"/>
									</td>
								</tr>
							</tbody>
						</table>
						<c:forEach var="item" items="${defaultInfo.langCodes }" >
						<c:if test="${item.slaveCode == 'ko'}">
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"> 담당자 <c:out value="${item.slaveCodeName }"/> 정보</h1>
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="*;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_name" placeholder="등록될 담당자의 <c:out value="${item.slaveCodeName }"/> 이름을 입력해주세요." id="<c:out value="${item.slaveCode }"/>_name">
									</td>
								</tr>
								<tr class="">
									<th>사업소 명</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_company" placeholder="등록될 담당자의 <c:out value="${item.slaveCodeName }"/> 사업소명을 입력해주세요." id="<c:out value="${item.slaveCode }"/>_company">
									</td>
								</tr>
								<tr>
									<th>직책</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_department" placeholder="등록될 담당자의 <c:out value="${item.slaveCodeName }"/> 직책을 입력해주세요." id="<c:out value="${item.slaveCode }"/>_department">
									</td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_mobilePhone" placeholder="등록될 담당자의 <c:out value="${item.slaveCodeName }"/> 직책을 입력해주세요." id="<c:out value="${item.slaveCode }"/>_mobilePhone">
									</td>
								</tr>
								<tr>
									<th>FAX 번호</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_fax" placeholder="등록될 담당자의 <c:out value="${item.slaveCodeName }"/> 팩스 번호를 입력해주세요." id="<c:out value="${item.slaveCode }"/>_fax">
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<input type="text" class="form-control text_title" name="<c:out value="${item.slaveCode }"/>_address" placeholder="등록될 담당자의 <c:out value="${item.slaveCodeName }"/> 팩스 번호를 입력해주세요." id="<c:out value="${item.slaveCode }"/>_address">
									</td>
								</tr>
							</tbody>
						</table>
						</c:if>
						</c:forEach>
						
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"> 담당자  지역 설정</h1>
						<table>
							<colgroup>
								<col width="58px;"/>
								<col width="300px;"/>
							</colgroup>
							<tbody>
								<c:forEach var="item" items="${defaultInfo.locCount }" >
								<tr>
									<th><label for="loc_<c:out value='${item.slaveCode }'/>"><c:out value='${item.slaveCodeName }'/></label><input class="_locCheckBox" type="checkbox" value="<c:out value='${item.slaveCode }'/>" data-name="<c:out value='${item.slaveCodeName }'/>" id="loc_<c:out value='${item.slaveCode }'/>"></th>
									<td>
										<select class="form-control" id="locCount_<c:out value='${item.slaveCode }'/>" name="locCount_<c:out value='${item.slaveCode }'/>" disabled="disabled">
											<option value="-1">==출력 순서 선택==</option>
											<c:forEach var="i" begin="1" end="${item.cnt +1 }">
												<option value="<c:out value="${i }"/>"><c:out value="${i }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								</c:forEach>
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
	
		$(document).ready(function(){
			
			//파일 업로드 설정
			FilePond.registerPlugin(FilePondPluginImagePreview);
			FilePond.registerPlugin(FilePondPluginFileValidateType);
			$('.my-pond-thum').filepond();
			//이미지 업로드 히든 처리
			$("._directorThum").hide();
			
			//본부장 여부 체크 이벤트
			$("#directorFlag").change(function(){
				let isDirector = $(this).is(":checked");
				if(isDirector){
					$("._directorThum").show();
// 					$("._company").hide();
				}else{
					$("._directorThum").hide();
// 					$("._company").show();
				}
			});
			
			//지역 선택 체인지 이벤트
			$("._locCheckBox").change(function(){
				
				let domId = '#locCount_'+$(this).val();
				let isCheck = $(this).is(":checked");
				if(isCheck){
					$( domId ).attr( 'disabled', false );
				}else{
					$( domId ).attr( 'disabled', true );
					$(domId).val(-1).attr("selected", "selected");
				}
				
			});
			
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					email: {required:true, email:true},
					<c:forEach var="item" items="${defaultInfo.langCodes }" >
					<c:if test="${item.slaveCode == 'ko'}">
					<c:out value="${item.slaveCode }"/>_name: {required:true, minlength:2, maxlength:50},
					<c:out value="${item.slaveCode }"/>_department: {required:true, minlength:2, maxlength:50},
					<c:out value="${item.slaveCode }"/>_mobilePhone: {required:true, minlength:2, maxlength:15},
					<c:out value="${item.slaveCode }"/>_address: {required:true, minlength:2, maxlength:100},
					<c:out value="${item.slaveCode }"/>_company:{required:true, minlength:2, maxlength:100}
					</c:if>
					</c:forEach>
				},
				submitHandler: function(form) {
					
					let param = $('#addForm').serializeObject();
					
					let fd = new FormData();
					
					let locInfos = [];
					$("._locCheckBox").each(function(){
						let domId = 'locCount_'+$(this).val();
						let isCheck = $(this).is(":checked");
						if(isCheck){
							if(param[domId] == -1){
								alert($(this).data('name') + '의 출력 순서를 선택 하세요.');
								$("#"+domId).focus();
								return false;
							}
							
							locInfos.push({
								codeNetworkType: $(this).val(),
								printOrder: param[domId]
							});
						}
					});
					
					if(locInfos.length  == 0){
						alert('지역 선택은 필 수 입니다.');
						return;
					}
					
					//본부장 여부 체크 이벤트
					let isDirector = $("#directorFlag").is(":checked");
					if(isDirector){
						
						fd.append("directorFlag", "Y");
						var thumFile = $(".my-pond-thum").filepond('getFiles');


	 					if(thumFile.length > 0){
	 						if(!CommonUtil.fileCheckImage(thumFile[0].fileExtension)){
	 							alert('이미지 파일만 업로드 가능합니다.');
	 							return;
	 						}else{
	 							fd.append('thumFile', thumFile[0].file);
	 						}
	 					}else{
	 						alert('본부장의 경우 섬네일은 필 수 입니다.');
	 						return;
	 					}
						
						
					}else{
						fd.append("directorFlag", "N");
					}
					
					fd.append('email', param.email);
					
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
					
					fd.append('userInfoJSON', JSON.stringify(userInfoArray));
					fd.append('locInfoJSON', JSON.stringify(locInfos));
					
					
					axios.post("<c:url value='/admin/status/network/addNetwork.write' />", fd,{headers : {
						'Content-Type' : 'multipart/form-data'
					}})
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/status/network/" + res.data.result + ".view' />";
 							$("#hiddenForm").attr('action', "<c:url value='/admin/status/network/" + res.data.result + ".view' />").submit();

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
				$("#hiddenForm").attr('action', "<c:url value='/admin/status/network/index.do' />").submit();
			});
			
		});
	</script>


	</body>
</html>

