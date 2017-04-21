<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<%--서브 메인이미지 --%>


<%-- 본문내용 --%>
<article id="wel_cont">
  <div id="bDel_wrap">
  
   <h2 class="hDel_title">호텔 자료 삭제</h2>
   <form method="post" action="h_del_ok.kkc">
   <input type="hidden" name="h_no" 
   value="${h.h_no}" />
   <input type="hidden" name="page" value="${page}" />
    <table id="hDel_t">
     <tr>
      <th>비밀번호</th>
      <td>
      <input type="password" name="del_pwd" id="del_pwd"
      size="14" />
      </td>
     </tr>
    </table>   
    <div id="hDel_menu">
    <input type="submit" value="삭제" />
    <input type="reset" value="취소" 
    onclick="$('#del_pwd').focus();" />
    </div>
   </form>
  </div>
</article>
<jsp:include page="../include/footer.jsp" />






