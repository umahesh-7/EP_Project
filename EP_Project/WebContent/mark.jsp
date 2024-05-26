<%@page import="java.sql.*,java.util.Date"%>

<%
int count=(Integer)session.getAttribute("count");
int leaderid=(Integer)session.getAttribute("leaderid");
Date d= new Date();
String edate=d.toString();
for(int i=1;i<=count;i++)
{

	
	try
	{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","harsha","harsha");
		PreparedStatement pstmt=con.prepareStatement("insert into attendence values(?,?,?,?,?)");
		
		
		pstmt.setString(1,(String)session.getAttribute("name"+i));
		pstmt.setInt(2,(Integer)session.getAttribute("id"+i));
		pstmt.setInt(3,leaderid);
		pstmt.setString(4,edate);
		out.println(request.getParameter("mark"+i));
		pstmt.setString(5,request.getParameter("mark"+i));
		int n=pstmt.executeUpdate();
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
out.println("attendence saved successfully");

%>