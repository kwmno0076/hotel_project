<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<%--서브 메인이미지 --%>


<%-- 본문내용 --%>
<article id="wel_cont">
	<div id="bWrite_wrap">
		<h2 class="bw_title">호텔 수정</h2>
		<form method="post" action="admin_hotel_edit_ok.kkc"
			onsubmit="return bw_check();" enctype="multipart/form-data">
			<%-- 
  자료실 기능을 만들려면
   1.form태그내에 enctype="multipart/form-data"를 지정해야 한다
   2.method="post"방식으로 서버로 첨부한파일을 전달해야 한다.
 --%>
			<input type="hidden" name="h_no" value="${h.h_no}" />

			<%--페이징 쪽번호 히든값 --%>
			<input type="hidden" name="page" value="${page}" />

			<table id="bw_t">
				<tr>
					<th>이름</th>
					<td><input name="h_name" id="h_name" size="14"
						value="${h.h_name}" /> <%-- type="text"가 생략되면 기본값이 text이다. --%></td>
				</tr>

				
				

				<tr>
					<th>제목</th>
					<td><input name="h_title" id="h_title" size="38"
						value="${h.h_title}" /></td>
				</tr>
				<tr>
				
				<tr>
					<th>연 락 처</th>
					<td><input name="h_phone" id="h_phone" size="14"
						value="${h.h_phone}" /> <%-- type="text"가 생략되면 기본값이 text이다. --%></td>
				</tr>
				
				
				<tr>
					<th>주 소</th>
					<td><input name="h_local" id="h_local" size="28" value="${h.h_local}" /></td>
				</tr>	
					
				<tr>
					<th>방 이름</th>
					<td><input name="h_room" id="h_room" size="14" value="${h.h_room}" />
					방 수<input name="h_room_ok" id="h_room_ok" size="14" value="${h.h_room_ok}" /> <%-- type="text"가 생략되면 기본값이 text이다. --%>
					 <%-- type="text"가 생략되면 기본값이 text이다. --%>
					</td>

				</tr>
				
				<tr>
					<th>방가격</th>
					<td>
					평일<input name="h_price_room" id="h_price_room" size="14" />
					주말<input name="h_price_room2" id="h_price_room2" size="14" />
					</td>
				</tr>

				<tr>
					<th>옵션</th>
					<td><input name="h_option" id="h_option" size="14" value="${h.h_option}" /> <%-- type="text"가 생략되면 기본값이 text이다. --%>

						옵션 가격 <input name="h_price_option" id="h_price_option" size="14" value="${h.h_price_option}" />
						<%-- type="text"가 생략되면 기본값이 text이다. --%></td>
				</tr>
				
				
				
				<tr>
					<th>내용</th>
					<td><textarea name="h_cont" id="h_cont" rows="10" cols="38">${h.h_cont}</textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" name="h_file" value="${h.h_file}"/></td>
				</tr>
			</table>
			<div id="bw_menu">
				<input type="submit" value="수정" /> <input type="reset" value="취소"
					onclick="$('#h_name').focus();" /> <input type="button" value="목록"
					onclick="location='admin_hotel_list.kkc?page=${page}';" />
			</div>
		</form>
	</div>
</article>

<jsp:include page="../include/footer.jsp" />





