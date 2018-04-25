<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.CRS.*" errorPage="" %>

<%
ArrayList allCurrentDate =  CommonCar.viewAllBookingCurrentDate();
int sizeCurrentDate = allCurrentDate.size();
ArrayList all1 = CommonCar.viewAllBooking();
int size1 = all1.size();
int totalTransaction = 0;
int totalTransactionforday= 0;
%>																			 
<style type="text/css">
<!--
.style10 {color: #9BC84C; font-weight: bold; font-size: 14px; }
-->
</style>
<jsp:useBean id="now" class="java.util.Date"/>
<s:date name="now" var="formattedDate" format="dd-MM-yyyy"/>
<br/>
<div class="header">View Your Customer's Bookings for ${now}</div>
<br/>
<table width="95%" align="center"  style="border:#D22929 solid 2px;padding:10px;" border="0">
  <tr>
    <th bgcolor="#D22929" scope="col"><span class="style10">Booking Date </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Vehicle Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Driver Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Start Date</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">End Date </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Kilometer</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Status&nbsp;</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">KmR;</span></th>
  </tr>
  <%
for(int i=0;i<sizeCurrentDate;i++){
ArrayList one=(ArrayList)allCurrentDate.get(i);

if(((String)one.get(6)).equalsIgnoreCase("approved"))
	totalTransactionforday+=(Integer)one.get(8);

%>
<form name="bookingForm1" id="bookingForm1" >
  <tr style="height:30px; padding:4px;">
    <td>
	<input  type="hidden" name="bid" value="<%=(String)one.get(0)%>" />
	<div align="center"><%=(String)one.get(7)%></div></td>
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%></div></td>
    <td><div align="center"><%=(String)one.get(5)%>&nbsp;Km.</div></td>
    <td><div align="center"><%=(String)one.get(6)%></div></td>
    <td><div align="center">\$<%=(Integer)one.get(8)%></div></td>
  </tr>
</form>
  <% } %>
</table>
  <div>
  <span>Total Transaction = \$ <%=totalTransactionforday%></span>
  </div>
<br/>
<div class="header">View Your Customer's Booking Request</div>
<br/>
<table width="95%" align="center"  style="border:#D22929 solid 2px;padding:10px;" border="0">
  <tr>
  <th bgcolor="#D22929" scope="col"><span class="style10">Booking Date </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Vehicle Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Driver Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Start Date</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">End Date </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Kilometer</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Status&nbsp;</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">KmR;</span></th>
  </tr>
  <%
for(int i=0;i<size1;i++){
ArrayList one=(ArrayList)all1.get(i);

if(((String)one.get(6)).equalsIgnoreCase("approved"))
	totalTransaction+=(Integer)one.get(8);
%>
<form name="bookingForm1" id="bookingForm1" >
  <tr style="height:30px; padding:4px;">
    <td>
	<input  type="hidden" name="bid" value="<%=(String)one.get(0)%>" />
	<div align="center"><%=(String)one.get(7)%></div></td>
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%></div></td>
    <td><div align="center"><%=(String)one.get(5)%>&nbsp;Km.</div></td>
    <td><div align="center"><%=(String)one.get(6)%></div></td>
    <td><div align="center">\$<%=(Integer)one.get(8)%></div></td>
  </tr>
</form>
  <% } %>
</table>
  <div>
  <span>Total Transaction = \$ <%=totalTransaction%></span>
  </div>