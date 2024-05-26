<%@page import="java.sql.*" %>
<%





String id=request.getParameter("eid");
String name=request.getParameter("ename");
String cat=request.getParameter("ecat");
String sdate=request.getParameter("sdate");
String edate =request.getParameter("edate");
String venue=request.getParameter("evenue");
String desc=request.getParameter("desc");
int leaderid=(Integer)session.getAttribute("leaderid");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project","project");
	PreparedStatement pstmt=con.prepareStatement("insert into eventdetails values(?,?,?,?,?,?,?,?)");
	pstmt.setString(1,id);
	pstmt.setString(2,name);
	pstmt.setString(3,cat);
	pstmt.setString(4,sdate);
	pstmt.setString(5,edate);
	pstmt.setString(6,venue);
	pstmt.setString(7,desc);
	pstmt.setInt(8, leaderid);
	int n=pstmt.executeUpdate();
	if(n>0)
	{
		out.println("details entered successfully");
		%>
		<br>
		To go back<a href="leaderhomepage.html">HomePage</a>
		<%
	}
}
catch(Exception e)
{
	out.println(e);
}
%>