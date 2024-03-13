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
			<jsp:include page="../../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../../include/header.jsp" flush="true"></jsp:include>
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
							<c:choose>
								<c:when test='${option.optNotiFlag == "Y" }'>
									<th>공지여부</th>
									<td><c:out value="${result.noticeFlag }"/></td>
									<th>조회수</th>
									<td><c:out value="${result.hitCnt }"/></td>
								</c:when>
								<c:otherwise>
									<th>조회수</th>
									<td colspan="3"><c:out value="${result.hitCnt }"/></td>
								</c:otherwise>
							</c:choose>
							</tr>
							<tr>
								<th>타이틀</th>
								<td colspan="3"><c:out value="${result.title }"/></td>
							</tr>
							<tr>
								<th>시스템 구분</th>
								<td>
								<c:if test='${result.systemType =="ALL"}'>
										전체
									</c:if>
									<c:if test='${result.systemType =="TEST_RESULT"}'>
										검사 결과관리
									</c:if>
									<c:if test='${result.systemType =="MARKETING"}'>
										홍보 홈페이지
									</c:if>
								</td>
								<th>팝업 생성</th>
								<td>
								   <c:if test="${result.popupUseYn == 'Y'}">
									   	생성
									   </c:if>
									   <c:if test="${result.popupUseYn == 'N'}">
										미생성
								   </c:if>
								</td>
							</tr>
							<tr>
								<th>시작일</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.popupStartDate}"/></td>
								<th>종료일</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.popupEndDate}"/></td>
							</tr>
							<tr>
								<th>좌측좌표</th>
								<td><c:out value="${result.popupLeftPosition }"/></td>
								<th>상단좌표</th>
								<td><c:out value="${result.popupTopPosition }"/></td>
							</tr>
							<c:if test='${option.optThumFlag == "Y"}'>
							<tr>
								<th>섬네일</th>
								<td colspan="3"><img id="imgThum" src="<c:out value='${result.thumImageBase64}'/>"></td>
							</tr>
							</c:if>
							<tr>
								<th>내용</th>
								<td colspan="3" class="boardcontent"><c:out escapeXml="false" value="${result.content }"/></td>
							</tr>
							<c:if test="${masterSeq ==2}">
							<tr>
								<th>검사코드</th>
								<td colspan="3" class="boardcontent"><c:out escapeXml="false" value="${result.oneClickGcd }"/> / <c:out escapeXml="false" value="${result.oneClickGnm }"/></td>
							</tr>
							</c:if>
							<tr>
								<th>최종 수정자</th>
								<td><c:out value="${result.editUserName }"/>&nbsp;(&nbsp;<c:out value="${result.editUserId }"/>&nbsp;)</td>
								<th>최종 수정 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.editDate}" /></td>
							</tr>
						</tbody>
					</table>
					
					<c:if test='${option.optFileFlag == "Y" }'>
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">첨부파일</h1>
					<table>
						<colgroup>
							<col style="width:50px;">
							<col style="width:*;">
							<col style="width:20%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>파일 이름</th>
								<th>파일 크기</th>
								<th>다운로드 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${result.files }" varStatus="status">
								<tr>
									<td><c:out value="${status.count }"/></td>
									<td><a href="<c:url value='/admin/board/news/${masterSeq}/download/${result.seq }/${item.seq }.do'/>"><c:out value="${item.fileName}"/></a></td>
									<td><c:out value="${item.fileSize}"/></td>
									<td><c:out value="${item.downCnt}"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</c:if>
					
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
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
		$(document).ready(function(){
			
			var seq = '<c:out value="${result.seq }"/>';
			if(seq == ''){
				alert('존재하지 않는 게시물 입니다.');
				location.href="<c:url value='/admin/board/news/${masterSeq}/index.do' />";
			}
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/board/news/${masterSeq}/index.do' />").submit();

			});
			
			
			if(writeFlag){
				$("._remove").show();
				$("._remove").click(function(){
					if(confirm('내용을 삭제 하시겠습니까?')){
						
						axios.post("<c:url value='/admin/board/news/${masterSeq}/"+ seq +".delete' />")
						  .then(function (res) {
						    if(res.data.result){
						    	alert('삭제 되었습니다.');
// 						    	history.back();
								$("#hiddenForm").attr('action', "<c:url value='/admin/board/news/${masterSeq}/index.do' />").submit();

						    }
						  })
						  .catch(function (error) {
						    console.log(error);
						  });
					}

				});
				
				$("._edit").show();
				$("._edit").click(function(){
// 					location.href="<c:url value='/admin/board/integrated/${masterSeq}/"+ seq +".edit' />";
					$("#hiddenForm").attr('action', "<c:url value='/admin/board/news/${masterSeq}/"+ seq +".edit' />").submit();

				});
				
			}
			
			
		});
		
	
	</script>



  </body>
  </html>

