<%@ page import="java.sql.*"%>

<%
int memberid=(Integer) session.getAttribute("memberid");
String eid=request.getParameter("eid1");
System.out.println(eid+","+memberid);
try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	
	PreparedStatement pstmt=con.prepareStatement("select Attendancedate,status from attendence where eventid=? and memberid=?");
	pstmt.setString(1,eid);
	pstmt.setInt(2, memberid);
	ResultSet rs=pstmt.executeQuery();
	%>
	<h3 align="center">Attendence Sheet</h3>
	
	<h4 align="center"><b>EventID: <%=eid %></b></h4>
	
	<table align="center" width=500px height=200px border=3 >
	<th>AttendanceDate </th><th>status </th>
	<% 

	while(rs.next())
	{
		
	%>
	<tr><td align="center"><%=rs.getString(1).substring(0,10)%></td>

	<td align="center"><%=rs.getString(2) %></td>	
	</tr>
	
	<% 
	
	}
	
	
	%>
	
	</table>
	<br>
	<center><a style="text-decoration: none" href="memberhomepage.html">Home</a></center>



	<%
}
catch(Exception e)
{
	out.println(e);
}
%>
