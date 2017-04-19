<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./css/community/ptcm_write.css" /><%-- css적용 --%>
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

</script>

<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">글쓰기~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <form method="post" id="asdf" action="ptcm_write_ok.kkc" onsubmit="return ptcm_check();" enctype="multipart/form-data">
 <div id="menubar">
  <input type="button" value="자유게시판" class="bt1" onclick="location='cm_list.kkc';"/>
  <input type="button" value="나만의포토" class="bt1" onclick="location='ptcm_list.kkc';"/>
  <input type="button" value="목록" class="btn" onclick="location='ptcm_list.kkc?page=${page}';" />
  </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
<!--  <div id="imgs"> -->
<!--   <img src="./images/tm01.jpg" width="200" height="400"> -->
<!--  </div> -->
 
 <div id="table_div">
  <table id="notice">
   <tr>
    <th class="th1">작성자</th>
    <td><input name="pt_name" id="pt_name" class="td1" readonly="readonly" value="${id}" /></td>
   </tr>
   <tr>
    <th class="th1">비밀번호</th>
    <td><input type="password" name="pt_pwd" id="pt_pwd" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">제목</th>
    <td><input name="pt_title" id="pt_title" class="td1" /></td>
   </tr>
   <tr>
    <th class="th1">내용</th>
    <td><textarea name="pt_cont" id="pt_cont" class="td2"></textarea></td>
   </tr>
   <tr>
    <th class="th1"><input type="button" value="추가" id="add" /></th>
   </tr>
   <tr id="ddd">
    <th class="th1">파일첨부</th>
    <td><input type="file" name="pt_file" id="pt_file" class="td1"></td>
   </tr>
   
  </table>
     <input type="reset" value="취소" class="btn1" onclick="aaa();"/>
     <input type="submit" value="등록" class="btn1" id="save"/>
 </div><%-- table_div 끝 --%>
 
 </form><%-- form 태그 끝 --%>
 
 </div><%-- container_cm1 끝 --%>
 
</div><%-- container_cm --%>

<%@ include file="../include/footer.jsp"%>
