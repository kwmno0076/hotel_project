<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="./css/cm_write.css" /><%-- css적용 --%>
<script src="./js/jquery.js"></script>
<script src="./js/cm.js"></script>
<script src="./SE2/js/HuskyEZCreator.js"></script>

<script>
function aaa(){
	 if(window.confirm("취소하시겠습니까?")==true){
		 location="cm_list.kkc?page=${page}";
	 }else{
		 return;
	 }
}
</script>

</head>
<body>
<header></header>
<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">글쓰기~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <form method="post" id="asdf"action="cm_write_ok.kkc" onsubmit="return cm_check();" >
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
    <th class="th1">작성자</th>
    <td><input name="cm_name" id="cm_name" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">비밀번호</th>
    <td><input type="password" name="cm_pwd" id="cm_pwd" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">제목</th>
    <td><input name="cm_title" id="cm_title" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">내용</th>
    <td><textarea name="cm_cont" id="cm_cont" class="td2"></textarea></td>
   </tr>
   <tr>
    <th colspan="2">
     <input type="button" value="등록" class="btn1" id="save" />
     <input type="button" value="취소" class="btn1" onclick="aaa();"/>
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