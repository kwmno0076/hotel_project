<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="./css/custom.css" /><%-- css적용 --%>
<script src="./js/cm.js"></script>

</head>
<body>
<div id="container_cm">

 <div id="container_cm1">
  <h1 class="h">공지사항</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
 <div id="s_me">
 <ul>
 	<li><a href="customcenter.kkc">고객센터</a></li>
 	<li><a href="#">1:1상담</a></li>
 	<li><a href="#">자주 묻는 질문</a></li>
 </ul>
 </div>
 
 <form method="get" action="customcenter.kkc" onsubmit="return find_check();">
 <div id="table_div">
   <table id="notice" >
    <tr>
   	 <th class="no" width="8%">no</th>
	 <th class="title" width="60%">제목</th>
	 <th class="write" width="12%">작성자</th>
	 <th class="date" width="12%">작성날짜</th>
	 <th class="read" width="8%">조회수</th>
    </tr>
   
    <c:if test="${!empty blist}">
     <c:forEach var="g" items="${blist}">
      <tr>
       <td align="center">${g.gongji_no}</td>
       <td align="center">
        <a href="customcenter_cont.kkc?no=${g.gongji_no}&page=${page}" >${g.gongji_title}</a>
       </td>
       <td align="center">${g.gongji_name}</td>
       <td align="center">${g.gongji_date}</td>
       <td align="center">${g.gongji_hit}</td>
      </tr>
     </c:forEach>
    </c:if>
    <c:if test="${empty blist}">
     <tr>
      <th colspan="5">게시판 목록이 없습니다!</th>
     </tr>
    </c:if>
   
   </table>
   
  <hr/>
   
  
  <div id="table_search">
   <select name="find_field">
    <option value="gongji_title"
    <c:if test="${find_field=='gongji_title'}">${'selected'}
    </c:if>>제목</option>
    <option value="gongji_cont"
    <c:if test="${find_field=='gongji_cont'}">${'selected'}
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
	 <a href="customcenter.kkc?page=${page-1}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="customcenter.kkc?page=${a}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>
	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="customcenter.kkc?page=${page+1}">[다음]</a>
	</c:if>		
	</c:if>		

	<%--검색후 페이징 --%>
	<c:if test="${(!empty find_field) &&  
   	 (!empty find_name)}">
   	<c:if test="${page <= 1 }">
	 [이전]&nbsp;
	</c:if>
	<c:if test="${page > 1 }">
	 <a href="customcenter.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="customcenter.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>

	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="customcenter.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
	</c:if>	
   </c:if>	
  </div>
   
 </div>
 </form>
 </div><%-- container_cm1 끝 --%>
</div><%-- container_cm --%>
<%@ include file="../include/footer.jsp"%>
</body>
</html>