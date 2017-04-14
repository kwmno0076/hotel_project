<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>


<script src=./js/jquery.js></script>
<script src=./js/index_page.js></script>
<script src="../js/kumsa.js"></script>
<script src="./js/modernizr.custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="./js/jquery.lettering.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>



<link rel="stylesheet" type="text/css" href="./css/main.css" /><%-- css적용 --%>
<link rel="stylesheet" type="text/css" href="./css/ho.css" />
<link rel="stylesheet" type="text/css" href="./css/hotel.css" /><%-- css적용 --%>

</head>
<body id="back">
  <header>
  <div id="header">
  
   <div class="logo"><%-- 로고이미지 삽입 --%>
    <a href="index.kkc">
     <img src="./images/logo.png" width="120" height="60"/>
    </a>
   </div>
   
   <div class="menu"><%-- 메뉴 라인 --%>
    <ul>
     <li><a href="h_list.kkc">호텔</a></li>
     <li><a href="cm_list.kkc">커뮤니티</a></li>
     <li><a href="customcenter.kkc">고객센터</a></li>
    </ul>
   
   </div>
   	
   	
   <div class="login"><%-- 오른쪽 로그인 라인--%>
   
   <c:if test="${empty id}">
   <div class="login"><%-- 오른쪽 로그인 라인--%>
    <a href="login.kkc" class="m_menu">로그인</a>
    <a href="join.kkc" class="m_menu">회원가입</a>
   </div>
   </c:if>
   <c:if test="${!empty id}">
   <div class="login">
   <a href="m_info.kkc" class="l_menu">${name}</a><a>님 환영합니다.</a>
   <a href="m_logout.kkc" class="l_out">로그아웃</a>
   </div>
   </c:if>	
    
   </div>
   
   <div class="clear"></div><%-- 빈공백 제거 --%>
  	</div>
   </header>													
   <div class="clear"></div><%-- 빈공백 제거 --%>
