<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<link rel="stylesheet" type="text/css" href="./css/cm_write.css" /><%-- css적용 --%>
<script src="./js/jquery.js"></script>
<script src="./js/cm.js"></script>
</head>
<body>
<header></header>
<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">글삭제ㅜ</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <form method="post" action="cm_del_ok.kkc" onsubmit="return del_check();" >
 <input type="hidden" name="cm_no" value="${c.cm_no}" />
 <input type="hidden" name="page" value="${page}" />
 <div id="menubar">
  <input type="button" value="자유게시판" class="bt1" onclick="location='cm_list.kkc';"/>
  <input type="button" value="나만의포토" class="bt1" onclick="location='ptcm_list.kkc';"/>
  <input type="button" value="목록" class="btn" onclick="location='cm_list.kkc?page=${page}';" />
  </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
 <div id="imgs">
  <img src="./images/tm01.jpg" width="200" height="400">
 </div>
 
 <div id="table_div">
  <table id="notice">
   <tr>
    <th class="th1">비밀번호</th>
    <td><input type="password" name="del_pwd" id="del_pwd" class="td1" /></td>
   </tr>
   <tr>
    <th colspan="2">
     <input type="submit" value="삭제" class="btn1" />
     <input type="reset" value="취소" class="btn1" />
    </th>
   </tr>
  </table>
 </div><%-- table_div 끝 --%>
 
 </form><%-- form 태그 끝 --%>
 
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>
</body>

<%@ include file="../include/footer.jsp"%>
</html>