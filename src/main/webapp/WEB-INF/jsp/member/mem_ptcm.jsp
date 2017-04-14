<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 상단nav -->
<%@include file="../include/navbar.jsp"%>
<script src="../js/jquery.js"></script>
<script src="../js/cm.js"></script>

<div class="jumbotron" style="background-color:buttonface;">
	<ul class="list-group" style="width:200px;height:50px; display:inline-block;margin-left:400px; list-style: none;">
		<li class="list-group-item list-group-item-success">아이디:</li>
		<li class="list-group-item list-group-item-info">이름</li>
		<li class="list-group-item list-group-item-warning">핸드폰 번호</li>
		<li class="list-group-item list-group-item-danger">이메일 주소<li>
	</ul>
	<ul class="list-group" style="width:400px;height:50px; display:inline-block;margin-left:0px; list-style: none;">
		<li class="list-group-item list-group-item-success">${m.mem_id}</li>
		<li class="list-group-item list-group-item-info">${m.mem_name}</li>
		<li class="list-group-item list-group-item-warning">${m.mem_phone}</li>
		<li class="list-group-item list-group-item-danger">${m.mem_email}<li>
	</ul>
</div>
<div class="container ">
	<div class="row">
		<div class="col-md-3">
			<aside class="col-md-3" id="sidebar">
				<%@include file="include/sub_nav.jsp"%>
			</aside>



		</div>




		<div class="col-md-9 ">
			<!--  회원정보 -->
			<div class="row post">
				<table class="table-striped" style="width: 100%;">
					<tr>
						<th class="no" width="8%" style="text-align:center;">no</th>
					 	<th class="title" width="60%" style="text-align:center;">제목</th>
					 	<th class="write" width="12%" style="text-align:center;">작성자</th>
	 					<th class="date" width="12%" style="text-align:center;">작성날짜</th>
	 					<th class="read" width="8%" style="text-align:center;">조회수</th>
					</tr>
					<c:if test="${!empty blist}">
						<c:forEach var="c" items="${blist}">
							<tr>
								<td align="center">${c.pt_no}</td>
								<td align="center">
								<a	href="ptcm_cont.kkc?no=${c.pt_no}&page=${page}&state=cont">${c.pt_title}</a>
								</td>
								<td align="center">${c.pt_name}</td>
								<td align="center">${c.pt_date}</td>
								<td align="center">${c.pt_hit}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty blist}">
						<tr>
							<th colspan="5">게시판 목록이 없습니다!</th>
						</tr>
					</c:if>
				</table>
				<div id="table_search">
				<form method="get" action="mem_ptcm.kkc" onsubmit="return find_check();">
   <select name="find_field">
    <option value="pt_title"
    <c:if test="${find_field=='pt_title'}">${'selected'}
    </c:if>>제목</option>
    <option value="pt_cont"
    <c:if test="${find_field=='pt_cont'}">${'selected'}
    </c:if>>내용</option>
   </select>
   <input name="find_name" id="find_name" type="text" value="${find_name}" class="input_box"> 
   <input type="submit" value="검색" class="btn1">
   </form>
  </div>
  
  <div id="page_control">
  <%-- 검색전 페이징(쪽나누기) --%>
  <c:if test="${(empty find_field) && (empty find_name)}">		
	<c:if test="${page <= 1 }">
	 [이전]&nbsp;
	</c:if>
	<c:if test="${page > 1 }">
	 <a href="mem_ptcm.kkc?page=${page-1}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="mem_ptcm.kkc?page=${a}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>
	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="mem_ptcm.kkc?page=${page+1}">[다음]</a>
	</c:if>		
	</c:if>		

	<%--검색후 페이징 --%>
	<c:if test="${(!empty find_field) &&  
   	 (!empty find_name)}">
   	<c:if test="${page <= 1 }">
	 [이전]&nbsp;
	</c:if>
	<c:if test="${page > 1 }">
	 <a href="mem_ptcm.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
	</c:if>

	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	 <c:if test="${a == page}">
	  <${a}>
	 </c:if>

	 <c:if test="${a != page}">
	  <a href="mem_ptcm.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
	 </c:if>
	</c:forEach>
	<%-- 쪽번호 출력 --%>

	<c:if test="${page >= maxpage}">
	 [다음]
	</c:if>
	<c:if test="${page < maxpage }">
	 <a href="mem_ptcm.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
	</c:if>	
   </c:if>	
  </div>
				</div>
				</div>
				</div>
				</div>
				

</body>
</html>