<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../admin/admin_header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>admin HotelList</title>
<script src="./js/jquery.js"></script>
<%-- 텍스트 제한 쿼리 --%>
<script>

	$(document).ready(function() {
		$('.h_cont2').each(function() {

	if ($(this).text().length > 10) {
				$(this).html($(this).text().substr(0, 10) + ".....");
			}
		});
	});
	$(document).ready(function() {
		$('.h_cont3').each(function() {

	if ($(this).text().length > 15) {
				$(this).html($(this).text().substr(0, 15) + ".....");
			}
		});
	});
	
</script>
<script>
	function hotelcencel() {

		if ($('input:checkbox[name="h_no"]').is(":checked")) {
			if (confirm("삭제하시겠습니까?") == true) {
				sendH('del');
			}
		} else {
			alert("삭제할 항목을 선택하세요");
		}
	}

	function sendH(b) {
		if (b == 'del') {
			alert()
			document.hotel.action = "admin_hotel_del_ok.kkc";
			document.hotel.submit();
		}
		return;
	}
</script>


<link rel="stylesheet" type="text/css" href="./admin_css/ad_hotel.css" />
<%-- css적용 --%>

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



<%-- 내용 --%>
<div id=one>
	<%--  헤더를 제외한 전체 바탕--%>
	<%-- <div id=maps> 
	
		<ul>
			<li id=map1>
			
			<a href="map.kkc"><input class="map2" value="지도"
			type="button" ></input></a></li>
		</ul>
		
		
		<div id="slider">  좌측 하단 페이지
		<figure>
	<img title="이미지 "src="./images/hotel011.jpg" alt="">
	<img src="./images/hotel022.jpg"  alt="">
	<img src="./images/hotel033.jpg"  alt="">
	<img src="./images/hotel044.jpg"   alt="">
	<img src="./images/hotel055.jpg"  alt="">
		</figure>
		
		
		</div>
		
	</div>
	 --%>


	

	<div class="clear"></div>

	<form method="get" action="admin_hotel_list.kkc"
		onsubmit="return find_check();">


		<%-- 검색기능 시작--%>
		<div style="text-align: right; margin:10px 300px 0px 0px;">
			<select name="find_field">

				<option value="h_title"
					<c:if test="$.tirm().${find_field =='h_title'}">
		 ${'selected'}</c:if>>호텔명
				</option>

				<option value="h_local"
					<c:if test="${find_field == 'h_local'}"> ${'selected'} </c:if>>
					주소</option>

				<option value="h_cont"
					<c:if test="${find_field=='h_cont'}">
		 	${'selected'}</c:if>>내용
				</option>

			</select> <input name="find_name" id="find_name" type="text"
				value="${find_name}" class="input_box" /> <input type="submit"
				value="검색" class="btn"> <input type="button" value="입력"
				id="bt_f" onclick="location='admin_hotel_write.kkc?page=${page}';" />
		</div>
		<%-- 검색기능 끝--%>

	</form>

	<p style="margin-left: 1200px; font-size: 20px;">
		총: <b>${listcount}</b>개의 호텔이 있습니다.
	</p>


	<form method="post" name="hotel">

		<table id="hotellist">
			<thead>
				<tr>
					<th>체크</th>
					<th>주소</th>
					<th>호텔명</th>
					<th>업주 이름</th>
					<th>호텔 방이름 And 금액</th>
					<th>호텔 옵션명 And 금액</th>
					<th>소개</th>
				</tr>
			</thead>

			<c:if test="${!empty hlist}">
				<c:forEach var="h" items="${hlist}">
					<tbody>
						<tr>
							<td><input type="checkbox" name="h_no" value="${h.h_no}"></td>
							<td class="h_cont3">${h.h_local}</td>
							<td><a
								href="admin_hotel_cont.kkc?h_no=${h.h_no}&page=${page}&state=cont">
									${h.h_title}</a></td>
							<td>${h.h_name}</td>
							<td>${h.h_room}+ ${h.h_price_room}원</td>
							<td>${h.h_option}+ ${h.h_price_option}원</td>
							<td class="h_cont2">${h.h_cont}</td>
	
						</tr>
					</tbody>
				</c:forEach>
			</c:if>

			<c:if test="${empty hlist}">
				<tr>
					<th colspan="9">게시판 목록이 없습니다!</th>
				</tr>
			</c:if>
		</table>

		<div id="hotel_button">
			<input type="button" value="등록"
				onclick="location='admin_hotel_write.kkc?page=${page}';" />
				 <input type="button"
				value="삭제" onclick="hotelcencel();" />
		</div>
	</form>







	<div id="page2">

		<%-- begin --%>
		<%-- 검색전 페이징(쪽나누기) --%>
		<c:if test="${(empty find_field) && (empty find_name)}">
			<c:if test="${page <= 1 }">
				<input type="hidden" class="btn_h" />&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
				<input type='button' value="[이전]" class="btn_h "
					onclick="location.href='admin_hotel_list.kkc?page=${page-1}'" />
					&nbsp;
			</c:if>


			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">

					<input type='button' value='${a}' class="btn_h"
						onclick="location.href='admin_hotel_list.kkc?page=${a}'" />
					&nbsp;
				</c:if>

				<c:if test="${a != page}">

					<input type='button' value='${a}' class="btn_h"
						onclick="location.href='admin_hotel_list.kkc?page=${a}'" />&nbsp;						
						
				</c:if>
			</c:forEach>
			<%-- 쪽번호 출력 --%>


			<c:if test="${page >= maxpage}">
				<input type="hidden" value='[다음]' class="btn_h" />
			</c:if>
			<c:if test="${page < maxpage }">
				<input type="button" value='[다음]' class="btn_h"
					onclick="location.href='admin_hotel_list.kkc?page=${page+1}'" />

			</c:if>
		</c:if>

		<%--검색후 페이징 --%>
		<c:if test="${!(empty find_field) && (empty find_name)}">
			<c:if test="${page <= 1 }">
				<input type="hidden" class="btn_h" />&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
				<input type='button' value='[이전]' class="btn_h"
					onclick="location.href='admin_hotel_list.kkc?page=${page-1}'" />
					&nbsp;
			</c:if>


			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">

					<input type='button' value='${a}' class="btn_h"
						onclick="location.href='admin_hotel_list.kkc?page=${a}'" />
					&nbsp;
				</c:if>

				<c:if test="${a != page}">
					<input type='button' value='${a}' class="btn_h"
						onclick="location.href='admin_hotel_list.kkc?page=${a}'" />&nbsp;									
				</c:if>
			</c:forEach>
			<%-- 쪽번호 출력 --%>


			<c:if test="${page >= maxpage}">
				<input type="hidden" value='[다음]' class="btn_h" />
			</c:if>
			<c:if test="${page < maxpage }">
				<input type="button" value='[다음]' class="btn_h"
					onclick="location.href='admin_hotel_list.kkc?page=${page+1}'" />

			</c:if>
		</c:if>
		<%-- end --%>
	</div>
	<%-- copy end --%>


</div>
<%-- 헤더를 제외한 전체 바탕 끄읏 --%>



<%@ include file="../include/footer.jsp"%>
