<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 상단nav -->
<%@include file="../include/navbar.jsp"%>
<script src="./js/jquery.js"></script>
<script src="./js/mem.js"></script>

<div class="jumbotron" style="background-color:buttonface;">
	<ul class="list-group" style="width:200px;height:50px; display:inline-block;margin-left:400px; list-style: none;">
		<li class="list-group-item list-group-item-success">아이디:</li>
		<li class="list-group-item list-group-item-info">이름</li>
		<li class="list-group-item list-group-item-warning">핸드폰 번호</li>
		<li class="list-group-item list-group-item-danger">이메일 주소<li>
	</ul>
	<ul class="list-group" style="width:400px;height:50px; display:inline-block;margin-left:0px; list-style: none;">
		<li class="list-group-item list-group-item-success">${m.mem_id}</li>
		<li class="list-group-item list-group-item-info">${m.mem_name}</li>
		<li class="list-group-item list-group-item-warning">${m.mem_phone}</li>
		<li class="list-group-item list-group-item-danger">${m.mem_email}<li>
	</ul>
</div>
<div class="container ">
<div class="row">
	<div class="col-md-3">
	<aside class="col-md-3" id="sidebar">
		<%@include file="include/sub_nav.jsp" %>
    </aside>
	
	
	
	</div>




	<div class="col-md-9 ">
		<!--  회원정보 -->
		<form method="post" action="mem_edit_ok.kkc" 
		onsubmit="return mem_edchk();">
		<div class="row post">
			<div class="row margin_30_30">
				<div class="col-md-6">
					<label>아이디</label>
					<input type="text" class="form-control" id="mem_id" name="mem_id" readonly="readonly" value="${m.mem_id}">
				</div>
				<div class="col-md-6">
				<label>이름</label>
					<input type="text" class="form-control" id="mem_name" name="mem_name" readonly="readonly" value="${m.mem_name}">
				</div>
				<div class="col-md-6">
					<label>핸드폰 번호</label>
					<input type="text" class="form-control" id="mem_phone" name="mem_phone" value="${m.mem_phone}">
				</div>
				<div class="col-md-6">
					<label>이메일</label>
					<input type="text" class="form-control" id="mem_email" name="mem_email" readonly="readonly" value="${m.mem_email}">
			</div>
			<div class="row">
				<div class="col-md-6">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" value="">
				</div>
				
				<div class="col-md-6">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="pwd_chk" name="pwd_chk" value="">
				</div>
				</div>
			</div>
			<div class="row"  style="text-align: center;">.
			
			<input type="submit" class="button" value="수정" />
			
			<input type="button" class="button" value="이전으로" onclick="location='m_info.kkc';"/>
			</div>
		</div>
		</form>
		<!-- 회원정보 끝 -->
	</div>
	
	
	
	
	
</div>


</div>
</body>
</html>