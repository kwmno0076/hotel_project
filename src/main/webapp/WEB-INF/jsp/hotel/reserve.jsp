<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/jquery.bxslider.min.js"></script>
<link href="./css/jquery.bxslider2.css" rel="stylesheet" />

<!-- <script type="text/javascript" src="./js/jquery.js"></script> -->

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

 <script type="text/javascript"> 
 
function selectEvent(selectObj) {
				
				
				//alert(selectObj.value.substring(0,6) + "가 선택 되었습니다."); 
				//스트링클래스 indexof 원 찾고  -- 50000원
				//서브 스트링으로 0부터 indexof -- 50000
				//int 값으로 바꿔 -- integer.parseInt(2..)
				
				var c = selectObj.value.substring(0,6);
				var d = Number(c);				
				alert(d + 100);	
			} 
			
function selectEvent2(selectObj2) {
	
				var a = selectObj2.value.substring(0,6);
				var b = Number(a);				
				alert(b + 100);
			} 
			
 </script>  
 
<script type="text/javascript">

function bankDisplay(frm) {

    var bank = frm.selectbank.selectedIndex;

    switch( bank ){
	   case 0:
	     frm.bank.value = '은행 및 계좌번호가 표시됩니다.';
		 break;
	   case 1:
	     frm.bank.value = '(국민은행) 012-33-456-789';
		 break;
	   case 2:
	     frm.bank.value = '(기업은행) 123-456789-02-011';
		 break;
	   case 3:
	     frm.bank.value = '(우리은행) 122-13-0456789';
		 break;
	   case 4:
	     frm.bank.value = '(신한은행) 0123456-08-09922';
		 break;
    }
	
    return true;
}




</script>
<link rel="stylesheet" type="text/css" href="./css/reserve.css" /><%-- css적용 --%>
</head>
<body>

<header></header> <%--헤더양념 --%>


<div id=one >
	<div id=two>
	<div id=re_h> <%-- 슬라이더 라인 --%>
	
 	<ul class="bxslider"><%-- 슬라이더 --%>
    <li><img src="./images/hotel01.jpg" /></li>
    <li><img src="./images/hotel02.jpg" /></li>
    <li><img src="./images/hotel03.jpg" /></li>
    <li><img src="./images/hotel04.jpg" /></li>
    <li><img src="./images/hotel05.jpg" /></li>
    <li><img src="./images/hotel07.jpg" /></li>
   
   </ul>
   
   <div id="test">
    <a data-slide-index="0" href=""><img src="./images/hotel01.jpg"  class="test"/></a>
    <a data-slide-index="1" href=""><img src="./images/hotel02.jpg" class="test"/></a>
    <a data-slide-index="2" href=""><img src="./images/hotel03.jpg" class="test"/></a>
    <a data-slide-index="3" href=""><img src="./images/hotel04.jpg" class="test"/></a>
    <a data-slide-index="4" href=""><img src="./images/hotel05.jpg" class="test"/></a>
    <a data-slide-index="5" href=""><img src="./images/hotel07.jpg" class="test"/></a>
    
   
    
   </div>
   
   <button  name="객실사진 바로가기" id="btn_i">객실사진보기</button>
   
   
   </div>
   
   </div>
   
  <div id="sex">  <%-- 우측 상단박스 --%>
  
	<div>
	
	<div>
		<h3 >원하시는 방을 선택해주세요.</h3>
	</div>
	
	<div>
		<select name="selectroom" onChange="javascript:selectEvent(this)" class="room">
		<option value="0" selected="selected">선택</option>
	<option value="50000" >일반A +50000원</option>
	<option value="50000">일반B +50000원</option>
	<option value="70000">준특실A +70000원</option>
	<option value="70000">준특실B +70000원</option>
	<option value="100000">특실A +100000원</option>
	<option value="100000">특실B +100000원</option>
	<option value="150000">파티룸 +150000원</option>
	<option value="150000">스위밍 룸 +150000원</option>
		</select>
	</div>
	</div>

	<div>
	
	<div>
		<h3 >원하시는 방을 선택해주세요.</h3>
	</div>
	
	<div>
		<select name="selectroom" onChange="javascript:selectEvent2(this)" class="room">
	<option value="50000" selected="selected">일반A +50000원</option>
	<option value="50000">일반B +50000원</option>
	<option value="70000">준특실A +70000원</option>
	<option value="70000">준특실B +70000원</option>
	<option value="100000">특실A +100000원</option>
	<option value="100000">특실B +100000원</option>
	<option value="150000">파티룸 +150000원</option>
	<option value="150000">스위밍 룸 +150000원</option>
		</select>
		
	</div>
	</div>
	
	<div>
	
	<form name = "form" >
	<div>
		<h3 >입금하실 은행을 선택해주세요.</h3>
	</div>
	
	<div>
	<select name="selectbank" onChange="bankDisplay(this.form)" class="room">
	<option value="0" selected="selected">선택하세요</option>
	<option value="1" >국민은행</option>
	<option value="2">기업은행</option>
	<option value="3">우리은행</option>
	<option value="4">신한은행</option>
	
		</select>
	<br/>
	<hr/>
	
	
	
	<div id=bank>
	<h3 >
	<font color="#0000ff">*</font>입 금 계 좌 
	</h3>
	<input id="bank2" name="bank" type="text" size="50" maxlength="50" />
    </div>
    
		
	</div>
	</form>
	</div>
	
	<br/>
	
	
	
	<div id=bank>
	<h2 >
	<font color="#0000ff">*</font>금 액 :
	<input id="bank3" name="a" type="text" size="50" maxlength="50" />
	<input id="bank3" name="b" type="text" size="50" maxlength="50" />
	</h2>
	
    </div>
	
	


	</div> <%-- 우측상단 박스 끝 --%>


	




</div><%-- 헤더를 제외한 전체 라인 끝  --%>

</body>

<%@ include file="../include/footer.jsp"%>
</html>