<%@page import="java.util.function.Function"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Font"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/jquery.bxslider.min.js"></script>
<link href="./css/jquery.bxslider2.css" rel="stylesheet" />


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript" src="./js/jquery.js"></script> -->

<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			mode : 'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			speed : 400, //default:500 이미지변환 속도
			auto : true, //default:false 자동 시작
			captions : true, // 이미지의 title 속성이 노출된다.
			autoControls : true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
			pagerCustom : '#test',

			pause : 2000
		//넘기는 속도
		// slideWidth : 900  메인 이미지 박스 크기줄임
		});
	});
</script>

<script type="text/javascript">
	function priceCheck() {

		form.p1.value = $("#aa").val();
		form.p2.value = $('#bb').val();

		form.p3.value = parseInt(form.p1.value) + parseInt(form.p2.value);
		
	}
</script>

<script type="text/javascript">
	function bankDisplay() {

		form.bank2.value=$("#selectbank").val();

// 		switch (bank) {
// 		case 0:
// 			frm.bank.value = '은행 및 계좌번호가 표시됩니다.';
// 			break;
// 		case 1:
// 			frm.bank.value = '(국민은행) 012-33-456-789  (주) KKC 잠자리';
// 			break;
// 		case 2:
// 			frm.bank.value = '(기업은행) 123-456789-02-011 (주) KKC 잠자리';
// 			break;
// 		case 3:
// 			frm.bank.value = '(우리은행) 122-13-0456789 (주) KKC 잠자리';
// 			break;
// 		case 4:
// 			frm.bank.value = '(신한은행) 0123456-08-09922 (주) KKC 잠자리';
// 			break;
// 		}

// 		return true;
	}
</script>

<% String[] ads = new String[]{"./images/hotel01.jpg"}; %>

<c:set var = "imgList" value = "<%=ads%>"/>


<link rel="stylesheet" type="text/css" href="./css/reserve.css" />
<%-- css적용 --%>
</head>
<body>


	<%--헤더양념 --%>


	<div id=one>

		<div id=two>
			<div id=re_h>
				<%-- 슬라이더 라인 --%>

				<ul class="bxslider">
					<%-- 슬라이더 --%>

					<li><a href="./h_photo.kkc"><img
							src=".${path}${h.h_file}" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel02.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel03.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel04.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel05.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel06.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel06.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel01.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel04.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel03.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel05.jpg" /> </a></li>
					<li><a href="./h_photo.kkc"><img
							src="./images/hotel02.jpg" /> </a></li>

				</ul>

				<div id="test">
					<c:forEach var = "i" begin = "1" end ="11">
						<a data-slide-index="${i-1}" href="">
					 	<img src="${imgList[0]}" class="test" /></a>
					 </c:forEach>
					 

				</div>

				<a href="./h_photo.kkc"><button name="객실사진 바로가기" id="btn_i">객실사진보기</button></a>

			</div>
		</div>

		<div id="sex">
			<%-- 우측 상단박스 --%>
			<form name="form" method="post" >
			
			
				<div>
					<%-- 룸 --%>
					<div>
						<h3>원하시는 방을 선택해주세요. </h3>
					</div>

					<div>
						
						<select id="aa" name="aa" onChange="priceCheck()" class="room">
							<option value="0" selected="selected">선택</option>
							<option value="${h.h_price_room}">${h.h_room} +${h.h_price_room}원</option>
<!-- 							<option value="50000">일반B +50000원</option> -->
<!-- 							<option value="70000">준특실A +70000원</option> -->
<!-- 							<option value="70000">준특실B +70000원</option> -->
<!-- 							<option value="100000">특실A +100000원</option> -->
<!-- 							<option value="100000">특실B +100000원</option> -->
<!-- 							<option value="150000">파티룸 +150000원</option> -->
<!-- 							<option value="150000">스위밍 룸 +150000원</option> -->
						</select>
					</div>
					
				</div>
		
				<div>
					<div>
						<h3>추가 옵션을 선택해주세요.</h3>
					</div>

					<div>
						<select id="bb" name="bb" onChange="priceCheck()" class="room">
							<option value="0" selected="selected">선택</option>
							<option value="${h.h_price_option}">${h.h_option} + ${h.h_price_option}원</option>
<!-- 							<option value="15000">입욕제 +15000원</option> -->
<!-- 							<option value="30000">파티용 케이크 +30000원</option> -->
<!-- 							<option value="30000">샴페인750ml +35000원</option> -->
<!-- 							<option value="60000">Carbernet Sauvignon(레드와인 750ml) -->
<!-- 								+60000원</option> -->
<!-- 							<option value="90000">Chateau d'Yquem (화이트와인 750ml) -->
<!-- 								+90000원</option> -->
						</select>
					</div>
				</div>
		

				<div>
					<div>
						<h3>입금하실 은행을 선택해주세요.</h3>
					</div>

					<div>
						<select id="selectbank" name="selectbank" onChange="bankDisplay()"
							class="room">
							<option value="" selected="selected">선택하세요</option>
							<option value="${h.h_bank} : ${h.h_anumber}">${h.h_bank} </option>
<!-- 							<option value="2">기업은행</option> -->
<!-- 							<option value="3">우리은행</option> -->
<!-- 							<option value="4">신한은행</option> -->

						</select> <br />
						<hr />

						<div id=bank>
							<h3>
								<font color="#0000ff">*</font>입 금 계 좌
							</h3>
							<input id="bank2" name="bank2" type="text" size="50"
								maxlength="50" readonly="readonly"/>
						</div>

					</div>

				</div>

				<br />
				<div id=bank>
					<h2>
						<font color="#0000ff">*</font>금 액 : <input class="bank3" id="p1"
							name="p1" type="text" size="50" maxlength="50" readonly="readonly"/> 
							
							<span>
							<font size="5px"> + </font>
							
							
							
						</span> <input class="bank3" id="p2" name="p2" type="text" size="50"
							maxlength="50" readonly="readonly"/> <span> <font size="5px" > 총 금액 =
						</font>
						</span> <input class="bank4" name="p3" type="text" size="50"
							maxlength="50" readonly="readonly"/>
					</h2>
				</div>

				<div class=result>
					<input id=result type="submit" value="결제하기" />

				</div>

			</form>
			
			

		</div>
		<%-- 우측상단 박스 끝 --%>

	</div>
	<%-- 헤더를 제외한 전체 라인 끝  --%>

</body>
<%@ include file="../include/footer.jsp"%>
</html>