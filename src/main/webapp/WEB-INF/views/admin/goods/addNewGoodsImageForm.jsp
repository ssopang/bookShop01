<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="타이틀 명칭" />
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
                    <!-- 화면 내용 시작(body start) -->
                    <h1>새제품 이미지 등록창</h1>
                    <br>
                    <form action="${pageContext.request.contextPath}/admin/goods/addNewGoods.do" method="post"    enctype="multipart/form-data">
                        <table  cellspacing="0" cellpadding="0">
                            <tr>
                                <td>메인 이미지</td>
                                <td>
                                    <input type="file" name="main_image"><br>
                                </td>
                            </tr>
                            <tr>
                             <td>
                               <br>
                             </td>
                            </tr>
                            <tr>
                                <td>상세 이미지1</td>
                                <td>
                                    <input type="file" name="detail_image1"><br>
                                </td>
                            </tr>
                            <tr>
                             <td>
                               <br>
                             </td>
                            </tr>
                            <tr>
                                <td>상세 이미지2:</td>
                                <td>
                                    <input type="file" name="detail_image2"><br>
                                </td>
                            </tr>
                            <tr>
                             <td>
                               <br>
                             </td>
                            </tr>
                            <tr>
                                <td>상세 이미지3:</td>
                                <td>
                                    <input type="file" name="detail_image3"><br>
                                </td>
                            </tr>
                            <tr>
                             <td>
                               <br>
                             </td>
                            </tr>
                            
                            <tr colspan=2 >
                                <td >
                                  <br>
                                   <input    type="submit" value="제품 이미지 등록하기">
                                </td>
                            </tr>
                        </table>
                    </form>
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