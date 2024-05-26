<%@ page import="java.sql.*"%>

<%
int leadid=(Integer)session.getAttribute("leaderid");
String eid=request.getQueryString();
session.setAttribute("eid", eid);

try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	
	ResultSet rs = con.createStatement().executeQuery("  select count(*) from registered where eventid='"+eid+"'  ");
	
	int count=0;
	
	if(rs.next())
	{
		count = rs.getInt(1);
	}
	
	if(count>0)
	{
	%>
	Total Members registered for this event : <%=count%><br>
	
	
	
	
	
	
	<form method=post action="markfinal1.jsp">
	
	<table align=center border=2 height=200>
	<tr align=center>
	
	<td>Member ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Registered Date</td>
	<td>Attendance Action</td>
	
	</tr>
	
	
	<%
	
	
	ResultSet rs1 = con.createStatement().executeQuery("  select * from registered where eventid='"+eid+"' order by memberid asc ");
	
	int i=1;
	

	while(rs1.next())
	{
		%>
		
		<tr align=center>
		
		<td><%=rs1.getString("memberid")%></td>
		<td><%=rs1.getString("fname")%></td>
		<td><%=rs1.getString("lname")%></td>
		<td><%=rs1.getString("registereddate")%></td>
		<td>
		
		Present&nbsp;<input type="radio" name="status<%=i%>" value="P" checked>&nbsp;
		Absent&nbsp;<input type="radio" name="status<%=i%>" value="A">
				
		</td>
		
		</tr>
		
		
		<%
		i++;
	}
	
	%>
	
	<tr align=center> 
	<td colspan=5><input type="submit" value="Save"></td>
	</tr>
	
	</table>
	</form>
	<%
	}
	else
	{
		out.println("Oops no student registered for this event yet!!!!!!!!");
		%>
		<br>
		<a href="viewallevents.jsp">Go back</a>
		<%
	}

}
catch(Exception e)
{
	out.println(e);
}
%>
