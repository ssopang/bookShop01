<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="비밀번호 찾기" />
        </jsp:include>
    </head>
    <body>
        <div id="outer_wrap">
            <div id="wrap">
                <header>
                    <jsp:include page="${includeCommonPath}/header.jsp" />
                </header>
                <div class="clear"></div>
                <aside>
                    <jsp:include page="${includeCommonPath}/side.jsp" />
                </aside>
                <article>
                    <h3>비밀번호찾기</h3>
                    <div id="detail_table">
                        <c:choose>
                            <c:when test="${empty memberPw}">
                                비밀번호를 찾을 수 없습니다.
                            </c:when>
                            <c:otherwise>
                                비밀번호는 ${memberPw} 입니다.
                            </c:otherwise>
                        </c:choose>
                        <p>
                            <c:if test="${not empty memberPw}">
                               <a href="loginForm.do">로그인</a>  |
                            </c:if>
                           <a href="javascript:void(0);" onclick="history.back(-1);">뒤로가기</a>
                       </p>
                    </div>
                </article>
                <div class="clear"></div>
                <footer>
                    <jsp:include page="${includeCommonPath}/footer.jsp" />
                </footer>
            </div>
            <jsp:include page="${includeCommonPath}/quickMenu.jsp" />
        </div>
    </body>
</html>
