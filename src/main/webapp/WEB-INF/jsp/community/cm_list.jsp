<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./css/community/cm_list.css" /><%-- css적용 --%>
<script src="./js/cm.js"></script>

<div id="container_cm"><%-- 헤더아래 배경 --%>
 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">자유게시판~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <form method="get" action="cm_list.kkc" onsubmit="return find_check();" >
 
 <div id="menubar">
  <input type="button" value="자유게시판" class="bt1" onclick="location='cm_list.kkc';"/>
  <input type="button" value="나만의포토" class="bt1" onclick="location='ptcm_list.kkc';"/>
  <c:if test="${!empty id}">
   <input type="button" value="글쓰기" class="btn" onclick="location='cm_write.kkc?page=${page}';" />
  </c:if>
  <c:if test="${empty id}">
   <input type="button" value="글쓰기" class="btn" onclick="login_check();" />
  </c:if>
  </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
<!--  <div id="imgs"> -->
<!--   <img src="./images/tm01.jpg" width="200" height="400"> -->
<!--  </div> -->
 
 <div id="table_div">
   <table id="notice" >
    <tr>
   	 <th class="no" width="8%">no</th>
	 <th class="title" width="60%">제목</th>
	 <th class="write" width="12%">작성자</th>
	 <th class="date" width="12%">작성날짜</th>
	 <th class="read" width="8%">조회수</th>
    </tr>
   
    <c:if test="${!empty clist}">
     <c:forEach var="c" items="${clist}">
      <tr>
       <td align="center">${c.cm_no}</td>
       <td align="center">
        <a href="cm_cont.kkc?no=${c.cm_no}&page=${page}&state=cont" >${c.cm_title}</a>
       </td>
       <td align="center">${c.cm_name}</td>
       <td align="center">${c.cm_date}</td>
       <td align="center">${c.cm_hit}</td>
      </tr>
     </c:forEach>
    </c:if>
    <c:if test="${empty clist}">
     <tr>
      <th colspan="5">게시판 목록이 없습니다!</th>
     </tr>
    </c:if>
   
   </table>
   
  <hr/>
   
  <div id="table_search">
   <select name="find_field">
   <option value="cm_name"
    <c:if test="${find_field=='cm_name'}">${'selected'}
    </c:if>>작성자</option>
    <option value="cm_title"
    <c:if test="${find_field=='cm_title'}">${'selected'}
    </c:if>>제목</option>
    <option value="cm_cont"
    <c:if test="${find_field=='cm_cont'}">${'selected'}
    </c:if>>내용</option>
   </select>
   <input name="find_name" id="find_name" type="text" value="${find_name}" class="input_box"> 
   <input type="submit" value="검색" class="btn1">
  </div>
  
  <div id="page_control">
  <%-- 검색전 페이징(쪽나누기) --%>
  <c:if test="${(empty find_field) && (empty find_name)}">		
	<c:if test="${page <= 1 }">
	 [이전]&nbsp;
	</c:if>
	<c:if test="${page > 1 }">
	 <a href="cm_list.kkc?page=${page-1}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="cm_list.kkc?page=${a}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>
	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="cm_list.kkc?page=${page+1}">[다음]</a>
	</c:if>		
	</c:if>		

	<%--검색후 페이징 --%>
	<c:if test="${(!empty find_field) &&  
   	 (!empty find_name)}">
   	<c:if test="${page <= 1 }">
	 [이전]&nbsp;
	</c:if>
	<c:if test="${page > 1 }">
	 <a href="cm_list.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="cm_list.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>

	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="cm_list.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
	</c:if>	
   </c:if>	
  </div>
  
  
 </div><%-- table_div끝 --%>
 
 </form> 
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>


<%@ include file="../include/footer.jsp"%>
