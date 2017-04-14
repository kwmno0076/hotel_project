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
<script src="./js/jquery.js"></script>
<script src="./js/mem.js"></script>
</head>
<body>
	<%--관리자 메인본문 --%>
	<div id="aMain_cont">

		<div id="aMedit_wrap">
			<h2 class="mJoin_title">관리자 회원수정</h2>
			<form name="m" method="post" action="admin_mem_edit_ok.kkc"
				onsubmit="return join_check();">
				<input type="hidden" name="page" value="${page}" />
				<table id="mJoin_t">
					<tr>
						<th>아이디</th>
						<td><input name="mem_id" id="mem_id" size="14" readonly
							value="${m.mem_id}" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="mem_pwd" id="mem_pwd"
							size="14" /></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td><input type="password" name="mem_chk" id="mem_chk"
							size="14" /></td>
					</tr>
					<tr>
						<th>회원이름</th>
						<td><input name="mem_name" id="mem_name" size="14"
							value="${m.mem_name}" /></td>
					</tr>
					<tr>
						<th>폰번호</th>
						<td><input name="mem_phone" id="mem_phone" size="14"
						value="${m.mem_phone}"/></td>
					</tr>
					<tr>
						<th>Email</th>
						<td><input name="mem_email" id="mem_email" size="14"
						value="${m.mem_email}"/></td>
					</tr>
					<tr>
						<th>가입/탈퇴</th>
						<td><input name="mem_state" size="3" value="${m.mem_state}" /></td>
					</tr>
					<c:if test="${m.mem_state==2}">
					</c:if>
				</table>
				<div id="mJoin_menu">
					<input type="submit" value="수정" /> <input type="reset" value="취소"
						onclick="$('#mem_pwd').focus();" /> <input type="button"
						value="회원목록"
						onclick="location='admin_mem_list.kkc?page=${page}';" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>
