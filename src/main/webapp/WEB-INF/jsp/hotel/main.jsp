<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>hotel</title>

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



<link rel="stylesheet" type="text/css" href="./css/hotel.css" /><%-- css적용 --%>


</head>

<body>

<header></header>

	

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
	


	<div id="mainH"> <%-- 우측 맵--%>
	
		<div id="mh">
		<marquee class="hh" behavior=alternate scrollamount="20" bgcolor="gray">
		x검색에 대한 검색 결과입니다.
		</marquee>	<%-- 상단 검색 수 밑 내용--%>
		
		</div>

			<div id="img1"> <%-- 첫번째 --%>


				<img alt="호텔사진" src="./images/hotel07.jpg" class="im1" />

				<div class="op">

					<p class="font2">호텔이름</p>
					<p class="font">서울</p>
					<div id=img_a>
						<img src="./images/morka.png"  class="img_h"></img>
						
						<img src="./images/spa.png"  class="img_h"></img>
					</div>
					
					<div class="img_b">몰카안심존 스파</div>

					<div class="avg">평점</div>

				</div>

				<div class="item_Line">
					<%-- 옆라인 --%>
					<em class="item_H">출처</em> <s class="item_a">할인 전 금액</s> <strong
						class="item_b">할인 후 금액</strong>
					<button class="item_c" onclick="location.href='./reserve.kkc'">예약하기</button>

				</div>

			</div>
			
			<div id="img1"> <%-- 두번째 --%>


				<img alt="호텔사진" src="./images/hotel07.jpg" class="im1" />

				<div class="op">

					<p class="font2">호텔이름</p>
					<p class="font">서울</p>
					<div id=img_a>
						<img src="./images/morka.png"  class="img_h"></img>
						
						<img src="./images/spa.png"  class="img_h"></img>
					</div>
					
					<div class="img_b">몰카안심존 스파</div>
					
					
					
					<div class="avg">평점</div>

				</div>

				<div class="item_Line">
					<%-- 옆라인 --%>
					<em class="item_H">출처</em> <s class="item_a">할인 전 금액</s> <strong
						class="item_b">할인 후 금액</strong>
					<button class="item_c" onclick="window.open('./reserve.jsp')">예약하기</button>

				</div>

			</div>
			
			<div id="img1"> <%-- 3번 --%>


				<img alt="호텔사진" src="./images/hotel07.jpg" class="im1" />

				<div class="op">

					<p class="font2">호텔이름</p>
					<p class="font">서울</p>
					<div id=img_a>
						<img src="./images/morka.png"  class="img_h"></img>
						
						<img src="./images/spa.png"  class="img_h"></img>
					</div>
					
					<div class="img_b">몰카안심존 스파</div>

					<div class="avg">평점</div>

				</div>

				<div class="item_Line">
					<%-- 옆라인 --%>
					<em class="item_H">출처</em> <s class="item_a">할인 전 금액</s> <strong
						class="item_b">할인 후 금액</strong>
					<button class="item_c" onclick="window.open('./reserve.jsp')">예약하기</button>

				</div>

			</div>
			
			<div id="img1"> <%-- 4번 --%>


				<img alt="호텔사진" src="./images/hotel07.jpg" class="im1" />

				<div class="op">

					<p class="font2">호텔이름</p>
					<p class="font">서울</p>
					<div id=img_a>
						<img src="./images/morka.png"  class="img_h"></img>
						
						<img src="./images/spa.png"  class="img_h"></img>
					</div>
					
					<div class="img_b">몰카안심존 스파</div>

					<div class="avg">평점</div>

				</div>

				<div class="item_Line">
					<%-- 옆라인 --%>
					<em class="item_H">출처</em> <s class="item_a">할인 전 금액</s> <strong
						class="item_b">할인 후 금액</strong>
					<button class="item_c" onclick="window.open('./reserve.jsp')">예약하기 </button>

				</div>

			</div>
			
			<div id="img1"> <%-- 5번 --%>


				<img alt="호텔사진" src="./images/hotel07.jpg" class="im1" />

				<div class="op">

					<p class="font2">호텔이름</p>
					<p class="font">서울</p>
					<div id=img_a>
						<img src="./images/morka.png"  class="img_h"></img>
						
						<img src="./images/spa.png"  class="img_h"></img>
					</div>
					
					<div class="img_b">몰카안심존 스파</div>

					<div class="avg">평점</div>

				</div>

				<div class="item_Line">
					<%-- 옆라인 --%>
					<em class="item_H">출처</em> 
					<s class="item_a">할인 전 금액</s> 
					<strong class="item_b">할인 후 금액</strong>
					<button class="item_c" onclick="window.open('./reserve.jsp')">예약하기</button>

				</div>

			</div>

		</div>

	<div id="page"> <%-- 햐단 버튼 --%>
		<button class=btn_h>1</button>
		<button class=btn_h>2</button>
		<button class=btn_h>3</button>
		<button class=btn_h>4</button>
		<button class=btn_h>5</button>
		<button class=btn_h>></button>
		
	</div>
	

</div> <%-- 헤더를 제외한 전체 바탕 끄읏 --%>



</body>

<%@ include file="../include/footer.jsp"%>
</html>