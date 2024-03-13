<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>

<ul>
	<c:forEach items="${menus.topMenus}" var="parentMenu">
		<c:if test="${parentMenu.seq ==  parentMenuSeq}">
			<c:forEach items="${parentMenu.childs}" var="childMenu" varStatus="status">
				<c:choose>
					<c:when test="${empty childMenu.childs }">
						<c:if test="${childMenu.codeMenuType == 'head'}">
							<li class="<c:if test="${childMenuSeq == childMenu.seq }">active</c:if>">
								<a href="<c:url value='${childMenu.menuUrl }'/>" class="hvr-underline-from-left <c:if test="${childMenuSeq == childMenu.seq }">line_on</c:if>"><c:out value="${childMenu.menuName }"/></a>
							</li>
						</c:if>
					</c:when>
					<c:otherwise>
						
						<c:set var="dept2Flag" value="N"/>
						<c:forEach items="${childMenu.childs}" var="l3Menu">
							<c:if test="${fn:length(childMenu.menuName) <  fn:length(l3Menu.menuName)}">
								<c:set var="dept2Flag" value="Y"/>
							</c:if>
						</c:forEach>
						
					
						<li class="<c:if test="${dept2Flag == 'N'}">depth_01</c:if> <c:if test="${dept2Flag == 'Y' }">depth_02</c:if> <c:if test="${childMenuSeq == childMenu.seq }">active</c:if> _submenu_<c:out value='${status.count }'/>" >
<%-- 						<li class="<c:if test="${fn:length(childMenu.menuName) > 4 }">depth_01</c:if> <c:if test="${fn:length(childMenu.menuName) <= 4 }">depth_02</c:if> <c:if test="${childMenuSeq == childMenu.seq }">active</c:if>"> --%>
							<c:choose>
								<c:when test="${empty childMenu.menuUrl}">
									<a class="hvr-underline-from-left <c:if test="${childMenuSeq == childMenu.seq }">line_on</c:if>" style="cursor:default;" ><c:out value="${childMenu.menuName }"/>
								</c:when>
								<c:otherwise>
									<a href="<c:url value='${childMenu.menuUrl }'/>" class="hvr-underline-from-left <c:if test="${childMenuSeq == childMenu.seq }">line_on</c:if>"><c:out value="${childMenu.menuName }"/>
								</c:otherwise>
							</c:choose>

<%--							<a href="<c:url value='${childMenu.menuUrl }'/>" class="hvr-underline-from-left <c:if test="${childMenuSeq == childMenu.seq }">line_on</c:if>"><c:out value="${childMenu.menuName }"/>--%>
<%-- 								<img src="<c:url value='/user/img/select_arrow3.png'/>" class="arrow" alt="화살표"/> --%>
								<c:choose>
									<c:when test="${childMenuSeq == childMenu.seq }">
										<img src="<c:url value='/user/img/select_arrow4.png'/>" class="arrow" alt="화살표"/>
									</c:when>
									<c:otherwise>
										<img src="<c:url value='/user/img/select_arrow3.png'/>" class="arrow" alt="화살표"/>
									</c:otherwise>
								</c:choose>
								
								
								<c:choose>
									<c:when test="${childMenuSeq == childMenu.seq }">
										<c:set var="lv3Menu" value="${childMenu.childs}" scope="request"/>
										<img src="<c:url value='/user/img/select_arrow4.png'/>" class="arrow4" alt="화살표"/>
									</c:when>
									<c:otherwise>
										<img src="<c:url value='/user/img/select_arrow3.png'/>" class="arrow2" alt="화살표"/>
									</c:otherwise>
								</c:choose>
							</a>
							<ul>
								<c:forEach items="${childMenu.childs}" var="l3Menu">
									<c:choose>
										<c:when test="${empty l3Menu.menuUrl}">
											<li style="cursor:default;" ><c:out value="${l3Menu.menuName }"/></li>
										</c:when>
										<c:otherwise>
											<li onclick="location.href='<c:url value="${l3Menu.menuUrl }"/>'" ><c:out value="${l3Menu.menuName }"/></li>
										</c:otherwise>
									</c:choose>

								</c:forEach>
							</ul>
						</li>
					
					</c:otherwise>
				</c:choose>
			
			</c:forEach>
		</c:if>
	</c:forEach>
</ul>

