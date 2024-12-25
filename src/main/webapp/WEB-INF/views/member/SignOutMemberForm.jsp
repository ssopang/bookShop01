<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="타이틀 명칭" />
        </jsp:include>
        <script type="text/javascript">
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
                    <!-- 화면 내용 시작(body start) -->
                    <h3>회원 탈퇴 창</h3>
                    <div id="detail_table">
                        <form action="${contextPath}/member/removeMember.do" method="post">
                            <table>
                                <tbody>
                                    <tr class="dot_line">
                                        <td class="fixed_join">아이디</td>
                                        <td><input name="member_id" type="text" size="20" autofocus/></td>
                                    </tr>
                                    <tr class="solid_line">
                                        <td class="fixed_join">비밀번호</td>
                                        <td><input name="member_pw" type="password" size="20" /></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br><br>
                            <input    type="submit" value="회원탈퇴" onClick="SignOutCheck()"> 
                            <input type="button" value="다시쓰기">
                            <br><br>
                           <a href="#">고객 센터</a>
                        </form>    
                    </div>
                    <!-- 화면 내용 끝(body end) -->
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