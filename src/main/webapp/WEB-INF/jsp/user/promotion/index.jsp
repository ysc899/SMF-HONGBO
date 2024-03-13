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
	<link href="<c:url value='/user/css/05_sub02.css'/>" type="text/css" rel="stylesheet"/>
	
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
	<jsp:include page="../include/login_header.jsp" flush="true"></jsp:include>
	</div>
	<!--header-->
	<!--wrap-->
	<div id="wrap">
		
		<!--container-->
			<div id="container">

					<div class="sub_menu">
						<jsp:include page="../include/submenu.jsp" flush="true"></jsp:include>
					</div>

					<div id="sub_title">
						<p><c:out value="${childMenuName }"/></p>
					</div>

					<!--sub_story-->
					<div class="sub_story">
						<ul class="tabs">
							<li class="tab-link no_bottom _promoRow _bookMenuRow" data-tab="tab-1" data-category="book">브로슈어</li>
							<li class="tab-link no_bottom _promoRow _videoMenuRow" data-tab="tab-2" data-category="video">홍보영상</li>
							<li class="tab-link no_bottom _promoRow _imageMenuRow" data-tab="tab-3" data-category="image">포토영상</li>
						</ul>
						
						
						<!--tab menu01-->
						<div id="tab-1" class="tab-content haksul01">
							<form id="bookForm" onSubmit="return false;">
								<input type="hidden" name="currentPage" value="0" id="bookCurrent"/>
								<input type="hidden" name="codeEbookCatType" value="brochure"/>
							</form>
							
							<div class="sil_box" id="bookList">
							
							</div>
							
							<div class="one_click_more_view _more" id="bookMore" data-category="book">
								<span><spring:message code="search.more" /></span><b>+</b>
							</div>

						</div>
						<!--//tab menu01 End-->
						
						<div id="tab-2" class="tab-content haksul02 tab_common">
							<form id="videoForm" onSubmit="return false;">
								<input type="hidden" name="currentPage" value="0" id="videoCurrent"/>
								<input type="hidden" name="codePromotionType" value="video"/>
							</form>
							<div class="sil_box" id="videoList">
							
							</div>
							<div class="one_click_more_view _more" id="videoMore" data-category="video">
								<span><spring:message code="search.more" /></span><b>+</b>
							</div>
						</div>
						
						<div id="tab-3" class="tab-content haksul03 tab_common">
							<form id="imageForm" onSubmit="return false;">
								<input type="hidden" name="currentPage" value="0" id="imageCurrent"/>
								<input type="hidden" name="codePromotionType" value="image"/>
							</form>
							<div class="sil_box" id="imageList">
							
							</div>
							<div class="one_click_more_view _more" id="imageMore" data-category="image">
								<span><spring:message code="search.more" /></span><b>+</b>
							</div>
						</div>

					</div>
					<!--//sub_story End-->
			</div>
			<!--//container End-->
			<jsp:include  page="../include/rolling.jsp"></jsp:include >

		<div id="top_bt">
			<span>TOP</span>
		</div>
		<!--footer-->
		<jsp:include  page="../include/footer.jsp"></jsp:include >
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
	<jsp:include  page="../include/quick2.jsp"></jsp:include >
	<!--//quick-menu-->
	<div class="red_bg"></div>
	<div class="gray_bg"></div>
	
	<div id="fixed_gnb">
		<jsp:include  page="../include/fixed_header.jsp"></jsp:include >
	</div>
	
	<!--popup-->
	<div id="modal">
		<div id="popup">
			<div class="popup_title">
				<span id="paper_name"></span>
					<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="close"/></b>
			</div>

			<div class="popup_inner">
				<iframe style="width:925px; height:520px; display: none;" id="popupIframe"
					src=""
					allowfullscreen
					allowtransparency
					allow="autoplay"
				></iframe>
				<video id="popupPlayer" playsinline controls style="width:925px; height:520px; display: none;">
<%-- 				  <source src="<c:url value='/admin/promotion/image/stream/${result.seq }.view'/>" type="video/mp4" /> --%>
				</video>
			</div>

		</div>

		<div class="popup_bg"></div>

	</div>
	<!--//popup-->
	
	
	
	<script type="text/javascript">
	
		function checkHash(){
			
			
			if (document.location.hash != ""){     //받아올 해시가 있으면
				
				var arrHash = new Array();
	
				var hash = document.location.hash;
				
				arrHash = hash.split("#");
				
				$("._"+ arrHash[1]+"MenuRow").trigger('click');
				
			}else{
				$("._promoRow").first().trigger('click');
			}
			
		}
		
		
		//해시태그 변경될때 메소드
		$(window).bind('hashchange', function() {
			checkHash();
	
		});
	
		
		//자세히보기 클릭 이벤트
		$(document).on('click', '._bookRow',function(){
			var url = $(this).data('url');
			
			var ax = screen.width;
			var ay = screen.height;
			
			var property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,scrollbars=no,copyhistory=no,";
			property += "width=" + ax + ",height=" + ay + ",left=" + 0 + ",top=" + 0;
			
			window.open(url, "ecatalog", property);
		});
		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			var url = $(this).data('url');
			var seq = $(this).data('seq');
			var title = $(this).data('title');
			
			$('#modal').stop().fadeIn(300);
			  $('#modal > .popup_bg , .close_bt').click(function(){
			    $('#modal').fadeOut(300);
			    
			    $("#popupIframe").attr('src', '');
			    $("#popupPlayer").attr('src', '');
			    $("#popupIframe").hide();
				$("popupPlayer").hide();
			    
			  });
			
			$("#paper_name").html(title);
			  
			if(CommonUtil.isEmpty(url)){
				$("#popupIframe").hide();
				$("#popupPlayer").show();
				$("#popupPlayer").attr('src', '<c:url value="/promotion/stream/'+ seq +'.view"/>');
			}else{
				$("#popupPlayer").hide();
				$("#popupIframe").show();
				$("#popupIframe").attr('src', url);
			}
			  
		});
		
		
		function getWebzineData(){
			
			var param = $('#bookForm').serializeObject();
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
						content +='	<ul class="book_ul book_gray">';
						content += '<li>';
					}else{
						content += '<li style="margin-left:50px;">';
					}
					content += ' <img src="'+ item.thumFileContent +'" class="_bookRow" data-url="'+ item.url +'" alt="ebook" style="cursor: pointer;">';
					content += ' <div style="max-width:210px;">';
					if(item.title.indexOf(']') >= 0){
						var sp = item.title.split(']');
						content += ' 	<p>'+sp[0] +']</p>';
						content += ' 	<a class="more_name _bookRow" style="letter-spacing: -1px;" data-url="'+ item.url +'">'+ sp[1] +'</a>';	
					}else{
						content += ' 	<p></p><br/>';
						content += ' 	<a class="more_name _bookRow" style="letter-spacing: -1px;" data-url="'+ item.url +'">'+ item.title +'</a>';
					}
					content += ' </div>';
					content += '</li>';
					
					if(checkIdx == 0){
						content +='	</ul>';
						content +='</div>';
					}
				  }
				  
				  $('#bookList').append(content);
				  $('#bookCurrent').val(res.data.result.currentPage);
				  
				  if(res.data.result.currentPage == res.data.result.totalPages){
				  	$('#bookMore').hide();
				  }else{
				  	$('#bookMore').show();
				  }
				  
				  if(param.currentPage == 1){
					  setTimeout(function() {
						  	$(window).scrollTop('223');
							}, 150);
					}
				  
			  });
		}
			
		function getData(category){
			var param = $('#'+ category +'Form').serializeObject();
			param.currentPage = Number(param.currentPage)+1;
			
			var url = "<c:url value='/promotion/moreInfo.json' />";
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
// 						if( (idx+1) % 8 == 5){ 
// 							content +='	<ul class="book_ul book_gray">';
// 						}else{
						content +='	<ul class="book_ul book_gray">';
// 						}
// 					}else{
// 						content += '<li style="margin-left:50px;">';
					}
					content += '<li>';
					
					content += ' <img src="'+ item.thumFileContent +'" class="thumbnail _row" data-seq="'+ item.seq +'" data-url="'+ item.url +'" data-title="'+ item.title +'" alt="'+ item.title +'" style="cursor: pointer;">';
					content += ' <img src="<c:url value='/user/img/sub/youtube_ico.png'/>" class="youtube_bt _row" data-seq="'+ item.seq +'" data-url="'+ item.url +'" data-title="'+ item.title +'" alt="play" style="cursor: pointer;">';
					content += '<div>';
// 					content += ' <b class="b1">';
					
						content += ' 	<p>'+item.title+'</p>';
					if(!CommonUtil.isEmpty(item.subTitle)){
// 						content += ' 	<span class="more_name2">'+item.title+'</span>';
// 					}else{
						content += ' 	<span class="more_name4">('+item.subTitle+')</span>';
					}
					
// 					content += ' </b>';
					content += '</div>';
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
					  
				$(".book_ul > li , .book_ul > li > strong").off('mouseover');
				$(".book_ul > li , .book_ul > li > strong").off('mouseleave');
				
				$(".book_ul > li , .book_ul > li > strong").mouseover(function(){
				    $(this).find('strong').stop().animate({bottom:'-20px'},300);
				}).mouseleave(function(){
				    $(this).find('strong').stop().animate({bottom:'-80px'},300);
				});
			});
		}
		
	
		$(document).ready(function(){
			
			
			getWebzineData();
			getData('video');
			getData('image');
			
			checkHash();
			
			$("._more").click(function(){
				var category =  $(this).data('category');
				if(category == 'book'){
					getWebzineData();
				}else{
					getData(category);
				}
				
			});
			
		});
	
	
	</script>
</body>
</html>
