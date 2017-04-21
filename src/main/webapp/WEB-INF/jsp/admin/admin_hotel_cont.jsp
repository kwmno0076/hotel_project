<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/admin_header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<script src="./js/jquery.js"></script>



<%-- 본문내용 --%>
<article id="wel_cont">
  <div id="hWrite_wrap">
   <h2 class="hw_title">호텔 세부사항</h2>
   
   <table class="hcont_t">
    <tr>
     <th>제목</th> <td>${h.h_title}</td>
    </tr>
    <tr>
     <th>내용</th> <td>${h.h_cont}</td>
    </tr>
    <tr>
     <th>조회수</th> <td>${h.h_hit}</td>    
    </tr>
    
    <c:if test="${!empty h.h_file}">
    <tr>
     <th>첨부파일</th>
     <td>
     
     <div class="bxslider" id="lightGallery">
     <c:if test="${!empty h.h_file}">
	  <c:forTokens var="ima" items="${h.h_file}" delims="," varStatus="sts">
	  <c:if test="${!ima.equals('null')}">
        ${h.h_file}
      </c:if>
      </c:forTokens>
      </c:if>
       </div>
     
     </td>
    </tr>
    </c:if>
   </table>
   <div id="hw_menu">
    <input type="button" value="수정"
onclick=
"location=
'admin_hotel_cont.kkc?h_no=${h.h_no}&page=${page}&state=edit';" />
     <input type="button"
				value="삭제" onclick="location='/project/admin_hotel_del_ok.kkc?h_no=${h.h_no}';" />
     <input type="button" value="목록"
 onclick="location='admin_hotel_list.kkc?page=${page}';" />
   </div>
  </div>
</article>

<jsp:include page="../include/footer.jsp" />










