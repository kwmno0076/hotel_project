<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*,com.daum.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />


<%
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);

	} else {

	}
	//년도/월 셋팅
	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	String today = sdf.format(todayCal.getTime());
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<style>
A:link {
	font-size: 15pt;
	font-family: "돋움";
	color: #556815;
	text-decoration: none;
}

A:visited {
	font-size: 20pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 20pt;
	font-family: "돋움";
	color: #5c322e;
	text-decoration: none;
}

A:hover {
	font-size: 20pt;
	font-family: "돋움";
	color: #5c322e;
	text-decoration: none;
}

#wrap6{
	width:725px;
	margin-left:400px;
}
</style>


<div id="wrap6">
	<c:if test="${!empty ho_info}">
		<c:forEach var="h" items="${ho_info}">
			<div id="res_title">
				<h1>${h.h_title}&nbsp;예약하기</h1>
			</div>
			<hr />
			<input type="hidden" name="h_no" value="${h.h_no}" />
		</c:forEach>
	</c:if>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<div id="content">

			<!--날짜 네비게이션  -->
			<table id="koo">

				<tr>
					<td height="60">

						<table class="koo_child">
							<tr>
								<td height="10"></td>
							</tr>

							<tr>
								<td align="center">
									<%
										if (month > 0) {
									%><a
									href="<c:url value='reserve1.kkc' />?year=<%=year%>&amp;month=<%=month-1%>&h_no=${h_no}"
									target="_self"><span id="thisMonth"><b>&lt;</b></span> <!-- 이전달 -->
								</a> <%
 	} else {
 %> <b>&lt;</b> <%
 	}
 %> &nbsp;&nbsp;<span id="thisMonth"><%=year%>년 <%=month + 1%>월 </span>&nbsp;&nbsp;
									<%
										if (month < 11) {
									%> <a
									href="<c:url value='reserve1.kkc' />?year=<%=year%>&amp;month=<%=month+1%>&h_no=${h_no}"
									target="_self"> <!-- 다음달 --> <span id="thisMonth"><b>&gt;</b></span>
								</a> <%
 	} else {
 %> <b></b> <%
 	}
 %>
								</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
			<br />
			
			<table id="week">
				<thead>
					<tr class="none">
						<TD>
							<DIV>
								<font color="red">일</font>
							</DIV>
						</TD>
						<TD>
							<DIV>월</DIV>
						</TD>
						<TD>
							<DIV>화</DIV>
						</TD>
						<TD>
							<DIV>수</DIV>
						</TD>
						<TD>
							<DIV>목</DIV>
						</TD>
						<TD>
							<DIV>금</DIV>
						</TD>
						<TD>
							<DIV>
								<font color="#529dbc">토</font>
							</DIV>
						</TD>
					</tr>
				</thead>
				<tbody>
					<tr>

						<%
							//처음 빈공란 표시
							for (int index = 1; index < start; index++) {
								out.println("<TD >&nbsp;</TD>");
								newLine++;
							}

							for (int index = 1; index <= endDay; index++) {
								String color = "";

								if (newLine == 0) {
									color = "RED";
								} else if (newLine == 6) {
									color = "#529dbc";
								} else {
									color = "BLACK";
								}
								;

								String sUseDate = Integer.toString(year);
								sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);
								sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
										: Integer.toString(index);

								String iUseDate = sUseDate;
								int iUseDate2 = Integer.parseInt(sUseDate);

								String backColor = "#EFEFEF";
								if (iUseDate.equals((today))) {
									backColor = "#c9c9c9";
								}
								out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
						%>
						<font color='<%=color%>'><b> 날짜 <%=month+1%>/<%=index%>
						</b></font>

						<%-- <%
							out.println("<br/>");
								PublicCoCBean pcb = new PublicCoCBean();
								int sSeason = Integer.parseInt(pageContext.getAttribute("sSeason").toString());
								int eSeason = Integer.parseInt(pageContext.getAttribute("eSeason").toString());
								if (iUseDate2 >= sSeason && iUseDate2 <= eSeason) {
						%> --%>
						<%-- <span style="color: red;">성수기</span>

						<%
							} else {
						%>
						<span style="color: coral;">비수기</span>
						<%
							}
								out.println("<br/><br/>");
						%> --%>

						<div>
							<span id="sitename">${no_name.h_name}</span> <br />
							<c:set var="sNum" value="${ok_num.h_room_ok }" />
							<%
								if (iUseDate2 < intToday) {
							%>

							<span id="state">0/${ok_num.h_room_ok}&nbsp; 예약불가</span><br />

							<%
								} else {
							%>

							<%
								List<ReserveBean> slist = (List<ReserveBean>) request.getAttribute("reslist");
										int sNum = Integer.parseInt(pageContext.getAttribute("sNum").toString());
										for (int k = 0; k < slist.size(); k++) {
											if (((slist.get(k).getReserve_date()) == iUseDate2) && (slist.get(k).getReserve_roomfind() == 1)) {
												sNum = sNum - 1;

											} else {
												sNum = sNum;
											}
										}
							%>
							<%
								if (sNum > 0) {
							%>
							<span id="able"><%=sNum%></span> /<span id="all">${ok_num.h_room_ok}</span>
							&nbsp;&nbsp;<a
								href="reserve2.kkc?day=<%=newLine %>&resdate=<%=iUseDate2 %>&h_no=${h_no}&reserve_roomfind=1"
								id="res_go">예약하기</a><br />

							<%
								} else {
							%>
							<span id="state">0/${ok_num.h_room_ok}&nbsp; 예약불가</span><br />

							<%
								}
									}
							%>
						</div>

						

						<%
							//기능 제거 
								out.println("</TD>");
								newLine++;

								if (newLine == 7) {
									out.println("</TR>");
									if (index <= endDay) {
										out.println("<TR>");
									}
									newLine = 0;
								}
							} //for end
						%>

						<%
							//마지막 공란 LOOP
							while (newLine > 0 && newLine < 7) {
								out.println("<TD>&nbsp;</TD>");
								newLine++;
							}
						%>
					</tr>
				</tbody>
			</table>

		</div>
	</form>
</div>

<jsp:include page="../include/footer.jsp" />