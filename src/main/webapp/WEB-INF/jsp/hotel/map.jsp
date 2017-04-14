<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- 지도 스크립트 --%>
<script type="text/javascript"

   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Hoz9zks_KImFLjv_hDRq"></script>


  
	<%-- 지도 스크립트 끄읏 --%>


<link rel="stylesheet" type="text/css" href="./css/map.css" /><%-- css적용 --%>


</head>
<body>


	<div id="map">
	
		<script>
   var HOME_PATH = window.HOME_PATH || '.';
   var position = new naver.maps.LatLng(37.3849483, 127.1229117);

   var map = new naver.maps.Map('map', {
       center: position,
       zoom: 14
   });

   var markerOptions = {
       position: position.destinationPoint(90, 15),
       map: map,
       icon: {
           url: HOME_PATH +'./images/target.png',
           size: new naver.maps.Size(50, 52),
           origin: new naver.maps.Point(0, 0),
           anchor: new naver.maps.Point(25, 26)
       }
   };
   var marker = new naver.maps.Marker(markerOptions);
   

   var contentString = [
           '<div class="iw_inner">',
           '   <h3>서울특별시청</h3>',
           '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
           '       <img src="'+ HOME_PATH +'./images/tm07.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
           '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
           '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
           '   </p>',
           '</div>'
       ].join('');

   var infowindow = new naver.maps.InfoWindow({
       content: contentString
   });

   naver.maps.Event.addListener(marker, "click", function(e) {
       if (infowindow.getMap()) {
           infowindow.close();
       } else {
           infowindow.open(map, marker); //이미지 설명 바로 띄우기
       }
   });

   </script>
	
	</div>


	

</body>

<%@ include file="../include/footer.jsp"%>
</html>