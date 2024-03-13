<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags"%>

<!--header-->
<header>
	<c:choose>
		<c:when test="${not empty logos.leftLogo }">
			<c:choose>
				<c:when test="${not empty logos.leftLogo.url }">
					<img src="<c:out escapeXml="false" value='${logos.leftLogo.logoImage }'/>" class="left_logo_click _leftLogoClick" data-url="<c:out value='${logos.leftLogo.url }'/>"	alt="좌측로고" />
				</c:when>
				<c:otherwise>
					<img src="<c:out escapeXml="false" value='${logos.leftLogo.logoImage }'/>" class="left_logo" alt="좌측로고" />	
				</c:otherwise>
			</c:choose>
			
		</c:when>
		<c:otherwise>
			<img src="<c:url value='/user/img/logo_left.png'/>" class="left_logo"	alt="좌측로고" />
		</c:otherwise>
	</c:choose>
<%-- 	<img src="<c:url value='/user/img/logo_left2.png'/>" onClick="window.open('https://www.seegenemedical.com')" class="left_logo"	alt="좌측로고" /> --%>
		<c:choose>
			<c:when test="${not empty logos.centerLogo }">
				<h1 class="logo"><a href="<c:url value='/'/>" style="background: url('<c:out escapeXml="false" value='${logos.centerLogo.logoImage }'/>') no-repeat 0 0;"></a></h1>
			</c:when>
			<c:otherwise>
				<h1 class="logo"><a href="<c:url value='/'/>"></a></h1>
			</c:otherwise>
		</c:choose>
<%-- 		<h1 class="logo"><a href="<c:url value='/'/>"></a></h1> --%>
			<div class="search">

				<b class="search_bar"></b>
				<form id="headerSearchForm" method="get" action="">
				<select name="searchOption" id="search_arrow">
					<option value="test">검사항목 조회</option>
					<option value="all">전체</option>
				</select>

				<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요." id="headerSearchWord">
				<img src="<c:url value='/user/img/search.png'/>" alt="검색아이콘" class="_headerSearchBtn">
				</form>
			</div>

	<nav id="menu_bar">

		<ul>
	 	<c:forEach items="${menus.topMenus}" var="parentMenu" varStatus="status">
	 		<li class="hvr-bounce-to-bottom gnb_on0<c:out value='${status.count }'/>">
				<a href="javascript:void(0);"><c:out value="${parentMenu.menuName }"/></a>
			</li>
		</c:forEach>
		</ul>
	
	</nav>

<!--//header End-->
</header>
<!--//header End-->


<form id="headerHiddenTestForm">
	<input type="hidden" name="searchFlag" value="Y"/>
	<input type="hidden" name="searchKeyword" value="Y" id="headerHiddenTestSearchKeyword"/>
</form>
<form id="headerHiddenAllSearchForm">
	<input type="hidden" name="searchKeyword" value="Y" id="headerHiddenAllSearchKeyword"/>
</form>



<script type="text/javascript">


	$(document).ready(function(){
		
		
		
		
		//상단 검색 관련
		$("#headerSearchWord").keydown(function(evt){
			if(evt.keyCode == 13){
				$("._headerSearchBtn").trigger('click');
				return false;
			}
		});
		
		$("._headerSearchBtn").click(function(){
			var param = $('#headerSearchForm').serializeObject();
			
			if(param.searchOption == 'test'){
				$("#headerHiddenTestSearchKeyword").val(param.searchKeyword);
				$("#headerHiddenTestForm").attr('action', "<c:url value='/task/test/index.do' />").submit();
			}else{
				$("#headerHiddenAllSearchKeyword").val(param.searchKeyword);
				$("#headerHiddenAllSearchForm").attr('action', "<c:url value='/search/index.do' />").submit();
			}
		});
		
		//왼쪽 베너 클릭 관련
		$("._leftLogoClick").click(function(){
			var logoUrl = $(this).data('url');
			if(!CommonUtil.isEmpty(logoUrl)){
				window.open(logoUrl, '_blank');
			}
		});
		
	});

</script>


