<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<script src="./js/jquery.js"></script>
<script>
 function admin_check(){
	 if($.trim($("#admin_id").val())==""){
		 alert("관리자 아이디를 입력하세요");
		 $("#admin_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#admin_pwd").val())==""){
		 alert("관리자 비번을 입력하세요!");
		 $("#admin_pwd").val("").focus();
		 return false;
	 }
 }
</script>
<link rel="stylesheet" type="text/css" href="./admin_css/admin.css" />
</head>
<body>
 <div id="aLogin_wrap">
  <h2 class="aLogin_title">ADMIN LOGIN</h2>
 <form method="post" action="admin_login_ok.kkc" onsubmit="return admin_check();">
 <table id="aLogin_t">
  <tr>
   <th>ID</th>                            
   <td><input name="admin_id" id="admin_id" size="14" tabindex="1" /></td>
   <th rowspan="2">
   <input type="submit" value="로그인" class="aLogin_box" />
   </th>
   </tr>
   <tr>
    <th>PASSWORD</th>
    <td>
     <input type="password" name="admin_pwd" id="admin_pwd" size="14" tabindex="2" />
     <%--tabindex 속성값을 2로 지정하면 관리자 아이디를 입력하고 키보드 탭키를 눌렀을 때 포커스가 로그인 서브밋
     	버튼으로 가지 않고, 바로 비번입력박스로 이동한다. --%>
     </td>
     </tr>
 </table>
 </form>
 </div>
</body>
</html>