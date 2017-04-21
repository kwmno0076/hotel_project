<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="./css/custom_cont.css" /><%-- css적용 --%>

</head>
<body>
<hr/>
<div id="container_cm"><%--헤더아래 배경 --%>

 <div id="container_cm1"> <%--큰 틀 --%>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
 <div id="s_me">
 <ul>
 	<li><a href="customcenter.kkc">고객센터</a></li>
 	<li><a href="#">1:1상담</a></li>
 	<li><a href="#">자주 묻는 질문</a></li>
 </ul>
 </div>
 

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
	    <th class="th1">작성자</th> <td class="td1">관리자</td>
	    <th class="th1">작성일</th> <td class="td1">${g.gongji_date}</td>
	    <th class="th1">조횟수</th> <td class="td1">${g.gongji_hit}</td>
	   </tr>
	   <tr>
	    <th colspan="6" class="th3">내용</th>
	   </tr>
	   <tr>
	    <td class="td2" colspan="6">
	    <div style="overflow-y: auto; height: 800px;">${g.gongji_cont}</div></td>
	   </tr>
	  </table>
	   <input type="button" value="목록" class="btn1" onclick="location='customcenter.kkc?page=${page}';" />
	 </div><%-- table 끝 --%>
	 <div class="clear"></div>
 
 
 </div> <%--cm1 끝 --%>
	 <hr/>
 
 </div> <%--cm 끝 --%>
<%@ include file="../include/footer.jsp"%>
</body>
</html>