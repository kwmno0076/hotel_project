/**
 *   mem.js
 */

function join_check(){
	  var reg = /(010|011|016|019)-\d{3,4}-\d{4}/; 														/*핸드폰 정규표현 ㅇㅇ*/
	  	
	  var phoneVal = $("#mem_phone").val();
	  
	  var emailVal = $("#mem_email").val();
	  
	  var ereg=  /[-_.+a-zA-Z0-9]+[@].+[.][[a-zA-Z0-9]+|[a-zA-Z0-9]+[.][a-zA-Z0-9]+]/i;			 /*email 정규표현. @.들어가야됨.*/
	  
	  var pereg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/i;				 /*비밀번호 정규표현식. 7~16자리 특수문자,알파벳 숫자 포함해야함*/
	
	  var regex = /^[a-zA-z][a-zA-Z0-9]{5,15}$/gi;
	  var idVal = $("#mem_id").val().trim();
	  
	  var rename = /^[가-힣]{2,10}$/i;
	  
	  var nameVal = $("#mem_name").val().trim();
	  
	  if($.trim($("#mem_id").val())==""){
		alert("회원아이디를 입력해주세요.");
		$("#mem_id").val("").focus();
		return false;
	}else if(!regex.test(idVal)){
		alert("아이디는 영문,숫자 조합 6자리 이상 15자리 미만으로 입력하세요.");
		$("#mem_id").val("").focus();
		return false;
	}
	
	
	$mem_pwd=$.trim($("#mem_pwd").val());
	$mem_chk=$.trim($("#mem_chk").val());
	
	if($mem_pwd.length == 0){
		alert("비밀번호를 입력해 주세요.");
		$("#mem_pwd").val("").focus();
		return false;
	}else if(!pereg.test($mem_pwd)){
		alert("비밀번호는 특수문자,영문 숫자 포함 7~16자리 내로 입력하세요.")
		$("#mem_pwd").val("").focus();
		return false;
	}
	
    if($mem_chk==0){
    	alert("비밀번호 확인란을 입력해주세요.");
    	$("#mem_chk").val("").focus();
    	return false;
    }
    
    if($mem_pwd != $mem_chk){
    	alert("비밀번호가 틀립니다");
    	$("#mem_pwd").val("");
    	$("#mem_chk").val("");
    	$("#mem_pwd").focus();
    	return false;
    }
    
    if($.trim($("#mem_name").val()) == ""){
    	alert("이름을 입력하세요.");
    	$("#mem_name").val("").focus();
    	return false;
    }else if(!rename.test(nameVal)){
    	alert("이름은 한글로만 가능합니다.");
    	$("#mem_name").val("").focus();
    	return false;
    }

    if(phoneVal.length == 0){
    	alert("핸드폰 번호를 입력하세요.");
    	$("#mem_phone").val("").focus();
    	return false;
    }
    else if(!reg.test(phoneVal)){
    	alert("핸드폰 번호를 정확히 입력해주세요.");
    	$("#mem_phone").val("").focus();
    	return false;
    }

    if(emailVal.length == 0){
    	alert("이메일 주소를 입력하세요.");
    	$("#mem_email").val("").focus();
    	return false;
    }else if(!ereg.test(emailVal)){
    	alert("이메일을 정확히 입력해주세요.");
    	$("#mem_email").val("").focus();
    	return false;
    }
}

	function mem_edchk(){
	var reg = /(010|011|016|019)-\d{3,4}-\d{4}/; 														/*핸드폰 정규표현 ㅇㅇ*/
  	
	  var phoneVal = $("#mem_phone").val();
	  
	  var emailVal = $("#mem_email").val();
	  
	  var ereg=  /[-_.+a-zA-Z0-9]+[@].+[.][[a-zA-Z0-9]+|[a-zA-Z0-9]+[.][a-zA-Z0-9]+]/i;			 /*email 정규표현. @.들어가야됨.*/
	  
	  var pereg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/i;				 /*비밀번호 정규표현식. 7~16자리 특수문자,알파벳 숫자 포함해야함*/
	
	    $mem_pwd=$.trim($("#mem_pwd").val());
		$pwd_chk=$.trim($("#pwd_chk").val());
		
		
		if($mem_pwd.length == 0){
			alert("비밀번호를 입력해 주세요.");
			$("#mem_pwd").val("").focus();
			return false;
		}else if(!pereg.test($mem_pwd)){
			alert("비밀번호는 특수문자,영문 숫자 포함 7~16자리 내로 입력하세요.")
			$("#mem_pwd").val("").focus();
			return false;
		}
		
	    if($pwd_chk==0){
	    	alert("비밀번호 확인란을 입력해주세요.");
	    	$("#pwd_chk").val("").focus();
	    	return false;
	    }
	    
	    if($mem_pwd != $pwd_chk){
	    	alert("비밀번호가 틀립니다");
	    	$("#mem_pwd").val("");
	    	$("#pwd_chk").val("");
	    	$("#mem_pwd").focus();
	    	return false;
	    }
	    
	    if(emailVal.length == 0){
	    	alert("이메일 주소를 입력하세요.");
	    	$("#mem_email").val("").focus();
	    	return false;
	    }else if(!ereg.test(emailVal)){
	    	alert("이메일을 정확히 입력해주세요.");
	    	$("#mem_email").val("").focus();
	    	return false;
	    }
	    
	    if(phoneVal.length == 0){
	    	alert("핸드폰 번호를 입력하세요.");
	    	$("#mem_phone").val("").focus();
	    	return false;
	    }
	    else if(!reg.test(phoneVal)){
	    	alert("핸드폰 번호를 정확히 입력해주세요.");
	    	$("#mem_phone").val("").focus();
	    	return false;
	    }
}