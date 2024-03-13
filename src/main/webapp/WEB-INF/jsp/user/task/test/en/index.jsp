<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="viewport" content="width=1280, initial-scale=1, minimum-scale=0.5, user-scalable=yes"/>
<!-- 	<meta name="X-UA-Compatible" content="IE=edge,chrome=1"/> -->
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Expires" content="-1"/>
    <meta property="og:title" content=":: <spring:message code="title" /> ::" />
    <meta property="og:url" content="<c:url value='${fullUrl}'/>" />
    <meta property="og:description" content="글로벌 질병검사 전문기관 <c:if test='${not empty urlDesc }'>- <c:out value='${urlDesc }'/> </c:if>" />
    <meta property="og:image" content="<c:url value="/user/img/sns_thumb.jpg"/>" />
    <meta property="og:site_name" content="<spring:message code="title" />" />
    <meta property="og:type" content="website" />
    <title>:: <spring:message code="title" /> ::</title>
    <link rel="shortcut icon" href="<c:url value='/user/img/seegene.ico'/>" />
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/03_sub06.css'/>" type="text/css" rel="stylesheet"/>
	
	<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet"/>
	<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" href="<c:url value='/lib/swiper/dist/css/swiper.min.css'/>"/>
    
    <script src="<c:url value='/lib/jquery/jquery-1.11.1.slim.min.js'/>"></script>
    <script src="<c:url value='/lib/swiper/dist/js/swiper.min.js'/>"></script>
    
	<!--  polyfill -->
	<script src="<c:url value='/lib/polyfill/polyfill.min.js'/>"></script>
	<!-- axios -->
	<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
	<script src="<c:url value='/lib/printThis-master/printThis.js'/>"></script>
	
	<!-- underscore -->
	<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>
    <script src="<c:url value='/user/js/common.js'/>"></script>
	<script src="<c:url value='/js/common-util.js'/>"></script>    
    
</head>

<body>
		<!--header-->
	<div id="login_header">
	<jsp:include page="../../../include/login_header_en.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	<!--wrap-->
	<div id="wrap">
		
		<!--container-->
			<div id="container">

					<div class="sub_menu">
						<jsp:include page="../../../include/submenu.jsp" flush="true"></jsp:include>
					</div>

					<div id="sub_title">
						<p><c:out value="${childMenuName }"/></p>
					</div>

					<!--sub_story-->
					<div class="sub_story">
						<form id="searchForm" method="get">
							<div class="one_search">
								<span><spring:message code="test.search.info" /></span>
									<select class="one_name" name="testInfoOption" id="testInfoOption">
										<option value="" ><spring:message code="search.all" /></option>
										<c:forEach items="${searchOption.testInfos}" var="item">
										<option value="<c:out value='${item.s002scd }'/>"><c:out value='${item.s002cnm }'/></option>
										</c:forEach>
									</select>
								<input type="text" maxlength="50" placeholder="<spring:message code="search.hint" />" name="searchKeyword" id="inputKeyword" value="<c:out value='${ param.searchKeyword}'/>"/>
								
<%-- 								<img src="<c:url value='/user/img/search.png'/>" alt="search" class="_search"/> --%>
								<span class="reset _reset"><spring:message code="test.search.clear" /></span>
								<span class="search _search">Search</span>
							</div>
							
							<!--kind_box-->
							<div class="kind_box">
									<div class="kind_select">
										<p><spring:message code="test.search.medicls" /></p>
										<select name="mediClsOption" id="mediClsOption" id="name_select">
											<option value=""><spring:message code="search.all" /></option>
											<c:forEach items="${searchOption.mediClss}" var="item">
												<option value="<c:out value='${item.s002scd }'/>"><c:out value='${item.s002cnm }'/></option>
											</c:forEach>
										</select>
									</div>
	
									<div class="kind_alpabet">
										<p><spring:message code="test.search.alp" /></p>
										<div class="name_alpabet">
											<input type="hidden" name="searchAlp" id="searchAlp" value="<c:out value='${sparam.searchAlp }'/>"/>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='A' || param.searchAlp =='a'}"> current</c:if> " >A</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='B' || param.searchAlp =='b'}"> current</c:if> " >B</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='C' || param.searchAlp =='c'}"> current</c:if> " >C</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='D' || param.searchAlp =='d'}"> current</c:if> " >D</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='E' || param.searchAlp =='e'}"> current</c:if> " >E</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='F' || param.searchAlp =='f'}"> current</c:if> " >F</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='G' || param.searchAlp =='g'}"> current</c:if> " >G</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='H' || param.searchAlp =='h'}"> current</c:if> " >H</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='I' || param.searchAlp =='i'}"> current</c:if> " >I</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='J' || param.searchAlp =='j'}"> current</c:if> " >J</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='K' || param.searchAlp =='k'}"> current</c:if> " >K</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='L' || param.searchAlp =='l'}"> current</c:if> " >L</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='M' || param.searchAlp =='m'}"> current</c:if> " >M</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='N' || param.searchAlp =='n'}"> current</c:if> " >N</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='O' || param.searchAlp =='o'}"> current</c:if> " >O</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='P' || param.searchAlp =='p'}"> current</c:if> " >P</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='Q' || param.searchAlp =='q'}"> current</c:if> " >Q</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='R' || param.searchAlp =='r'}"> current</c:if> " >R</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='S' || param.searchAlp =='s'}"> current</c:if> " >S</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='T' || param.searchAlp =='t'}"> current</c:if> " >T</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='U' || param.searchAlp =='u'}"> current</c:if> " >U</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='V' || param.searchAlp =='v'}"> current</c:if> " >V</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='W' || param.searchAlp =='w'}"> current</c:if> " >W</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='X' || param.searchAlp =='x'}"> current</c:if> " >X</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='Y' || param.searchAlp =='y'}"> current</c:if> " >Y</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='Z' || param.searchAlp =='z'}"> current</c:if> " >Z</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='1'}"> current</c:if> " >1</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='2'}"> current</c:if> " >2</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='3'}"> current</c:if> " >3</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='4'}"> current</c:if> " >4</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='5'}"> current</c:if> " >5</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='6'}"> current</c:if> " >6</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='7'}"> current</c:if> " >7</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='8'}"> current</c:if> " >8</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='9'}"> current</c:if> " >9</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='0'}"> current</c:if> "  style="margin-top:5px">0</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='α'}"> current</c:if> "  style="margin-top:5px">α</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='β'}"> current</c:if> "  style="margin-top:5px">β</span>
											<span class="_searchAlp <c:if test="${sparam.searchAlp =='γ'}"> current</c:if> "  style="margin-top:5px">γ</span>
										</div>
									</div>
	
									<div class="kind_checkbox">
										<p><spring:message code="test.search.diss" /></p>
										<div class="name_checkbox">
											<table>
												<tbody>
													<c:forEach items="${searchOption.dissClss}" var="item" varStatus="status">
														<c:if test="${status.count % 6 == 1}">
															<tr>
														</c:if>
															<td>
																<c:set var="selectFlag" value="N"/>
																<c:forEach items="${sparam.dissClss }" var="t">
																	<c:if test="${item.s002scd == t }">
																	<c:set var="selectFlag" value="Y"/>
																	</c:if>
																</c:forEach>
																<input type="checkbox" name="dissClss" class="kindcheck" value="<c:out value='${item.s002scd }'/>" id="diss_<c:out value='${status.count }'/>" <c:if test="${selectFlag == 'Y'}">checked</c:if> />
																<label style="font-size: 10px;" for="diss_<c:out value='${status.count }'/>"><c:out value='${item.s002cnm }'/></label>
															</td>
														<c:if test="${status.count % 6 == 0 || status.last }">
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>

										</div>
	
									</div>
							</div>
							<!--//kind_box End-->
							<input type="hidden" name="currentPage" id="currentPage" value="1" />
							<input type="hidden" name="searchFlag" id="searchFlag" value="Y" />
						</form>
						
						
						<!--kind_table-->
						<div class="kind_table">
							<div class="table_title">

								<div class="left_txt">
									<span class="span_count">[<spring:message code="test.search.result.page" />:<b id="table_count">35<spring:message code="test.search.result.count" /></b>]</span>
									<span class="span_page _nowPage"></span>
								</div>

								<div class="right_txt">
									<span><spring:message code="test.search.option" /> : <b class="_searchOption"></b></span>
								</div>

							</div>

							<table>
								<colgroup>
									<col width="100px;"/>
									<col width="*"/>
									<col width="100px;"/>
									<col width="120px;"/>
									<col width="130px;"/>
									<col width="70px;"/>
									<col width="100px;"/>
								</colgroup>
								<thead>
									<tr>
										<th class="border_none"><spring:message code="test.list.head.1" /></th>
										<th><spring:message code="test.list.head.2" /></th>
										<th><spring:message code="test.list.head.3" /></th>
										<th><spring:message code="test.list.head.4" /></th>
										<th><spring:message code="test.list.head.5" /></th>
										<th><spring:message code="test.list.head.6" /></th>
										<th><spring:message code="test.list.head.7" /></th>
									</tr>
								</thead>
								<tbody id="testResultBody">
								</tbody>
							</table>

							<!--page_number-->
							<div class="page_number">
							</div>
							<!--//page_number End-->
							

						</div>
						<!--//kind_table End-->
						
						
						
						
					</div>
					<!--//sub_story End-->
			</div>
			<!--//container End-->
			<%-- <jsp:include  page="../../include/rolling.jsp"></jsp:include > --%>

		<div id="top_bt2">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../../../include/footer_en.jsp"></jsp:include >
		<!--//footer End-->
	</div>
	
	<!--//wrap End-->

	<!-- banner_bg-->
	<div class="banner_box">
		<h1><c:out value="${parentMenuName }"/></h1>
		<div class="banner_bg"></div>
	</div>
	<!--banner_bg End-->
	
	<!--quick-menu-->
	<jsp:include  page="../../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../../include/fixed_header_en.jsp"></jsp:include >
	</div>
	
	
	<script type="text/javascript">
	var totalPage = 1;
		
		function checkHash(){
			
			if (document.location.hash != ""){     //받아올 해시가 있으면
				
				var arrHash = new Array();
	
				var hash = document.location.hash;
				
				arrHash = hash.split("#");
				
// 				$("._centerMenu_"+ arrHash[1]).trigger('click');
				printPage(Number(arrHash[1]));
				
			}else{
				fnSetHash(1);
			}
		}
		//해시태그 세팅하기
		function fnSetHash(page) {
			var hash = "#" + page;
			window.location.hash = hash;
		}
	
// 		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			
			var seq = $(this).data('seq');
			$("#searchForm").attr('action', "<c:url value='/task/test/" + seq + ".view' />").submit();
			
		});
		
		
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
		});
		
		
		<c:choose>
			<c:when test="${not empty result }">
			var content = <c:out escapeXml="false" value="${result}"/> ;
			</c:when>
			<c:otherwise>
			var content = [];
			</c:otherwise>
		</c:choose>
		
		
		
		function printPage(page){
			$("#testResultBody").empty();
			
			if(content.length == 0){
				$("#testResultBody").html('<tr style="height:400px;"><td colspan="7" class="border_none"><spring:message code="search.noresult" /></td></tr>');
				
				return;
			}
			
			<c:if test="${sparam.searchFlag == 'Y'}">
			setTimeout(function() {
				$(window).scrollTop('923');
			}, 250);
			</c:if>
			

			var startCursor = (page -1) * 20;
			var endCursor = startCursor + 20;
			
			if(endCursor > content.length){
				endCursor = content.length;
			}
			
			var contentHtml = '';
			for(startCursor; startCursor < endCursor; startCursor++){
				var item = content[startCursor];
				
				contentHtml +='<tr>';
				contentHtml +='	<td class="border_none">'+item.f010gcd+'</td>';
				//contentHtml +='	<td>'+item.f010fkn+'</td>';
				contentHtml +='	<td style="max-width: 0px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: left; padding: 0 5px 0 5px;">'+item.f010fen+'</td>';
				contentHtml +='	<td>'+item.f010tnm+'</td>';
				if(item.f010msnm){
					contentHtml +='	<td>'+item.f010msnm+'</td>';
				}else{
					contentHtml +='	<td></td>';
				}
				contentHtml +='	<td>'+item.t001day+'</td>';
				contentHtml +='	<td>'+ item.f010eed +'</td>';
				contentHtml +='	<td class="kind_ok _row" data-seq="' +item.f010gcd+ '"><span><spring:message code="test.list.view" /></span></td>';
				contentHtml +='</tr>';
			}
			$("#testResultBody").html(contentHtml);
			$("._nowPage").html('[' +page +'/'+totalPage +'<spring:message code="search.page" />]');
			
			var paggingContent = '';
			var paggingStart = 1;
			var paggingEnd = totalPage;
			if(page > 2){
				paggingStart = page -2;
				
				if(paggingEnd > page+2){
					paggingEnd = page+2;
				}else{
					if(paggingEnd - paggingStart <= 3){
						paggingStart -= 5 - (paggingEnd - paggingStart);
					}
					if(paggingStart < 1){
						paggingStart = 1;
					}
				}
				
			}else{
				if(paggingEnd > 5){
					paggingEnd = 5;
				}
			}
			
			if(page > 1){
				paggingContent += '<img src="<c:url value='/user/img/sub/prev_bt.png'/>" class="prev_bt _pagging" data-current="'+ (page-1) +'" alt="<spring:message code="search.pre" />"/>';
			}
			
				paggingContent += '<ul>';
			for(var idx = paggingStart; idx <= paggingEnd; idx++){
				if(idx == page){
				paggingContent += '	<li class="active">'+ idx +'</li>';
				}else{
				paggingContent += '	<li class="_pagging" data-current="'+ idx +'">'+ idx +'</li>';	
				}
			}
				paggingContent += '</ul>';
			
			if(page < totalPage){
				paggingContent += '<img src="<c:url value='/user/img/sub/next_bt.png'/>" class="next_bt _pagging" data-current="'+ (page+1) +'" alt="<spring:message code="search.next" />"/>';
			}

			$(".page_number").html(paggingContent);
			setTimeout(function() {
				$(window).scrollTop('923');
			}, 250);
// 			$(window).scrollTop('923');
			
		}
		
		//페이징 클릭 이벤트
		$(document).on('click', '._pagging',function(){
			var current = $(this).data('current');
			console.log(current);
			$("#currentPage").val(current);
			fnSetHash(current);
		});
	
		$(document).ready(function(){
			
			if(content.length > 0){
				totalPage = Math.floor(content.length / 20) ;
			
				if((content.length % 20 ) > 0){
					totalPage++;
				}
			}else if(content.length == 0){
				totalPage = 0;
			}
			
			$("#table_count").html(totalPage+'<spring:message code="test.search.result.count" />');
			
			//선택박스 처리
			$("#mediClsOption").val('<c:out value="${sparam.mediClsOption}"/>').attr("selected", "selected");
			
			
			$("._searchAlp").click(function(){
				$("#searchAlp").val($(this).html());
				$("._search").trigger('click');
			});
			
			$("._search").click(function(){
				fnSetHash(1);
				$('#searchForm').submit();
			});
			
			$("._reset").click(function(){
				$("#inputKeyword").val('');
				$("#searchAlp").val('');
				$("#testInfoOption").val('').attr("selected", "selected");
				$("#mediClsOption").val('').attr("selected", "selected");
				$("._searchAlp").removeClass('current');
				$(".kindcheck").prop("checked", false);
				
			});
			
			
			var searchOption = '';
			var keyword = '<c:out value="${sparam.searchKeyword}"/>';
			var mediClsOption = '';
			var dissClss = [];
			
			<c:forEach items="${searchOption.dissClss}" var="item" varStatus="status">
				<c:forEach items="${sparam.dissClss }" var="t">
					<c:if test="${item.s002scd == t }">
					dissClss.push("<c:out value='${item.s002cnm }'/>");
					</c:if>
				</c:forEach>
			</c:forEach>
			
			<c:forEach items="${searchOption.mediClss}" var="item">
				<c:if test="${item.s002scd == sparam.mediClsOption}">
				mediClsOption = "<c:out value='${item.s002cnm }'/>";
				</c:if>
			</c:forEach>
			
			searchOption += keyword;
			if(searchOption.length > 0 && mediClsOption.length >0){
				searchOption += ' > ';
			}
			
			if(mediClsOption.length > 0){
				searchOption += mediClsOption;
			}
			
			if(searchOption.length > 0 && dissClss.length > 0){
				searchOption += ' > ';
			}
			
			if(dissClss.length > 0){
				
				searchOption += dissClss.join(' | ');
			}
			
			$("._searchOption").html(searchOption);
			
			checkHash();
			
// 			printPage(Number($("#currentPage").val()));
			
		});
	
	
	</script>
</body>
</html>
