/**
 * 
 */

function join(){
	
	if(!$('#selday>option:selected').val()){
		alert("기간을 선택하세요")
		$("#selday").val("").focus();
		return false;
	}
	if(!$('#re_adult>option:selected').val()){
		alert("예약 인원을 선택하세요")
		$("#re_adult").val("").focus();
		return false;
	}
	if($.trim($("#m_name").val())==""){
		alert("이름을 입력하세요")
		$("#m_name").val("").focus();
		return false;
	}
	if($.trim($("#tel").val())==""){
		alert("번호를 입력하세요")
		$("#tel").val("").focus();
		return false;
	}
	if($.trim($("#passwd").val())==""){
		alert("비번을 입력하세요")
		$("#passwd").val("").focus();
		return false;
	}
	var comfirm_ok1=$('#comfirm_ok1');
	if($(':radio[id="comfirm_ok1"]:checked').length<1){
		alert("동의함 버튼을 체크해주세요");
		comfirm_ok1.focus();
		event.preventDefault();
	}
		
}