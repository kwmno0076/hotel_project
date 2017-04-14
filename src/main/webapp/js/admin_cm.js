/**
 *  cm.js
 */

 function cm_check(){
	if($.trim($("#cm_name").val())==""){
		alert("작성자를 입력하세요!");
		$("#cm_name").val("").focus();
		return false;
	}
	if($.trim($("#cm_pwd").val())==""){
		alert("비밀번호를 입력하세요!");
		$("#cm_pwd").val("").focus();
		return false;
	}
	if($.trim($("#cm_title").val())==""){
		alert("제목을 입력하세요!");
		$("#cm_title").val("").focus();
		return false;
	}
    if($.trim($("#cm_cont").val())==""){
    	alert("내용을 입력하세요!");
    	$("#cm_cont").val("").focus();
    	return false;
    }	
 }
 

 
 function test(){
		alert("로그인하세요!");
 }
 
function login_check(){
	
	alert("로그인을 해주세요.");
	
	$(location).attr("href", "/project/login.kkc");
	
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
 function del_check(){
 	if($.trim($("#del_pwd").val())==""){
 		alert("비번을 입력하세요!");
 		$("#del_pwd").val("").focus();
 		return false;
 	}
 }

 
 
 //스마트 에디터
 var oEditors = [];
 $(function(){
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder : "cm_cont",
	        //SmartEditor2Skin.html 파일이 존재하는 경로
	        sSkinURI : "./SE2/SmartEditor2Skin.html",
	        htParams : {
	           // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseToolbar : true,
	         // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseVerticalResizer : false,
	         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseModeChanger : false,  
	            
	            fOnBeforeUnload : function(){
	                 
	            }
	        }, 
	        fOnAppLoad : function(){
	            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	            oEditors.getById["cm_cont"]//.exec("PASTE_HTML", ["첨부할 사진을 포함한 기사를 작성해 주세요!"]);
	        },
	        fCreator: "createSEditor2"
	    });
	    
	    //저장버튼 클릭시 form 전송
	    $("#save").click(function(){
	        oEditors.getById["cm_cont"].exec("UPDATE_CONTENTS_FIELD", []);
	        $("#asdf").submit();
	    });
	});
