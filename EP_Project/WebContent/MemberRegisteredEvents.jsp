<%@ page import="java.sql.*"%>






<%

int memberid=(Integer)session.getAttribute("memberid");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt=con.prepareStatement("select eventid,registereddate from registered where memberid=?");
	pstmt.setInt(1,memberid);
     
    ResultSet rs=pstmt.executeQuery();
   
    %>
    <h3 align="center"><b>Events</b></h3>
     <table align="center" width=500px height=200px border=3>
  
    <tr><th>EventId</th><th>Registered date</th>
    </tr>
    <% 
    
    while(rs.next())
    {
    	
    %>
    
    
   
    <tr>
    <td align="center"><%=rs.getString(1) %></td>
    <td align="center"><%=rs.getString(2) %></td>
    </tr>
 
   
    
    <%
    }
    %>
    <TR >
 <TD ALIGN="CENTER" COLSPAN="2"><A HREF="memberhomepage.html">HOME</A></TD>
    </TR>
     </table>

    <%
}
catch(Exception e)
{
	out.println(e);
}
%>