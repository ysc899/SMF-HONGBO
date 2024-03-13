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
	<link href="<c:url value='/user/css/header.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/04_sub04.css?20230721'/>" type="text/css" rel="stylesheet"/>
	
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
    <script src="<c:url value='/user/js/common.js'/>"></script>
	<script src="<c:url value='/js/common-util.js'/>"></script>    
    
</head>

<body>
		<!--header-->
	<div id="login_header">
	<jsp:include page="../../include/login_header.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	<!--wrap-->
	<div id="wrap">
		
		<!--container-->
			<div id="container">

					<div class="sub_menu">
						<jsp:include page="../../include/submenu.jsp" flush="true"></jsp:include>
					</div>

					<div id="sub_title">
						<p><c:out value="${l3MenuName }"/></p>
					</div>

					<!--sub_story-->
					<div class="sub_story">
						<ul class="tabs">
							<li class="tab-link no_bottom _certRow" data-tab="tab-0" data-category="all"><spring:message code="search.all" /></li>
							<c:forEach items="${defaultInfo.ebookCatCodes }" var="item" varStatus="status">
								<c:if test="${item.slaveCode != 'brochure' }">
								<li class="tab-link no_bottom _certRow" data-tab="tab-<c:out value='${status.count }'/>" data-category="<c:out value='${item.slaveCode }'/>"><c:out value='${item.codeName }'/></li>
								</c:if>
							</c:forEach>
						</ul>
						<div id="tab-0" class="tab-content tab_common">
							<form id="allForm" onSubmit="return false;">
								<input type="hidden" name="currentPage" value="0" id="allCurrent"/>
								<input type="hidden" name="codeEbookCatType" value=""/>
							</form>
							<div class="sil_box" id="allList">
							
							</div>
							
							<div class="one_click_more_view _more" id="allMore" data-category="all">
								<span><spring:message code="search.more" /></span><b>+</b>
							</div>
						</div>
						<c:forEach items="${defaultInfo.ebookCatCodes }" var="item" varStatus="status">
							<c:if test="${item.slaveCode != 'brochure' }">
								<div id="tab-<c:out value='${status.count}'/>" class="tab-content tab_common">
									<form id="<c:out value='${item.slaveCode }'/>Form" onSubmit="return false;">
										<input type="hidden" name="currentPage" value="0" id="<c:out value='${item.slaveCode }'/>Current"/>
										<input type="hidden" name="codeEbookCatType" value="<c:out value='${item.slaveCode }'/>"/>
									</form>
									<div class="sil_box" id="<c:out value='${item.slaveCode }'/>List">
									
									</div>
									
									<div class="one_click_more_view _more" id="<c:out value='${item.slaveCode }'/>More" data-category="<c:out value='${item.slaveCode }'/>">
										<span><spring:message code="search.more" /></span><b>+</b>
									</div>
								</div>
							</c:if>
						</c:forEach>

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
	
	<!--quick-menu-->
	<jsp:include  page="../../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../../include/fixed_header.jsp"></jsp:include >
	</div>
	
	
	<script type="text/javascript">
		
		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			var url = $(this).data('url');
			
			var ax = screen.width;
			var ay = screen.height;
			
			var property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,scrollbars=no,copyhistory=no,";
			property += "width=" + ax + ",height=" + ay + ",left=" + 0 + ",top=" + 0;
			
			window.open(url, "ecatalog", property);
		});
		
		
		function getData(category){
			var param = $('#'+ category +'Form').serializeObject();
			param.currentPage = Number(param.currentPage)+1;
			
			var url = "<c:url value='/customer/webzine/moreInfo.json' />";
			axios.get(url,{
					params: param
				})
			  .then(function (res) {
				  var content = '';
				  for(var idx = 0; idx < res.data.result.content.length ; idx++){
					var item = res.data.result.content[idx];
					var checkIdx = (idx+1) % 4;
					if(checkIdx == 1){
						content +='<div class="sil_bg">';
// 						if( (idx+1) % 6 == 4){ 
						content +='	<ul class="book_ul book_gray">';
// 						}else{
// 							content +='	<ul class="book_ul book_gray">';
// 						}
					}
					content += '<li>';
					content += ' <img src="'+ item.thumFileContent +'" class="_row" data-url="'+ item.url +'" alt="ebook">';
// 					content += ' <strong class="strong1">';
					content += ' <div style="max-width:210px;">';
					if(item.title.indexOf(']') >= 0){
						var sp = item.title.split(']');
						content += ' 	<p>'+sp[0] +']</p>';
						content += ' 	<a class="more_name _row" data-url="'+ item.url +'">'+ sp[1] +'</a>';	
					}else{
						content += ' 	<p></p><br/>';
						content += ' 	<a class="more_name _row" data-url="'+ item.url +'">'+ item.title +'</a>';
					}
// 					content += ' 	<span class="more_bt _row" data-url="'+ item.url +'"><spring:message code="webzen.view" /></span>';
					content += ' </div>';
					content += '</li>';
					
					if(checkIdx == 0){
						content +='	</ul>';
						content +='</div>';
					}
				  }
				  
				  $('#'+category+'List').append(content);
				  $('#'+category+'Current').val(res.data.result.currentPage);
				  
				  if(res.data.result.currentPage == res.data.result.totalPages){
				  	$('#'+category+'More').hide();
				  }else{
				  	$('#'+category+'More').show();
				  }
// 				$(".book_ul > li , .book_ul > li > strong").off('mouseover');
// 				$(".book_ul > li , .book_ul > li > strong").off('mouseleave');
				
// 				$(".book_ul > li , .book_ul > li > strong").mouseover(function(){
// 				    $(this).find('strong').stop().animate({bottom:'-20px'},300);
// 				}).mouseleave(function(){
// 				    $(this).find('strong').stop().animate({bottom:'-80px'},300);
// 				});

				if(category == 'all' && param.currentPage == 1){
				  setTimeout(function() {
					  	$(window).scrollTop('223');
						}, 150);
				}
			  });
		}
		
	
		$(document).ready(function(){
			
			getData('all');
			<c:forEach items="${defaultInfo.ebookCatCodes }" var="item" varStatus="status">
				getData("<c:out value='${item.slaveCode }'/>");
			</c:forEach>
			
			$("._certRow").first().trigger('click');
			
			$("._more").click(function(){
				getData($(this).data('category'));
			});
			
			$("._search").click(function(){
				search($(this).data('category'));
			});
			$("._searchKeyword").keydown(function(evt){
				if(evt.keyCode == 13){
					search($(this).data('category'));
				}
			});
			
			
			
		});
	
	
	</script>
</body>
</html>
