<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
//  response.addHeader("Refresh", "3");
%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포토게시판</title>
<link rel="stylesheet" type="text/css" href="./css/ptcm_cont.css" /><%-- css적용 --%>
<script src="./js/jquery.js" ></script>
<script src="./js/ptcomment.js" ></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/jquery.bxslider.min.js"></script>
<link href="./css/jquery.bxslider2.css" rel="stylesheet" />

<!-- bx슬라이더 부분 -->
<script>
$(document).ready(function(){
   $('.bxslider').bxSlider({
        mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
        speed:400, //default:500 이미지변환 속도
        auto: true, //default:false 자동 시작
        captions: true, // 이미지의 title 속성이 노출된다.
        autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
     	pagerCustom: '#test',
     	
     	pause: 2000 //넘기는 속도
		
        // slideWidth : 900 // 메인 이미지 박스 크기줄임
      });
});
</script>

<!-- 라이트 박스부분 -->
<link type="text/css" rel="stylesheet" href="./lightGallery-master/src/css/lightgallery.css" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script src="./lightGallery-master/demo/js/lightgallery.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	$("#lightGallery").lightGallery({
		thumbnail : true // 미리보기 이미지를 표시 할 버튼을 표시할지 여부.
	});
 });
</script>


</head>
<body>
<header></header>
<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">포토게시판~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 
 <div id="menubar">
  <input type="button" value="자유게시판" class="bt1" onclick="location='cm_list.kkc';"/>
  <input type="button" value="나만의포토" class="bt1" onclick="location='ptcm_list.kkc';"/>
  <input type="button" value="목록" class="btn" onclick="location='ptcm_list.kkc?page=${page}';" />
  </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 

 <div id="container_cm2">
  <div id="container_cm3">
	 <div id=re_h> <%-- 슬라이더 라인 --%>
	   
	   
 	   <div class="bxslider" id="lightGallery">
	  <c:if test="${!empty p.pt_file}">
	  <c:forTokens var="ima" items="${p.pt_file}" delims="," varStatus="sts">
	  <c:if test="${!ima.equals('null')}">
        <a href="./upload/${ima}"><img src="./upload/${ima}" /></a>
      </c:if>
      </c:forTokens>
      </c:if>
       </div>
   
      <div id="test">
      <c:if test="${!empty p.pt_file}">
      <c:forTokens var="ima" items="${p.pt_file}" delims="," varStatus="sts">
       <a data-slide-index="ima" href=""><img src="./upload/${ima}" class="test"/></a>
      </c:forTokens>
      </c:if>
      </div>
      
      
     </div>
     
  <table id="table" >
   <tr>
    <th class="th1">no</th>
    <th class="th2" colspan="5">제목</th>
   </tr>
   <tr>
    <td class="td1">${p.pt_no}</td> 
    <td colspan="5" class="td1">${p.pt_title}</td>
   </tr>
   <tr>
    <th class="th1">작성자</th> <td class="td1">${p.pt_name}</td>
    <th class="th1">작성일</th> <td class="td1">${p.pt_date}</td>
    <th class="th1">조횟수</th> <td class="td1">${p.pt_hit}</td>
   </tr>
   <tr>
    <th colspan="6" class="th3">내용</th>
   </tr>
   <tr>
    <td class="td2" colspan="6">${p.pt_cont}</td>
   </tr>
  </table>
  
  <div class="clear"></div>
  
  <input type="button" value="삭제" class="btn1" onclick="location='ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=del';" />
  <input type="button" value="수정" class="btn1" onclick="location='ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=edit';" />
  </div>
 </div><%-- container_cm2 끝 --%>
  
 
 <div class="clear"></div>
 
 <%-- 댓글 입력폼 --%>
 <form method="post" action="ptcomment_ok.kkc" onsubmit="return ptcom_check();">
  <input type="hidden" name="pt_no" value="${p.pt_no}" />
  <input type="hidden" name="pc_name" value="${p.pt_name}" />
  <input type="hidden" name="page" value="${page}" />
  
  <table id="comment">
   <tr>
    <th colspan="2" class="cth1">댓글수: ${ptcom_count} 개</th>
   </tr>
   <tr>
    <th><textarea name="pc_cont" id="pc_cont" class="cth2"></textarea></th>
    <th><input type="submit" value="댓글달기" class="cbtn1" /></th>
   </tr>
  </table>
 </form>
 
  <div class="clear"></div>
  
 <%-- 댓글 목록 --%>
 <table id="ptcomment_cont" border="1">
  <c:if test="${!empty pclist}">
   <tr>
    <th colspan="3">댓글목록</th>
   </tr>
   <c:forEach var="pc" items="${pclist}">
    <tr>
     <th>${pc.pc_name}</th>
     <td class="ctd1">${fn:substring(pc.pc_date,0,16)}</td>
     <td class="ctd2">
      <a href="javascript:ptcom_del_ok(${pc.pc_no},${p.pt_no},${page});" onfocus="this.blur();">삭제</a>수정
     </td>
    </tr>
    <tr>
     <td colspan="3" class="ctd3">${pc.pc_cont}</td>
    </tr>
   </c:forEach>
  </c:if>
 </table>

</div><%-- container_cm1 끝 --%>

</div><%-- container_cm --%>

 <div class="clear"></div>
</body>

<%@ include file="../include/footer.jsp"%>
</html>