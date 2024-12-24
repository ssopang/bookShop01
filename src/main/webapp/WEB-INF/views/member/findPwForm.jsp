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
		<title>비밀번호 찾기 페이지</title>
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
					<H3>비밀번호찾기</H3>
					<div id="detail_table">
						<form action="${contextpath}/member/findedPw.do" method="post">
							<table>
								<tbody>
									<tr class="dot_line">
										<td class="fixed_join">아이디</td>
										<td><input name="member_id" type="text" size="20" /></td>
									</tr>
								</tbody>
							</table>
							<br><br>
							<input	type="submit" value="찾기"> 
						</form>
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