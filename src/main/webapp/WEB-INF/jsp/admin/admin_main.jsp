<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./admin_css/ad_main.css" />
<script src="./js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

 <%--herder div --%>
 <header>
  <div id="adheader">
  
   <div class="adlogo"><%-- 로고이미지 삽입 --%>
    <a href="admin_main.kkc">
     <img src="./images/logo.png" width="120" height="60"/>
    </a>
   </div>
   
   <div class="admenu"><%-- 메뉴 라인 --%>
    <ul>
     <li><a href="#">회원관리</a></li>
     <li><a href="admin_hotel_list.kkc">호텔목록</a></li>
     <li><a href="#">예약현황</a></li>
     <li><a href="admin_cm_list.kkc">자유게시판</a></li>
     <li><a href="#">고객센터</a></li>
    </ul>
   
   </div>
   	
   	
   <div class="adlogin"><%-- 오른쪽 로그인 라인--%>
   
   <c:if test="${!empty admin_id}">
   <div class="adlogin">
    <form method="post" action="admin_logout.kkc">
     <a>${admin_name}님 환영합니다.</a>
     <input type="submit" value="로그아웃" />
    </form>
   </div>
   </c:if>	
    
   </div>
   
   <div class="clear"></div><%-- 빈공백 제거 --%>
  </div><%-- header 끝 --%>
 </header>
 
 <div id="wrap1"><%-- 큰틀 --%>
 
 <%--관리자 메인 본문--%>
 <div id="aMain_cont">

  <div class="mem">
   <ul>
	<li class="mem_li">회원관리</li>
   </ul>
  </div>
  <div class="camplist" onclick="location='admin_hotel_list.kkc';">
   <ul>
	<li class="camp_li">호텔목록</li>
   </ul>
  </div>
  <div class="res" onclick="location='admin_hotel_list.kkc';">
   <ul>
	<li class="res_li">예약현황</li>
   </ul>
  </div>
  <div class="board">
   <ul>
	<li class="board_li">자유게시판</li>
   </ul>
  </div>
  <div class="mtomqa">
   <ul>
	<li class="qa_li">고객센터</li>
   </ul>
  </div>

 </div><%-- 관리자 메인 본문 끝 --%>
 
 </div><%-- wrap 부분 끝 --%>
 
	<div class="clear"></div>

	<%--관리자 메인 하단 --%>

</body>
</html>
<%@ include file="../include/footer.jsp"%>