<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			mode : 'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			speed : 1000, //default:500 이미지변환 속도
			auto : true, //default:false 자동 시작
			captions : true, // 이미지의 title 속성이 노출된다.
			autoControls : false, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
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
					<div class="login">
						<%-- 오른쪽 로그인 라인--%>
						<a href="login.kkc" class="m_menu">로그인</a> <a href="join.kkc"
							class="m_menu">회원가입</a>
					</div>
				</c:if>
				<c:if test="${!empty id}">
					<div class="login">
						<a href="m_info.kkc" class="l_menu">${name}</a><a>님 환영합니다.</a> <a
							href="m_logout.kkc" class="l_out">로그아웃</a>
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
			<li><img src="./images/ho4.jpg" /></li>

		</ul>

		<div class="clear"></div>
		<%--빈공백 제거 --%>
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

		<p class="me">포토 게시판</p>
		<div class="clear"></div>


		<div id="pt_list">
			<div id="line">
				<%-- 4칸짜리 한줄 큰틀 --%>

				<c:if test="${!empty plist}">
					<c:forEach var="p" items="${plist}">
						<div class="line_1">
							<%--4칸짜리안에 작은틀 끝 --%>
							<ul>
								<li><a
									href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">
										<c:if test="${!empty p.pt_file}">
											<c:forTokens var="ima" items="${p.pt_file}" delims=","
												end="0">
												<img src="./upload/${ima}" width="250" height="200" />
											</c:forTokens>
										</c:if>
								</a></li>
								<li>제목:<a
									href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_title}</a></li>
								<li>작성자:<a
									href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_name}</a></li>
								<li>조회수:<a
									href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_hit}</a></li>
								<li>작성날짜:<a
									href="ptcm_cont.kkc?no=${p.pt_no}&page=${page}&state=cont">${p.pt_date}</a></li>
							</ul>
						</div>
						<%--4칸짜리안에 작은틀 끝 --%>
					</c:forEach>
				</c:if>

				<c:if test="${empty plist}">
					<h1>게시판 목록이 없습니다</h1>
				</c:if>

			</div>
			<!-- 4칸짜리 큰틀 -->
		</div>




		<div class="clear"></div>




		<%-- 메인 몸통2 끝 --%>
		<p class="me3">커뮤니티</p>
		<div class="comu">
			<div class="co-l">
				<h3>
					<span class="c-title"> <a href="cm_list.kkc">자유게시판</a></span>
				</h3>
				<hr />
				<div id="table_div">
					<table id="notice">
						<tr>
							<th class="title" width="60%">제목</th>
							<th class="write" width="12%">작성자</th>
						</tr>
	
						<c:if test="${!empty clist}">
							<c:forEach var="c" items="${clist}">
								<tr>
									<td align="center"><a href="cm_cont.kkc?no=${c.cm_no}&page=${page}&state=cont">${c.cm_title}</a></td>
									<td align="center">${c.cm_name}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty clist}">
							<tr>
								<th colspan="5">게시판 목록이 없습니다!</th>
							</tr>
						</c:if>

					</table>
				</div>
			</div>

			<div class="co-r">
				<h3>
					<span class="c-title"> <a href="#">공지사항</a></span>
				</h3>
				<hr />
				<div id="table_div">
					<table id="notice">
						<tr>
							<th class="title" width="60%">제목</th>
							<th class="write" width="12%">작성자</th>
						</tr>
	
						<c:if test="${!empty blist}">
							<c:forEach var="c" items="${blist}">
								<tr>
									<td align="center"><a href="gongji_cont.kkc?no=${g.gongji_no}&page=${page}&state=cont">${g.gongji_title}</a></td>
									<td align="center">${g.gongji_name}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty blist}">
							<tr>
								<th colspan="5">공지사항이 없습니다!</th>
							</tr>
						</c:if>

					</table>
				</div>
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
				잠자리 대표이사: 최문환 서울시 왕십리 성동구청 신방빌딩 3층 TEL: 02-1234-5678 FAX:
				02-1234-5679<br /> 사업자등록번호 : 123-45-678 온라인정보제공업.통신판매신고:
				제2013-서울왕십리-0270호 관광사업자 등록번호 : 제1234-56호
			</div>
		</div>
	</footer>
	<%-- 하단 끝 --%>
</body>
</html>