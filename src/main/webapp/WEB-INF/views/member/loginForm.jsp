<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="타이틀 명칭" />
        </jsp:include>
        <c:if test='${not empty message }'>
            <script type="text/javascript">
                window.onload=function()
                {
                  result();
                }
                
                function result(){
                    alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
                }
            </script>
        </c:if>
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
                    <h3>회원 로그인 창</h3>
                    <div id="detail_table">
                        <form action="${contextPath}/member/login.do" method="post">
                            <table>
                                <tbody>
                                    <tr class="dot_line">
                                        <td class="fixed_join">아이디</td>
                                        <td><input name="member_id" type="text" size="20" /></td>
                                    </tr>
                                    <tr class="solid_line">
                                        <td class="fixed_join">비밀번호</td>
                                        <td><input name="member_pw" type="password" size="20" /></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br><br>
                            <input type="submit" value="로그인"> 
                            <input type="button" value="초기화">
                            
                            <br><br>
                           <a href="#">아이디 찾기</a>  | 
                           <a href="#">비밀번호 찾기</a> | 
                           <a href="${contextPath}/member/addMember.do">회원가입</a>    | 
                           <a href="#">고객 센터</a>
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