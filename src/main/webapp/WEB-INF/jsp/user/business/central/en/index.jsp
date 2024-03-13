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
	<link href="<c:url value='/user/css/header_en.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/footer.css'/>" type="text/css" rel="stylesheet"/>
	<link href="<c:url value='/user/css/02_sub03_en.css'/>" type="text/css" rel="stylesheet"/>

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
	<!-- underscore -->
	<script src="<c:url value='/lib/underscore-master/underscore-min.js'/>"></script>

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

			<ul class="big_tabs">
				<c:forEach items="${defaultInfo.centerCodes }" var="item" varStatus="status">
					<li class="center0<c:out value='${status.count }'/> _center _center_<c:out value='${item.slaveCode }'/>" data-center="<c:out value='${item.slaveCode }'/>"><c:out value='${item.codeName }'/><span></span></li>
				</c:forEach>

				<!-- 						 <li class="center01 _center _center_seoul" data-center="seoul">본원<span></span></li> -->
				<!-- 						 <li class="center02 _center _center_other" data-center="other">지역검사센터<span></span></li> -->
			</ul>

			<c:forEach items="${defaultInfo.centerCodes }" var="item" varStatus="status">
				<ul class="tabs<c:out value='${status.count }'/> _center_tabs _center_tabs_<c:out value='${item.slaveCode }'/>" style="display: none;">

					<c:forEach items="${defaultInfo.certCodes }" var="item2" varStatus="status2">
						<li class="tab-link no_bottom _certRow" data-tab="tab-<c:out value='${status.count }'/>-<c:out value='${status2.count }'/>" data-category="<c:out value='${item2.slaveCode }'/>" data-center="<c:out value='${item.slaveCode }'/>"><c:out value='${item2.codeName }'/></li>
					</c:forEach>
				</ul>

			</c:forEach>


			<c:forEach items="${defaultInfo.centerCodes }" var="ctitem" varStatus="ctstatus">

				<c:forEach items="${defaultInfo.certCodes }" var="item" varStatus="status">
					<div id="tab-<c:out value='${ctstatus.count }'/>-<c:out value='${status.count }'/>" class="tab-content tab_common">
						<div class="one_search">
							<form id="<c:out value='${ctitem.slaveCode }'/><c:out value='${item.slaveCode }'/>Form" onSubmit="return false;">
								<span><spring:message code="search.msg" /></span>
								<input type="text" class="_searchKeyword" name="searchKeyword" placeholder="<spring:message code="search.hint" />" data-center="<c:out value='${ctitem.slaveCode }'/>" data-category="<c:out value='${item.slaveCode }'/>"/>
								<img class="_search" src="<c:url value='/user/img/search.png'/>" alt="검색" data-center="<c:out value='${ctitem.slaveCode }'/>" data-category="<c:out value='${item.slaveCode }'/>"/>
								<input type="hidden" name="currentPage" value="0" id="<c:out value='${ctitem.slaveCode }'/><c:out value='${item.slaveCode }'/>Current"/>
								<input type="hidden" name="codeCertType" value="<c:out value='${item.slaveCode }'/>"/>
								<input type="hidden" name="codeCenterType" value="<c:out value='${ctitem.slaveCode }'/>"/>
							</form>
						</div>

						<div class="sil_box" id="<c:out value='${ctitem.slaveCode }'/><c:out value='${item.slaveCode }'/>List">
						</div>

						<div class="one_click_more_view _more" id="<c:out value='${ctitem.slaveCode }'/><c:out value='${item.slaveCode }'/>More" data-center="<c:out value='${ctitem.slaveCode }'/>" data-category="<c:out value='${item.slaveCode }'/>">
							<span><spring:message code="search.more" /></span><b>+</b>
						</div>
					</div>
				</c:forEach>
			</c:forEach>

		</div>
		<!--//sub_story End-->
	</div>
	<!--//container End-->
	<%--			<jsp:include  page="../../include/rolling.jsp"></jsp:include >--%>

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


<!--popup-->
<div id="modal">
	<div id="popup">
		<div class="popup_title">
			<span id="paper_name"></span>
			<div class="right_ico">
				<img class="_print" src="<c:url value='/user/img/sub/03sub_ico05.png'/>" alt="<spring:message code="cret.print" />" style="cursor:pointer;" title="<spring:message code="cret.print" />" id="certModalPrint"/>
				<img src="<c:url value='/user/img/sub/sil5.png'/>" alt="실" class="sil"/>
				<img class="_download" src="<c:url value='/user/img/sub/03sub_ico06.png'/>" alt="<spring:message code="cret.download" />" style="cursor:pointer;" title="<spring:message code="cret.download" />" id="certModalDownload"/>
			</div>
			<b class="close_bt"><img src="<c:url value='/user/img/sub/close.png'/>" alt="close"/></b>
		</div>

		<div class="popup_inner">
			<img id="certModalImg" class="paper"/>
		</div>

	</div>

	<div class="popup_bg"></div>

</div>
<!--//popup-->

<div id="printArea" style="display: none;">
	<img id="printImg" style="width:100%;height:100%;" />
</div>


<script type="text/javascript">

	//자세히보기 클릭 이벤트
	$(document).on('click', '._row',function(){
		var seq = $(this).data('seq');
		var title = $(this).data('title');


		var url = "<c:url value='/inspection/cert/stream/"+ seq +".json' />";
		axios.get(url)
				.then(function (res) {
					$("#paper_name").html(title);
					$(".paper").attr('src', res.data.result);


					$("#certModalDownload").data('seq', seq);
					$("#certModalPrint").data('seq', seq);

					$('#modal').stop().fadeIn(300);
					$('#modal > .popup_bg , .close_bt').click(function(){
						$('#modal').fadeOut(300);
					});
				});
	});
	//다운로드
	$(document).on('click', '._download',function(){
		var seq = $(this).data('seq');
		location.href='<c:url value="/inspection/cert/download/"/>'+seq+'.do';
	});
	//출력
	$(document).on('click', '._print',function(){
		var seq = $(this).data('seq');

		var url = "<c:url value='/inspection/cert/stream/"+ seq +".json' />";
		axios.get(url)
				.then(function (res) {
					$("#printArea").show();
					$("#printImg").attr('src', res.data.result);
					$("#printArea").printThis({
						importCSS: false,
						printDelay: 333
					});
					setTimeout(function(){
						$("#printArea").hide();
					}, 1000);
				});
	});

	function search(center, category){

		$('#'+center+category+'List').html('');
		$('#'+center+category+'Current').val(0);
		getData(center, category);
	}

	function getData(center, category){
		var param = $('#'+center+ category +'Form').serializeObject();
		param.currentPage = Number(param.currentPage)+1;

		var url = "<c:url value='/inspection/cert/moreInfo.json' />";
		axios.get(url,{
			params: param
		})
				.then(function (res) {
					var content = '';

					if(center == 'seoul'){

						<c:forEach items="${defaultInfo.certLocCodes }" var="item" varStatus="status">

						var <c:out value='${item.slaveCode }'/> = _.filter(res.data.result.content, function(t){return t.codeCertLocType == "<c:out value='${item.slaveCode }'/>"});
						if(<c:out value='${item.slaveCode }'/>.length > 0){
							content +=  '<p class="sub_title">${item.codeName }</p>';
							content += printContent(<c:out value='${item.slaveCode }'/>);
						}
						</c:forEach>


					}else{
						content = printContent(res.data.result.content);
					}

					$('#'+center+category+'List').append(content);
					$('#'+center+category+'Current').val(res.data.result.currentPage);

					if(res.data.result.currentPage == res.data.result.totalPages){
						$('#'+center+category+'More').hide();
					}else{
						$('#'+center+category+'More').show();
					}

					if(param.currentPage == 1){
						setTimeout(function() {
							$(window).scrollTop('223');
						}, 150);
					}

				});
	}

	function printContent(items){

		var content = '';

		for(var idx = 0; idx < items.length ; idx++){
			var item = items[idx];
			var checkIdx = (idx+1) % 2;
			if(checkIdx == 1){
				content +='<div class="sil_bg">';
				if( (idx+1) % 6 == 4){
					content +='	<ul class="book_ul book_gray">';
				}else{
					content +='	<ul class="book_ul">';
				}
			}


			content += '<li>';
			content += ' <table><tbody><tr>';
			content += '  <td>';
			content += '   <img src="'+ item.thumFileContent +'" class="_row" data-seq="'+ item.seq +'" data-title="'+ item.title +'" alt="인증서">';
			content += '  </td>';
			content += '  <td>';
			content += ' 	<p class="b2 _row" data-seq="'+ item.seq +'" title="view">'+ item.title +'</p>';
			content += ' 	<span class="i_title"><spring:message code="cret.sub1" /> : </span>';
			content += ' 	<span class="i_time" >'+ item.issuingAgency +'</span>';
			content += ' 	<span class="i_title"><spring:message code="cret.sub2" /> : </span>';
			content += ' 	<span class="i_story">'+ item.content +'</span>';
			content += '    <ul>';
			content += ' 	 <li title="<spring:message code="cret.print" />" class="_print" data-seq="'+ item.seq +'"></li>';
			content += ' 	 <li></li>';
			content += ' 	 <li title="<spring:message code="cret.download" />" class="_download" data-seq="'+ item.seq +'"></li>';
			content += '    </ul>';
			content += '  </td>';
			content += ' </tr></tbody></table>';
			content += '</li>';

			if(checkIdx == 0 || idx == items.length-1){
				content +='	</ul>';
				content +='</div>';
			}
		}
		return content;
	}



	$(document).ready(function(){


		<c:forEach items="${defaultInfo.centerCodes }" var="ctitem" varStatus="ctstatus">
		<c:forEach items="${defaultInfo.certCodes }" var="item" varStatus="status">
		getData("<c:out value='${ctitem.slaveCode }'/>", "<c:out value='${item.slaveCode }'/>");
		</c:forEach>
		</c:forEach>



		$("._certRow").click(function(){
			$("._center_tabs").hide();
			var center = $(this).data('center');

			$("._center_"+center).removeClass('open');
			$("._center_"+center).addClass('on');

			var tab = $(this).data('tab');

			$(".tab_common").each(function(){
				$(this).removeClass('current');
			});
			$("._certRow").each(function(){
				$(this).removeClass('current');
			});

			$(this).addClass('current');
			$("#"+tab).addClass('current');


		});

		$("._certRow").first().trigger('click');

		$("._center").click(function(){


			var cls = $(this).attr('class').split(' ');
			if(_.contains(cls, 'open')){
				$(this).removeClass('open');
				$(this).addClass('on');
				$("._center_tabs").hide();
				return;
			}

			var center = $(this).data('center');
			$("._center").removeClass('on');
			$("._center").removeClass('open');
			$("._center_"+center).addClass('open');

			$("._center_tabs").hide();
			$("._center_tabs_"+center).show();
		});



		$("._more").click(function(){
			getData($(this).data('category'));
		});

		$("._search").click(function(){
			search($(this).data('center'), $(this).data('category'));
		});
		$("._searchKeyword").keydown(function(evt){
			if(evt.keyCode == 13){
				search($(this).data('center'), $(this).data('category'));
			}
		});



	});


</script>
</body>
</html>
