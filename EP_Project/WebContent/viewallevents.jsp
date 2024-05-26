<%@ page import="java.sql.*" %>
<%
int leaderid=(Integer)session.getAttribute("leaderid");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt=con.prepareStatement("select eventid,eventname from eventdetails");
	//pstmt.setInt(1,leaderid);
	ResultSet rs=pstmt.executeQuery();
	%>
	<table align="center" width=500px height=200px border=3>
	<tr align=center>
	<th>EventID</th><th>Event Name</th><th>Action</th>
	</tr>
	
	<%
	
	while(rs.next())
	{
		
		%>
		<tr align=center>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><a href="markfinal.jsp?<%=rs.getString(1)%>"> mark attendance</a></td>
		</tr>
		
		<%
	}
	
	
	
	
	
	
	%>
	
	
	
	
	
	
	</table>
	<%
}
catch(Exception e)
{
	
}
%>

