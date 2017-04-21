<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="./admin_css/admin_gong/admin_gong.css" />
<script src="./js/jquery.js"></script>
<script src="./js/gongji.js"></script>
<script src="./SE2/js/HuskyEZCreator.js"></script>
</head>
<body>
		<div id="abbsEdit_wrap">
			<form method="post" action="admin_gongji_edit_ok.kkc"
				onsubmit="return gongji_check();">
				<input type="hidden" name="gongji_no" value="${g.gongji_no}" /> 
				<input type="hidden" name="page" value="${page}" />
				<div id="table_div">
					<table id="notice">
						<tr>
							<th class="th1">작성자</th>
							<td><input name="gongji_name" id="gongji_name" class="td1"
								readonly="readonly" value="${admin_id}" /></td>
						</tr>
						<tr>
							<th class="th1">제목</th>
							<td><input name="gongji_title" id="gongji_title" class="td1" value="${g.gongji_title }"/></td>
						</tr>
						<tr>
							  <tr>
   						 <th class="th1">비밀번호</th>
   						 <td><input type="password" name="gongji_pwd" id="gongji_pwd" class="td1" value="${g.gongji_pwd }"/></td>
  						 </tr>
						<tr>
							<th class="th1">내용</th>
							<td><textarea name="gongji_cont" id="gongji_cont" class="td2">${g.gongji_cont}</textarea></td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" value="수정" class="btn1" id="save" />
							<input type="button" value="목록" class="btn1" onclick="location='admin_gongji_list.kkc?page=${page}';" /> 
						</tr>
					</table>
				</div>
			</form>
		</div>
</body>
</html>
	<%@ include file="../include/footer.jsp"%>