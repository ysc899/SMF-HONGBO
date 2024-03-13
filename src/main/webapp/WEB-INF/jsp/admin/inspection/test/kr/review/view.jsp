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
			<jsp:include page="../../../../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../../../../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area">
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 상세 조회</h1>
					<table>
						<colgroup>
							<col width="15%"/>
							<col width="40%"/>
							<col width="15%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<th class="th1">검사명</th>
								<td class="td1"><c:out value="${result.f010fkn }"/></td>
								<th>검사코드</th>
								<td class="null_td"><c:out value="${result.f010gcd }"/></td>
							</tr>

							<tr>
								<th class="th1">검사일</th>
								<td class="td1"><c:out value="${result.t001day }"/></td>
								<th>검체(ml)</th>
								<td class="null_td"><c:out value="${result.f010tnm }"/></td>
							</tr>
							<tr>
								<th class="th1">소요일</th>
								<td class="td1"><c:out value="${result.f010eed }"/></td>
								<th>보존방법</th>
								<td class="null_td"><c:out value="${result.t001sav }"/></td>
							</tr>

							<tr>
								<th class="th1">검사방법</th>
								<td class="td1"><c:out value="${result.f010msnm }"/></td>
								<th>용기명</th>
								<td class="null_td"><c:out value="${result.f010gbnm }"/></td>
							</tr>

							<tr>
								<th class="th1">보험코드</th>
								<td class="td1"><c:out value="${result.docdTmp }"/></td>
								<th rowspan="4">검체용기</th>
								<td rowspan="4" class="null_td">
									<img src="<c:url value='https://trms.seegenemedical.com${result.vessimg }'/>" style="margin-left:30px;" />
								</td>
							</tr>


							<tr>
								<th class="th1">검사수가</th>
								<td><c:out value="${result.tssu }"/></td>
							</tr>


							<tr>
								<th class="th1">분류번호</th>
								<td>
								<c:choose>
									<c:when test="${empty result.somk }"><c:out value="${result.bomk }"/></c:when>
									<c:when test="${not empty result.somk && not empty result.bomk && result.somk == result.bomk}"><c:out value="${result.somk }"/></c:when>
									<c:when test="${not empty result.somk && empty result.bomk}"><c:out value="${result.somk }"/></c:when>
									<c:otherwise ><c:out value="${result.somk }"/>&nbsp;,&nbsp;<c:out value="${result.bomk }"/></c:otherwise>
								</c:choose>
								
<%-- 								<c:out value="${result.somk }"/><c:if test="${not empty result.somk && not empty result.bomk }">&nbsp;,&nbsp;</c:if><c:out value="${result.bomk }"/> --%>
								</td>
							</tr>

							<tr>
								<th class="th1">참고치</th>
								<td><c:out escapeXml="false" value="${result.t001ref }"/></td>
							</tr>

							<tr>
								<th class="th1">임상정보</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.t001cont }"/></td>
							</tr>

							<tr>
								<th class="th1">주의사항</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.t001etc }"/></td>
							</tr>

							<tr>
								<th class="th1">url</th>
								<td colspan="3"><c:out escapeXml="false" value="${result.t001url }"/></td>
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
											<li class="_edit" style="display:none;"><img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">수정</li>
											
											<li class="_editLog" style="display:none;"><img src="<c:url value='/admin/img/notes.svg' />" alt="수정아이콘">수정 요청 이력</li>
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
				<input type="hidden" name="testInfoOption" value="<c:out value="${sparam.testInfoOption }"/>"/>
				<input type="hidden" name="mediClsOption" value="<c:out value="${sparam.mediClsOption }"/>"/>
				<input type="hidden" name="dissClsOption" value="<c:out value="${sparam.dissClsOption }"/>"/>
			</form>
		<!--footer-->
		<jsp:include page="../../../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		
		<!-- 출처 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalEditLog">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">수정 요청 이력</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<table class="table">
			    		<thead>
			    			<tr>
			    				<th>요청자</th>
			    				<th>상태</th>
			    				<th>요청일시</th>
			    			</tr>
			    		</thead>
			    		<tbody id="historyBody">
			    		</tbody>
			    	</table>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 출처 등록 끝-->
		
	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
	
		$(document).ready(function(){
			
			let seq = '<c:out value="${result.f010gcd }"/>';
			
			if(seq == ''){
				alert('존재하지 않는 검사항목 입니다.');
				location.href="<c:url value='/admin/inspection/test/kr/review/index.do' />";
			}
			
			
			//목록 가기 클릭 이벤트
			$("._list").click(function(){
// 				history.back();
				$("#hiddenForm").attr('action', "<c:url value='/admin/inspection/test/kr/review/index.do' />").submit();

			});
			
			
			if(writeFlag){
				
				$("._edit").show();
				$("._edit").click(function(){
					location.href="<c:url value='/admin/inspection/test/kr/review/"+ seq +".edit' />";
				});
				$("._editLog").show();
				$("._editLog").click(function(){
					
					axios.get("<c:url value='/admin/inspection/test/kr/review/editLog/"+ seq +".json' />")
					  .then(function (res) {
					    
				    	let content = '';
				    	for(var idx in res.data.result){
				    		let item = res.data.result[idx];
				    		content +='<tr>';
				    		content +='	<td>'+ item.regUserName+"</td>";
				    		content +='	<td>'+ item.codeEditStName+"</td>";
				    		content +='	<td>'+ new moment(item.regDate).format('lll')+"</td>";
				    		content +='</tr>';
				    	}
				    	
						$("#historyBody").html(content);
						$("#modalEditLog").modal('show');
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				});
				
			}
			
			
		});
		
	
	</script>



  </body>
  </html>

