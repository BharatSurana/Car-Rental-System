<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.CRS.*" errorPage="" %>
<%
ArrayList all = CommonCar.viewAllFuelDetails();
int size = all.size();
%>
<style type="text/css">
<!--
.style10 {color: #9BC84C; font-weight: bold; font-size: 14px; }
.style11 {color: #E49C7C}
-->
</style>
<script>
function deleteFuel(id){
	if(confirm('Want to Delete this Fuel Details?')){
		window.location.href = 'do?MOD=MTN&ACT=fDel&fid='+id;
	}
}
</script>
<div class="header">View All Vehicle Excepnces Details </div><br/>
<h3>View all the Vehicle Expences Details.<br/>If you want to add more Vehicle Expences then <a href="do?MOD=MTN&ACT=FuelAdd">Click Here.</a></h3><br/>
<table width="95%" align="center"  style="border:#D22929 solid 2px;padding:10px;" border="0">
  <tr>
    <th bgcolor="#D22929" scope="col"><span class="style10">Vehicle Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Driver Name </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Date</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Fuel Type </span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Qty</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Cost&nbsp;&nbsp;</span></th>
    <th bgcolor="#D22929" scope="col"><span class="style10">Ation</span></th>
  </tr>

<%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
<tr style="height:30px; padding:4px;">
    <td><div align="center"><%=(String)one.get(0)%></div></td>
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%>&nbsp;Ltr.</div></td>
    <td><div align="center">\$.<%=(String)one.get(5)%></div></td>
    <td><div align="center"><a href="javascript:deleteFuel(<%=(String)one.get(6)%>)"><button class="myButton">Delete</button></a></div></td>
</tr>
	<% } %>
</table>

