<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 자유게시판 관리</title>
<script src="./js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="./admin_css/admin_gong/admin_gong.css" />
</head>
<body>
<header></header>
<div id="aMain_cont">
	<form method="get" action="admin_gongji_list.kkc"
		onsubmit="return find_check();">
		<div id="abList_wrap">
			<h2 class="abList_title">관리자 공지목록</h2>
			<div class="abList_count">글개수:${listcount}</div>
			<table id="abList_t">
				<tr>
					<th width="6%" height="26">번호</th>
					<th width="34%">제목</th>
					<th width="14%">작성자</th>
					<th width="14%">작성일</th>
					<th width="10%">조회수</th>
					<th width="22%">수정/삭제</th>
				</tr>
				<c:if test="${!empty blist}">
					<c:forEach var="g" items="${blist}">
						<tr>
							<td align="center">${g.gongji_no}</td>
							<td><a
								href="admin_gongji_cont.kkc?no=${g.gongji_no}&page=${page}&state=cont">
									<c:if test="${fn:length(g.gongji_title)>16}">
										<%-- 자료실 제목이 16자를 넘어서는 경우 실행 --%>
   ${fn:substring(g.gongji_title,0,16)}...
   <%--제목을 16자까지만 출력하고 나머지는 ... 표시 --%>
									</c:if> <c:if test="${fn:length(g.gongji_title) <16}">
   ${g.gongji_title}
  </c:if>
							</a></td>
							<td align="center">${g.gongji_name}</td>
							<td align="center">${g.gongji_date}</td>
							<td align="center">${g.gongji_hit}</td>
							<td align="center"><input type="button" value="수정"
								onclick="location=
'admin_gongji_cont.kkc?no=${g.gongji_no}&page=${page}&state=edit';" />
								<input type="button" value="삭제"
								onclick="if(confirm('정말로 삭제할까요?')==true){
location=
'admin_gongji_del.kkc?no=${g.gongji_no}&page=${page}';	
}else{return;}" />
								<%-- 자바스크립트에서 confirm()함수는 확인/취소버튼을 가진
경고창을 만들어 준다. 확인을 클릭하면 true를 반환하고,
취소를 클릭하면 false를 반환 --%></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty blist}">
					<tr>
						<th colspan="5">공지목록이 없습니다.</th>
					</tr>
				</c:if>
			</table>
			<%--페이징  --%>
			<div id="abList_paging">
				<%--검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
					<c:if test="${page > 1 }">
						<a href="admin_gongji_list.kkc?page=${page-1}">[이전]</a>&nbsp;
			</c:if>


					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
					<${a}>
				</c:if>

						<c:if test="${a != page}">
							<a href="admin_gongji_list.kkc?page=${a}">[${a}]</a>&nbsp;
				</c:if>
					</c:forEach>
					<%-- 쪽번호 출력 --%>


					<c:if test="${page >= maxpage}">
			 [다음]
			</c:if>
					<c:if test="${page < maxpage }">
						<a href="admin_gongji_list.kkc?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>
				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty find_field) &&  
   (!empty find_name)}">
					<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
					<c:if test="${page > 1 }">
						<a
							href="admin_gongji_list.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
			</c:if>


					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
					<${a}>
				</c:if>

						<c:if test="${a != page}">
							<a
								href="admin_gongji_list.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
				</c:if>
					</c:forEach>
					<%-- 쪽번호 출력 --%>


					<c:if test="${page >= maxpage}">
			 [다음]
			</c:if>
					<c:if test="${page < maxpage }">
						<a
							href="admin_gongji_list.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>
			</div>

			<%-- 검색폼 추가 --%>
			<div id="abFind_wrap">
				<select name="find_field">
					<option value="gongji_title"
						<c:if test="${find_field=='gongji_title'}">
      ${'selected'}</c:if>>제목</option>
					<option value="gongji_cont"
						<c:if test="${find_field=='gongji_cont'}">
       ${'selected'}
      </c:if>>내용</option>
				</select> <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" value="검색" />
			</div>

			<%-- 관리자 공지작성  이동--%>
			<div id="agWrite_form">
				<input type="button" value="공지작성"
					onclick="location='admin_gongji_write.kkc?page=${page}';" />
				<c:if test="${(!empty find_field) &&  
   (!empty find_name)}">
					<input type="button" value="전체목록"
						onclick="location='admin_gongji_list.kkc?page=${page}';" />
				</c:if>
			</div>
		</div>
	</form>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>












