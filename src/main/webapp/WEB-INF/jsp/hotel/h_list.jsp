<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/res_header.jsp"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>hotel</title>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<%-- 텍스트 제한 쿼리 --%>
<script>
$(document).ready(function(){ $('.avg2').each(function(){ <%-- 내용 텍스트 제한 쿼리 --%>
	if ($(this).text().length > 120) $(this).html($(this).text().substr(0,120)+"....."); }); });
$(document).ready(function(){ $('.font').each(function(){ <%-- 주소 텍스트 제한 쿼리 --%>
	if ($(this).text().length > 35) $(this).html($(this).text().substr(0,35)+"....."); }); });		
</script>



<%--
<script>
window.onfocus=function(){
}
window.onload=function(){
 window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
window.resizeTo(1920,1080); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
}

</script>
--%>
<style>
@keyframes slidy {
0% { left: 0%; }
20% { left: 0%; }
25% { left: -100%; }
45% { left: -100%; }
50% { left: -200%; }
70% { left: -200%; }
75% { left: -300%; }
95% { left: -300%; }
100% { left: -400%; }
}
</style>



<header></header>

<%-- 내용 --%>
<div id=one> <%--  헤더를 제외한 전체 바탕--%>
	<div id=maps> 
	
		<ul>
			<li id=map1>
			
			<a href="map.kkc"><input class="map2" value="지도"
			type="button" ></input></a></li>
		</ul>
		
		
		<div id="slider">  <%-- 좌측 하단 페이지 --%>
		<figure>
	<img title="이미지 "src="./images/hotel011.jpg" alt="">
	<img src="./images/hotel022.jpg"  alt="">
	<img src="./images/hotel033.jpg"  alt="">
	<img src="./images/hotel044.jpg"   alt="">
	<img src="./images/hotel055.jpg"  alt="">
		</figure>
		
		
		</div>
		
	</div>
	
	
	<form method="get" action="h_list.kkc" onsubmit="return find_check();">
	<div id="mainH"> <%-- 우측 맵--%>
	
			<%-- 검색기능 시작--%>
		<div style="text-align:right ;margin-top:10px"> 
			<select name="find_field">
			
			 <option value="h_title"
		 <c:if test="$.tirm().${find_field =='h_title'}">
		 ${'selected'}</c:if>>제목
		 </option>
		 
		 	<option value="h_local"
		 		<c:if test="${find_field == 'h_local'}"> ${'selected'} </c:if>>
		 		주소
		 	</option>
		 
		 	<option value="h_cont"
		 	<c:if test="${find_field=='h_cont'}">
		 	${'selected'}</c:if>>내용
			 </option>
		 
			</select>
			
			<input name="find_name" id="find_name" type="text" value="${find_name}"  class="input_box" /> 
			 
			<input type="submit" value="검색크" class="btn" >	
		
		
 	 
		</div>
		<%-- 검색기능 끝--%>
		
		
		<div id="mh">
		<marquee class="hh" behavior=alternate scrollamount="20" bgcolor="gray">
	
		${listcount}개의 호텔이 있습니다.
		
		</marquee>	<%-- 상단 검색 수 밑 내용--%>
		</div>	
		
			<div id="img1"> <%-- 결과물 --%>
				
				<c:if test="${!empty hlist}">

 					<c:forEach var="h" items="${hlist}">
 					
 					
 					<c:forTokens var="ima" items="${h.h_file}" delims="," end="0">
 					<img alt="설정된 이미지가 없습니다." src="./upload/${ima}" class="im1"  />
 					</c:forTokens>
<!-- 			<img alt="호텔사진" src="./images/hotel07.jpg" class="im1" />				 -->
	
						<%-- *.kkc?no=번호&page=쪽번호&state=cont 구분값까지
									3개의 인자값이 하이퍼링크 get방식으로 전달됨. --%>
						
				<div class="op">
				
					<p class="font2">${h.h_title}</p>
					<p class="font">위치:${h.h_local}</p>
 					
			
					<div class="avg">소개</div>
					<p class="avg2">${h.h_cont}</p>
					
				</div>
				
				<div class="item_Line">
					<em class="item_H">출처</em> <s class="item_a">${h.h_price_room}</s> 
					<strong class="item_b">${h.h_price_room-h.h_price_room *(10/100)} </strong>
					<a href="reserve1.kkc?h_no=${h.h_no}&page=${page}&state=reserve" > <input type="button" class="item_c" value="예약하기"/></a>
				</div>
						
						
 					</c:forEach>
 				</c:if>
 				
 				
 			<c:if test="${empty hlist}">
 				<tr>
  					<th colspan="5">자료실 목록이 없습니다!</th>
 				</tr>
			</c:if>	
 			</div>
 			<%-- 결과물 끝--%>
 			
 			
		</div> <%-- 메인 박스 끝 --%>
		

	</form>	
		
		<div id="page2">
		
		<%-- begin --%>
<%-- 검색전 페이징(쪽나누기) --%>
<c:if test="${(empty find_field) && (empty find_name)}">		
		<c:if test="${page <= 1 }" >
			<input type="hidden" class="btn_h" />&nbsp;
			</c:if>
				<c:if test="${page > 1 }">
				<input type='button' value="[이전]" class="btn_h " onclick="location.href='h_list.kkc?page=${page-1}'" />
					&nbsp;
			</c:if>


				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
					
					<input type='button' value='${a}' class="btn_h" onclick="location.href='h_list.kkc?page=${a}'" />
					&nbsp;
				</c:if>

					<c:if test="${a != page}">
					
<input type='button' value='${a}' class="btn_h" onclick="location.href='h_list.kkc?page=${a}'"/>&nbsp;						
						
				</c:if>
				</c:forEach>
				<%-- 쪽번호 출력 --%>


			<c:if test="${page >= maxpage}">
			 <input type="hidden" value='[다음]' class="btn_h" />
			</c:if>
				<c:if test="${page < maxpage }">
				<input type="button" value='[다음]'class= "btn_h" onclick="location.href='h_list.kkc?page=${page+1}'"/>
					
			</c:if>		
</c:if>		

<%--검색후 페이징 --%>
<c:if test="${!(empty find_field) && (empty find_name)}">		
		<c:if test="${page <= 1 }" >
			<input type="hidden" class="btn_h" />&nbsp;
			</c:if>
				<c:if test="${page > 1 }">
				<input type='button' value='[이전]' class="btn_h" onclick="location.href='h_list.kkc?page=${page-1}'" />
					&nbsp;
			</c:if>


				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
					
					<input type='button' value='${a}' class="btn_h" onclick="location.href='h_list.kkc?page=${a}'" />
					&nbsp;
				</c:if>

					<c:if test="${a != page}">	
					<input type='button' value='${a}' class="btn_h" 
						onclick="location.href='h_list.kkc?page=${a}'"/>&nbsp;									
				</c:if>
				</c:forEach>
				<%-- 쪽번호 출력 --%>


			<c:if test="${page >= maxpage}">
			 <input type="hidden" value='[다음]' class="btn_h" />
			</c:if>
				<c:if test="${page < maxpage }">
				<input type="button" value='[다음]'class= "btn_h" onclick="location.href='h_list.kkc?page=${page+1}'"/>
					
			</c:if>		
</c:if>		
		<%-- end --%>
	</div>
	<%-- copy end --%>
	

</div> <%-- 헤더를 제외한 전체 바탕 끄읏 --%>



<%@ include file="../include/footer.jsp"%>
