/**
 * index.jsp 페이지 관련 js
 */

//레이어팝업열기
function openLayer(idName, tpos, lpos) {
	var pop = document.getElementById(idName);
	pop.style.top = tpos + "%";
	pop.style.left = lpos + "%";

	var oDiv = document.getElementById("deemed");
	document.body.appendChild(oDiv);
	oDiv.style.display = "inline-block";

	if (idName == 'join') {
		closeLogin('login');
	} else if (idName == 'search') {
		closeLogin('login');
	}
}
//레이어팝업닫기
function closeLayer(idName) {
	var pop = document.getElementById(idName);
	pop.style.display = "none";
	var oDiv = document.getElementById("deemed");
	oDiv.style.display = "none";
	document.body.removeChild(oDiv);

	var reUrl = document.location.hash;
	location.replace(reUrl);
}
//로그인레이어닫기
function closeLogin(idName) {
	var pop = document.getElementById(idName);
	pop.style.display = "none";
}

//로그인 유효성 검증
function login_check(){
	if($.trim($("#m_id").val()).length==0){
		alert("아이디를 입력하세요");
		$("#m_id").val("").focus();
		return false;
	}
	if($.trim($("#m_pwd").val()).length==0){
		alert("비밀번호를 입력하세요");
		$("#m_pwd").val("").focus();
		return false;
	}
}
//비밀번호변경 체크
function pwd_check(){
	$edit_pwd=$.trim($("#m_pwd2").val());
	$edit_pwd2=$.trim($("#m_pwd3").val());
	
	if($edit_pwd.length < 8){
		alert("비밀번호는 8자 이상이어야 합니다.")
		$("#m_pwd3").val('');
		$("#m_pwd2").val('').focus();
		return false;
	};
	if(($.trim($("#m_pwd2").val()))!=($.trim($("#m_pwd3").val()))){
		alert("비밀번호가 일치하지 않습니다");
		$("#m_pwd3").val("").focus();
		return false;
	}
	if(!(validate_userpwd($edit_pwd))){
		alert("비밀번호는 영문소문자, 숫자만 가능합니다.");
		$("#m_pwd2").val('').focus();
		return false;
	};
}
//회원가입 체크
function join_check(){
	$join_pwd=$.trim($(".psw_ip").val());
	$join_id=$.trim($("#join_id").val());
	
	if($.trim($(".id_ip").val()).length==0){
		alert("아이디를 입력하세요");
		$(".id_ip").val("").focus();
		return false;
	}
	if($join_id.length < 5){
		alert("아이디는 5자 이상이어야 합니다");
		$(".id_ip").val("").focus();
		return false;
	}
	if($join_id.length > 12){
		alert("아이디는 12자 이하여야 합니다");
		$(".id_ip").val("").focus();
		return false;
	}
	if(!(validate_userid($join_id))){
		alert("아이디는 영문소문자,숫자만 가능합니다");
		$(".id_ip").val("").focus();
		return false;
	}
	if($.trim($(".psw_ip").val()).length==0){
		alert("비밀번호를 입력하세요");
		$(".psw_ip").val("").focus();
		return false;
	}
	if($.trim($(".psw_ip2").val()).length==0){
		alert("비밀번호를 확인해주세요");
		$(".psw_ip2").val("").focus();
		return false;
	}
	if(($.trim($(".psw_ip").val()))!=($.trim($(".psw_ip2").val()))){
		alert("비밀번호가 일치하지 않습니다");
		$(".psw_ip2").val("").focus();
		return false;
	}
	
	if($join_pwd.length < 8){
		alert("비밀번호는 8자 이상이어야 합니다.")
		$(".psw_ip2").val('').focus();
		return false;
	};

	//2.정규표현식으로 비밀번호 유효성 검사
	if(!(validate_userpwd($join_pwd))){
		alert("비밀번호는 영문소문자, 숫자만 가능합니다.");
		$(".psw_ip").val('').focus();
		return false;
	};
	
	if($.trim($(".name_ip").val()).length==0){
		alert("이름을 입력하세요");
		$(".name_ip").val("").focus();
		return false;
	}
	if($.trim($(".yy_ip").val()).length==0){
		alert("태어난 년도를 입력하세요");
		$(".yy_ip").val("").focus();
		return false;
	}
	if($(".mm_select").val()==""){
		alert("태어난 달을 선택하세요");
		$(".mm_select").val("").focus();
		return false;
	}
	if($.trim($(".dd_ip3").val()).length==0){
		alert("태어난 날짜를 입력하세요");
		$(".dd_ip3").focus();
		return false;
	}
	if($.trim($(".email_ip").val()).length==0){
		alert("E-mail을 입력하세요");
		$(".email_ip").val("").focus();
		return false;
	}
}
//아이디 체크
function idCheck(){
	
	$("#idfind").hide();
	//아이디 영역을 숨김
	
	$join_id=$.trim($("#join_id").val());
	
	//alert($join_id);
	
	//1.입력글자 길이 체크
	if($("#join_id").val()==""){
		$newtext='<font color="red" size="3"><b>아이디를 입력하세요</b></font>';
		$("#idfind").text('');
		//idfind 아이디 영역 문자열을 초기화
		$("#idfind").show();
		//idfind 아이디 영역을 보이게 함.
		$("#idfind").append($newtext);
		//idfind영역에 문자열을 추가
		$("#join_id").focus();
		return false;
	}
	if($join_id.length < 5){
		$newtext='<font color="red" size="2"><b>아이디는 5자 이상이어야 합니다.</b></font>';
		$("#idfind").text('');
		//idfind 아이디 영역 문자열을 초기화
		$("#idfind").show();
		//idfind 아이디 영역을 보이게 함.
		$("#idfind").append($newtext);
		//idfind영역에 문자열을 추가
		$("#join_id").val('').focus();
		return false;
	};
	if($join_id.length > 12){
		$newtext='<font color="red" size="2"><b>아이디는12자 이하이어야 합니다.</b></font>';
		$("#idfind").text('');
		//idfind 아이디 영역 문자열을 초기화
		$("#idfind").show();
		//idfind 아이디 영역을 보이게 함.
		$("#idfind").append($newtext);
		//idfind영역에 문자열을 추가
		$("#join_id").val('').focus();
		return false;
	};
	//2.정규표현식으로 회원아이디 유효성 검사
	if(!(validate_userid($join_id))){
		$newtext='<font color="red" size="2"><b>아이디는 영문소문자,숫자만 가능합니다.</b></font>';
		$("#idfind").text('');
		$("#idfind").show();
		$("#idfind").append($newtext);
		$("#mem_id").val('').focus();
		return false;
	};
	
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법
       //url:"./member/id_check.jsp",    
        url:"id_check.coc", //아작스 서버 주소 파일명
        data: {"id":$join_id},  //좌측 id 피라미터 이름에 우측 $join_id변수값을 저장
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
        
        success: function (data) {
        	//success는 아작스로 받아오는것이 성공했을경우
        	//서버 데이터를 data변수에 저장
         	
      	  if(data==1){//중복 아이디가 있다면
      		$newtext='<font color="red" size="2"><b>중복 아이디입니다.</b></font>';
      		$("#idfind").text('');
        	$("#idfind").show();
        	$("#idfind").append($newtext);          		
          	$("#join_id").focus();
          	return false;
	     
      	  }else{//중복 아이디가 아니면
      		$newtext='<font color="blue" size="2"><b>사용가능한 아이디입니다.</b></font>';
      		$("#idfind").text('');
      		$("#idfind").show();
      		$("#idfind").append($newtext);
      		$("#mem_pwd").focus();
      	  }  	    	  
        },
    	  error:function(){//비동기식 자료 받아오는 것을 실패시 호출
    		  //되는 함수
    		  alert("data error");
    	  }
      });//$.ajax
}
//아이디 정규식 유효성 검증
function validate_userid($id){

	var pattern= new RegExp(/^[a-z0-9]+$/);
	return pattern.test($id);
	//회원아이디가 영문소문자와 숫자만 가능하게 함.

}
//비밀번호 정규식 유효성 검증
function validate_userpwd($pwd){

	var pattern= new RegExp(/^[a-z0-9]+$/);
	return pattern.test($pwd);

}
//예약비밀번호 정규식
function validate_respwd($pwd){
	var pattern= new RegExp(/^[0-9]+$/);
	return pattern.test($pwd);
}
//레이어팝업 open효과
$(document).ready(function() {
	$(".m_log").click(function() {
		$('#login').fadeIn("slow");
	});
});
$(document).ready(function() {
	$(".m_join").click(function() {
		$('#join').fadeIn("slow");
	});
});
$(document).ready(function() {
	$(".m_search").click(function() {
		$('#search').fadeIn("slow");
	});
});

//체크인 체크아웃 달력
$(function() {
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    showButtonPanel: true,
    yearSuffix: '년',
    closeText: 'Clear',
    onClose: function(dateText, inst) {
      if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
        document.getElementById(this.id).value = '';
      }
    }
  });
});
$(function() {
  $("#date1, #date2").datepicker();
});

//이미지롤링
$(function() {
	$("#main_bn").ulslide({
		statusbar : true,
		width : 420,
		height : 250,
		affect : 'slide',
		axis : 'x',
		navigator : '#main_bn_bt a',
		duration : 400,
		autoslide : 2000
	});
});
//메인이미지
$(document).ready(
		function() {
			$("#os-phrases > h2").lettering('words').children("span")
					.lettering().children("span").lettering();
});
//답변보기 버튼이벤트
function showRep(){
	var repName=document.getElementById("q_repname");
	if(repName.value==""){
		alert("작성된 답변이 아직 없습니다.");
	}else{
	var reDiv=document.getElementById("repCont");
	
	reDiv.style.visibility='visible';
	}
}
//CK에디터
/*$(function(){
    CKEDITOR.replace( 'freebord_cont', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'380px',
        resize_enabled : false, // 에디터 크기를 조절하지 않음
        removePlugins : "elementspath",
        filebrowserImageUploadUrl:"ckeditorImageUpload.coc",
        //파일 업로드 매핑주소 해당 매핑주소로 파일을 전달하여 업로드 한다.
    	     
       toolbar :
       [
           ['NewPage','Preview'],
           ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
           ['Styles','Format'],
           ['Bold','Italic','Strike'],
           ['NumberedList','BulletedList'],
           ['Maximize','-','About']
       ]
    });
    CKEDITOR.on('dialogDefinition', function (ev) {
      var dialogName = ev.data.name;
      var dialog = ev.data.definition.dialog;
      var dialogDefinition = ev.data.definition;

         if (dialogName == 'image') {
            dialog.on('show', function (obj) {
            this.selectPage('Upload'); //업로드텝으로 시작
         });

         dialogDefinition.removeContents('advanced'); // 자세히탭 제거
         dialogDefinition.removeContents('Link'); // 링크탭 제거
      }
   });
    
});

//ckeditor내용 가져오기
function check(){
	
	 var instance=CKEDITOR.instances.f_cont;
		
		instance.updateElement();
		$("#output").attr("value",instance.getData());
	if($.trim("#f_cont").val()==""){
		alert("내용을입력하세요");
		return false;
	}
	
}*/
//예약정보입력 검사
function res_check(){
	$r_usemen=$.trim($("#r_men").val());
	$res_pwd=$.trim($("#r_pwd").val());
	$res_umen=$.trim($("#r_usemen").val());
	$res_amen=$.trim($("#cl_addmen").val());
	$res_car=$.trim($("#cl_addcar").val());
	
	if($res_pwd.length < 4){
		alert("비밀번호는 4자 이상이어야 합니다.");
		$("#r_respwd").val('').focus();
		return false;
	};
	if($("#selday").val()==0){
		alert("이용기간을 선택해주세요");
		return false;
	}
	if(!(validate_respwd($res_umen))){
		alert("예약인원란은 숫자만 입력 가능합니다.");
		$("#r_usemen").val('').focus();
		return false;
	};
	if($res_umen>$r_usemen){
		alert("예약인원은 기준인원을 초과할 수 없습니다");
		$("#r_usemen").val('').focus();
		return false;
	}
	if(!(validate_respwd($res_amen))){
		alert("인원추가란은 숫자만 입력 가능합니다.");
		$("#cl_addmen").val('').focus();
		return false;
	};
	if(!(validate_respwd($res_car))){
		alert("차량추가란은 숫자만 입력 가능합니다.");
		$("#cl_addcar").val('').focus();
		return false;
	};
	if(!(validate_respwd($res_pwd))){
		alert("예약비밀번호는 숫자만 입력 가능합니다.");
		$("#r_respwd").val('').focus();
		return false;
	};

	var chk = $("#comfirm_ok1").is(":checked");
	if (!chk) {
		alert("동의란을 체크해주세요.");
		return false;
	}
}
//예약날짜별 금액합
function PriceSum(){
	
	var up=document.getElementById("useprice");
	
	var rowLen=up.rows.length;
	var sumPrice=0;

	for(var i=0;i<rowLen;i++){
		sumPrice+=parseInt(up.rows[i].cells[0].outerText);				
	}

	return sumPrice;
}
//예약 총 결제정보
function allPriceSum(){
	
	var tb=document.getElementById("resconfirm");
	
	var sumprice=0;
	var up=document.getElementById("useprice");
	
	var rowLen=up.rows.length;
	for(var i=0;i<rowLen;i++){
		sumprice+=parseInt(up.rows[i].cells[0].outerText);
	}
	var price=sumprice;
	//var price=tb.rows[1].cells[4].outerText;
	//price=price.split('원');
	//price=parseInt(price);
	var addmen=tb.rows[1].cells[5].outerText;
	addmen=addmen.split('원');
	addmen=parseInt(addmen);
	var addcar=tb.rows[1].cells[6].outerText;
	addcar=addcar.split('원');
	addcar=parseInt(addcar);
	var elec=tb.rows[1].cells[7].outerText;
	elec=elec.split('원');
	elec=parseInt(elec);
		
	var sum=price+addmen+addcar+elec;
	
	var text="<input type='hidden' name='r_price' class='r_price' size='3' readonly='readonly' value="+sum;
	text=text+">"+sum;
	return text;
		
}
function confirmPrice(){
	var tb=document.getElementById("resconfirm");
	var form=document.getElementById("resok");
	
	var cp=tb.rows[1].cells[8].outerText;
	cp=cp.split('원');
	cp=parseInt(cp);
	
	var allprice=document.getElementById("r_price");
	
	allprice.value(cp);	
}
//예약정보 전송
$(document).ready(function(){

	var tb=document.getElementById("resconfirm");
	var allprice=tb.rows[1].cells[8].outerText;
	allprice=allprice.split('원');
	allprice=parseInt(allprice);
	
	$("#r_price").val(allprice);
	
	$("#next").click(function(){
		$("#resok").submit();
	});
});
//댓글 삭제
function comment_check(){
    if($.trim($("#replyarea").val()) == ""){
       alert("댓글 내용을 입력하세요!");
       $("#replyarea").val("").focus();
       return false;
    }
}

function com_del_ok($comment_no,$freebord_no,$page){
    if(window.confirm("정말로 댓글을 삭제할까요?")==true){
       location="comment_del_ok.coc?comment_no="+$comment_no+
             "&freebord_no="+$freebord_no+"&state=cont&page="+$page;
       /*
        자바스크립트 최상위 객체는 웹브라우저를 가리키는 window객체이다. 이 객체
        하위의 confirm()메서드는 삭제유무를 물어볼때 주로 사용한다.즉 확인/취소
        버튼을 가진 경고창을 만들어 준다.확인을 클릭하면  true로 반환해서 삭제하게
        하고,취소를 클릭하면 false 를 반환해서 삭제 안되게 한다.
       */
    }else{
       return;
    }
}

//이메일 인증 (ID찾기)

function email_check(){
	$email = $.trim($("#mail_IdSearch").val());
   if($.trim($("#mail_IdSearch").val())==""){
      alert("이메일을 입력해주세요.");
      return false;
   }else{
	  $.ajax({
		 type: "POST",
		 url: "id_mail.coc",
		 data: {"email":$email},
		 datatype:"int",
		 
		 success: function(data){
			 
			 if(data==0){
				 alert("가입되지 않은 이메일입니다.");
				 $("#mail_IdSearch").val("").focus();
				 return false;
			 }
			 if(data==1){
				 alert("인증번호가 발송되었습니다.");
				 $("#email_confirm").focus();
			 }
			 
		 },
		 error:function(){
			 alert("ERROR");
		 }
	  });
   }
}

function email_checkNum(){
   var num = $("#mail_Idsearch2").val();
   var email = $.trim($("#mail_IdSearch").val());
   var sendData="num="+num;
   var numReg = /^[0-9]+$/ ;   
   if($.trim($("#mail_Idsearch2").val())==""){
      alert("인증번호를 입력해주세요.");
      return false;
   }else if(!(numReg.test(num))){
      alert("숫자만 입력이 가능합니다.");
      return false;   
   }else{
      $query={
            email:email,
            num:num
      };
      $.post(
            "id_confirm.coc",
            $query,
            function(data){
                  if(data==0){
                     alert("인증번호가 일치하지 않습니다.");
                     $("#mail_Idsearch2").val("").focus();
                  }
                  if(data==1){
                	  ddkoddko.mail_IdSearch.readOnly = true;
                	  $("#hiddenhidden").val("true");
                     alert("인증번호 확인");
                  }
            }
         );
         return false;
      
   }
}
//이메일 유효성 (히든값)
function checkcheck(){
	if($("#hiddenhidden").val()=="false"){
		alert("이메일을 인증해주세요");
		return false;
	}
}

//이메일 인증 (비밀번호 찾기)
function email_check2(){
	$email = $.trim($("#mail_IdSearch01").val());
   if($.trim($("#mail_IdSearch01").val())==""){
      alert("이메일을 입력해주세요.");
      return false;
   }else{
	  $.ajax({
		 type: "POST",
		 url: "id_mail.coc",
		 data: {"email":$email},
		 datatype:"int",
		 
		 success: function(data){
			 
			 if(data==0){
				 alert("가입되지 않은 이메일입니다.");
				 $("#mail_IdSearch01").val("").focus();
				 return false;
			 }
			 if(data==1){
				 alert("인증번호가 발송되었습니다.");
				 $("#email_confirm01").focus();
			 }
			 
		 },
		 error:function(){
			 alert("가입되지 않은 이메일입니다.");
		 }
	  });
   }
}

function email_checkNum2(){
   var num = $("#mail_Idsearch201").val();
   var email = $.trim($("#mail_IdSearch01").val());
   var sendData="num="+num;
   var numReg = /^[0-9]+$/ ;   
   if($.trim($("#mail_Idsearch201").val())==""){
      alert("인증번호를 입력해주세요.");
      return false;
   }else if(!(numReg.test(num))){
      alert("숫자만 입력이 가능합니다.");
      return false;   
   }else{
      $query={
            email:email,
            num:num
      };
      $.post(
            "id_confirm.coc",
            $query,
            function(data){
                  if(data==0){
                     alert("인증번호가 일치하지 않습니다.");
                     $("#mail_Idsearch201").val("").focus();
                  }else{
                	  ddko.mail_IdSearch01.readOnly = true;
                	  $("#hiddenhidden01").val("true");
                     alert("인증번호 확인");
                  }
            }
         );
         return false;
   }
}
//이메일 유효성 (히든값)
function checkcheck01(){
	if($("#hiddenhidden01").val()=="false"){
		alert("이메일을 인증해주세요");
		return false;
	}
}

//검색 유효성 검사
function searchCheck(){
	if($("#loc").val()==""){
		alert("지역을 선택하세요");
		return false;
	}
	if($("#date1").val()==""){
		alert("날짜를 선택하세요");
		return false;
	}
	if($("#per_value").val()==""){
		alert("이용하실 종류를 선택하세요");
		return false;
	}
}

function cancelgo(resref){
	
	if(confirm("예약취소를 신청하시겠습니까?") == true){
		rescancel('cancelgo',resref);
	}
}
function rescancel(a,b){
	if(a=='cancelgo'){
		location.href="res_cancel.coc?r_resref="+b;
	}
}

function paygo(resref,rPrice){
	location.href="cardPay.coc?r_resref="+resref+"&r_price="+rPrice;
}
/*캠핑장 상세정보 이미지 팝업*/
var cnj_img_view = null;
function cnj_win_view(img){
img_conf1= new Image();
img_conf1.src=(img);
cnj_view_conf(img);
}

function cnj_view_conf(img){
if((img_conf1.width!=0)&&(img_conf1.height!=0)){
cnj_view_img(img);
} else {
funzione="cnj_view_conf('"+img+"')";
intervallo=setTimeout(funzione,20);
}
}

function cnj_view_img(img){
if(cnj_img_view != null) {
if(!cnj_img_view.closed) { cnj_img_view.close(); }
}
cnj_width=img_conf1.width+20;
cnj_height=img_conf1.height+20;
str_img="width="+cnj_width+",height="+cnj_height;
cnj_img_view=window.open(img,"cnj_img_open",str_img);
cnj_img_view.focus();
return;
}

/*쿠키생성
function setCookie(cName,cValue,cDay){
	var expire=new Date();
	expire.setDate(expire.getDate()+cDay);
	
	cookies=cName+'='+escape(cValue)+'; path=/';
	
	if(typeof cDay != 'undefined') cookies+=';expires='+expire.toGMTString()+';';
	
	document.cookie=cookies;
}*/
/*쿠키가져오기
function getCookie(cName){
	cName=cName+'=';
	
	var cookieData=document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue='';
	if(start != -1){
		start+=cName.length;
		var end=cookieData.indexOf(';',start);
		if(end == -1) end=cookieData.length;
		cValue=cookieData.substring(start,end);
	}
	return unescape(cValue);
}*/