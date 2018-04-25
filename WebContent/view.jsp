<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.CRS.*" errorPage="" %>
<%
String view = (String)session.getAttribute("view");
session.removeAttribute("view");
String type="";
if(view.equals("lux")) {
	type="Premium Cars";
}else if(view.equals("mini")){
	type="Mini Vans";
}else if(view.equals("muv")){
	type="SUV";
}else if(view.equals("eco")){
	type="Economy Cars";
}else if(view.equals("exe")){
	type="Standard Cars";
}
//out.println("Type:"+type);
//out.println("View:"+view);
ArrayList all = CommonCar.viewVehiclesByType(type);
int size = all.size();
%>
<script>
function bookThisVehicle(id){
	if(confirm('Want to Book this Vehicle ?')){
		window.location.href = 'do?MOD=BOK&ACT=bok&vid='+id;
		//alert('do?MOD=BOK&ACT=bok&vid='+id);
	}
}
</script>
<%
int count =0;
for(int i=0;i<size;i++){
count=count+1;
ArrayList one=(ArrayList)all.get(i);
%>

<table width="90%" align="center" style="border-right:#D22929 dotted 4px; border-left:#D22929 dotted 4px;border-bottom:#D22929 solid 4px;  padding:5px;" border="0" >
  <tr>
    <th colspan="3" scope="col"><div class="header"> 
      <div align="center">&nbsp;<%=(String)one.get(1)%></div>
    </div></th>
  </tr>
  <tr>
    <td><strong>Plate : </strong>&nbsp;<%=(String)one.get(2)%></td>
    <td>&nbsp;</td>
    <td width="21%" rowspan="6"><img src="<%=(String)one.get(8)%>" width="220" height="120" /></td>
  </tr>
  <tr>
    <td colspan="2"><strong>Model</strong> : <%=(String)one.get(3)%></td>
  </tr>
  <tr>
    <td><strong>Fuel Type:</strong> <%=(String)one.get(4)%></td>
    <td><strong>Cost : </strong>\$&nbsp;<%=one.get(7)%></td>
  </tr>
  <tr>
    <td colspan="2"><strong>Vehicle Type: </strong><%=one.get(9)%></td>
  </tr>

  <tr>
    <td width="36%"><strong>\$ Per Mile  :</strong> <%=one.get(5)%></td>
    <td width="43%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;<a href="javascript:bookThisVehicle(<%=(String)one.get(0)%>)"><button class="myButton">Book Vehicle</button></a></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
<% } %>
