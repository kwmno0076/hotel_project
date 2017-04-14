
 /**
  * ptcomment.js
  */

  function ptcom_check(){
 	 if($.trim($("#pc_cont").val()) == ""){
 		 alert("댓글 내용을 입력하세요!");
 		 $("#pc_cont").val("").focus();
 		 return false;
 	 }
  }
  
  function ptcom_del_ok($pc_no,$pt_no,$page){
 	 if(window.confirm("정말로 댓글을 삭제할까요?")==true){
 		 location="ptcom_del_ok.kkc?pc_no="+$pc_no+"&pt_no="+$pt_no+"&state=cont&page="+$page;
 		 /*
 		  자바스크립트 최상위 객체는 웹브라우저를 가리키는 window객체이다. 
 		  이 객체 하위의 confirm()메서드는 삭제유무를 물어볼때 주로 사용한다.
 		  즉 확인/취소 버튼을 가진 경고창을 만들어 준다.
 		  확인을 클릭하면  true로 반환해서 삭제하게 하고,취소를 클릭하면 false 를 반환해서 삭제 안되게 한다.
 		 */
 	 }else{
 		 return;
 	 }
 }