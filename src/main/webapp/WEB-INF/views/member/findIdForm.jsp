<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="아이디 찾기" />
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
                    <h3>아이디찾기</h3>
                    <div id="detail_table">
                        <form action="${contextpath}/member/findedId.do" method="post">
                            <table>
                                <tbody>
                                    <tr class="dot_line">
                                        <td class="fixed_join">이름</td>
                                        <td><input name="member_name" type="text" size="20" /></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br><br>
                            <input    type="submit" value="찾기"> 
                        </form>
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
