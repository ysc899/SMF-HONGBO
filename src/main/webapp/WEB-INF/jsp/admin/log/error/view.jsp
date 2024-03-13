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
		
		<!-- 코드미러 -->
		<link rel="stylesheet" href="<c:url value='/lib/codemirror-5.55.0/lib/codemirror.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/codemirror-5.55.0/addon/merge/merge.css'/>">

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_01.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		<style>
	    .CodeMirror { line-height: 1.2; }
	    @media screen and (min-width: 1300px) {
	      article { max-width: 1000px; }
	      #nav { border-right: 499px solid transparent; }
	    }
	    span.clicky {
	      cursor: pointer;
	      background: #d70;
	      color: white;
	      padding: 0 3px;
	      border-radius: 3px;
	    }
	  </style>
		
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
		
		<!-- 코드미러 -->
		<script src="<c:url value='/lib/codemirror-5.55.0/lib/codemirror.js'/>"></script>
		<script src="<c:url value='/lib/codemirror-5.55.0/mode/javascript/javascript.js'/>"></script>
		<script src="<c:url value='/lib/diff-match-patch-master/javascript/diff_match_patch.js'/>"></script>
		<script src="<c:url value='/lib/codemirror-5.55.0/addon/merge/merge.js'/>"></script>
		
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
								<th>메뉴 명</th>
								<td colspan="3"><c:out value="${result.menuName }"/></td>
							</tr>
							<tr>
								<th>URL</th>
								<td colspan="3"><c:out value="${result.url }"/></td>
							</tr>
							<tr>
								<th>에러 메시지</th>
								<td colspan="3"><c:out value="${result.errorMsg }"/></td>
							</tr>
							<tr>
								<th>파라미터</th>
								<td colspan="3"><pre id="paramView"></pre></td>
							</tr>
							<tr>
								<th>ip</th>
								<td colspan="3"><c:out value="${result.ip }"/></td>
							</tr>
							<tr>
								<th>수정자</th>
								<td><c:out value="${result.regUserName }"/>&nbsp;(&nbsp;<c:out value="${result.regUserId }"/>&nbsp;)</td>
								<th>수정 일시</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${result.regDate}" /></td>
							</tr>
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

		<!--footer-->
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
		$(document).ready(function(){
			
			let seq = '<c:out value="${result.seq }"/>';
			
			if(seq == ''){
				alert('존재하지 않는 수정로그 입니다.');
				location.href="<c:url value='/admin/log/error/index.do' />";
			}
			
			let paramJson = JSON.stringify(<c:out escapeXml="false" value="${result.paramJson }"/>, null, '\t');
			$("#paramView").html(paramJson);
// 			var editor = CodeMirror.fromTextArea(document.getElementById("paramView"), {
// 				lineNumbers: true,
// 				matchBrackets: true,
// 				readOnly: true,
// 				mode: "application/json"
// 		      });
			
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
				history.back();
			});
			
			
			if(writeFlag){
				$("._remove").show();
				$("._remove").click(function(){
					if(confirm('삭제시 복구 할 수 없습니다.\n에러 로그를 삭제 하시겠습니까?')){
						
						axios.post("<c:url value='/admin/log/error/"+ seq +".delete' />")
						  .then(function (res) {
						    if(res.data.result){
						    	alert('삭제 되었습니다.');
						    	history.back();
						    }
						  })
						  .catch(function (error) {
						    console.log(error);
						  });
					}

				});
				
				
			}
			
			
		});
		
	</script>

  </body>
  </html>

