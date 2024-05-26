<%@ page import="java.sql.*"%>






<%

int memberid=(Integer)session.getAttribute("memberid");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt=con.prepareStatement("select * from eventdetails where eventid not in (select eventid from registered where memberid=?)");
	pstmt.setInt(1,memberid);
     
    ResultSet rs=pstmt.executeQuery();
   
    %>
    <h3 align="center"><b>Events</b></h3>
     <table align="center" width=500px height=200px border=3>
  
    <tr><th>EventId</th><th>Event Name</th><th>category</th><th>start date</th><th>End Date</th><th>venue</th><th>Details</th><th>Action</th>
    </tr>
    <% 
    
    while(rs.next())
    {
    	
    %>
    
    
   
    <tr>
    <td align="center"><%=rs.getString(1) %></td>
    <td align="center"><%=rs.getString(2) %></td>
    <td align="center"><%=rs.getString(3) %></td>
    <td align="center"><%=rs.getString(4) %></td>
    <td align="center"><%=rs.getString(5) %></td>
    <td align="center"><%=rs.getString(6) %></td>
 <td align="center"><%=rs.getString(7) %></td>
 <td align="center"><a href="eventregister.jsp?eid1=<%=rs.getString(1) %>">Register</a></td>
    </tr>
   
    
    <%
    }
    %>
     </table>

    <%
}
catch(Exception e)
{
	out.println(e);
}
%>