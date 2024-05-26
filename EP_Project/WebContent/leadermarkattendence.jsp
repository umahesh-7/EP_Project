<%@ page import="java.sql.*"%>






<%

int leaderid=(Integer)session.getAttribute("leaderid");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt=con.prepareStatement("select eventid,eventname from eventdetails where leaderid=?");
	pstmt.setInt(1,leaderid);
     
    ResultSet rs=pstmt.executeQuery();
    %>
    <form  method="post" action="markfinal.jsp"> 
     <table align="center" width=500px height=200px border=3>
    <th colspan=2 >Event Attendence</th>
    <tr><td align="center"><b>Event Name</b></td><td align="center"><b>Mark attendence</b></td></tr>
    <% 
    
    while(rs.next())
    {
    	
    %>
    
    
   
    <tr>
    <td align="center"><%=rs.getString(2) %></td>
 <td align="center"><input type="submit" name="sub" value="<%=rs.getString(1) %>"></td>
    </tr>
   
    
    <%
    }
    %>
     </table>
    </form>
    <%
}
catch(Exception e)
{
	out.println(e);
}
%>