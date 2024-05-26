<%@ page import="java.sql.*"%>






<%

int memberid=(Integer)session.getAttribute("memberid");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt=con.prepareStatement("select eventid from registered where memberid=?");
	pstmt.setInt(1,memberid);
     
    ResultSet rs=pstmt.executeQuery();
   
    %>
    
     <table align="center" width=500px height=200px border=3>
    <th colspan=2 >Event Attendence</th>
    <tr><td align="center"><b>Event ID</b></td><td align="center"><b>Action</b></td></tr>
    <% 
    
    while(rs.next())
    {
    	
    %>
    
    
   
    <tr>
    <td align="center"><%=rs.getString(1) %></td>
 <td align="center"><a href="memberfinal.jsp?eid1=<%=rs.getString(1) %>">View Attendence</a></td>
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