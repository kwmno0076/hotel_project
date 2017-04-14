<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./admin_css/admin_gong/admin_gong.css" />
</head>
<body>

<div id="aMain_cont">
 <div id="abbsCont_wrap">
  <h2 class="abbsCont_title">관리자 공지내용</h2>
  <table id="abbsCont_t">
   <tr>
    <th>제목</th> <td>${g.gongji_title}</td>
   </tr>
   <tr>
    <th>내용</th> <td>${gongji_cont}</td>
   </tr>
   <tr>
    <th>조회수</th> <td>${g.gongji_hit}</td>
   </tr>   
  </table>
  <div id="abbsCont_menu">
   <input type="button" value="목록"
   onclick="location='admin_gongji_list.kkc?page=${page}';"/>
  </div>
 </div> 
</div>
</body>
</html>
<jsp:include page="../include/footer.jsp" />






