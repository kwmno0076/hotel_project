/**
 * 
 */
function check(){

	if($.trim($("#gongji_title").val())==""){
		alert("제목을 입력하세요!");
		$("#gongji_title").val("").focus();
		return false;
	}
	if($.trim($("#gongji_cont").val())==""){
		alert("내용을 입력하세요!");
		$("#gongji_cont").val("").focus();
		return false;
	}
}

function check2(){
	if($.trim($("#fb_pwd").val())==""){
		alert("비밀번호를 입력하세요!");
		$("#fb_pwd").val("").focus();
		return false;
	}
	if($.tirm($("#fb_title").val())==""){
		alert("제목을 입력하세요!");
		$("#fb_title").val("").focus();
		return false;
	}
	if($.tirm($("#fb_cont").val())==""){
		alert("제목을 입력하세요!");
		$("#fb_cont").val("").focus();
		return false;
	}
}