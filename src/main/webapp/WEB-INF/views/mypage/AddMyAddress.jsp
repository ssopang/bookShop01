<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <jsp:include page="${includeCommonPath}/head.jsp">
            <jsp:param name="title" value="타이틀 명칭" />
        </jsp:include>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script type="text/javascript">
            function execDaumPostcode() {
              new daum.Postcode({
                oncomplete: function(data) {
                  var fullRoadAddr = data.roadAddress;
                  var extraRoadAddr = '';
            
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                  }
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                  }
            
                  document.getElementById('zipcode').value = data.zonecode;
                  document.getElementById('roadAddress').value = fullRoadAddr;
                  document.getElementById('jibunAddress').value = data.jibunAddress;
            
                  if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                  } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                  } else {
                    document.getElementById('guide').innerHTML = '';
                  }
                }
              }).open();
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
                    <h3>주소 추가</h3>
                    <form action="${contextPath}/member/addAddress.do" method="post">
                        <div id="detail_table">
                            <table>
                                <tbody>
                                    <tr class="dot_line">
                                            <td class="fixed_join">주소 이름</td>
                                            <td>
                                               <input type="text" id="address_name" name="address_name" size="30" />
                                            </td>
                                    </tr>
                                    <tr class="dot_line">
                                            <td class="fixed_join">주소</td>
                                            <td>
                                               <input type="text" id="zipcode" name="zipcode" size="10" readonly />
                                               <a href="javascript:execDaumPostcode()">우편번호 검색</a>
                                              <br>
                                              <p> 
                                               지번 주소:<br><input type="text" id="roadAddress" name="roadAddress" size="50" readonly /><br><br>
                                              도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50" readonly /><br><br>
                                              나머지 주소: <input type="text" id="namujiAddress" name="namujiAddress" size="50" />
                                               </p>
                                            </td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                            <div class="clear">
                                <br><br>
                                <table align="center">
                                <tr>
                                    <td>
                                        <input type="submit" value="주소 추가">
                                        <input type="reset" value="다시입력">
                                    </td>
                                </tr>
                            </table>
                        </div>
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