<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="나의 주소록" />
        </jsp:include>
        <link rel="stylesheet" href="<c:url value='/resources/css/styles.css'/>">
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
                    <!-- 기본 주소 출력 -->
                    <h2>기본 배송지</h2>
                    <div class="address-box">
                        <!-- 기본 주소가 null이 아닐 때만 출력되도록 하여 오류 방지 -->
                        <c:if test="${not empty defaultAddress}">
                            <p><strong>주소 이름:</strong> ${defaultAddress.addressName}</p>
                            <p><strong>우편번호:</strong> ${defaultAddress.zipcode}</p>
                            <p><strong>도로명주소:</strong> ${defaultAddress.roadAddress}</p>
                            <p><strong>지번주소:</strong> ${defaultAddress.jibunAddress}</p>
                            <p><strong>상세주소:</strong> ${defaultAddress.namujiAddress}</p>
                        </c:if>
                        <c:if test="${empty defaultAddress}">
                            <p>기본 주소가 설정되지 않았습니다.</p>
                        </c:if>
                    </div>
                
                    <hr>
                
                    <!-- 추가 배송지 출력 -->
                    <h2>추가 배송지</h2>
                    <c:if test="${not empty additionalAddresses}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>주소 이름</th>
                                    <th>우편번호</th>
                                    <th>도로명주소</th>
                                    <th>지번주소</th>
                                    <th>상세주소</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="address" items="${additionalAddresses}">
                                    <tr>
                                        <td>${address.addressName}</td>
                                        <td>${address['zipcode']}</td>
                                        <td>${address['roadAddress']}</td>
                                        <td>${address['jibunAddress']}</td>
                                        <td>${address['namujiAddress']}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                
                    <c:if test="${empty additionalAddresses}">
                        <p>추가 배송지가 없습니다.</p>
                    </c:if>
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