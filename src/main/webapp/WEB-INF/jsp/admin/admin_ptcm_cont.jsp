<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="./admin_css/admin_cm/admin_ptcm_cont.css" /><%-- css적용 --%>
<script src="./js/ptcm.js" ></script>
<script src="./js/ptcomment.js" ></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/jquery.bxslider.min.js"></script>
<link href="./css/jquery.bxslider3.css" rel="stylesheet" />

<!-- bx슬라이더 부분 -->
<script>
$(document).ready(function(){
   $('.bxslider').bxSlider({
        mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
        speed:400, //default:500 이미지변환 속도
        auto: true, //default:false 자동 시작
        captions: true, // 이미지의 title 속성이 노출된다.
        autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
     	pagerCustom: '#test',
     	
     	pause: 2000 //넘기는 속도
		
        // slideWidth : 900 // 메인 이미지 박스 크기줄임
      });
});
</script>

<!-- 라이트 박스부분 -->
<link type="text/css" rel="stylesheet" href="./lightGallery-master/src/css/lightgallery.css" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script src="./lightGallery-master/demo/js/lightgallery.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	$("#lightGallery").lightGallery({
		thumbnail : true // 미리보기 이미지를 표시 할 버튼을 표시할지 여부.
	});
 });
</script>

 <div id="container_cm2">
 
 <div id=re_h> <%-- 슬라이더 라인 --%>
	   
	   
 	   <div class="bxslider" id="lightGallery">
	  <c:if test="${!empty adpb.pt_file}">
	  <c:forTokens var="ima" items="${adpb.pt_file}" delims="," varStatus="sts">
	  <c:if test="${!ima.equals('null')}">
        <a href="./upload/${ima}"><img src="./upload/${ima}" /></a>
      </c:if>
      </c:forTokens>
      </c:if>
       </div>
   
      <div id="test">
      <c:if test="${!empty adpb.pt_file}">
      <c:forTokens var="ima" items="${adpb.pt_file}" delims="," varStatus="sts">
       <a data-slide-index="ima" href=""><img src="./upload/${ima}" class="test"/></a>
      </c:forTokens>
      </c:if>
      </div>
      
      
 </div>
 <div id="table_div">
  <table id="table" >
   <tr>
    <th class="th1">no</th>
    <th class="th2" colspan="5">제목</th>
   </tr>
   <tr>
    <td class="td1">${adpb.pt_no}</td> 
    <td colspan="5" class="td1">${adpb.pt_title}</td>
   </tr>
   <tr>
    <th class="th1">작성자</th> <td class="td1">${adpb.pt_name}</td>
    <th class="th1">작성일</th> <td class="td1">${adpb.pt_date}</td>
    <th class="th1">조횟수</th> <td class="td1">${adpb.pt_hit}</td>
   </tr>
   <tr>
    <th colspan="6" class="th3">내용</th>
   </tr>
   <tr>
    <td class="td2" colspan="6">${adpb.pt_cont}</td>
   </tr>
  </table>
  </div>
  
  <div class="clear"></div>
  
   <input type="button" value="삭제" class="btn1" 
    onclick="if(confirm('정말로 삭제할까요?')==true){location=
		'admin_ptcm_del.kkc?pt_no=${adpb.pt_no}&page=${page}&state=del';}else{ return; }" />
   <input type="button" value="수정" class="btn1"
	onclick="location='admin_ptcm_cont.kkc?pt_no=${adpb.pt_no}&page=${page}&state=edit';"/>
   <input type="button" value="목록" class="btn1" onclick="location='admin_cm_list.kkc?page=${page}';" />
   
 </div><%-- table 끝 --%>
 <div class="clear"></div>
 
 <%-- 댓글 입력폼 --%>
 <form method="post" action="comment_ok.kkc" onsubmit="return com_check();">
  <input type="hidden" name="cm_no" value="${c.cm_no}" />
  <input type="hidden" name="c_name" value="${c.cm_name}" />
  <input type="hidden" name="page" value="${page}" />
  
  <table id="comment">
   <tr>
    <th colspan="2" class="cth1">댓글수: ${com_count} 개</th>
   </tr>
   <tr>
    <th>
      <textarea name="c_cont" id="c_cont" class="cth2"></textarea>
    </th>
    <th>
      <input type="submit" value="댓글달기" class="cbtn1" />
    </th>
   </tr>
  </table>
 </form>
 
 <%-- 댓글 목록 --%>
 <table id="comment_cont" border="1">
  <c:if test="${!empty cmlist}">
   <tr>
    <th colspan="3">댓글목록</th>
   </tr>
   <c:forEach var="cb" items="${cmlist}">
    <tr>
     <th>${admin_id}</th>
     <td class="ctd1">${fn:substring(cb.c_date,0,16)}</td>
     <td class="ctd2">
      <c:if test="${id == c.cm_mem_id}">
       <a href="javascript:com_del_ok(${cb.c_no},${c.cm_no},${page});" onfocus="this.blur();">삭제</a>수정
      </c:if>
     </td>
    </tr>
    <tr>
     <td colspan="3" class="ctd3">${cb.c_cont}</td>
    </tr>
   </c:forEach>
  </c:if>
 </table>


 <div class="clear"></div>

<%@ include file="../include/footer.jsp"%>
