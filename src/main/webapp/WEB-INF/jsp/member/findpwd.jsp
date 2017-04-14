<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./m_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="./css/member.css" /><%-- css적용 --%>
<meta charset="UTF-8">
<title></title>
</head>
<body id="back">
<header></header>
<div class="login-page">
<div class="form">
<form class="find_pwd" method="post" action="findpwd_ok.kkc">
	<p class="top">비밀번호 찾기</p>
      <input type="text" placeholder="아이디" id="mem_id" name="mem_id"/>
      <input type="text" placeholder="이메일주소" id="mem_email" name="mem_email"/>
      <input type="submit" id="button"value="비밀번호 찾기"/>
      <p class="message">아이디가 기억나셨나요?<a href="login.kkc">로그인창으로</a></p>
      <p class="message2">아이디를 잊으셨나요?<a href="findid.kkc">아이디찾기</a></p>
    </form>
    </div>
    </div>
</body>
</html>