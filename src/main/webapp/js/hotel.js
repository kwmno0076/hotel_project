/**
 * hotel.js
 */

function hw_check(){
	if($.trim($("#h_name").val())==""){
		alert("이름을 입력하세요!");
		$("#h_name").val("").focus();
		return false;
	}
	if($.trim($("#h_title").val())==""){
		alert("제목을 입력하세요!");
		$("#h_title").val("").focus();
		return false;
	}
	
    if($.trim($("#h_cont").val())==""){
    	alert("내용을 입력하세요!");
    	$("#h_cont").val("").focus();
    	return false;
    }	
}

//검색어 유효성 검증
function find_check(){
	if($.trim($("#find_name").val())==""){
		alert("검색어를 입력하세요!");
		$("#find_name").val("").focus();
		return false;
	}
}

//자료실 삭제폼 유효성 검증
/*function del_check(){
	if($.trim($("#del_pwd").val())==""){
		alert("비번을 입력하세요!");
		$("#del_pwd").val("").focus();
		return false;
	}
}*/

	


























