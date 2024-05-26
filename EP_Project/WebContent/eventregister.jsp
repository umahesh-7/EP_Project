<%@ page import="java.sql.* ,java.util.Date,java.text.SimpleDateFormat"%>

<%
int memberid=(Integer) session.getAttribute("memberid");
String eid=request.getParameter("eid1");
System.out.println(eid+","+memberid);
try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	
	PreparedStatement pstmt=con.prepareStatement("select fname,lname,emailid,mobile from teammember where  username=?");
	pstmt.setInt(1, memberid);
	ResultSet rs=pstmt.executeQuery();
	if(rs.next())
	{
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
	String date =sdf.format(new Date());
	
	PreparedStatement pstmt1=con.prepareStatement("insert into registered values(?,?,?,?,?,?,?)");
	pstmt1.setString(1,eid);
	pstmt1.setInt(2,memberid);
	pstmt1.setString(3,rs.getString(1));
	pstmt1.setString(4,rs.getString(2));
	pstmt1.setString(5,rs.getString(3));
	pstmt1.setInt(6,rs.getInt(4));
	pstmt1.setString(7,date);
	int n=pstmt1.executeUpdate();
	if(n>0)
	{
		out.println("Successfully registered for the event");
				%>
				Go back to<a href="memberhomepage.html">Home Page</a>
				<%
	}
	else
	{
		out.println("error occured");
		%>
		
		Click here to Register <a href="newevents.jsp">Again</a> 
		
		<%
	}
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
