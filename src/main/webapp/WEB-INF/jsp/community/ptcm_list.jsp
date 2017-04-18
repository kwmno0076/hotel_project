<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./css/community/ptcm_list.css" /><%-- css적용 --%>
<script src="./js/cm.js"></script>

<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">나만의 포토~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <form method="get" action="ptcm_list.kkc" onsubmit="return find_check();" >
 
 <div id="menubar">
  <input type="button" value="자유게시판" class="bt1" onclick="location='cm_list.kkc';"/>
  <input type="button" value="나만의포토" class="bt1" onclick="location='ptcm_list.kkc';"/>
  <c:if test="${!empty id}">
   <input type="button" value="글쓰기" class="btn" onclick="location='ptcm_write.kkc?page=${page}';" />
  </c:if>
  <c:if test="${empty id}">
   <input type="button" value="글쓰기" class="btn" onclick="login_check();" />
  </c:if>
 </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
  
  <div id="line"><%-- 4칸짜리 한줄 큰틀 --%>
  
  <c:if test="${!empty plist}">
   <c:forEach var="p" items="${plist}">
    <div class="line_1"><%--4칸짜리안에 작은틀 끝 --%>
    <ul>
     <li><a href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">
     <c:if test="${!empty p.pt_file}">
     <c:forTokens var="ima" items="${p.pt_file}" delims="," end="0">
     <img src="./upload/${ima}" width="250" height="200" />
     </c:forTokens>
     </c:if>
     </a></li>
     <li>제목:<a href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_title}</a></li>
     <li>작성자:<a href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_name}</a></li>
     <li>조회수:<a href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_hit}</a></li>
     <li>작성날짜:<a href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_date}</a></li>    </ul>
   </div><%--4칸짜리안에 작은틀 끝 --%>
   </c:forEach>
  </c:if>
  
  <c:if test="${empty plist}">
      <h1>게시판 목록이 없습니다</h1>
  </c:if>
   
  </div><!-- 4칸짜리 큰틀 -->  
  
  
  <div class="clear"></div><%-- 빈공백 제거 --%>
  
  <hr/>
  
  <div id="table_search">
   <select name="find_field">
   <option value="pt_name"
    <c:if test="${find_field=='pt_name'}">${'selected'}
    </c:if>>작성자</option>
    <option value="pt_title"
    <c:if test="${find_field=='pt_title'}">${'selected'}
    </c:if>>제목</option>
    <option value="pt_cont"
    <c:if test="${find_field=='pt_cont'}">${'selected'}
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
	 <a href="ptcm_list.kkc?page=${page-1}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="ptcm_list.kkc?page=${a}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>
	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="ptcm_list.kkc?page=${page+1}">[다음]</a>
	</c:if>		
	</c:if>		

	<%--검색후 페이징 --%>
	<c:if test="${(!empty find_field) &&  
   	 (!empty find_name)}">
   	<c:if test="${page <= 1 }">
	 [이전]&nbsp;
	</c:if>
	<c:if test="${page > 1 }">
	 <a href="ptcm_list.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="ptcm_list.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>

	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="ptcm_list.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
	</c:if>	
   </c:if>	
  </div>
  
  </form>
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>

<%@ include file="../include/footer.jsp"%>
