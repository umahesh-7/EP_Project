<%@ page import="java.util.*,java.sql.*" %>


<%

int uname=Integer.parseInt(request.getParameter("user"));

String pwd=request.getParameter("pwd");
session.setAttribute("leaderid",uname);

try{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");

	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");
	PreparedStatement pstmt1=con.prepareStatement("select * from teamleader where username=?");
	pstmt1.setInt(1,uname);
	ResultSet rs=pstmt1.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("leaderhomepage.html");
	}
	else{
		response.sendRedirect("TeamLeaderLogin.html");
	}
	
	
}
catch(Exception e)
{
out.println(e);
}

%>