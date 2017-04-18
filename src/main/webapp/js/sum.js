
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
	
	var tb= document.getElementById("resconfirm");
	/*var tb=$("#resconfirm");*/
	
	var sumprice=0;
	var up=document.getElementById("useprice");
	
	var rowLen=up.rows.length;
	for(var i=0;i<rowLen;i++){
		sumprice+=parseInt(up.rows[i].cells[0].outerText);
	}
	
	var price=sumprice;	
	
	var price_option= tb.rows[1].cells[4].outerText;
	
	var ddd= $(caption).childrn("thead").childnd("th").eq(3);
	
	
	price_option=price_option.split('원');
	price_option=parseInt(price_option);
	
	alert($("#price_option").val());
		
	var sum= price + price_option;
	
	var text="<input type='hidden' name='r_price' class='r_price' size='3' readonly='readonly' value="+sum;
	text=text+">"+sum;
	return text;
		
}
/*function confirmPrice(){
	var tb=document.getElementById("resconfirm");
	var form=document.getElementById("resok");
	
	var cp=tb.rows[1].cells[8].outerText;
	cp=cp.split('원');
	cp=parseInt(cp);
	
	var allprice=document.getElementById("r_price");
	
	allprice.value(cp);	
}*/
//예약정보 전송
/*$(document).ready(function(){

	var tb=document.getElementById("resconfirm");
	var allprice=tb.rows[1].cells[8].outerText;
	allprice=allprice.split('원');
	allprice=parseInt(allprice);
	
	$("#r_price").val(allprice);
	
	$("#next").click(function(){
		$("#resok").submit();
	});
});*/