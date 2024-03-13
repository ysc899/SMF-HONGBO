<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no,initial-scale=1"/>
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>

		<link rel="stylesheet" href="<c:url value='/lib/bootstrap/css/bootstrap.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/summernote/summernote.min.css'/>">

		<link href="<c:url value='/admin/css/reset2.css'/>" type="text/css" rel="stylesheet">
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
		
		<!-- moment js -->
		<script src="<c:url value='/lib/moment/moment.min.js'/>"></script>
		<script src="<c:url value='/lib/moment/locale/ko.js'/>"></script>
		
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>
		
		<title>씨젠의료재단 관리자 페이지</title>
	</head>

	<body>

		<!--wrap-->
		<div id="wrap">
			<!--header-->
			<jsp:include page="../../../../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../../../../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area">
					<form id="editForm">
					<input type="hidden" name="f010gcd" value="<c:out value='${result.asIs.f010gcd }'/>"/>
					<input type="hidden" name="seq" value="<c:out value='${result.toBe.seq }'/>"/>
					<sec:csrfInput />
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 관리 </h1>
					<table>
						<colgroup>
							<col width="20%"/>
							<col width="30%"/>
							<col width="20%"/>
							<col width="30%"/>
						</colgroup>
						<thead>
						</thead>

						<tbody>
							<tr>
								<th>검사명</th>
								<td><c:out value="${result.asIs.f010fkn }"/></td>
								<th>상태</th>
								<td><c:out value="${result.toBe.codeEditStName }"/></td>
							</tr>
							<tr>
								<th>등록자</th>
								<td><c:out value="${result.toBe.regUserName }"/>(<c:out value="${result.toBe.regUserId }"/>)</td>
								<th>등록 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.toBe.regDate}" /></td>
							</tr>
							<c:if test="${result.toBe.codeEditStType == 'apply' }">
							<tr>
								<th>적용 사용자</th>
								<td><c:out value="${result.toBe.editUserName }"/>(<c:out value="${result.toBe.editUserId }"/>)</td>
								<th>적용 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.toBe.editDate}" /></td>
							</tr>	
								
							</c:if>
							<tr>
								<th>검사명</th>
								<td><c:out value="${result.asIs.f010fkn }"/></td>
								<th>검사코드</th>
								<c:choose>
									<c:when test="${not empty result.asIs.f010gcd }">
										<td><c:out value="${result.asIs.f010gcd }"/></td>	
									</c:when>
									<c:otherwise>
										<td><c:out value="${result.toBe.f010gcd }"/></td>
									</c:otherwise>
								</c:choose>
								
							</tr>
							<tr >
								<th>검사일</th>
								<td>
									<c:out value='${result.asIs.t001day }'/>
								</td>
								<th>검체(ml)</th>
								<td>
									<c:out value='${result.asIs.f010tnm }'/>
								</td>
							</tr>
							<tr >
								<th>소요일</th>
								<td>
									<c:out value='${result.asIs.f010eed }'/>
								</td>
								<th>보존방법(현재)</th>
								<td>
									<c:out value='${result.asIs.t001sav }'/>
								</td>
							</tr>
							
							<c:if test="${writeFlag == 'true' || writeFlag == true }">
							<tr >
								<td colspan="2">
								</td>
								<th>보존방법  (수정)</th>
								<td>
									<input type="text" class="form-control text_title" name="t001sav" placeholder="수정될 보존방법을 입력해주세요." id="t001sav" value="<c:out value='${result.toBe.t001sav }'/>" readonly="readonly">
								</td>
							</tr>
							</c:if>
							<tr >
								<th>검사방법</th>
								<td><c:out value="${result.asIs.f010msnm }"/></td>
								<th>용기명</th>
								<td><c:out value="${result.asIs.f010gbnm }"/></td>
							</tr>
							<tr>
								<th>보험코드</th>
								<td><c:out value="${result.asIs.docdTmp }"/></td>
								<th rowspan="3">검체용기</th>
								<c:choose>
									<c:when test="${not empty result.asIs.vessimg }">
										<td rowspan="3"><img src="<c:url value='https://trms.seegenemedical.com${result.asIs.vessimg }'/>" /></td>
									</c:when>
									<c:otherwise>
										<td rowspan="3"></td>
									</c:otherwise>
								</c:choose>
								
							</tr>
							<tr>
								<th>검사수가</th>
								<td><c:out value="${result.asIs.tssu }"/></td>
							</tr>
							<tr>
								<th>분류번호</th>
								<td>
									<c:choose>
										<c:when test="${empty result.asIs.somk }"><c:out value="${result.asIs.bomk }"/></c:when>
										<c:when test="${not empty result.asIs.somk && not empty result.asIs.bomk && result.asIs.somk == result.asIs.bomk}"><c:out value="${result.asIs.somk }"/></c:when>
										<c:when test="${not empty result.asIs.somk && empty result.asIs.bomk}"><c:out value="${result.asIs.somk }"/></c:when>
										<c:otherwise ><c:out value="${result.asIs.somk }"/>&nbsp;,&nbsp;<c:out value="${result.asIs.bomk }"/></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>참고치 (현재)</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.asIs.t001ref }"/></td>
							</tr>
							<c:if test="${writeFlag == 'true' || writeFlag == true }">
							<tr>
								<th>참고치 (수정)</th>
								<td colspan="3"><div id="t001refSummernote"></div></td>
							</tr>
							</c:if>
							<tr>
								<th>임상정보 (현재)</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.asIs.t001cont }"/></td>
							</tr>
							<c:if test="${writeFlag == 'true' || writeFlag == true }">
							<tr>
								<th>임상정보 (수정)</th>
								<td colspan="3"><div id="t001contSummernote"></div></td>
							</tr>
							</c:if>
							<tr>
								<th>주의사항 (현재)</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.asIs.t001etc }"/></td>
							</tr>
							<c:if test="${writeFlag == 'true' || writeFlag == true }">
								<tr>
									<th>주의사항 (수정)</th>
									<td colspan="3"><div id="t001etcSummernote"></div></td>
								</tr>
							</c:if>
							<tr>
								<th>URL (현재)</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.asIs.t001url }"/></td>
							</tr>
							<c:if test="${writeFlag == 'true' || writeFlag == true }">
								<tr>
									<th>URL (수정)</th>
									<td colspan="3"><input type="text" class="form-control text_title" name="t001url" id="t001url" value='<c:out value="${result.toBe.t001url }"/>'></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					</form>
					<table>
						<tr>
							<td colspan="2">
								<span class="notice_write_ok _list" >목록</span>
								<c:if test="${writeFlag == 'true' || writeFlag == true }">
									<c:if test="${result.toBe.codeEditStType == 'wait' }">
									<button type="button" class="btn btn-danger _reject" style="float:left;" ><i class="fas fa-ban"></i>&nbsp;거절</button>
									<span class="notice_write_cancel _add">
										<img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">적용</span>
									</c:if>
								</c:if>
							</td>
						</tr>
					</table>

				</div>
				<!--/notice_area End-->
			</div>
			<!--//container End-->
			<c:if test="${writeFlag == 'true' || writeFlag == true }">
				<c:if test="${result.toBe.codeEditStType == 'wait' }">
					<form id="rejectForm">
<%-- 						<input type="hidden" name="f010gcd" value="<c:out value='${result.asIs.f010gcd }'/>"/> --%>
						<input type="hidden" name="seq" value="<c:out value='${result.toBe.seq }'/>"/>
						<sec:csrfInput />
					</form>
				</c:if>
			</c:if>
		<!--footer-->
		<jsp:include page="../../../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
	
		$(document).ready(function(){
			
			let seq = '<c:out value="${result.toBe.seq }"/>';
			
			if(seq == ''){
				alert('존재하지 않는 검사항목 입니다.');
				location.href="<c:url value='/admin/inspection/test/kr/redaction/index.do' />";
			}
			
			<c:if test="${writeFlag == 'true' || writeFlag == true }">
			//텍스트 에디터 설정
			$('#t001refSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 200,
				toolbar: [
					  ['font', ['italic']],
					],
			});
			$("#t001refSummernote").summernote("code", '<c:out escapeXml="false" value="${result.toBe.t001ref }"/>');
			
			$('#t001contSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 200,
				toolbar: [
					  ['font', ['italic']],
					],
			});
			$("#t001contSummernote").summernote("code", '<c:out escapeXml="false" value="${result.toBe.t001cont }"/>');
			
			$('#t001etcSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 200,
				toolbar: [
					  ['font', ['italic']],
					],
			});
			$("#t001etcSummernote").summernote("code", '<c:out escapeXml="false" value="${result.toBe.t001etc }"/>');
			</c:if>
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
				history.back();
			});
			
			<c:if test="${writeFlag == 'true' || writeFlag == true }">
			<c:if test="${result.toBe.codeEditStType == 'wait' }">
			//입력값 검증 설정
			$("#editForm").validate({
				rules:{
// 					t001day: {required:true, maxlength:100},
// 					t001sav: {required:true, maxlength:20}
				},
				submitHandler: function(form) {
					
					let param = $('#editForm').serializeObject();
					
					
					let t001ref = $('#t001refSummernote').summernote('code');
					if(t001ref.length > 4000){
						alert('참고치의 최대 길이는 4000자 입니다.');
						return;
					}
					param.t001ref = t001ref;
					
					let t001cont = $('#t001contSummernote').summernote('code');
					if(t001cont.length > 10000){
						alert('임상정보의 최대 길이는 10000자 입니다.');
						return;
					}
					param.t001cont = t001cont;
					
					let t001etc = $('#t001etcSummernote').summernote('code');
					if(t001etc.length > 10000){
						alert('주의사항의 최대 길이는 10000자 입니다.');
						return;
					}
					param.t001etc = t001etc;
					
					
					axios.post("<c:url value='/admin/inspection/test/kr/redaction/apply.edit' />", param)
					  .then(function (res) {
					    if(res.data.result){
					    	alert('적용 되었습니다.');
					    	location.href="<c:url value='/admin/inspection/test/kr/redaction/" + seq + ".view' />";
					    }else{
					    	alert('이미 적용된 검사항목 수정 데이터 입니다.');
					    	location.href="<c:url value='/admin/inspection/test/kr/redaction/" + seq + ".view' />";
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
			
			$("._reject").click(function(){
				
				if(confirm("반려 처리 하시겠습니까?")){
				
					let param = $('#rejectForm').serializeObject();
					console.log(param);
					axios.post("<c:url value='/admin/inspection/test/kr/redaction/reject.edit' />", param)
					  .then(function (res) {
					    if(res.data.result){
					    	alert('반려 되었습니다.');
					    	location.href="<c:url value='/admin/inspection/test/kr/redaction/" + seq + ".view' />";
					    }else{
					    	alert('이미 적용된 검사항목 수정 데이터 입니다.');
					    	location.href="<c:url value='/admin/inspection/test/kr/redaction/" + seq + ".view' />";
					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
				}
			});
			</c:if>
			</c:if>
		});
		
	
	</script>



  </body>
  </html>

