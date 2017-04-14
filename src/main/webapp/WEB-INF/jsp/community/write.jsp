<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="./css/write.css" /><%-- css적용 --%>
</head>
<body>
<header></header>
<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">글쓰기~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 
 <div id="menubar">
  <a href="community.kkc"><input type="button" value="자유게시판" class="bt1" /></a>
  <a href="potocm.kkc"><input type="button" value="나만의포토" class="bt1" /></a>
  <a href="write.kkc"><input type="button" value="글쓰기" class="btn" /></a>
  </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
 <div id="imgs">
  <img src="./images/tm01.jpg" width="200" height="400">
 </div>
 
 <div id="table_div">
  <table id="notice">
   <tr>
    <th class="th1">작성자</th>
    <td><input type="text" size="80" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">비밀번호</th>
    <td><input type="text" size="80" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">파일첨부</th>
    <td><input type="file" /></td>
   </tr>
   <tr>
    <th class="th1">제목</th>
    <td><input type="text" size="80" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">내용</th>
    <td><textarea rows="30" cols="80" class="td2"></textarea></td>
    
   </tr>
   <tr>
    <th colspan="2">
     <input type="submit" value="등록" class="btn1" />
     <input type="reset" value="취소" class="btn1" />
    </th>
   </tr>
  </table>
 </div><%-- table_div 끝 --%>
 
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>
</body>

<%@ include file="../include/footer.jsp"%>
</html>