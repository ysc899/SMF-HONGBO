<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>

<header>
	<nav>
		<a href="<c:url value='/admin/login.do'/>"><img src="<c:url value='/admin/img/logo_unname.jpg' />" alt="로고"></a>
		
		<sec:authentication property="principal.adminMenus" var="adminMenus" />
		
		<ul id="nav1">
			<c:forEach var="parentMenu" items="${adminMenus}">
				<li>
					<a href="javascript:void(0);" class="more_menu _parent_menu_<c:out value='${parentMenu.seq }'/> " >${parentMenu.menuName}<span></span></a>
					<ul class="off">
						<c:forEach var="childMenu" items="${parentMenu.childs}">
							<li><a class="_childMenu_<c:out value='${childMenu.seq }'/>" href="<c:url value='${childMenu.menuUrl }index.do'  />" ><c:out value="${childMenu.menuName }"/></a></li>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</nav>
</header>


<script type="text/javascript">

	let writeFlag = false;
// 	let nowMenuName = '';


	function initMenu(){
		var acodian = {
		  click : function(target) {
		    var $target = $(target);
		    $target.on('click',function() {
		      if($(this).hasClass('on')){
		        slideUp($target);
		      }else{
		        slideUp($target);
		        $(this).addClass('on').next().slideDown(100);
		      }
		      function slideUp($target) {
		        $target.removeClass('on').next().slideUp(100);
		      }
		    });
		  }
		};
		acodian.click('.more_menu');
	}
	
	/** 메뉴 하이라이팅 */
	function selectMenu(){
		
		<c:set var="writeFlag" value="false" scope="request"/>
			
		<c:set var="nowURI" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
		
		let path = $(location).attr('pathname');
		let parentSeq = -1;
		let childSeq = -1;
		<c:forEach var="parentMenu" items="${adminMenus}">
			<c:forEach var="childMenu" items="${parentMenu.childs}">
				<c:if test='${fn:startsWith(nowURI, childMenu.menuUrl)}'>
					parentSeq = <c:out value="${parentMenu.seq}"/>;
					childSeq = <c:out value="${childMenu.seq}"/>;
					
					<c:set var="nowMenuName" value="${childMenu.menuName}" scope="request"/>
					
					writeFlag = '<c:out value="${childMenu.writeFlag}"/>' == 'Y';
					<!-- 쓰기 권한 설정 -->
					<c:if test="${childMenu.writeFlag == 'Y' }">
						<c:set var="writeFlag" value="true" scope="request"/>
					</c:if>
				</c:if>
			</c:forEach>
		</c:forEach>
		
		let parentDom = '._parent_menu_'+parentSeq;
		let childDom = '._childMenu_'+childSeq;
		$(parentDom).addClass('on').next().slideDown(100);
		$(childDom).addClass('active');
		
	}


	$(document).ready(function(){
		initMenu();
		selectMenu();
	});

</script>