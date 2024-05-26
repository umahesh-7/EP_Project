<%@ page import="java.util.*,java.sql.*" %>


<%

int uname=Integer.parseInt(request.getParameter("user"));

String pwd=request.getParameter("pwd");


try{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");

	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt1=con.prepareStatement("select * from teammember where username=?");
	pstmt1.setInt(1,uname);
	ResultSet rs=pstmt1.executeQuery();
	if(rs.next())
	{
		session.setAttribute("memberid", uname);
		response.sendRedirect("memberhomepage.html");
	}
	else{
		out.println("invalid login");
		%>
		Go Back To<a href="TeamMemberLogin.html">Login Page</a>
		<%
	}
	
	
}
catch(Exception e)
{
out.println(e);
}

%>