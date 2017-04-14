<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/jquery.bxslider.min.js"></script>
<link href="./js/jquery.bxslider.css" rel="stylesheet" />

<!-- <script type="text/javascript" src="./js/jquery.js"></script> -->
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<%-- css적용 --%>

<script>
$(document).ready(function(){
	$('.bxslider').bxSlider({
		  mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
		  speed:1000, //default:500 이미지변환 속도
		  auto: true, //default:false 자동 시작
		  captions: true, // 이미지의 title 속성이 노출된다.
		  autoControls: false, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
		});
});
</script>
</head>
<body id="back">
	<header>
		<div id="header">

			<div class="logo">
				<%-- 로고이미지 삽입 --%>
				<a href="index.kkc"> <img src="./images/logo.png" width="120"
					height="60" />
				</a>
			</div>

			<div class="menu">
				<%-- 메뉴 라인 --%>
				<ul>
					<li><a href="h_list.kkc">호텔</a></li>
					<li><a href="cm_list.kkc">커뮤니티</a></li>
					<li><a href="customcenter.kkc">고객센터</a></li>
				</ul>

			</div>
			<div class="login">
				<c:if test="${empty id}">
   <div class="login"><%-- 오른쪽 로그인 라인--%>
    <a href="login.kkc" class="m_menu">로그인</a>
    <a href="join.kkc" class="m_menu">회원가입</a>
   </div>
   </c:if>
   <c:if test="${!empty id}">
   <div class="login">
   <a href="m_info.kkc" class="l_menu">${name}</a><a>님 환영합니다.</a>
   <a href="m_logout.kkc" class="l_out">로그아웃</a>
   </div>
   </c:if>
			<div class="clear"></div>
			<%-- 빈공백 제거 --%>
		</div>
	</header>
	<%-- 헤더 끝 --%>




	<div id="wrap">
		<ul class="bxslider">
			<%-- 슬라이더 --%>
			<li><img title="*나의 이벤트 파티 룸" src="./images/ho1.jpg" /></li>
			<li><img title="*발렌타인데이에 가기 좋은 호텔" src="./images/ho2.jpg" /></li>
			<li><img title="★또 다른 즐거움" src="./images/ho3.jpg" /></li>
			<li><img  src="./images/ho4.jpg" /></li>
			
		</ul>

		   <div class="clear"></div><%--빈공백 제거 --%>
		<p class="me">지역별 숙박업소</p>

		<div id="img">
			<%-- 메인 몸통2 시작 --%>
			<div class="ga">
				<span><a href="#"><img src="./images/hotel01.jpg"
						width="350" height="300" /></a></span> <span><a href="#"><img
						src="./images/hotel02.jpg" width="550" height="300" /></a></span>
			</div>
			<div class="ga">
				<span><a href="#"><img src="./images/hotel04.jpg"
						width="600" height="300" /></a></span>
				<div class="img2">
					<span><a href="#"><img src="./images/hotel05.jpg"
							width="300" height="150" /></a></span> <span><a href="#"><img
							src="./images/hotel06.jpg" width="300" height="150" /></a></span>
				</div>
			</div>
			<div class="ga">
				<span><a href="#"><img src="./images/hotel07.jpg"
						width="270" height="300" /></a></span> <span><a href="#"><img
						src="./images/hotel09.jpg" width="630" height="300" /></a></span>
			</div>
		</div>
		<%-- 메인 몸통2 끝 --%>
				   <p class="me3">커뮤니티</p>
		<div class="comu">
			<div class="co-l">
				<h3>
				<span class="c-title">
				<a href="./community/cm_list.jsp">자유게시판</a></span></h3>
				<hr/>
				<table>
					<tr>
						<td class="contxt"><a href="#">첫번째 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">두번째 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">세번째 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">네번째 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">다섯번째 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
				</table>
			</div>
			
			<div class="co-r">
			<h3>
			<span class="c-title">
			<a href="./community/ptcm_list.jsp">포토게시판</a></span></h3>
			<hr/>
				<table>
					<tr>
						<td class="contxt"><a href="#">이미지 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">이미지 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">이미지 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">이미지 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
					<tr>
						<td class="contxt"><a href="#">이미지 게시판 내용입니다</a></td>
						<td>작성자</td>
					</tr>
				</table>
			</div>
		</div>

	</div>

	<div class="clear"></div>
	
	<%-- 빈공백 제거 --%>
	<%-- 하단영역 --%>
	<footer>
		<%-- html5에서 추가된 태그로 하단영역을 지정할때 사용한다 --%>
		<div id=foot>
		<span class="logo"><img src="./images/logo2.png" width="100"
					height="60" /></span>
		<div id="copy">
			잠자리  대표이사: 최문환    서울시 왕십리 성동구청 신방빌딩 3층   TEL: 02-1234-5678   FAX: 02-1234-5679<br/>
			사업자등록번호 : 123-45-678   온라인정보제공업.통신판매신고: 제2013-서울왕십리-0270호   관광사업자 등록번호 : 제1234-56호
		</div>
		</div>
	</footer>
	<%-- 하단 끝 --%>
</body>
</html>