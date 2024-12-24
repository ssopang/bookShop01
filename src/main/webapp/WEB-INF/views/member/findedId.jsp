<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
		<link href="${contextPath}/resources/css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
		<link href="${contextPath}/resources/css/mobile.css" rel="stylesheet" type="text/css">
		<script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script>
		<script>
			// 슬라이드 
			$(document).ready(function() {
				$('#ad_main_banner').bjqs({
					'width' : 775,
					'height' : 145,
					'showMarkers' : true,
					'showControls' : false,
					'centerMarkers' : false
				});
			});
			// 스티키 		
			$(function() {
				$("#sticky").stickySidebar({
					timer : 100,
					easing : "easeInBounce"
				});
			});
		</script>
		<title>로그인 페이지</title>
	</head>
	<body>
		<div id="outer_wrap">
			<div id="wrap">
				<header>
					<%@ include file="/WEB-INF/views/common/header.jsp" %>
				</header>
				<div class="clear"></div>
				<aside>
					<%@ include file="/WEB-INF/views/common/side.jsp" %>
				</aside>
				<article>
					<H3>아이디찾기</H3>
					<div id="detail_table">
						<c:choose>
							<c:when test="${empty memberId}">
								아이디를 찾을 수 없습니다.
							</c:when>
							<c:otherwise>
								아이디는 ${memberId} 입니다.
							</c:otherwise>
						</c:choose>
						<p>
							<c:if test="${not empty memberId}">
							   <a href="loginForm.do">로그인</a>  |
							   <a href="findPwForm.do">비밀번호찾기</a>  |
							</c:if>
						   <a href="javascript:void(0);" onclick="history.back(-1);">뒤로가기</a>
					   </p>
					</div>
				</article>
				<div class="clear"></div>
				<footer>
					<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	        	</footer>
			</div>
			<%@ include file="/WEB-INF/views/common/quickMenu.jsp" %>
	    </div>
	</body>
</html>