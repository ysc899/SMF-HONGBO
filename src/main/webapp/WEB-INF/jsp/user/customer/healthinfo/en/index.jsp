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
	<link href="<c:url value='/user/css/04_sub03.css'/>" type="text/css" rel="stylesheet"/>
	
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
	
		<!-- moment js -->
	<script src="<c:url value='/lib/moment/moment.min.js'/>"></script>
	<script src="<c:url value='/lib/moment/locale/ko.js'/>"></script>
	
	<!-- axios -->
	<script src="<c:url value='/lib/axios-master/dist/axios.min.js'/>"></script>
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

							 <!-- <div class="red_bar"><img src="./img/sub/red_bar.png" alt="빨강막대기"></div>

						<span>재단방문 시 참고하세요!
						</span> -->
					</div>

					<!--sub_story-->
					<div class="sub_story">

						<div class="one_search">
							<form id="searchForm" method="get">
							<span><spring:message code="healthinfo.list.search" /></span>
							<input type="text" placeholder="<spring:message code="search.hint" />" name="searchKeyword" id="inputKeyword" value="<c:out value='${ result.option.searchKeyword}'/>"/>
							<img src="<c:url value='/user/img/search.png'/>" alt="검색" id="btnSearch"/>
							</form>
						</div>


						<!--one more-->
						<div class="one_more">
							<div class="one_more_plus">
								<span><spring:message code="healthinfo.list.alllist" /></span>
								<a href="#none" class="one_more_ico"><img src="<c:url value='/user/img/plus2.png'/>" alt="플러스"/></a>
							</div>

							<div class="one_more_inner">
								<div class="one_more_inner2">
								<ul>
									<c:forEach items="${allTitle}" var="item" varStatus="status">
										<c:if test="${status.count % 4 == 1 }">
										<li class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value='${item.title }' /></li>
										</c:if>
									</c:forEach>
								</ul>
								<ul>
									<c:forEach items="${allTitle}" var="item" varStatus="status">
										<c:if test="${status.count % 4 == 2 }">
										<li class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value='${item.title }' /></li>
										</c:if>
									</c:forEach>
								</ul>
								<ul>
									<c:forEach items="${allTitle}" var="item" varStatus="status">
										<c:if test="${status.count % 4 == 3 }">
										<li class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value='${item.title }' /></li>
										</c:if>
									</c:forEach>
								</ul>
								<ul>
									<c:forEach items="${allTitle}" var="item" varStatus="status">
										<c:if test="${status.count % 4 == 0 }">
										<li class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value='${item.title }' /></li>
										</c:if>
									</c:forEach>
								</ul>
<!-- 								<ul> -->
<%-- 									<c:forEach items="${allTitle}" var="item" varStatus="status"> --%>
<%-- 										<c:if test="${status.count % 5 == 0 }"> --%>
<%-- 										<li class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value='${item.title }' /></li> --%>
<%-- 										</c:if> --%>
<%-- 									</c:forEach> --%>
<!-- 								</ul> -->

								</div>
							</div>
						</div>
						<!--//one_more End-->

						<div class="one_click">
							<!--oc_ul01-->
							<div class="oc_ul01">
							<ul class="_ulLeft">
								<c:forEach items="${result.content }" var="item" varStatus="status">
									<c:if test="${status.count % 2 == 1 }">
										<li>
											<table>
												<tbody>
													<tr>
														<td style="">
															<c:if test="${not empty item.imgTitleThumContent }">
																<img id="imgThum" style="max-width:165px; max-height:105px; width:165px; height:105px;" src="<c:out value='${item.imgTitleThumContent}'/>" alt="thumImage" class="_row" data-seq="<c:out value='${item.seq }' />"/>
															</c:if>
														</td>
														<td class="td_2 sil">
															<p class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value="${item.title }"/></p>
															<span class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value="${item.subTitle }"/></span>
															<b class="_row" data-seq="<c:out value='${item.seq }' />">Date Created : <fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></b>
														</td>
													</tr>
												</tbody>
											</table>
										</li>
									</c:if>
								</c:forEach>
							</ul>
							<ul class="_ulRight">
								<c:forEach items="${result.content }" var="item" varStatus="status">
									<c:if test="${status.count % 2 == 0 }">
										<li>
											<table>
												<tbody>
													<tr>
														<td style="max-width:">
															<c:if test="${not empty item.imgTitleThumContent }">
																<img id="imgThum" style="max-width:165px; max-height:105px; width:165px; height:105px;" src="<c:out value='${item.imgTitleThumContent}'/>" alt="thumImage" class="_row" data-seq="<c:out value='${item.seq }' />"/>
															</c:if>
														</td>
														<td class="td_2">
															<p class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value="${item.title }"/></p>
															<span class="_row" data-seq="<c:out value='${item.seq }' />"><c:out value="${item.subTitle }"/></span>
															<b class="_row" data-seq="<c:out value='${item.seq }' />">Date Created : <fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.regDate}" /></b>
														</td>
													</tr>
												</tbody>
											</table>
										</li>
									</c:if>
								</c:forEach>
							</ul>
							</div>
							<!--//oc_ul01 End-->

							<c:if test="${result.totalPages > 1}">
							<div class="one_click_more_view _more">
								<span><spring:message code="search.more" /></span><b>+</b>
							</div>
							</c:if>
							
							<!--oc_ul02-->
							<!-- 이부분 봐야함~ -->


						</div>

					</div>
					<!--//sub_story End-->

			</div>
			<!--//container End-->
		<%-- 	<jsp:include  page="../../include/rolling.jsp"></jsp:include > --%>

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
		var totalPages = <c:out value="${result.totalPages}"/>;
		var currentPage = <c:out value="${result.option.currentPage }"/>;
	
		function search(){
			$("#searchForm").submit();
		}
		
		//자세히보기 클릭 이벤트
		$(document).on('click', '._row',function(){
			var seq = $(this).data('seq');
			$("#searchForm").attr('action', "<c:url value='/customer/healthinfo/" + seq + ".view' />").submit();
		});
	
		$(document).ready(function(){
			
			$("._more").click(function(){
				
				if(currentPage < totalPages){
					currentPage++;
				
					var param = $('#searchForm').serializeObject();
					param.currentPage = currentPage;
					
					var url = "<c:url value='/customer/healthinfo/moreInfo.json' />";
					axios.get(url,{
							params: param
						})
					  .then(function (res) {
						  
						  for(var idx = 0; idx < res.data.result.length ; idx++){
							var item = res.data.result[idx];
							
							var content = '';
							content += '<li>';
							content += '	<table>';
							content += '		<tr>';
							content += '			<td>';
							content += '				<img id="imgThum" class="_row" data-seq="' + item.seq +'" style="max-width:165px; max-height:105px; width:165px; height:105px;" src="' + item.imgTitleThumContent +'" alt="thumImage" />';
							content += '			</td>';
							if(idx == res.data.result.length -1 || idx % 2 != 0){
							content += '			<td class="td_2">';
							}else{
							content += '			<td class="td_2 sil">';
							}
							content += '				<p class="_row" data-seq="' + item.seq +'">' + item.title +'</p>';
							content += '				<span class="_row" data-seq="' + item.seq +'">' + item.subTitle +'</span>';
							content += '				<b class="_row" data-seq="' + item.seq +'">Date Created : '+ moment(item.regDate).format('YYYY-MM-DD') +'</b>';
							content += '			</td>';
							content += '		</tr>';
							content += '	</table>';
							content += '</li>';
								
							if(idx % 2 == 0){
								$("._ulLeft").append(content);
							}else{
								$("._ulRight").append(content);
							}
						  }
						  
						  
						  if(currentPage >= totalPages){
							  $("._more").hide();
						  }
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
