<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./admin_css/admin_cm/admin_cm_write.css" /><%-- css적용 --%>
<script src="./js/cm.js"></script>
<script src="./SE2/js/HuskyEZCreator.js"></script>

<script>
function aaa(){
	 if(window.confirm("취소하시겠습니까?")==true){
		 location="admin_cm_list.kkc?page=${page}";
	 }else{
		 return;
	 }
}
</script>

<div id="container_cm"><%-- 헤더아래 배경 --%>

 <form method="post" id="asdf" action="admin_cm_edit_ok.kkc" onsubmit="return cm_check();" >
 <input type="hidden" name="cm_no" readonly="readonly" value="${adcb.cm_no}"/>
 
 <div id="table_div">
  <table id="notice">
   <tr>
    <th class="th1">작성자</th>
    <td><input name="cm_name" id="cm_name" class="td1" readonly="readonly" value="${admin_id}"/></td>
   </tr>
   <tr>
    <th class="th1">비밀번호</th>
    <td><input type="password" name="cm_pwd" id="cm_pwd" class="td1" readonly="readonly" value="${adcb.cm_pwd}"/></td>
   </tr>
   <tr>
    <th class="th1">제목</th>
    <td><input name="cm_title" id="cm_title" class="td1" value="${adcb.cm_title}" /></td>
   </tr>
   <tr>
    <th class="th1">내용</th>
    <td><textarea name="cm_cont" id="cm_cont" class="td2">${adcb.cm_cont}</textarea></td>
   </tr>
   <tr>
    <th colspan="2">
     <input type="button" value="목록" class="btn1" onclick="location='admin_cm_list.kkc?page=${page}';" />
     <input type="button" value="수정" class="btn1" id="save" />
     <input type="button" value="취소" class="btn1" onclick="aaa();"/>
    </th>
   </tr>
  </table>
 </div><%-- table_div 끝 --%>
 
 </form><%-- form 태그 끝 --%>
  
</div><%-- container_cm --%>
<div class="clear"></div>

<%@ include file="../include/footer.jsp"%>
