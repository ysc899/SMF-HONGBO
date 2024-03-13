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

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_00.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
		
		<script src="<c:url value='/lib/fontawesome-free/js/all.min.js'/>"></script>
		<script src="<c:url value='/lib/popper/umd/popper.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>"></script>
		
		<!-- 페이지 네이션 -->
		<script src="<c:url value='/lib/twbs-pagination/jquery.twbsPagination.js'/>"></script>
		
		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		<!-- sheetjs -->
		<script src="<c:url value='/lib/sheetjs-master/xlsx.full.min.js'/>"></script>
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
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/> - 리스트</h1>
						<div class="select_box">
						
							<form id="searchForm" method="get">
								<input type="button" value="검색" class="search_bt" id="btnSearch">
								<input type="text" class="search_content" name="searchKeyword" id="inputKeyword" value="<c:out value='${ param.searchKeyword}'/>">
								<select class="kind" name="testInfoOption" id="testInfoOption">
									<option value="" >전체</option>
									<c:forEach items="${searchOption.testInfos}" var="item" >
									<option value="<c:out value='${item.s002scd }'/>"><c:out value='${item.s002cnm }'/></option>
									</c:forEach>
								</select>
								<select class="kind" name="mediClsOption" id="mediClsOption">
									<option value="" >전체</option>
									<c:forEach items="${searchOption.mediClss}" var="item">
									<option value="<c:out value='${item.s002scd }'/>"><c:out value='${item.s002cnm }'/></option>
									</c:forEach>
								</select>
								<select class="kind" name="dissClsOption" id="dissClsOption">
									<option value="" >전체</option>
									<c:forEach items="${searchOption.dissClss}" var="item">
									<option value="<c:out value='${item.s002scd }'/>"><c:out value='${item.s002cnm }'/></option>
									</c:forEach>
								</select>
								<input type="hidden" name="currentPage" id="currentPage" value="1">
							</form>
						</div>
						
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:*">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th>검사코드</th>
									<th>검사항목</th>
									<th>검체</th>
									<th>검사방법</th>
									<th>검사일정</th>
									<th>소요일</th>
								</tr>
							</thead>

							<tbody class="listBody">
							</tbody>
						</table>

						<div class="page_box">
							<div id="page-selection"></div>
							<c:if test="${writeFlag == 'true' || writeFlag == true }">
								<button id="btnAdd" type="button" class="btn btn-default" style="float:right;" ><i class="fas fa-plus"></i>&nbsp;신규 등록</button>
								<button id="btnDownloadExcel" type="button" class="btn btn-default" style="float:right;margin-right:5px;" ><i class="fas fa-download"></i>&nbsp;엑셀 다운로드</button>
								<button id="btnUploadExcel" type="button" class="btn btn-default" style="float:right;margin-right:5px;" ><i class="fas fa-upload"></i>&nbsp;엑셀 업로드</button>
								<div style="display:none;">
									<input id="excelUpload" type="file" name="attachFile" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
								</div>
<!-- 								<button id="btnAddNotice" type="button" class="btn btn-default" style="float:right; display: none;" ><i class="fas fa-plus"></i>&nbsp;동영상 추가</button> -->
							</c:if>
						</div>
				</div>
				<!--/notice_area End-->

			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../../../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		let content = JSON.parse('<c:out escapeXml="false" value="${result}"/>');
		
		
		//선택 박스 값 설정
		$("#testInfoOption").val('<c:out value="${param.testInfoOption }"/>').attr("selected", "selected");
		$("#mediClsOption").val('<c:out value="${param.mediClsOption }"/>').attr("selected", "selected");
		$("#dissClsOption").val('<c:out value="${param.dissClsOption }"/>').attr("selected", "selected");
		
		
		function search(page){
			$("#currentPage").val(page);
			$("#searchForm").submit();
		}
		
		function printPage(page){
			
			if(content.length == 0){
				$(".listBody").html('<tr><td colspan="5">검색결과가 없습니다.</td></tr>');
				return;
			}
			
			
			var startCursor = (page -1) * 10;
			var endCursor = startCursor + 10;
			
			if(endCursor > content.length){
				endCursor = content.length;
			}
			
			let contentHtml = '';
			for(startCursor; startCursor < endCursor; startCursor++){
				let item = content[startCursor];
				contentHtml +='<tr class="_row" data-seq="' +item.f010gcd+ '">';
				contentHtml +='	<td>'+item.f010gcd+'</td>';
				contentHtml +='	<td><a href="javascript:void(0);">'+item.f010fkn+'</a></td>';
				contentHtml +='	<td>'+item.f010tnm+'</td>';
				contentHtml +='	<td>'+item.f010msnm+'</td>';
				contentHtml +='	<td>'+item.t001day+'</td>';
				contentHtml +='	<td>'+item.f010eed+'</td>';
				contentHtml +='</tr>';
			}
			$(".listBody").html(contentHtml);
		}
		
		
		//로우 클릭 이벤트
		$(document).on('click', '._row',function(){
			let seq = $(this).data('seq');
			$("#searchForm").attr('action', "<c:url value='/admin/inspection/test/kr/review/" + seq + ".view' />").submit();

		});
		
		//해시태그 세팅하기
		function fnSetHash(page) {
			var hash = "#" + page;
			window.location.hash = hash;
		}
		
		//해시태그 변경될때 메소드

		$(window).bind('hashchange', function() {

			if (document.location.hash != ""){	 //받아올 해시가 있으면

				var arrHash = new Array();

				var hash = document.location.hash;
				
				arrHash = hash.split("#");
				printPage(arrHash[1]);
				
				$('#page-selection').twbsPagination('show', Number(arrHash[1]));

			}

		});
		
		function regInspectionData(datas){
			if(confirm(datas.length+'의 검사항목 검토 내용을 등록 하시겠습니까?')){
				
				axios.post("<c:url value='/admin/inspection/test/kr/review/excel.edit' />", {
					dataJSON: JSON.stringify(datas)
				})
				  .then(function (res) {
// 					if(res.data.result){
						
						alert('수정된 '+res.data.result +'개의 데이터가 수정 요청 되었습니다.');
						search(1);
// 					}
				  })
				  .catch(function (error) {
					console.log(error);
				  });
			}
		}

		$(document).ready(function(){
			
			let totalPage = 1;
			let startPage = 1;
			
			if(content.length > 0){
				totalPage = Math.floor(content.length / 10) ;
			
				if((content.length % 10 ) > 0){
					totalPage++;
				}
			}
			
			
			if (document.location.hash != ""){	 //받아올 해시가 있으면
				var arrHash = new Array();
				var hash = document.location.hash;
				arrHash = hash.split("#");
				startPage = arrHash[1];
				printPage(arrHash[1]);
			}
			
			//페이지 네이션
			$('#page-selection').twbsPagination({
				totalPages: totalPage,
				startPage : Number(startPage),
				visiblePages: 5,
				onPageClick: function (event, page) {
					fnSetHash(page);
				}
			});
			
			
			$("#btnSearch").click(function(){
				search(1);
			});
			$("#inputKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search(1);
				}
			});
			
			<c:if test="${writeFlag == 'true' || writeFlag == true }">
			
			$("#btnDownloadExcel").click(function(){
				
				let param = $('#searchForm').serializeObject();
				
				axios({
					method: 'GET',
					url: "<c:url value='/admin/inspection/test/kr/review/downexcel.do' />",
					params: param,
					responseType: 'arraybuffer' // 가장 중요함
				})	
				.then(function(response){
					
					var link = document.createElement('a');
					var blob = new Blob([response.data], { type: response.headers['content-type'] });
					var fileName = '<c:out value="${nowMenuName }"/>_'+new moment().format("YYYY-MM-DD") +'.xlsx';
					
					if (window.navigator.msSaveOrOpenBlob) { // IE 10+
						window.navigator.msSaveOrOpenBlob(blob, fileName)
					} else { // not IE
						let link = document.createElement('a')
						link.href = window.URL.createObjectURL(blob)
						link.target = '_self'
						if (fileName) link.download = fileName
						link.click()
					}
				});
				
// 				$("#searchForm").attr('action', "<c:url value='/admin/inspection/test/kr/review/downexcel.do' />").submit();
			});
			
			$("#btnUploadExcel").click(function(){
				$("#excelUpload").click();
			});
			
			$("#excelUpload").change(function(e){
				let file = e.target.files[0];
				if(!file.name.endsWith(".xls") && !file.name.endsWith(".xlsx")){
					alert('엑셀 파일만 업로드 가능합니다.');
					return;
				}
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					var data = e.target.result;
					var arr = CommonUtil.readFixData(data);
					var workBook = XLSX.read(btoa(arr), {type : 'base64'});
					
					workBook.SheetNames.forEach(function(item, index, array){
						var json = XLSX.utils.sheet_to_json(workBook.Sheets[item], {header:1});
						
						let sendDatas = [];
						
						for(var idx in json){
							if(idx == 0){
// 								console.log(json[idx]);
// 								console.log(json[1]);
								continue;
							}
							
							let t = json[idx];
							
							sendDatas.push({
								f010gcd: t[1],
								testName: t[0],
								t001sav: t[5],
								t001ref: CommonUtil.toBr(t[11]),
								t001cont: CommonUtil.toBr(t[12]),
								t001etc: CommonUtil.toBr(t[13])
							});
						}
						$("#excelUpload").val(null);
						regInspectionData(sendDatas);
						
					});
				};
				reader.readAsArrayBuffer(file);
				
			});
			
			
			$("#btnAdd").click(function(){
				$("#searchForm").attr('action', "<c:url value='/admin/inspection/test/kr/review/add.write' />").submit();
			});
			
			</c:if>
		});
		
		
	
	
	</script>



  </body>
  </html>

