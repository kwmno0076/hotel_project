<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./m_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/member.css" /><%-- css적용 --%>
<script src="./js/jquery.js"></script>
<script src="./js/mem.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body id="back">
<header></header>
<div class="login-page">
  <div class="form">
  <p class="top">회원가입</p>
    <form class="register-form" method="post"
   	onsubmit="return join_check();" action="member_join_ok.kkc">
      <input type="text" name="mem_id" id="mem_id" placeholder="아이디"/>
      <input type="password" name="mem_pwd" id="mem_pwd" placeholder="비밀번호"/>
      <input type="password" name="mem_chk" id="mem_chk" placeholder="비밀번호 확인"/>
      <input name="mem_name" id="mem_name" placeholder="이름"/>
      <input type="text" name="mem_phone" id="mem_phone" placeholder="핸드폰 번호"/>
      <input type="text" name="mem_email" id="mem_email"placeholder="이메일주소"/>
      <input type="submit" id="button" value="회원가입"/>
      <p class="message">이미 아이디가 있으신가요? <a href="login.kkc">로그인창으로</a></p>
    </form>
    </div>
    </div>
</body>
</html>