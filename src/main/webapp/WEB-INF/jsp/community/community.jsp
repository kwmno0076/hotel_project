<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="./css/community.css" /><%-- css적용 --%>
</head>
<body>
<header></header>
<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">자유게시판~</h1>
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
   
  <div id="table_search">
   <input name="" type="text" class="input_box"> 
   <input type="button" value="검색" class="btn1">
  </div>
  
  <div id="page_control">
   <a href="#">&lt;&lt;</a> <a href="#">&lt;</a> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
   <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a> <a href="#">&gt;&gt;</a>
  </div>
 </div><%-- table_div끝 --%>
  
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>
</body>

<%@ include file="../include/footer.jsp"%>
</html>