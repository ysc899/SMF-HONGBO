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
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">관리자 상세 조회</h1>
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
								<th>ID</th>
								<td><c:out value="${result.user.userId }"/></td>
								<th>이름</th>
								<td><c:out value="${result.user.name }"/></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><c:out value="${result.user.contact }"/></td>
								<th>이메일</th>
								<td><c:out value="${result.user.email }"/></td>
							</tr>
							<tr>
								<th>최종 접속 일시</th>
								<td colspan="3"><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.user.lastLoginDate}" /></td>
							</tr>
							<tr>
								<th>코멘트</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.user.comment }"/></td>
							</tr>
							<tr>
								<th>최종 수정자</th>
								<td><c:out value="${result.user.editUserName }"/>&nbsp;(&nbsp;<c:out value="${result.user.editUserId }"/>&nbsp;)</td>
								<th>최종 수정 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.user.editDate}" /></td>
							</tr>
						</tbody>
					</table>
					
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">접근 메뉴</h1>
					<table>
						<colgroup>
							<col width="20%">
							<col width="10%">
							<col width="65%">
						</colgroup>
						<thead>
							<tr>
								<th>메뉴 명</th>
								<th>읽기 권한</th>
								<th>쓰기 권한</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="parent" items="${result.userMenus}">
								<tr>
									<td><c:out value="${parent.menuName}"/></td>
									<td>-</td>
									<td>-</td>
								</tr>
								<c:forEach var="child" items="${parent.childs}">
									<tr>
										<td> &nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${child.menuName}"/></td>
										<td>
											<c:choose>
												<c:when test="${child.readFlag == 'Y' }"> O </c:when>
												<c:otherwise> X </c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${child.writeFlag == 'Y' }"> O </c:when>
												<c:otherwise> X </c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
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
											<c:if test="${loginUserId !=  result.user.userId}">
												<li class="_remove" style="display:none;"><img src="<c:url value='/admin/img/recycle-bin.svg' />" alt="삭제아이콘">삭제</li>
											</c:if>
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

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
		$(document).ready(function(){
			
			let userId = '<c:out value="${result.user.userId }"/>';
			
			//코멘트 관련 처리
			/*
			let comment = CommonUtil.toBr('<c:out value="${result.user.comment }"/>');
			console.log(comment)
			$("._comment").html()
			*/
			if(userId == ''){
				alert('존재하지 않는 사용자 입니다.');
				location.href="<c:url value='/admin/user/index.do' />";
			}
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/user/index.do' />").submit();

			});
			
			if(writeFlag){
				$("._remove").show();
				$("._remove").click(function(){

					if(confirm(userId + ' 사용자를 삭제 하시겠습니까?')){
						
						axios.post("<c:url value='/admin/user/"+ userId +".delete' />")
						  .then(function (res) {
						    if(res.data.result){
						    	alert('삭제 되었습니다.');
// 						    	history.back();
								$("#hiddenForm").attr('action', "<c:url value='/admin/user/index.do' />").submit();

						    }
						  })
						  .catch(function (error) {
						    console.log(error);
						  });
					}

				});
				
				$("._edit").show();
				$("._edit").click(function(){
// 					location.href="<c:url value='/admin/user/"+ userId +".edit' />";
					$("#hiddenForm").attr('action', "<c:url value='/admin/user/"+ userId +".edit' />").submit();
				});
				
			}
			
			
		});
		
	
	</script>



  </body>
  </html>

