<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./m_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/member.css" /><%-- css적용 --%>
<script src="./js/jquery.js"></script>
<script>
	function email_check() {
		if ($.trim($("#p_email").val()) == "") {
			alert("이메일 주소를 입력해주세요.");
			$("#p_email").val("").focus();
			return false;
		}
	}
</script>
<meta charset="UTF-8">
<title></title>
</head>
<body id="back">
<header></header>
<div class="login-page">
 <form class="form" method="post" action="find_id_ok.kkc"
 	onsubmit="return email_check();">
 	<p class="top">아이디 찾기</p>
      <input type="text" id="p_email" name="p_email" placeholder="이메일주소"/>
      <input type="submit" id="button"value="아이디찾기"/>
      <p class="message">아이디가 기억나셨나요? <a href="login.kkc">로그인창으로</a></p>
      <p class="message4">비밀번호를 잊으셨나요?<a href="findpwd.kkc">비밀번호찾기</a></p>
    </form>
    </div>
</body>
</html>