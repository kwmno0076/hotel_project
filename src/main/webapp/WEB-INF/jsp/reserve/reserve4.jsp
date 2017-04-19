<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<script>
	$(document).ready(function() {
		$(".gostep2").click(function() {
			$("#step1").css('visibility', 'hidden');
			$("#step2").show('slow');
		});

		$(".prevstep").click(function() {
			$("#step2").css('display', 'none');
			$("#step1").css('visibility', 'visible');
		});
	});
</script>
<div class="confcon">

	<div id="resrfinsh">
		<strong>카드결제진행</strong>
		<p>- 결제가 완료되지 않은경우 '마이페이지-예약확인'메뉴에서 결제진행 가능합니다.</p>
	</div>
	<div id="clear"></div>
	<form method="post" action="cardPayok.coc">
	<div id="step_cont">
		<div id="step1">
			<div class="step">
				<strong>Step1</strong>
			</div>
			<div class="card_cont">
				<p>카드선택</p>
				<input type="radio" value="uri" name="r_payname" checked />우리카드 <input type="radio"	
					name="r_payname" value="bc" />비씨카드 <input type="radio" name="r_payname" value="shin" />신한카드 <br /> <input
					type="radio" name="r_payname" value="hana" />하나카드 <input type="radio" name="r_payname" value="sam" />삼성카드
				<input type="radio" name="r_payname" value="hyun" />현대카드
				<hr />
				<span class="pmonth">할부개월수 선택</span> <select class="paymonth">
					<option value="1">일시불</option>
					<option value="0">2개월</option>
					<option value="3">3개월</option>
					<option value="6">6개월</option>
					<option value="12">12개월</option>
					<option value="24">24개월</option>
				</select> <br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<div id="gostep">
					<input type="button" class="gostep2" value="다음" />
				</div>
			</div>
		</div>

		<div id="step2">
		
		<input type="hidden" name="r_resref" value="${r_resref }"/>
			<div class="step">
				<strong>Step2</strong>
			</div>
			<div class="card_cont">
				<p>결제금액</p>
				<p class="price">${allPrice }원</p>
				<p>카드번호입력</p>
				<div class="input">
					<input type="text" size="1" />- <input type="text" size="1" />- <input
						type="text" size="1" />- <input type="text" size="1" />
				</div>
				<span class="cvcnum">CVC번호</span> <input type="text" size="3"
					id="cvc" /> <span class="cvc">* 카드뒷면의 7자리 숫자중 뒷 3자리</span> <br />
				<br />
				<div id="gostep1">
					<input type="button" class="prevstep" value="이전으로" /> <input
						type="submit" class="gostep3" value="결제하기" />
				</div>
			</div>
		</div>
	</div>
	</form>
</div>
<jsp:include page="../include/footer.jsp" />