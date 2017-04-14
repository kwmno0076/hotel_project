<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp" %>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./admin_css/admin_cm/admin_cm_list.css" />

 <div id="adList_warp">
 <form method="get" action="admin_cm_list.kkc" onsubmit="return find-check();">
  <h1>자유게시판 관리</h1>
  
  <h3>글개수:${listcount}</h3>
  
  <table id="adList_t" border="1">
   <tr>
    <th width="7%" height="26">번호</th>
	<th width="45%">제목</th>
	<th width="15%">작성자</th>
	<th width="15%">작성일</th>
	<th width="7%">조회수</th>
	<th width="15%">수정/삭제</th>
   </tr>
   
   <c:if test="${!empty adclist}">
    <c:forEach var="list" items="${adclist}">
     <tr>
      <td align="center">${list.cm_no}</td>
      <td align="center">
       <a href="admin_cm_cont.kkc?cm_no=${list.cm_no}&page=${page}&state=cont">${list.cm_title}</a>
      </td>
      <td align="center">${list.cm_name}</td>
      <td align="center">${list.cm_date}</td>
      <td align="center">${list.cm_hit}</td>
      <td align="center">
       <input type="button" value="수정" class="btn1"
	   onclick="location='admin_cm_cont.kkc?cm_no=${list.cm_no}&page=${page}&state=edit';"/>
       <input type="button" value="삭제" class="btn1" 
       onclick="if(confirm('정말로 삭제할까요?')==true){location=
		'admin_cm_del.kkc?cm_no=${list.cm_no}&page=${page}&state=del';}else{ return; }" />
      </td>
     </tr>
    </c:forEach>
   </c:if>
   
   <c:if test="${empty adclist}">
    <tr>
     <th colspan="6">목록이 없습니다.</th>
    </tr>
   </c:if>
  </table>

  <!-- 글쓰기,전체목록 -->
  <div id="adListW_menu">
   <input type="button" value="글쓰기" class="input_b" onclick="location='admin_cm_write.kkc?page=${page}';" />
   <c:if test="${(!empty find_field) && (!empty find_name)}">
    <input type="button" value="전체목록" class="input_b" onclick="location='admin_cm_list.kkc?page=${page}';" />
   </c:if>
  </div>

  <!-- 검색폼 -->
  <div id="adFind_wrap">
   <select name="find_field">
    <option value="cm_name"
    <c:if test="${find_field=='cm_name'}">
    ${'selected'}
    </c:if>>작성자</option>
    <option value="cm_title"
    <c:if test="${find_field=='cm_title'}">
    ${'selected'}
    </c:if>>제목</option>
    <option value="cm_cont"
    <c:if test="${find_field=='cm_cont'}">
    ${'selected'}</c:if>>내용</option>
   </select>
    <input name="find_name" id="find_name" value="${find_name}" size="14" class="input_box" />
    <input type="submit" value="검색" class="input_b" />
  </div>
  <!-- 검색 끝 -->
  
  <!-- 페이징 추가 -->
  <div id="adList_paging">
   <!-- 페이징 쪽나누기 -->
   <c:if test="${(empty find_field) && (empty find_name)}">
    <c:if test="${page <= 1}">
     [이전]&nbsp;
    </c:if>
     <c:if test="${page > 1}">
      <a href="admin_cm_list.kkc?page=${page-1}">이전</a>&ndsp;
     </c:if>
   
   <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
    <c:if test="${a == page}">
     <${a}>
    </c:if>
    
    <c:if test="${a != page}">
     <a href="admin_cm_list.kkc?page=${a}">[${a}]</a>&nbsp;
    </c:if>
   </c:forEach>
   <!-- 쪽번호 출력  -->
   
   <c:if test="${page >= maxpage}">
    [다음]
   </c:if>
   <c:if test="${page < maxpage}">
    <a href="admin_cm_list.kkc?page=${page+1}">[다음]</a>
   </c:if>
  </c:if>
  
  <!-- 검색후 페이징(쪽나누기) -->
  <c:if test="${(!empty find_field) && (!empty find_name)}">
   <c:if test="${page <= 1}">
    [이전]&nbsp;
   </c:if>
   <c:if test="${page > 1}">
    <a href="admin_cm_list.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>
   
   <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
    <c:if test="${a == page}">
     <${a}>
    </c:if>
    
    <c:if test="${a != page}">
    <a href="admin_cm.list.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
   </c:forEach>
   <!-- 쪽번호 출력 -->
   
   <c:if test="${page >= maxpage}">
    [다음]
   </c:if>
   <c:if test="${page < maxpage}">
    <a href="admin_cm_list.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
   </c:if>
   
  </c:if><!-- 검색후 페이징 끝 -->
  </div><!-- 페이징 끝 -->
    
 </form> 
 </div>
 
<%@ include file="../include/footer.jsp" %>
