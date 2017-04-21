<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="../include/res_header.jsp" />

	<c:set var="date" value="<%=new Date() %>" />
	<form id="resok" method="post" action="reserveOk.kkc?day=${day}&resdate=${resdate }&selday=${selday}&h_no=${h_no}&reserve_roomfind=${roomfind}&state=${payment}&username=${username}&reserve_addr=${addr}&respwd=${respwd}">
	<div class="confcon">
			<!-- 예약확인 -->
			
			
			<div id="resrfinsh">
				<strong>예약하신 내용입니다.</strong><br/>
				<p>- 무통장 입금 : 예약후 10분 이내에 입금이 되지 않을 경우 자동취소됩니다.</p> <!-- 시간은 12시간으로 설정할거임 %%-->
				<p>- 카드결제 : 확인버튼을 누르면 결제창으로 이동합니다.</p>
			</div>
			<!-- 예약확인정보 -->
			<table class="resconfirm" id="resconfirm">
			
			
			
			
			<c:if test="${!empty ho_info }">
			
			<c:forEach var="ho" items="${ho_info }">
			
			<input type="hidden" id ="price_option" name="price_option" value="${price_option}" />
			
			
			
			
			<caption>예약 정보</caption>
				<thead>
					<tr>
						<th>호텔</th>
						<th>이용날짜</th>
						<th>이용기간</th>
						<th>이용금액</th>
						<th>옵션금액</th>
						 <!-- 이값은 전 페이지에서 받아와야함! -->
						<th>총결제금액</th>
					</tr>
				</thead>
					<tr>
						<td>${ho.h_title}</td>
						
						<td>${fn:substring(resdate,0,4)}-${fn:substring(resdate,4,6)}-${fn:substring(resdate,6,8)}
							<c:if test="${selday>1&&selday<6}">
							<c:set var="resdate1" value="${resdate+1}"/> <!-- 2박 -->
							<c:set var="resdate2" value="${resdate+2}"/> <!-- 3박 -->
							<c:set var="resdate3" value="${resdate+3}"/> <!-- 4박 -->
							<c:set var="resdate4" value="${resdate+4}"/> <!-- 5박 -->
							
							<input type="hidden" value="${resdate1}" name="resdate1"/>
							<input type="hidden" value="${resdate2}" name="resdate2"/>
							<input type="hidden" value="${resdate3}" name="resdate3"/>
							<input type="hidden" value="${resdate4}" name="resdate4"/>
							</c:if></td>					
						<td>${selday}박${selday+1}일</td>
						<%-- <td>${username}명</td> --%>
						<td>
						 <table id="useprice" border="1">
						<c:if test="${selday==1 }">
						<tr>
						<td>
						<c:choose><c:when test="${(day<5)}">${ho.h_price_room }</c:when>
						<c:when test="${(day>4)}">${ho.h_price_room2}</c:when>
						</c:choose>
						</td>
						</tr>
						</c:if>
						
						<!-- 2박 -->
						<c:if test="${selday==2 }">
						<tr>
						<td>
						<c:choose><c:when test="${(day<5)}">${ho.h_price_room }</c:when>
						<c:when test="${(day>4)}">${ho.h_price_room2 }</c:when>
						</c:choose>
						</td>
						</tr>
						<tr>
						<td>
						<c:choose>
						<c:when test="${(day==6)}">${ho.h_price_room }</c:when>
						<c:when test="${(day==5)}">${ho.h_price_room2 }</c:when>
						</c:choose>
						</td>
						</tr>
						</c:if>
						<!-- 3박 -->
						<c:if test="${selday==3 }">
						<tr>
						<td>
						<c:choose><c:when test="${(day<5)}">${ho.h_price_room }</c:when>
						<c:when test="${(day>4)}">${ho.h_price_room2 }</c:when>
						</c:choose>
						</td>
						</tr>
						<tr>
						<td><c:choose><c:when test="${(day==6)}">${ho.h_price_room }</c:when>
						<c:when test="${(day==5)}">${ho.h_price_room2}</c:when>
						</c:choose>
						</td>
						</tr>
						<tr>
						<td><c:choose><c:when test="${(day!=3)||(day!=4)}">${ho.h_price_room }</c:when>
						<c:when test="${(day==3)||(day==4)}">${ho.h_price_room2}</c:when>
						
						</c:choose>
						</td>
						</tr></c:if>
						<!-- 4박 -->
						<c:if test="${selday==4 }">
						<tr>
						<td>
						<c:choose><c:when test="${(day<5)}">${ho.h_price_room }</c:when>
						<c:when test="${(day>4)}">${ho.h_price_room2 }</c:when>
						
						</c:choose>
						</td>
						</tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=4)&&(day!=5)}">${ho.h_price_room}</c:when>
						<c:when test="${(day==4)||(day==5)}">${ho.h_price_room2 }</c:when>
						
						</c:choose>
						</td>
						</tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=3)&&(day!=4)}">${ho.h_price_room }</c:when>
						<c:when test="${(day==3)||(day==4)}">${ho.h_price_room2 }</c:when>
						
						</c:choose>
						</td>
						</tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=2)&&(day!=3)}">${ho.h_price_room }</c:when>
						<c:when test="${(day==2)||(day==3)}">${ho.h_price_room2}</c:when>
						
						</c:choose>
						</td>
						</tr></c:if>
						<!-- 5박 -->
						<c:if test="${selday==5 }">
						<tr>
						<td>
						<c:choose><c:when test="${(day<5)}">${ho.h_price_room }</c:when>
						<c:when test="${(day>4)}">${ho.h_price_room2 }</c:when>
						</c:choose></td></tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=4)&&(day!=5)}">${ho.h_price_room}</c:when>
						<c:when test="${(day==4)||(day==5)}">${ho.h_price_room2 }</c:when>
						</c:choose></td></tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=3)&&(day!=4)}">${ho.h_price_room }</c:when>
						<c:when test="${(day==3)||(day==4)}">${ho.h_price_room2 }</c:when>
						</c:choose></td></tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=2)&&(day!=3)}">${ho.h_price_room}</c:when>
						<c:when test="${(day==2)||(day==3)}">${ho.h_price_room2 }</c:when>
						
						</c:choose></td></tr>
						<tr>
						<td>
						<c:choose><c:when test="${(day!=1)&&(day!=2)}">${ho.h_price_room}</c:when>
						<c:when test="${(day==1)||(day==2)}">${ho.h_price_room2 }</c:when>
						
						</c:choose></td></tr></c:if> 
					
						
						</table>
						
						<script>
						
							var sumPrice=PriceSum();
							document.write(sumPrice);
						</script>원
						</td>
						<td>${ho.h_price_option}원</td>  <!-- 옵션 -->
						<td>
						


						
						<script>
							
							var sum=allPriceSum();
							document.write(sum);
						</script>원
						</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
			<table class="resconfirm2">
					<tr>
						<th>예약일</th>
						<td><fmt:formatDate value="${date }" type="date" pattern="yyyy/MM/dd" />
						<fmt:formatDate value="${date }" type="time" pattern="hh:mm:ss"/></td>
						<th>예약자ID</th>
						<td>:${resid}</td>
					</tr>
				
		             <tr>
						<th>연락처</th>
						
						<td>:${addr }</td>
						
						<th>입금자명</th>
						<td><input type="text" class="reserve_username" name="reserve_username" value="${username}" size="4" readonly="readonly"/></td>
					</tr>
			</table>
			
			<table class="pay_info">
			<caption>결제 정보</caption>
			<tr>
			 <th>결제방법</th>
			 <td><c:choose><c:when test="${payment eq 'B' }">무통장입금(계좌이체)</c:when>
			 
			 <c:otherwise>카드결제</c:otherwise></c:choose></td>
			 </tr>
			 <c:choose>
			 
			 <c:when test="${payment eq 'B' }">
			 <tr>
			 <th>입금계좌</th>
			 <td><%-- 입금계좌.,.. ${pcb.bankname }&nbsp;${pcb.banknumber }&nbsp;예금주:${pcb.bankuser } --%></td>
			 </tr>
			 </c:when>
		
			 </c:choose>
			 <tr>
			 <th>결제금액</th>
			 <td>
			 <script>
							
				var sum=allPriceSum();
				document.write(sum);

			</script>원
			<input type="hidden" name="reserve_price" id="reserve_price" />
			</td>		
			 </tr>
			</table>		
			
			<input type="hidden" name="reserve_addr" value="${addr}"/>
			<input type="hidden" name="reserve_payment" value="${payment }"/>
			<input type="hidden" name="reserve_respwd" value="${respwd }"/>
			<input type="hidden" name="reserve_night" value="${selday }"/>

			<div class="button">
			
			<input type="button" id="prev" value="이전" onclick="location='reserve2.kkc?day=${day }&resdate=${resdate}&h_no=${h_no}&reserve_roomfind=${roomfind}';"/>
			<input type="submit" id="next" value="확인" />
			</div>
			
	`</div>
	</form>
<jsp:include page="../include/footer.jsp" />