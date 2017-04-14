<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 상단nav -->
<%@include file="../include/navbar.jsp"%>

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
				<%@include file="include/sub_nav.jsp"%>
			</aside>


		</div>
		<div class="col-md-9 ">
			<form  method="post" action="mem_ed_p_ok.kkc"class="row post">
				<div class="row" style="text-align:center;">
					<div class="col-md-12" style="margin:0 auto;">
						<label>비밀번호를 한번 더 입력해주세요.</label> 
						<input type="password" class="form-control" id="mem_pwd" name="mem_pwd"
						style="width:400px; margin:0 auto;">
					</div> 
				</div>
				<div class="row" style="text-align:center;">
					<input type="submit" class="button" value="확인">
				</div>

			</form>
		</div>

	</div>





</div>




</body>
</html>