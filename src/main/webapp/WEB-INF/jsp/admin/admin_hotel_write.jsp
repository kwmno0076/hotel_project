<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script>
	$(document).ready(function() {
		var copy = $("#ddd").clone();
		var a = 1;
		$("#add").click(function() {
			a += 1;
			$(copy).find("input").attr("id", "file" + a);
			$(copy).find("input").attr("name", "file" + a);
			$("table").append(copy.clone());
		});
	});
	function aaa() {
		if (window.confirm("취소하시겠습니까?") == true) {
			location = "ptcm_list.kkc?page=${page}";
		} else {
			return;
		}
	}
</script>

<article id="wel_cont">
	<div id="hWrite_wrap">

		<h2 class="hw_title">호텔 업로드</h2>

		<form method="post" action="admin_hotel_write_ok.kkc"
			onsubmit="return hw_check();" enctype="multipart/form-data">

			<%-- 
  자료실 기능을 만들려면
   1.form태그내에 enctype="multipart/form-data"를 지정해야 한다
   2.method="post"방식으로 서버로 첨부한파일을 전달해야 한다.
 --%>
			<table id="hw_t">
				<tr>
					<th>이름</th>
					<td><input name="h_name" id="h_name" size="14" /> <%-- type="text"가 생략되면 기본값이 text이다. --%>
					</td>
				</tr>

				<tr>
					<th>호 텔 명</th>
					<td><input name="h_title" id="h_title" size="38" /></td>
				</tr>
				<tr>
					<th>연 락 처</th>
					<td><input name="h_phone" id="h_phone" size="38" /></td>
				</tr>

				<tr>
					<th>주 소</th>
					<td><input name="h_local" id="h_local" size="28" /></td>
				</tr>

				<tr>
					<th>방 이름</th>
					<td><input name="h_room" id="h_room" size="14" /> 방 수<input
						name="h_room_ok" id="h_room_ok" size="14" /> <%-- type="text"가 생략되면 기본값이 text이다. --%>
						<%-- type="text"가 생략되면 기본값이 text이다. --%></td>

				</tr>

				<tr>
					<th>방가격</th>
					<td>평일<input name="h_price_room" id="h_price_room" size="14" />
					</td>
				</tr>

				<tr>
					<th>방가격</th>
					<td>주말<input name="h_price_room2" id="h_price_room2" size="14" />
					</td>
				</tr>



				<tr>
					<th>옵션</th>
					<td><input name="h_option" id="h_option" size="14" /> <%-- type="text"가 생략되면 기본값이 text이다. --%>

						옵션 가격 <input name="h_price_option" id="h_price_option" size="14" />
						<%-- type="text"가 생략되면 기본값이 text이다. --%></td>
				</tr>




				<tr>
					<th>소개</th>
					<td><textarea name="h_cont" id="h_cont" rows="10" cols="38"></textarea>
					</td>
				</tr>
				<tr>
					<th><input type="button" value="추가" id="add" /></th>
				</tr>
				<tr id="ddd">
					<th>파일첨부</th>
					<td><input type="file" name="h_file" /></td>
				</tr>
			</table>
			<div id="hw_menu">
				<input type="submit" value="저장" /> <input type="reset" value="취소"
					onclick="$('#h_name').focus();" /> <input type="button" value="목록"
					onclick="location='admin_hotel_list.kkc?page=${page}';" />
			</div>
		</form>
	</div>
</article>
<%@ include file="../include/footer.jsp"%>
