<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="aMain_cont">
		<div id="abbsEdit_wrap">
			<h2 class="abbsEdit_title">관리자 공지수정</h2>
			<form method="post" action="admin_gongji_edit_ok.kkc"
				onsubmit="return gongji_check();">
				<input type="hidden" name="gongji_no" value="${g.gongji_no}" /> <input
					type="hidden" name="page" value="${page}" />
				<table id="abbsEdit_t">
					<tr>
						<th>이름</th>
						<td><input name="gongji_name" id="gongji_name" size="14"
							value="${g.gongji_name}" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="gongji_title" id="gongji_title" size="36"
							value="${g.gongji_title}" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="gongji_pwd" id="gongji_pwd"
							size="14" /></td>
					</tr>
					<tr>
						<th>글내용</th>
						<td><textarea name="gongji_cont" id="gongji_cont" rows="10"
								cols="36">${g.gongji_cont}</textarea></td>
					</tr>
				</table>
				<div id="abbsEdit_menu">
					<input type="submit" value="수정" /> <input type="reset" value="취소"
						onclick="$('#gongji_name').focus();" /> <input type="button"
						value="목록" onclick="location='admin_gongji_list.kkc?page=${page}';" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
	<%@ include file="../include/footer.jsp"%>