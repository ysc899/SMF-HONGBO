<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>

<!--hide_menu-->
<div id="hide_menu">
	<ul>
		<c:forEach items="${menus.quickMenus }" var="item">
		<li class="_quick1" data-url="<c:out value="${item.menuUrl }"/>"><c:out value="${item.menuName }"/></li>
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
		$("._quick1").click(function(){
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