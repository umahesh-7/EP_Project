<%@ page import="java.sql.*"%>

<%
int leaderid=(Integer)session.getAttribute("leaderid");
String eid=request.getParameter("eid1");
System.out.println(eid+","+leaderid);
try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	
	PreparedStatement pstmt=con.prepareStatement("select memberid,status from attendence where eventid=? and leaderid=?");
	pstmt.setString(1,eid);
	pstmt.setInt(2, leaderid);
	ResultSet rs=pstmt.executeQuery();
	%>
	<h3 align="center">Attendence Sheet</h3>
	
	
	<table align="center" width=500px height=200px border=3 >
	<th>member Id </th><th>status </th>
	<% 

	while(rs.next())
	{
		
	%>
	<tr><td><%=rs.getInt(1)%></td>

	<td><%=rs.getString(2) %></td>	
	</tr>
	
	<% 
	
	}
	
	
	%>
	
	</table>
	<br>
	<center><a style="text-decoration: none" href="leaderhomepage.html">Home</a></center>



	<%
}
catch(Exception e)
{
	out.println(e);
}
%>
