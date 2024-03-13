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
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 등록</h1>
					<form id="addForm">
					<table>
						<colgroup>
							<col width="15%"/>
							<col width="40%"/>
							<col width="15%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>검사코드</th>
								<td class="null_td" colspan="3">
									<select class="form-control" name="f010gcd" style="width: 100%;" id="selectF010gcd">
										<option value="-1">검사코드를 선택하세요.</option>
										<c:forEach items="${newList }" var="item">
											<option value="<c:out value='${item.f010gcd }'/>"><c:out value='${item.f010fkn }'/>&nbsp;(<c:out value='${item.f010gcd }'/>)</option>
										</c:forEach>
									</select>
<!-- 									<input type="text" name="f010gcd" value="" style="width: 100%;" placeholder="검사코드를 입력해주세요."/> -->
									
								</td>
							</tr>

							<tr>
								<th class="th1">참고치</th>
								<td colspan="3"><div id="t001refSummernote"></div></td>
							</tr>

							<tr>
								<th class="th1">임상정보</th>
								<td colspan="3"><div id="t001contSummernote"></div></td>
							</tr>

							<tr>
								<th class="th1">주의사항</th>
								<td colspan="3"><div id="t001etcSummernote"></div></td>
							</tr>

						</tbody>
					</table>
					</form>
					<table>
						<tr>
							<td colspan="2">
								<span class="notice_write_ok _list" >취소</span>
								<span class="notice_write_cancel _add">
									<img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">등록</span>
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
				<input type="hidden" name="testInfoOption" value="<c:out value="${sparam.testInfoOption }"/>"/>
				<input type="hidden" name="mediClsOption" value="<c:out value="${sparam.mediClsOption }"/>"/>
				<input type="hidden" name="dissClsOption" value="<c:out value="${sparam.dissClsOption }"/>"/>
			</form>
		<!--footer-->
		<jsp:include page="../../../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
		
	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
	
		$(document).ready(function(){
			
			//텍스트 에디터 설정
			$('#t001refSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 200,
				toolbar: [
					  ['font', ['italic']],
					],
			});
			
			$('#t001contSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 200,
				toolbar: [
					  ['font', ['italic']],
					],
			});
			
			$('#t001etcSummernote').summernote({
				placeholder: '',
				tabsize: 2,
				height: 200,
				toolbar: [
					  ['font', ['italic']],
					],
			});
			
			
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/inspection/test/en/review/index.do' />").submit();

			});
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
// 					f010gcd: {required:true, maxlength:5},
				},
				submitHandler: function(form) {
					
					let param = $('#addForm').serializeObject();
					
					if(param.f010gcd == '-1'){
						alert('검사코드를 선택하세요.');
						return;
					}
					
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
					
					
					axios.post("<c:url value='/admin/inspection/test/en/review/addInsp.write' />", param)
					  .then(function (res) {
					    if(res.data.result){
					    	alert('수정요청이 등록 되었습니다.');
					    	location.reload();
					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});
			
			
			if(writeFlag){
				
				$("._add").show();
				$("._add").click(function(){
					$("#addForm").submit();
				});
				
			}
			
			
		});
		
	
	</script>



  </body>
  </html>

