<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./admin_css/admin_gong/admin_gong_cont.css" />

</head>
<body>

<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="table_div">
  <table id="table" >
   <tr>
    <th class="th1">no</th>
    <th class="th2" colspan="5">제목</th>
   </tr>
   <tr>
    <td class="td1">${g.gongji_no}</td> 
    <td colspan="5" class="td1">${g.gongji_title}</td>
   </tr>
   <tr>
    <th class="th1">작성자</th> <td class="td1">${g.gongji_name}</td>
    <th class="th1">작성일</th> <td class="td1">${g.gongji_date}</td>
    <th class="th1">조횟수</th> <td class="td1">${g.gongji_hit}</td>
   </tr>
   <tr>
    <th colspan="6" class="th3">내용</th>
   </tr>
   <tr>
	    <td class="td2" colspan="6">
	    <div style="overflow-y: auto; height: 600px;">${g.gongji_cont}</div></td>
	   </tr>
  </table>
   <input type="button" value="목록" class="btn1" onclick="location='admin_gongji_list.kkc?page=${page}';" />
 </div><%-- table 끝 --%>
 <hr/>
 <div class="clear"></div>
 
</div><%-- container --%>

</body>
</html>
<jsp:include page="../include/footer.jsp" />






