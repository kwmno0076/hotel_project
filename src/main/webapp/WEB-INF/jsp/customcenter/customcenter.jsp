<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="./css/custom.css" /><%-- css적용 --%>

</head>
<body>
<div id="container_cm">

 <div id="container_cm1">
  <h1 class="h">공지사항</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
 <div id="s_me">
 <ul>
 	<li><a href="customcenter.jsp">고객센터</a></li>
 	<li><a href="#">1:1상담</a></li>
 	<li><a href="#">자주 묻는 질문</a></li>
 </ul>
 </div>
 
 <div id="table_div">
   <table id="notice" >
    <tr>
   	 <th class="no">no</th>
	 <th class="category">카테고리</th>
	 <th class="title">제목</th>
	 <th class="write">작성자</th>
	 <th class="date">작성날짜</th>
	 <th class="read">조횟수</th>
    </tr>
   
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
    
    <tr>
 	 <td>1</td>
	 <td>전체</td>
	 <td class="left">내용입니다.</td>
	 <td>작성자</td>
	 <td>2017.02.20</td>
	 <td>0</td>
    </tr>
   
   </table>
   
  <hr/>
   
  
  <div id="page_control">
   <a href="#">&lt;&lt;</a> <a href="#">&lt;</a> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
   <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a> <a href="#">&gt;&gt;</a>
  </div>
 </div><%-- table_div끝 --%>
  
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>
<%@ include file="../include/footer.jsp"%>
</body>
</html>