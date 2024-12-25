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
                    <div id="ad_main_banner">
                        <ul class="bjqs">         
                          <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner01.jpg"></li>
                            <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner02.jpg"></li>
                            <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner03.jpg"></li> 
                        </ul>
                    </div>
                    <div class="main_book">
                       <c:set  var="goods_count" value="0" />
                        <h3>베스트셀러</h3>
                        <c:forEach var="item" items="${goodsMap.bestseller }">
                           <c:set  var="goods_count" value="${goods_count+1 }" />
                            <div class="book">
                                <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
                                <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
                                </a> 
                                    <img width="121" height="154" 
                                         src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
                    
                                <div class="title">${item.goods_title }</div>
                                <div class="price">
                                     <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
                                      ${goods_price}원
                                </div>
                            </div>
                           <c:if test="${goods_count==15   }">
                             <div class="book">
                               <font size=20> <a href="#">more</a></font>
                             </div>
                         </c:if>
                      </c:forEach>
                    </div>
                    <div class="clear"></div>
                    <div id="ad_sub_banner">
                        <img width="770" height="117" src="${contextPath}/resources/image/sub_banner01.jpg">
                    </div>
                    <div class="main_book" >
                    <c:set  var="goods_count" value="0" />
                        <h3>새로 출판된 책</h3>
                        <c:forEach var="item" items="${goodsMap.newbook }" >
                           <c:set  var="goods_count" value="${goods_count+1 }" />
                            <div class="book">
                              <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
                               <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
                              </a>
                             <img width="121" height="154" 
                                    src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
                            <div class="title">${item.goods_title }</div>
                            <div class="price">
                                <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
                                   ${goods_price}원
                              </div>
                        </div>
                         <c:if test="${goods_count==15   }">
                         <div class="book">
                           <font size=20> <a href="#">more</a></font>
                         </div>
                       </c:if>
                        </c:forEach>
                    </div>
                    
                    <div class="clear"></div>
                    <div id="ad_sub_banner">
                        <img width="770" height="117" src="${contextPath}/resources/image/sub_banner02.jpg">
                    </div>
                    
                    
                    <div class="main_book" >
                    <c:set  var="goods_count" value="0" />
                        <h3>스테디셀러</h3>
                        <c:forEach var="item" items="${goodsMap.steadyseller }" >
                           <c:set  var="goods_count" value="${goods_count+1 }" />
                            <div class="book">
                              <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
                               <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
                              </a>
                             <img width="121" height="154" 
                                    src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
                            <div class="title">${item.goods_title }</div>
                            <div class="price">
                                <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
                                   ${goods_price}원
                              </div>
                        </div>
                         <c:if test="${goods_count==15   }">
                         <div class="book">
                           <font size=20> <a href="#">more</a></font>
                         </div>
                       </c:if>
                        </c:forEach>
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