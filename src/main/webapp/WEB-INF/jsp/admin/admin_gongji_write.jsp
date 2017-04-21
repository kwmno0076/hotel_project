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
			<form method="post" id="asdf" action="admin_gongji_write_ok.kkc"
				onsubmit="return gongji_check();">
				<div id="table_div">
					<table id="notice">
						<tr>
							<th class="th1">작성자</th>
							<td><input name="gongji_name" id="gongji_name" class="td1"
								readonly="readonly" value="${admin_id}" /></td>
						</tr>
						<tr>
							<th class="th1">제목</th>
							<td><input name="gongji_title" id="gongji_title" class="td1" /></td>
						</tr>
						<tr>
							  <tr>
   						 <th class="th1">비밀번호</th>
   						 <td><input type="password" name="gongji_pwd" id="gongji_pwd" class="td1" /></td>
  						 </tr>
						<tr>
							<th class="th1">내용</th>
							<td><textarea name="gongji_cont" id="gongji_cont" class="td2"></textarea></td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="button" value="등록" class="btn1" id="save" />
							<input type="button" value="목록" class="btn1" onclick="location='admin_gongji_list.kkc?page=${page}';" /> 
						</tr>
					</table>
				</div>
				<%-- table_div 끝 --%>

			</form>
			<%-- form 태그 끝 --%>
		</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>


