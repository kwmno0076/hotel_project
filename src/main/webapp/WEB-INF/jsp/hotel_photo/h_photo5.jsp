<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>

    <meta charset="UTF-8">
    
    <title>호텔(모텔) 객실 내부</title>
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<style type="text/css">
body,html,div,blockquote,img,label,p,h1,h2,h3,h4,h5,h6,pre,ul,ol,li,dl,dt,dd,form,a,fieldset,input,th,td{border:0;outline:none;margin:0;padding:0;}
body{height:100%;background:#fff;color:#1f1f1f;font-family:"Lucida Sans Unicode","Lucida Grande",Arial,Verdana,sans-serif;font-size:13px;padding:7px 0;}
ul{list-style:none;}
/* 여기 밑부터는 사진 메인 전체 박스 */

.text-center {text-align: center; padding: 10px 0;  }  

#gallery {width: 860px; margin: 0 auto;}
#gallery ul {padding-left: 30px;}
#gallery li {display: inline; margin-right: 3px; }

#gallery #main-img {background: url(bg_img.png) no-repeat 0 0; padding: 26px;}

.h_btn{
	
	padding-left: 30px;
	 
}
</style>

<script type="text/JavaScript">
// prepare the form when the DOM is ready 
$(document).ready(function() {
	$("#gallery li img").hover(function(){
		$('#main-img').attr('src',$(this).attr('src').replace('thumb/', ''));
	});
	var imgSwap = [];
	 $("#gallery li img").each(function(){
		imgUrl = this.src.replace('thumb/', '');
		imgSwap.push(imgUrl);
	});
	$(imgSwap).preload();
});
$.fn.preload = function() {
    this.each(function(){
        $('<img/>')[0].src = this;
    });
}
</script>

<link href="./css/bootstrap.min.css" rel="stylesheet">


<%--  css  hotel.css에  들어있음 --%>

	


<div>
  <h2 class="text-center">Party Room</h2>
	<div id="gallery">
		<div class="h_btn">
	<a href="./h_photo.kkc" ><input class="btn btn-default" type="button" value="Standard Room"></a> &nbsp;&nbsp;&nbsp;&nbsp;<%-- boot --%>
	<a href="./h_photo2.kkc" ><input class="btn btn-default" type="button" value="Deluxe Room"></a> &nbsp;&nbsp;&nbsp;&nbsp; <%-- boot --%>
	<a href="./h_photo3.kkc" ><input class="btn btn-default" type="button" value="VIP Room"></a>&nbsp;&nbsp;&nbsp;&nbsp; <%-- boot --%>
	<a href="./h_photo4.kkc" ><input class="btn btn-default" type="button" value="Special Room"></a>&nbsp;&nbsp;&nbsp;&nbsp; <%-- boot --%>
	<a href="./h_photo5.kkc" ><input class="btn btn-default" type="button" value="Party Room"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%-- boot --%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="./reserve.kkc" > <input type="button" class="btn btn-primary" value="지금 예약하기"/></a>
	
		</div>
	<img src="gallery/img_1.jpg" alt="" id="main-img"  />
	<ul>
	  <li><img src="./gallery/thumb/img_8.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_2.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_3.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_4.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_5.jpg" alt="" /></li>
	 
	  <li><img src="./gallery/thumb/img_7.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_8.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_9.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_10.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_11.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_12.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_3.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_4.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_5.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_8.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_9.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_10.jpg" alt="" /></li>
	  <li><img src="./gallery/thumb/img_11.jpg" alt="" /></li>
	  
	</ul>
</div>
</div>
<p class="text-center"><a href="">ㄱㄷㄱㄷ</a></p>

<%@ include file="../include/footer.jsp"%>