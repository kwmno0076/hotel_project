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
	<%--가운데 div --%>

	<div id="aMain_cont">

		<div id="aMem_info">
			<h2 class="aMem_title">회원정보</h2>
			<table id="aMem_t">
				<tr>
					<th size="14">회원아이디</th>
					<td>${m.mem_id}</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>${m.mem_name}</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>${m.mem_phone}</td>
				</tr>
				<tr>
					<th>전자우편</th>
					<td>${m.mem_email}</td>
				</tr>
				<tr>
					<th>가입/탈퇴회원</th>
					<td><c:if test="${m.mem_state == 1}">가입회원</c:if> <c:if
							test="${m.mem_state == 2}">탈퇴회원</c:if></td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td>${m.mem_date}</td>
				</tr>
				<c:if test="${m.mem_state ==2}">
					<tr>
						<th>탈퇴날짜</th>
						<td>${m.mem_deldate}</td>
					</tr>
				</c:if>
			</table>
			<div id="aMem_menu">
				<input type="button" value="회원목록"
					onclick="location='admin_mem_list.kkc?page=${page}';" />
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>




