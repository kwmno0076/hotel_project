<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 상단nav -->
<%@include file="../include/navbar.jsp"%>

<script src="./js/jquery.js"></script>
<script src="./js/mem.js"></script>

<div class="jumbotron" style="background-color: buttonface;">
	<ul class="list-group"
		style="width: 200px; height: 50px; display: inline-block; margin-left: 400px; list-style: none;">
		<li class="list-group-item list-group-item-success">아이디:</li>
		<li class="list-group-item list-group-item-info">이름</li>
		<li class="list-group-item list-group-item-warning">핸드폰 번호</li>
		<li class="list-group-item list-group-item-danger">이메일 주소
		<li>
	</ul>
	<ul class="list-group"
		style="width: 400px; height: 50px; display: inline-block; margin-left: 0px; list-style: none;">
		<li class="list-group-item list-group-item-success">${m.mem_id}</li>
		<li class="list-group-item list-group-item-info">${m.mem_name}</li>
		<li class="list-group-item list-group-item-warning">${m.mem_phone}</li>
		<li class="list-group-item list-group-item-danger">${m.mem_email}
		<li>
	</ul>
</div>
<div class="container ">
	<div class="row">
		<div class="col-md-3">
			<aside class="col-md-3" id="sidebar">
				<%@include file="include/sub_nav.jsp"%>
			</aside>



		</div>




		<!-- 회원탈퇴 -->
		<div class="col-md-9">
			<form method="post" action="mem_del_p.kkc">
			<div class="row post">
				<div class="row" style="margin-left:100px;">약관내용</div>
				<div class="row" style="text-align: center;">
				</div>
					<dl class="col-md-9">
						<dt>1. 현재 사용중인 계정정보는 재사용 및 복구 불가능합니다.</dt>
						<dd>
							<p>
								탈퇴 시, <b>사용하고 계신 아이디(${m.mem_id})는 본인과 타인 모두 재사용 및 복구가 불가능</b>합니다.<br>
								또한 탈퇴한 아이디로는 재가입이 불가능합니다.
							</p>
						</dd>

						<dt>2. 회원 탈퇴 시, 회원님의 모든 혜택이 소멸되며 어떠한 경우에도 복구 할 수 없습니다.</dt>
						<dd>
							<div class="txt_etc">그 외, 개인회원에 대한 정보 및 서비스 활동기록은 모두 삭제됩니다.
								단, 불량 이용 및 징계에 대한 기록은 일정기간 동안 삭제되지 않고 보관됩니다.</div>
						</dd>

						<dt>3. 게시판형 서비스에 등록된 게시물은 삭제되지 않고 유지됩니다.</dt>
						<dd>
							<p>
								이용후기와 같은 게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다. <br> 탈퇴 후에는
								회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없으므로, 게시글을 임의로 삭제할 수 없습니다.<br>
								<b>삭제를 원하는 게시물이 있을 경우, 반드시 삭제 후 탈퇴 하시기 바라며, 필요한 데이터는 미리 백업을
									해주시기 바랍니다.</b>
							</p>
						<input type="submit" class="button"value="확인"/>
						</dd>
						</dl>

			</div>
			</form>
			<!-- 회원탈퇴 끝 -->
		</div>


	</div>





</div>
</html>