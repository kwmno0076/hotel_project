<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./admin_css/admin_cm/admin_cm_write.css" /><%-- css적용 --%>
<script src="./js/ptcm.js"></script>
<script src="./SE2/js/HuskyEZCreator.js"></script>

<script>

$(document).ready(function(){
	var copy=$("#ddd").clone();
	var a=1;
	$("#add").click(function(){
		a+=1;
		$(copy).find("input").attr("id","file"+a);
		$(copy).find("input").attr("name","file"+a);
		$("table").append(copy.clone());
	});
});
function aaa(){
	 if(window.confirm("취소하시겠습니까?")==true){
		 location="admin_ptcm_list.kkc?page=${page}";
	 }else{
		 return;
	 }
}
</script>

<div id="container_cm"><%-- 헤더아래 배경 --%>

 <form method="post" id="asdf" action="admin_ptcm_edit_ok.kkc" onsubmit="return ptcm_check();" enctype="multipart/form-data" >
 <input type="hidden" name="pt_no" readonly="readonly" value="${adpb.pt_no}"/>
 <div id="table_div">
  <table id="notice">
   <tr>
    <th class="th1">작성자</th>
    <td><input name="pt_name" id="pt_name" class="td1" readonly="readonly" value="${admin_id}"/></td>
   </tr>
   <tr>
    <th class="th1">비밀번호</th>
    <td><input type="password" name="pt_pwd" id="pt_pwd" class="td1" value="${adpb.pt_pwd}"/></td>
   </tr>
   <tr>
    <th class="th1">제목</th>
    <td><input name="pt_title" id="pt_title" class="td1" value="${adpb.pt_title}"/></td>
   </tr>
   <tr>
    <th class="th1">내용</th>
    <td><textarea name="pt_cont" id="pt_cont" class="td2" >${adpb.pt_cont}</textarea></td>
   </tr>
   <tr>
    <th class="th1"><input type="button" value="추가" id="add" /></th>
   </tr>
   <tr id="ddd">
    <th class="th1">파일첨부</th>
    <td><input type="file" name="pt_file" id="pt_file" class="td1"></td>
   </tr>
  </table>
 </div><%-- table_div 끝 --%>
 <div class="clear"></div>
     <input type="button" value="목록" class="btn1" onclick="location='admin_ptcm_list.kkc?page=${page}';" />
     <input type="button" value="수정" class="btn1" id="save" />
     <input type="button" value="취소" class="btn1" onclick="aaa();"/>
 
 </form><%-- form 태그 끝 --%>
  
</div><%-- container_cm --%>
<div class="clear"></div>

<%@ include file="../include/footer.jsp"%>
