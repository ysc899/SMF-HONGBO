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

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_01.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
		
		<script src="<c:url value='/lib/fontawesome-free/js/all.min.js'/>"></script>
		<script src="<c:url value='/lib/popper/umd/popper.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>"></script>
		
		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>
		
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
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 상세 조회</h1>
					<table>
						<colgroup>
							<col width="150px;">
							<col width="*">
							<col width="150px;">
							<col width="*">
						</colgroup>
						<thead>
						</thead>

						<tbody>
							<tr>
								<th>코드</th>
								<td colspan="3"><c:out value="${result.masterCode }"/></td>
							</tr>
							<tr>
								<th>코드 이름</th>
								<td colspan="3"><c:out value="${result.masterCodeName}"/></td>
							</tr>
							<tr>
								<th>코드 설명</th>
								<td colspan="3"><c:out value="${result.masterCodeDes}"/></td>
							</tr>
							<tr>
								<th>시스템 코드 여부</th>
								<td colspan="3"><c:out value="${result.systemCodeFlag}"/></td>
							</tr>
							<tr>
								<th>최종 수정자</th>
								<td><c:out value="${result.editUserName }"/>&nbsp;(&nbsp;<c:out value="${result.editUserId }"/>&nbsp;)</td>
								<th>최종 수정 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.editDate}" /></td>
							</tr>
						</tbody>
					</table>
					
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">하위 코드 메뉴</h1>
					<table>
						<colgroup>
							<col width="10%">
							<col width="25%">
							<col width="40%">
							<col width="10%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th>하위 코드</th>
								<th>하위 코드 이름</th>
								<th>하위 코드 설명</th>
								<th>코드 순서</th>
								<th>최종 수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="slave" items="${result.slaveList}">
								<tr class="_rowSlave" data-code="<c:out value="${slave.slaveCode }"/>" data-name="<c:out value="${slave.slaveCodeName}"/>" data-desc="<c:out value="${slave.slaveCodeDes}"/>">
									<td><c:out value="${slave.slaveCode}"/></td>
									<td><a href="javascript:void(0);"><c:out value="${slave.slaveCodeName}"/></a></td>
									<td><c:out value="${slave.slaveCodeDes}"/></td>
									<td><c:out value="${slave.codeOrder}"/></td>
									<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${slave.editDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<table>
						<tfoot>
							<tr>
								<td>
									<ul>
									
										<li class="_list"><img src="<c:url value='/admin/img/file.svg' />" alt="목록아이콘">목록</li>
										<c:if test="${writeFlag == 'true' || writeFlag == true }">
											<li class="_edit" style="display:none;"><img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">수정</li>
										</c:if>
									</ul>
								</td>
							</tr>
						</tfoot>
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
		<div class="modal fade" tabindex="-1" role="dialog" id="modalSlaveCodeInfo">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">다국어 정보 확인</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<table class="table">
			    		<thead>
			    			<tr>
			    				<td colspan="2" style="font-weight:600;border-bottom:1px solid #000">코드 정보</td>
			    			</tr>
			    			<tr>
			    				<th style="font-weight:600">코드명</th>
			    				<td class="_popupCode"></td>
			    			</tr>
			    			<tr>
			    				<th style="font-weight:600">이름</th>
			    				<td class="_popupName"></td>
			    			</tr>
			    			<tr>
			    				<th style="font-weight:600">설명</th>
			    				<td class="_popupDesc"></td>
			    			</tr>
			    			<tr>
			    				<td colspan="2" style="font-weight:600;border-bottom:1px solid #000">언어별 정보</td>
			    			</tr>
			    			<tr>
			    				<th style="font-weight:600">언어코드명</th>
			    				<th style="font-weight:600">이름</th>
			    			</tr>
			    		</thead>
			    		<tbody class="_pupupInfos">
			    		
			    		</tbody>
			    	</table>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
		$(document).ready(function(){
			
			var seq = '<c:out value="${result.seq }"/>';
			
			if(seq == ''){
				alert('존재하지 코드 입니다.');
				location.href="<c:url value='/admin/code/index.do' />";
			}
			
			
			$("._rowSlave").click(function(){
				var code = $(this).data('code');
				var name = $(this).data('name');
				var desc = $(this).data('desc');
				
				axios.get("<c:url value='/admin/code/slave/${result.masterCode}/"+code+".json' />")
				  .then(function (res) {
			    	
					console.log(res.data.result);
					var results = res.data.result;
					$("._popupCode").html(code);
					$("._popupName").html(name);
					$("._popupDesc").html(desc);
					
					var content = '';
			    	for(var idx in results){
			    		var item = results[idx];
			    		content +='<tr>';
			    		content +='	<td>'+item.codeLangName+'</td>';
			    		content +='	<td>'+item.infoName+'</td>';
			    		content +='</tr>';
			    	}
			    	$("._pupupInfos").html(content);
			    	
			    	$("#modalSlaveCodeInfo").modal('show');
				  })
				  .catch(function (error) {
				    console.log(error);
				  });
				
			});
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/code/index.do' />").submit();

			});
			
			if(writeFlag){
				
				$("._edit").show();
				$("._edit").click(function(){
// 					location.href="<c:url value='/admin/code/"+ seq +".edit' />";
					$("#hiddenForm").attr('action', "<c:url value='/admin/code/"+ seq +".edit' />").submit();
				});
				
				$("._slaveAdd").show();
			}
		});
		
	
	</script>



  </body>
  </html>

