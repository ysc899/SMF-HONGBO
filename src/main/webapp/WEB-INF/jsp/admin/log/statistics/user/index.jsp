<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no,initial-scale=1"/>
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>

		<link rel="stylesheet" href="<c:url value='/lib/bootstrap/css/bootstrap.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/bootstrap-datepicker-master/css/bootstrap-datepicker3.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/lib/Chart.js/Chart.min.css'/>">

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		<link href="<c:url value='/admin/css/notice_00.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/chart.css'/>" type="text/css" rel="stylesheet">
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
				<!-- underscore -->
		<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
		
		
				<!-- 데이터 피커 -->
		<script src="<c:url value='/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap-datepicker-master/locales/bootstrap-datepicker.ko.min.js'/>"></script>
		
		<script src="<c:url value='/lib/Chart.js/Chart.min.js'/>"></script>
		<script src="<c:url value='/lib/Chart.js/utils.js'/>"></script>
		
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>
		
		<title>씨젠의료재단 관리자 페이지</title>
	</head>

	<body>

		<!--wrap-->
		<div id="wrap">
			<!--header-->
			<jsp:include page="../../../include/menu.jsp" flush="true"></jsp:include>
			<!--header-->

			<!-- menu -->
			<jsp:include page="../../../include/header.jsp" flush="true"></jsp:include>
			<!-- menu -->

			<!--container-->
			<div id="container">
				<!--notice_area-->
				<div class="notice_area" style="min-height:150px;">
					<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘"><c:out value="${nowMenuName }"/></h1>
					<div class="select_box">
						<form id="searchForm" method="get">
								<input type="button" value="엑셀 다운로드" class="search_bt" style="width:120px;margin-top:7px; margin-left:10px;" id="btnExcel">
								<input type="button" value="조회" style="margin-top:7px;" class="search_bt" id="btnSearch">
								
								<div class="input-group date" style="max-width: 200px;margin-top:5px;float:right;">
								    <input type="text" class="form-control _datepicker" name="startDate" autocomplete="off" id="searchDate">
								    <div class="input-group-addon">
								        <span class="glyphicon glyphicon-th"></span>
								    </div>
								</div>
								<span style="margin-top:13px;float:right;">조회 년도</span>
						</form>
					</div>
				</div>
				<!--/notice_area End-->
				<div class="chart_area">
					<canvas id="line-chart"></canvas>

				</div>

			</div>
			<!--//container End-->
			
				<!-- 모달  -->
		<!-- 출처 등록 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalExcel">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">엑셀 다운로드</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<form id="addSourceForm">
				    	<table class="table">
				    		<tbody>
								<tr>
									<th>시작일</th>
									<td>
										<div class="input-group date">
										    <input type="text" class="form-control _datepicker" name="startDate" autocomplete="off" id="startDate">
										    <div class="input-group-addon">
										        <span class="glyphicon glyphicon-th"></span>
										    </div>
										</div>
									</td>
									<th>종료일</th>
									<td>
										<div class="input-group date">
										    <input type="text" class="form-control _datepicker" name="endDate" autocomplete="off" id="endDate">
										    <div class="input-group-addon">
										        <span class="glyphicon glyphicon-th"></span>
										    </div>
										</div>
									</td>
								</tr>
				    		</tbody>
				    	</table>
			    	</form>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnModalExcel">다운로드</button>
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 출처 등록 끝-->

		<!--footer-->
		<jsp:include page="../../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		

	</div>
	<!--//wrap End-->

	
	<script type="text/javascript">
	
		
		var COLORS = [
			'#4dc9f6',
			'#f67019',
			'#f53794',
			'#537bc4',
			'#acc236',
			'#166a8f',
			'#00a950',
			'#58595b',
			'#8549ba'
		];
		
		function search(){
			let param = $('#searchForm').serializeObject();
			
			axios.get("<c:url value='/admin/log/statistics/user/yearStatic.json' />",{
				params: param
			}).then(function (res) {
				viewChart(res.data.result);
			  })
			  .catch(function (error) {
			    console.log(error);
			  });
		}
		
		function viewChart(data){
			
			var dates = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];
			var viewdates = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
			var idDatas = _.groupBy(data, function(t){return t.userType});
			
			var chartDatas = {};
			_.each(dates, function(d){
			
				_.each(idDatas, function(t){
					if(!_.contains(_.keys(chartDatas), t[0].userType)){
						chartDatas[t[0].userType] = {data:[]};
					}
					
					var checkData = _.filter(t, function(k){return k.month == d});
					if(checkData.length == 1){
						chartDatas[t[0].userType].data.push(checkData[0].cnt);
					}else{
						chartDatas[t[0].userType].data.push(0);
					}
				});
			});
			
			
			
			let datasets = [];
			
			_.each(_.keys(chartDatas), function(cd){
				var lv = '';
				if(cd  == 'admin'){
					lv = '관리자';
				}else if(cd == 'anonymous'){
					lv = '비로그인';
				}else if(cd == 'user'){
					lv = '로그인 사용자';
				}
				
				datasets.push({
					label: lv,
					data: chartDatas[cd].data,
					backgroundColor: COLORS[_.indexOf(_.keys(chartDatas), cd) % 9],
					borderColor: COLORS[_.indexOf(_.keys(chartDatas), cd) % 9],
					fill:false
				});
				
			});
			
			config = {
				type: 'line',
				data: {
					labels: viewdates,
					datasets: datasets
				},
				options: {
					responsive: true,
					title: {
						display: true,
						text: $("#searchDate").val()+'년도 월별 사용자 그룹 접속 통계'
					},
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					scales: {
						xAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '월'
							}
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '접속 수'
							}
						}]
					}
				}
			};
			
			var ctx = document.getElementById('line-chart').getContext('2d');
			
			if(lineChart != null){
				lineChart.destroy();
			}
				lineChart = new Chart(ctx, config);
		}
		
		let lineChart = null;
		let config = {};
		
		$(document).ready(function(){
			$("#btnSearch").click(function(){
				search();
				return false;
			});
			
			//달력 설정
			$('#searchDate').datepicker({
			    format: 'yyyy',
			    language: 'ko',
			    startView: 2, 
			    minViewMode: 2,
			    autoclose: true
			});
			
			
			$('#startDate').datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    autoclose: true
			}).on('changeDate', function(selected){
				var startDate = new Date(selected.date.valueOf());
				$("#endDate").datepicker('setStartDate', startDate);
			});
			$("#endDate").datepicker({
			    format: 'yyyy-mm-dd',
			    language: 'ko',
			    clearBtn: true,
			    autoclose: true
			}).on('changeDate', function(selected){
				if(selected.date){
					var endDate = new Date(selected.date.valueOf());
					$("#startDate").datepicker('setEndDate', endDate);
				}else{
					$("#startDate").datepicker('setEndDate', '');
				}
			});
				

			
			$("#btnExcel").click(function(){
				$("#modalExcel").modal('show');
			});
			
			
			$("#btnModalExcel").click(function(){
				let startDate = $('#startDate').val();
				let endDate = $('#endDate').val();
				
				if(startDate == '' || endDate == ''){
					alert('시작일과 종료일을 확인해 주세요.');
					return;
				}
				let param = {
					startDate: startDate,
					endDate: endDate
				}
				
				axios({
					method: 'GET',
					url: "<c:url value='/admin/log/statistics/user/yearStaticExcel.do' />",
					params: param,
					responseType: 'arraybuffer' // 가장 중요함
				})	
				.then(function(response){
					
					var link = document.createElement('a');
					var blob = new Blob([response.data], { type: response.headers['content-type'] });
					var fileName = "사용자 접속 통계 "+startDate+"-"+endDate +'.xlsx';
					
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
			});
			
			
			
		});
		
		
		
	
	
	</script>



  </body>
  </html>

