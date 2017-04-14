<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 상단nav -->
<%@include file="../include/navbar.jsp"%>

<div class="jumbotron" style="background-color:buttonface;">
	<ul class="list-group" style="width:200px;height:50px; display:inline-block;margin-left:400px; list-style: none;">
		<li class="list-group-item list-group-item-success">Dapibus ac</li>
		<li class="list-group-item list-group-item-info">Cras sit amet</li>
		<li class="list-group-item list-group-item-warning">Porta ac</li>
		<li class="list-group-item list-group-item-danger">Vestibulum at<li>
	</ul>
	<ul class="list-group" style="width:400px;height:50px; display:inline-block;margin-left:0px; list-style: none;">
		<li class="list-group-item list-group-item-success">Dapibus ac</li>
		<li class="list-group-item list-group-item-info">Cras sit amet</li>
		<li class="list-group-item list-group-item-warning">Porta ac</li>
		<li class="list-group-item list-group-item-danger">Vestibulum at<li>
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
		<div class="row post">
				<table class="table-striped" style="width: 100%;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>게시일</th>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>게시일</th>
					</tr>
				
				</table>
		</div>
	</div>
	
	
	
	
	
</div>


</div>


</body>
</html>