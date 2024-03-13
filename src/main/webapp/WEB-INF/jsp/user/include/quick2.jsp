<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>

<!--hide_menu-->
<div id="hide_menu2">
	<ul>
		<c:forEach items="${menus.quickMenus }" var="item">
		
			<!-- 2020.11.24 - Quick 메뉴 줄바꿈이 깨짐 -->
			<c:if test="${item.menuName eq 'How to request test'}">
				<li class="_quick2" style="line-height:16px;" data-url="<c:out value="${item.menuUrl }"/>"><c:out value="${item.menuName }"/></li>
			</c:if>
			<c:if test="${item.menuName ne 'How to request test'}">
				<li class="_quick2" data-url="<c:out value="${item.menuUrl }"/>"><c:out value="${item.menuName }"/></li>
			</c:if>
			
		</c:forEach>
		<li class="quick_last">
			<a href="https://business.facebook.com/mf.seegene/?business_id=416515292176171" target="_blank" class="facebook" title="씨젠의료재단 SNS/facebook"></a>
			<a href="https://www.youtube.com/channel/UCusPMVb6AUr0WE1XO1RNZew" target="_blank" class="youtube" title="씨젠의료재단 youtube"></a>
		</li>
		<li class="_quick1" data-url="https://blog.naver.com/seegenemedical"><c:out value="BLOG"/></li>
	</ul>
</div>
<!--//hide_menu-->


<script type="text/javascript">
	$(document).ready(function(){
		$("._quick2").click(function(){
			var url = $(this).data('url');
			if(url.indexOf('http') == -1){
				location.href = "<c:url value='"+ url +"'/>";
			}else{
				
				if(url == 'http://757.co.kr/seegene'){
					window.open(url, 'win', 'width=550, height=740');
				}else{
					window.open(url, 'win', 'width=1100, height=740');
				}
			}
			
		});
	});
</script>