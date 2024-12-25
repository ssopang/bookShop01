<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>    
<script>
	function SignOutCheck() {
		const result = confirm("정말 회원탈퇴 하시겠습니까 ??");
		
		if(result) {
			return true;
		} else {
			event.preventDefault();
			event.stopPropagation();
		}
	}

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<H3>회원 탈퇴 창</H3>
	<DIV id="detail_table">
	<form action="${contextPath}/member/removeMember.do" method="post">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">아이디</TD>
					<TD><input name="member_id" type="text" size="20" autofocus/></TD>
				</TR>
				<TR class="solid_line">
					<TD class="fixed_join">비밀번호</TD>
					<TD><input name="member_pw" type="password" size="20" /></TD>
				</TR>
			</TBODY>
		</TABLE>
		<br><br>
		<INPUT	type="submit" value="회원탈퇴" onClick="SignOutCheck()"> 
		<INPUT type="button" value="다시쓰기">
		
		<Br><br>
		   <a href="#">고객 센터</a>
					   
	</form>		
</body>
</html>