<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./admin_css/admin.css" />
<link rel="stylesheet" type="text/css" href="./admin_css/ad_main.css" />
<link rel="stylesheet" type="text/css" href="./admin_css/admin_mem/admin_mem.css" />
</head>
<body>
	<%--관리자 메인본문 --%>
	<%--가운데 div --%>


	<div id="aMain_cont">
		<form method="get" action="admin_mem_list.kkc"
			onsubmit="return find_check();">
			<div id="abList_wrap">
				<h2 class="abList_title">관리자 회원목록</h2>
				<div class="abList_count">회원수:${listcount}</div>
				<table id="abList_t">
					<tr>
						<th width="20%" height="26">아이디</th>
						<th width="14%">회원이름</th>
						<th width="18%">폰번호</th>
						<th width="16%">가입/탈퇴</th>
						<th width="18%">가일날짜</th>
						<th width="22%">수정/삭제</th>
					</tr>
					<c:if test="${!empty blist}">
						<c:forEach var="m" items="${blist}">
							<tr>
								<td align="center">${m.mem_id}</td>
								<td><a
									href="admin_mem_info.kkc?id=${m.mem_id}&page=${page}&state=cont">${m.mem_name}</a>
								</td>
								<td align="center">${m.mem_phone}</td>
								<td align="center"><c:if test="${m.mem_state ==1}">가입회원</c:if>
									<c:if test="${m.mem_state ==2}">탈퇴회원</c:if></td>
								<td align="center">${m.mem_date}</td>
								<td align="center"><input type="button" value="수정"
									onclick="location=
										'admin_mem_info.kkc?id=${m.mem_id}&page=${page}&state=edit';" />
									<input type="button" value="삭제"
									onclick="if(confirm('정말로 삭제할까요?')==true){
									location=
											'admin_mem_del.kkc?id=${m.mem_id}&page=${page}';	
																			}else{return;}" />
									<%-- 자바스크립트에서 confirm()함수는 확인/취소버튼을 가진
경고창을 만들어 준다. 확인을 클릭하면 true를 반환하고,
취소를 클릭하면 false를 반환 --%></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty blist}">
						<tr>
							<th colspan="5">회원목록이 없습니다.</th>
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
							<a href="admin_mem_list.kkc?page=${page-1}">[이전]</a>&nbsp;
			</c:if>


						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}">
					<${a}>
				</c:if>

							<c:if test="${a != page}">
								<a href="admin_mem_list.kkc?page=${a}">[${a}]</a>&nbsp;
				</c:if>
						</c:forEach>
						<%-- 쪽번호 출력 --%>


						<c:if test="${page >= maxpage}">
			 [다음]
			</c:if>
						<c:if test="${page < maxpage }">
							<a href="admin_mem_list.kkc?page=${page+1}">[다음]</a>
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
								href="admin_mem_list.kkc?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
			</c:if>


						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}">
					<${a}>
				</c:if>

							<c:if test="${a != page}">
								<a
									href="admin_mem_list.kkc?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
				</c:if>
						</c:forEach>
						<%-- 쪽번호 출력 --%>


						<c:if test="${page >= maxpage}">
			 [다음]
			</c:if>
						<c:if test="${page < maxpage }">
							<a
								href="admin_mem_list.kkc?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
						</c:if>
					</c:if>
				</div>

				<%-- 검색폼 추가 --%>
				<div id="abFind_wrap">
					<select name="find_field">
						<option value="mem_id"
							<c:if test="${find_field=='mem_id'}">
      ${'selected'}</c:if>>아이디</option>
						<option value="mem_name"
							<c:if test="${find_field=='mem_name'}">
       ${'selected'}
      </c:if>>회원이름</option>
					</select> <input name="find_name" id="find_name" size="14"
						value="${find_name}" /> <input type="submit" value="검색" />
				</div>
			</div>
		</form>
	</div>

</body>
</html>
<%@ include file="../include/footer.jsp"%>











