<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglib_import.jsp" %>
<script type="text/javascript">
	function fnMvCategoryPage(categoryNo){
		var url="${contextPath}/goods/goodsList.do";
		var frm = $('<form></form>');
		frm.attr('action',url);
		frm.attr('method','post');

		var goods_sort = '';
		var goods_sort_type = '';
		switch (categoryNo) {
    		case "01": goods_sort_type = "도서";goods_sort="IT/인터넷"; break;
            case "02": goods_sort_type = "도서";goods_sort="경제/경영"; break;
            case "03": goods_sort_type = "도서";goods_sort="대학교재"; break;
            case "04": goods_sort_type = "도서";goods_sort="자기계발"; break;
            case "05": goods_sort_type = "도서";goods_sort="자연과학/공학"; break;
            case "06": goods_sort_type = "도서";goods_sort="역사/인문학"; break;
            case "07": goods_sort_type = "음반";goods_sort="가요"; break;
            case "08": goods_sort_type = "음반";goods_sort="록"; break;
            case "09": goods_sort_type = "음반";goods_sort="클래식"; break;
            case "10": goods_sort_type = "음반";goods_sort="뉴에이지"; break;
            case "11": goods_sort_type = "음반";goods_sort="재즈"; break;
            case "12": goods_sort_type = "음반";goods_sort="기타"; break;
    		default:
    			break;
		}

		frm.append("<input type=\"hidden\" name=\"goods_sort\" value=\""+goods_sort+"\">");
		frm.append("<input type=\"hidden\" name=\"goods_sort_type\" value=\""+goods_sort_type+"\">");
		frm.appendTo(document.body);
		frm.submit();
		frm.remove();
	}
</script>

<nav>
<ul>
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li>
        <h3>주요기능</h3>
        <ul>
            <li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
            <li><a href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
            <li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
            <li><a href="#">배송관리</a></li>
            <li><a href="#">게시판관리</a></li>
        </ul>
    </li>
</c:when>
<c:when test="${side_menu=='my_page' }">
    <li>
        <h3>주문내역</h3>
        <ul>
            <li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li>
            <li><a href="${contextPath}/mypage/listMyReturnHistory.do">반품/교환 신청 및 조회</a></li>
            <li><a href="${contextPath}/mypage/listMyCancleHistory.do">취소 주문 내역</a></li>
            <li><a href="#">세금 계산서</a></li>
        </ul>
    </li>
    <li>
        <h3>정보내역</h3>
        <ul>
            <li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li>
            <li><a href="${contextPath}/mypage/myAddresses.do">나의 주소록</a></li>
            <li><a href="#">개인정보 동의내역</a></li>
            <li><a href="${contextPath}/member/SignOutMemberForm.do">회원탈퇴</a></li>
            <li><a href="${contextPath}/mypage/AddMyAddress.do">배송지 추가</a></li>
        </ul>
    </li>
</c:when>
<c:otherwise>
    <li>
        <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국내외 도서</h3>
        <ul>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('01')">IT/인터넷</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('02')">경제/경영</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('03')">대학교재</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('04')">자기계발</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('05')">자연과학/공학</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('06')">역사/인문학</a></li>
        </ul>
    </li>
    <li>
        <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;음반</h3>
        <ul>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('07')">가요</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('08')">록</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('09')">클래식</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('10')">뉴에이지</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('11')">재즈</a></li>
            <li><a href="javascript:void(0);" onclick="fnMvCategoryPage('12')">기타</a></li>
        </ul>
    </li>
 </c:otherwise>
</c:choose>    
</ul>
</nav>
<div class="clear"></div>
<div id="banner">
    <a href="#"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div>
<div id="notice">
    <h2>공지사항</h2>
    <ul>
    
    <c:forEach  var="i" begin="1" end="5" step="1">
        <li><a href="#">공지사항입니다.${ i}</a></li>
    </c:forEach>
    </ul>
</div>


<div id="banner">
    <a href="#"><img width="190" height="362" src="${contextPath}/resources/image/side_banner1.jpg"></a>
</div>
<div id="banner">
    <a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>
<div id="banner">
    <a href="#"><img width="190" height="69" src="${contextPath}/resources/image/QnA_logo.jpg"></a>
</div>
</html>