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
		<link rel="stylesheet" href="<c:url value='/lib/summernote/summernote.min.css'/>">

		<link href="<c:url value='/admin/css/reset.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/common.css'/>" type="text/css" rel="stylesheet">

		
		<link href="<c:url value='/admin/css/notice_01_write.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/header.css'/>" type="text/css" rel="stylesheet">
		<link href="<c:url value='/admin/css/footer.css'/>" type="text/css" rel="stylesheet">
		
		<script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
		
		<script src="<c:url value='/lib/fontawesome-free/js/all.min.js'/>"></script>
		<script src="<c:url value='/lib/popper/umd/popper.min.js'/>"></script>
		<script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>"></script>
		<script src="<c:url value='/lib/summernote/summernote.min.js'/>"></script>
		
		<!-- treeview -->
		<script src="<c:url value='/lib/bootstrap-treeview/dist/bootstrap-treeview.min.js'/>"></script>

		<!--  polyfill -->
		<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
		<!-- axios -->
		<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
		<!-- jquery 입력값 검증 -->
		<script src="<c:url value='/lib/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		<!-- underscore -->
		<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
		
		<script src="<c:url value='/admin/js/common.js'/>"></script>
		<script src="<c:url value='/js/common-util.js'/>"></script>

		
		<!-- 페이지 네이션 -->
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
					<form id="addForm">
						<sec:csrfInput />
						<h1><img src="<c:url value='/admin/img/menu.svg'/>" alt="메뉴아이콘">사용자 메뉴 등록</h1>
						<table>
							<colgroup>
								<col width="100px;"/>
								<col width="400px;"/>
								<col width="100px;"/>
								<col width="300px;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>언어코드</th>
									<td>
										<select class="form-control" id="codeLang" name="codeLang">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.langCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
									<th>메뉴명</th>
									<td>
										<input type="text" class="form-control text_title" name="menuName" placeholder="등록될 메뉴명을 입력해주세요." id="menuName">
									</td>
								</tr>
								<tr>
									<th>메뉴코드</th>
									<td>
										<select class="form-control" id="codeMenu" name="codeMenu">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.typeCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
									<th>로그인 여부</th>
									<td>
										<select class="form-control" id="codeLogin" name="codeLogin">
											<option value="-1">==선택==</option>
											<c:forEach var="item" items="${defaultInfo.loginCodes}">
												<option value="<c:out value='${item.slaveCode }'/>"><c:out value="${item.slaveCodeName }"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>상위 메뉴 선택</th>
									<td>
										<input type="hidden" name="parentSeq" id="parentSeq" value="-1">
										<spen id="parentMenuName"></spen>
										
										<button type="button" class="btn btn-default" id="btnSelectParent">선택</button>
										&nbsp;&nbsp;&nbsp;<label for="thisTop">최상위 메뉴</label>
										<input type="checkbox" name="thisTop" id="thisTop">
										
									</td>
									<th>출력 순서</th>
									<td>
										<select class="form-control" name="menuOrder" id="menuOrder" style="width:276px;">
											<option>1</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>URL</th>
									<td colspan="3"><input type="text" class="form-control text_title" name="url" placeholder="메뉴 URL를 입력 하세요" id="url"></td>
								</tr>
							</tbody>
						</table>
					</form>

					<table>
						<tr>
							<td colspan="2">
								<span class="notice_write_ok _list" >취소</span>
								<span class="notice_write_cancel _add">
									<img src="<c:url value='/admin/img/notes.svg' />" alt="등록아이콘">등록</span>
							</td>
						</tr>
					</table>
				</div>
				<!--/notice_area End-->

			</div>
			<!--//container End-->

		<!--footer-->
		<jsp:include page="../../include/footer.jsp" flush="true"></jsp:include>
		<!--//footer End-->
		<form id="hiddenForm" method="get">
			<input type="hidden" name="searchOption" value="<c:out value='${sparam.searchOption}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${sparam.searchKeyword}'/>"/>
			<input type="hidden" name="currentPage" value="<c:out value="${sparam.currentPage }"/>"/>
		</form>
		
		<!-- 모달  -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalParent">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    <div class="modal-header">
			      <h5 class="modal-title">상위 메뉴 선택</h5>
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			      </button>
			    </div>
			    <div class="modal-body">
			    	<div id="parentTreeView"></div>
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
	
		function clearInfo(){
			$("#codeMenu").val(-1).attr("selected", "selected");
			
			$("#btnSelectParent").show();
			$("#parentSeq").val(-1);
			$("#parentMenuName").html('');
			$("#thisTop").prop('checked', false);
			$("#thisTop").prop('disabled', false);
			
			setMenuPrintOrder(0);
			
		}
	
	
		// 출력 순서 변경 이벤트
		function setMenuPrintOrder(size){
			$("#menuOrder").empty();
			
			let selectCount = size+1;
			
			for(var idx = 1; idx <= selectCount; idx++){
				$("#menuOrder").append("<option value='"+idx+"'>"+ idx +"</option>");
			}
			
			$("#menuOrder").val(selectCount).attr("selected", "selected");
		}

		/** 최상위 메뉴시 카운트 가져오기 */
		function getTopMenuCount(){
			let codeMenu = $("#codeMenu").val();
			let lang = $("#codeLang").val();
			
			if(codeMenu == -1  || lang == -1){
				return false;
			}
				
			
			let url = "<c:url value='/admin/menu/user/getHeadTopCount.json' />";
			if(codeMenu == 'quick'){
				url = "<c:url value='/admin/menu/user/getQuickTopCount.json' />"; 
			}

			axios.get(url,{
					params: {
						lang: lang
					}
				})
			  .then(function (res) {
			    $("#parentSeq").val(0);
			    setMenuPrintOrder(res.data.result);
			  })
			  .catch(function (error) {
			    console.log(error);
			  });
		}
	
	
		$(document).ready(function(){
			
			//메뉴코드 체인지 이벤트
			$("#codeMenu").change(function(){
				
				let lang = $("#codeLang").val();
				if(lang == -1){
					if(lang == -1){
						alert('언어코드를 선택 하세요.');
					}
					clearInfo();
					return;
				}
				
				let codeMenu = $(this).val();
				
				if(codeMenu == 'quick'){
					$("#btnSelectParent").hide();
					$("#parentSeq").val(0);
					$("#thisTop").prop('checked', true);
					$("#thisTop").prop('disabled', true);
					$("#thisTop").trigger('change');
					
				}else if(codeMenu == 'head'){
					$("#parentSeq").val(-1);
					$("#thisTop").prop('checked', false);
					$("#thisTop").prop('disabled', false);
					$("#btnSelectParent").show();
				}
			});
			
			//최상위 메뉴 체인지 이벤트
			$("#thisTop").change(function(){
				if($(this).is(":checked")){
					let lang = $("#codeLang").val();
					let menu = $("#codeMenu").val();
					if(lang == -1 || menu == -1){
						
						if(lang == -1){
							alert('언어코드를 선택 하세요.');
						}else if(menu == -1){
							alert('메뉴코드를 선택 하세요.');
						}
						clearInfo();
						return;
					}
					$("#parentSeq").val(0);
					$("#parentMenuName").html('');
					getTopMenuCount();
				}
			});
			
			//언어코드 체인지 이벤트
			$("#codeLang").change(function(){
				//언어코드가 선택 되었고
				clearInfo();
			});
			
			
			
			//상위 메뉴 선택 이벤트
			$("#btnSelectParent").click(function(){
				let lang = $("#codeLang").val();
				let menu = $("#codeMenu").val();
				
				if(lang == -1){
					alert('언어코드를 선택 하세요.');
					return;
				}
				
				if(menu == -1){
					alert('메뉴 코드를 선택 하세요.');
					return;
				}
				
				let treeData = [];
				
				axios.get("<c:url value='/admin/menu/user/getHeadParentInfo.json' />",{
						params: {
							lang: lang
						}
					})
				  .then(function (res) {
				    let data = res.data.result;
				    
				    let level1 = _.filter(data, function(item){return item.menuLevel == 1});
				    let level2 = _.filter(data, function(item){return item.menuLevel == 2});
				    let level3 = _.filter(data, function(item){return item.menuLevel == 3});
				    let level4 = _.filter(data, function(item){return item.menuLevel == 4});
				    
				    let level2Tree = [];
				    let level3Tree = [];

				    for(var idx in level3){
				    	let item = {
				    		text: level3[idx].menuName,
				    		tags: [level3[idx].seq, level3[idx].menuOrder, level3[idx].parentSeq]
				    	};
				    	
				    	let childs = _.filter(level4, function(t){return t.parentSeq == level3[idx].seq});
				    	let lv4Data = [];
				    	for( var idx2 in childs){
				    		lv4Data.push({
				    			text: childs[idx2].menuName,
					    		tags: [childs[idx2].seq, childs[idx2].menuOrder, childs[idx2].parentSeq],
				    		});
				    	}
				    	
				    	if(lv4Data.length > 0){
				    		item.nodes = _.sortBy(lv4Data, function(n){return n.tags[1];});	
				    	}
				    	
				    	level3Tree.push(item);
				    }
				    
				    for(var idx in level2){
				    	
				    	let childs = _.filter(level3Tree, function(t){return t.tags[2] == level2[idx].seq;});
				    	childs = _.sortBy(childs, function(n){return n.tags[1];});
				    	
				    	let lv2Data = {
				    		text: level2[idx].menuName,
				    		tags: [level2[idx].seq, level2[idx].menuOrder, level2[idx].parentSeq]
				    	};
				    	
				    	if(childs.length > 0){
				    		lv2Data.nodes = childs;
				    	}
				    	level2Tree.push(lv2Data);
				    }
				    
				    for(var idx in level1){
				    	let childs = _.filter(level2Tree, function(t){return t.tags[2] == level1[idx].seq;});
				    	childs = _.sortBy(childs, function(n){return n.tags[1];});
				    	
				    	let lv1Data = {
				    		text: level1[idx].menuName,
				    		tags: [level1[idx].seq, level1[idx].menuOrder],
				    	}
				    	if(childs.length > 0){
				    		lv1Data.nodes = childs;
				    	}
				    	
				    	treeData.push(lv1Data);
				    }
				    
				    
					$('#parentTreeView').treeview({
					  levels: 4,
			          data: treeData,
			          onNodeSelected: function(event, data){
			          }
			        });
					
					$('#parentTreeView').treeview('collapseAll', { silent: true });
				   
				  })
				  .catch(function (error) {
				    console.log(error);
				  });
				
				$("#modalParent").modal('show');

			});
			//부모 메뉴 선택 완료
			$("#btnModealSelected").click(function(){
				let selected = $('#parentTreeView').treeview('getSelected');
				if(selected.length == 0){
					alert('선택된 메뉴가 없습니다.');
					return;
				}
				
				var item = {};
				if(selected.length){
					item = selected[0];
				}else{
					item = selected;
				}
				
				if(item){
					
					$("#parentSeq").val(item.tags[0]);
					$("#parentMenuName").html(item.text);
					if(item.nodes){
						setMenuPrintOrder(item.nodes.length);
					}else{
						setMenuPrintOrder(0);
					}
					
					$("#modalParent").modal('hide');
				}
			});
			
			
			//입력값 검증 설정
			$("#addForm").validate({
				rules:{
					menuName: {required:true},
					url: {required:true}
				},
				submitHandler: function(form) {
					
					let param = $('#addForm').serializeObject();
					
					if(param.codeLang == -1){
						alert('언어코드를 선택 하세요');
						return;
					}else if(param.codeMenu == -1){
						alert('메뉴 형태를 선택 하세요');
						return;
					}else if(param.codeLogin == -1){
						alert('로그인 여부를 선택 하세요');
						return;
					}
					
					let isTop = $("#thisTop").is(":checked");
					if(isTop){
						param.parentSeq = 0;
					}else if(!isTop && param.parentSeq == -1){
						alert('상위메뉴를 선택 하세요.');
						return;
					}
					
					axios.post("<c:url value='/admin/menu/user/addMenu.write' />", param)
					  .then(function (res) {
					    if(res.data.result > 0){
					    	alert('등록 되었습니다.');
//  					    	location.href="<c:url value='/admin/menu/user/" + res.data.result + ".view' />";
 							$("#hiddenForm").attr('action', "<c:url value='/admin/menu/user/" + res.data.result + ".view' />").submit();

					    }
					   
					  })
					  .catch(function (error) {
					    console.log(error);
					  });
					
				}
			});
			
			//추가버튼 이벤트 추가
			$("._add").click(function(){
				$("#addForm").submit();
			});
			
			//목록으로 가기 이벤트
			$("._list").click(function(){
// 				history.back();
				
				$("#hiddenForm").attr('action', "<c:url value='/admin/menu/user/index.do' />").submit();

			});
			
		});
	</script>


	</body>
</html>

