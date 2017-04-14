<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./m_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<%-- css적용 --%>
<script src="./js/jquery.js"></script>
<script>
	function login_check() {
		if ($.trim($("#login_id").val()) == "") {
			alert("로그인 아이디를 입력하세요!");
			$("#login_id").val("").focus();
			return false;
		}
		if ($.trim($("#login_pwd").val()) == "") {
			alert("로그인 비번을 입력하세요!");
			$("#login_pwd").val("").focus();
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
		<div class="form">
			<p class="top">로그인</p>
			<form class="login-form" method="post" action="member_login_ok.kkc"
				onsubmit="return login_check();">
				<input type="text" name="login_id" id="login_id" placeholder="아이디" />
				<input type="password" name="login_pwd" id="login_pwd"
					placeholder="비밀번호" /> 
					<input type="submit" id="button" value="로그인" />
				<p class="message3">
					아직 회원이 아니신가요? <a href="join.kkc">회원가입</a>
				</p>
				<p class="message2">
					가입정보를 잊으셨나요? <a href="findid.kkc">아이디/비밀번호 찾기</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>