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

		<link href="<c:url value='/admin/css/reset2.css'/>" type="text/css" rel="stylesheet">
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
			<jsp:include page="../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area">
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">One Click 건강정보 상세 조회</h1>
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
								<th>언어코드</th>
								<td colspan="3"><c:out value="${result.codeLangName }"/></td>
							</tr>
							<tr>
								<th>타이틀</th>
								<td colspan="3"><c:out value="${result.title }"/></td>
							</tr>
							<tr>
								<th>보조 타이틀</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.subTitle }"/></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="3"><c:out value="${result.writer }"/></td>
							</tr>
							<tr>
								<th>검수자</th>
								<td><c:out value="${result.inspector }"/></td>
								<th>검수자 설명</th>
								<td><c:out value="${result.inspectorCmt }"/></td>
							</tr>
							<tr>
								<th>섬네일</th>
								<td colspan="3">
									<c:if test="${result.imgThumFlag == 'Y'}">
										<img id="imgThum" src="<c:out value='${result.imgTitleThumBase64}'/>">
									</c:if>
								</td>
							</tr>
							<tr>
								<th>내용 이미지</th>
								<td colspan="3">
									<c:if test="${result.imgContentFlag == 'Y'}">
										<img id="imgThum" src="<c:out value='${result.imgContentBase64}'/>">
									</c:if>
									
								</td>
							</tr>
							<tr>
								<th>출력 순서</th>
								<td><c:out value="${result.printOrder }"/></td>
								<th>출력 여부</th>
								<td><c:out value="${result.printFlag }"/></td>
							</tr>
							<tr>
								<th>최종 수정자</th>
								<td><c:out value="${result.editUserName }"/>&nbsp;(&nbsp;<c:out value="${result.editUserId }"/>&nbsp;)</td>
								<th>최종 수정 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.editDate}" /></td>
							</tr>
						</tbody>
					</table>
					
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">One Click 건강정보 출처</h1>
					<table>
						<colgroup>
							<col style="width:50px;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:*;">
							<col style="width:10%;">
						</colgroup>
						<thead>
							<tr>
								<th style="padding-left:9px">번호</th>
								<th>출처</th>
								<th>보조 설명</th>
								<th>URL</th>
								<th>최종 수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${result.sources }" varStatus="status">
								<tr>
									<td><c:out value="${status.count }"/></td>
									<td><c:out value="${item.source}"/></td>
									<td><c:out value="${item.comment}"/></td>
									<td><c:out value="${item.url}"/></td>
									<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">One Click 검사코드</h1>
					<table>
						<colgroup>
							<col style="width:50px;">
							<col style="width:20%;">
							<col style="width:*;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th style="padding-left:9px">번호</th>
								<th>검사코드</th>
								<th>검사명</th>
								<th>최종 수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${result.tests }" varStatus="status">
								<tr class="_testRow" data-seq='<c:out value="${item.seq}"/>' data-hard='<c:out value="${item.hardFlag}"/>'>
									<td><c:out value="${status.count }"/></td>
									<td><c:out value="${item.testCode}"/></td>
									<td><c:out escapeXml="false" value="${item.testName}"/></td>
									<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<table>
						<tfoot>
							<tr>
								<td>
									<sec:authentication property="principal.id" var="loginUserId" />
									<ul>
									
										<li class="_list"><img src="<c:url value='/admin/img/file.svg' />" alt="목록아이콘">목록</li>
										<c:if test="${writeFlag == 'true' || writeFlag == true }">
											<li class="_remove" style="display:none;"><img src="<c:url value='/admin/img/recycle-bin.svg' />" alt="삭제아이콘">삭제</li>
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
		<div class="modal fade" tabindex="-1" role="dialog" id="modalTestCodeInfo">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">검사코드 확인</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<table class="table">
			    		<tr>
			    			<th>검사코드</th>
			    			<td style="text-align:left;" class="_modalTestCode"></td>
			    		</tr>
			    		<tr>
			    			<th>검사명</th>
			    			<td style="text-align:left;" class="_modalTestName"></td>
			    		</tr>
			    		<tr>
			    			<th>코멘트</th>
			    			<td style="text-align:left;" class="_modalTestComment"></td>
			    		</tr>
			    		<tr>
			    			<th>검체</th>
			    			<td style="text-align:left;" class="_modalTestSpecimen"></td>
			    		</tr>
			    		<tr>
			    			<th>용량</th>
			    			<td style="text-align:left;" class="_modalTestVolume"></td>
			    		</tr>
			    		<tr>
			    			<th>검사방법</th>
			    			<td style="text-align:left;" class="_modalTestMethod"></td>
			    		</tr>
			    		<tr>
			    			<th>검사일정</th>
			    			<td style="text-align:left;" class="_modalTestDay"></td>
			    		</tr>
			    		<tr>
			    			<th>소요일</th>
			    			<td style="text-align:left;" class="_modalTestProcessDay"></td>
			    		</tr>
			    		<tr>
			    			<th>최종 수정자</th>
			    			<td style="text-align:left;" class="_modalEditer"></td>
			    		</tr>
			    		<tr>
			    			<th>최종 수정 일시</th>
			    			<td style="text-align:left;" class="_modalEditDate"></td>
			    		</tr>
			    	</table>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModealSelected">선택</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
		$(document).ready(function(){
			
			let seq = '<c:out value="${result.seq }"/>';
			let title = '<c:out value="${result.title }"/>';
			
			if(seq == ''){
				alert('존재하지 않는 건강정보 입니다.');
				location.href="<c:url value='/admin/health/index.do' />";
			}
			
			//이미지 관련 처리
			<c:if test="${result.imgThumFlag == 'Y'}">
// 				$("#imgThum").attr('src', '${result.imgTitleThumBase64}');
				
			</c:if>
			
			
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/health/index.do' />").submit();

			});
			
			$("._testRow").click(function(){
				let testSeq = $(this).data('seq');
				let hardFlag = $(this).data('hard');
				
				
				axios.get("<c:url value='/admin/health/testInfo.json' />",{
					params: {
						seq: testSeq,
						type: hardFlag
					}
				})
				  .then(function (res) {
			    	
			    	let item = res.data.result;
			    	$("._modalTestCode").html(item.testCode);
			    	$("._modalTestName").html(item.testName);
			    	$("._modalTestComment").html(item.comment);
			    	$("._modalTestSpecimen").html(item.specimen);
			    	$("._modalTestVolume").html(item.volume);
			    	$("._modalTestMethod").html(item.testMethod);
			    	$("._modalTestDay").html(item.testDay);
			    	$("._modalTestProcessDay").html(item.processDay);
			    	$("._modalEditer").html(item.editUserName + " ( " +item.editUserId+" )" );
			    	$("._modalEditDate").html(new moment(item.editDate).format('lll'));
			    	
			    	$("#modalTestCodeInfo").modal('show');
				  })
				  .catch(function (error) {
				    console.log(error);
				  });
				
			});
			
			
			if(writeFlag){
				$("._remove").show();
				$("._remove").click(function(){
					if(confirm(title + ' 건강정보를 삭제 하시겠습니까?')){
						
						axios.post("<c:url value='/admin/health/"+ seq +".delete' />")
						  .then(function (res) {
						    if(res.data.result){
						    	alert('삭제 되었습니다.');
// 						    	history.back();
								$("#hiddenForm").attr('action', "<c:url value='/admin/health/index.do' />").submit();
						    }
						  })
						  .catch(function (error) {
						    console.log(error);
						  });
					}

				});
				
				$("._edit").show();
				$("._edit").click(function(){
// 					location.href="<c:url value='/admin/health/"+ seq +".edit' />";
					$("#hiddenForm").attr('action', "<c:url value='/admin/health/"+ seq +".edit' />").submit();
				});
				
			}
			
			
		});
		
	
	</script>



  </body>
  </html>

