<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>:: <spring:message code="title" /> ::</title>
    
	<link href="<c:url value='/user/css/reset.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/common.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/05_sub01.css'/>" type="text/css" rel="stylesheet"/>
	
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
    <script src="<c:url value='/user/js/common.js'/>"></script>
	<script src="<c:url value='/js/common-util.js'/>"></script>    
	
		<!-- moment js -->
	<script src="<c:url value='/lib/moment/moment.min.js'/>"></script>
	<script src="<c:url value='/lib/moment/locale/ko.js'/>"></script>
    
</head>

<body>
	
	<!--wrap-->
	<div id="wrap">
		<!--header-->
		<jsp:include page="../../include/header.jsp" flush="true"></jsp:include>
		<!--header-->
		
		<!--container-->
			<div id="container">

					<div class="sub_menu">
						<jsp:include page="../../include/submenu.jsp" flush="true"></jsp:include>
					</div>

					<div id="sub_title">
						<p><c:out value="${childMenuName }"/></p>
					</div>

					<!--sub_story-->
					<div class="sub_story">
						<div class="new_table">

							<div class="n_left">
								<b><spring:message code="search.total" /> <c:out value="${result.totalElements }"/></b> <span class="_viewCurrentPage">[<c:out value="${result.currentPage }"/>/<c:out value="${result.totalPages }"/><spring:message code="search.page" />]</span>
							</div>

							<div class="n_right">
								<form id="searchForm" method="get">
								<select name="searchOption" id="search_select">
									<option value=""><spring:message code="search.all" /></option>
									<option value="title"><spring:message code="board.option1" /></option>
									<option value="content"><spring:message code="board.option2" /></option>
								</select>
								<input type="text" placeholder="<spring:message code="search.hint" />" class="search_text"  name="searchKeyword" id="inputKeyword" value="<c:out value='${ result.option.searchKeyword}'/>"/>
								<input type="button" class="search_bt" id="btnSearch"/>
								</form>
							</div>


							<div class="n_ul _content">
							<c:forEach items="${result.content }" var="item" varStatus="status">
								<c:if test="${status.count % 3 ==  1}">
									<ul>
								</c:if>
									<li class="_row" data-seq="<c:out value='${item.seq }'/>">
										<div class="img_inner">
											<img src="<c:out escapeXml="false" value='${item.thumContent }'/>" alt="재단새소식이미지"/>
										</div>
										<p style="max-width:265px;"><c:out escapeXml="false" value="${item.title }"/></p>
										<span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.editDate}" /></span>
									</li>
								
								<c:if test="${status.count % 3 ==  0}">
									</ul>
								</c:if>
							
							
							</c:forEach>

							</div>

							<c:if test="${result.totalPages > 1}">
							<div class="one_click_more_view _more">
								<span><spring:message code="search.more" /></span><b>+</b>
							
							</div>
							</c:if>


						</div>

					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
			<jsp:include  page="../../include/rolling.jsp"></jsp:include >

		<div id="top_bt">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../../include/footer.jsp"></jsp:include >
		<!--//footer End-->
	</div>
	
	<!--//wrap End-->

	<!-- banner_bg-->
	<div class="banner_box">
		<h1><c:out value="${parentMenuName }"/></h1>
		<div class="banner_bg"></div>
	</div>
	<!--banner_bg End-->

	<div class="white_bg"></div>
	
	<!--quick-menu-->
	<jsp:include  page="../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../include/fixed_header.jsp"></jsp:include >
	</div>
	<script type="text/javascript">
		let totalPages = <c:out value="${result.totalPages}"/>;
		let currentPage = <c:out value="${result.option.currentPage }"/>;
	
		function search(){
			$("#searchForm").submit();
		}
		
		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			let seq = $(this).data('seq');
			$("#searchForm").attr('action', "<c:url value='/board/${masterSeq}/" + seq + ".view' />").submit();
		});
	
		$(document).ready(function(){
			
			//선택 박스 값 설정
			$("#search_select").val('<c:out value="${result.option.searchOption }"/>').attr("selected", "selected");
			
			
			$("._more").click(function(){
				
				if(currentPage < totalPages){
					currentPage++;
				
					let param = $('#searchForm').serializeObject();
					param.currentPage = currentPage;
					
					let url = "<c:url value='/board/${masterSeq}/moreInfo.json' />";
					axios.get(url,{
							params: param
						})
					  .then(function (res) {
						  let content = '';
						  for(var idx = 0; idx < res.data.result.length ; idx++){
							let item = res.data.result[idx];
							
							let checkIdx = (idx+1) %3;
							if(checkIdx == 1){
								content += '<ul>';
							}
							
							content += '<li class="_row" data-seq="'+item.seq +'">';
							content += '	<div class="img_inner">';
							content += '		<img src="'+item.thumContent +'" alt="재단새소식이미지"/>';
							content += '	</div>';
							content += '	<p style="max-width:265px;">'+item.title+'</p>';
							content += '	<span>'+ new moment(item.editDate).format('lll') +'</span>';
							content += '</li>';
							
							if(checkIdx == 0){
								content += '</ul>';
							}
								
						  }
						  
						  $("._content").append(content);
						  
						  if(currentPage >= totalPages){
							  $("._more").hide();
						  }
						  
						  $("._viewCurrentPage").html('['+currentPage+'/'+totalPages+'<spring:message code="search.page" />]');
					  });
				
				}
				
			});
			
			
			$("#btnSearch").click(function(){
				search();
			});
			$("#inputKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search();
				}
			});
			
		});
	
	
	</script>
</body>
</html>
