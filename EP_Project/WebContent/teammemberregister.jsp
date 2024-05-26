<%@ page import="java.util.*,java.sql.*" %>


<%

String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
int uname=Integer.parseInt(request.getParameter("user"));
String email=request.getParameter("eamil");
long phone =Long.parseLong(request.getParameter("phone"));
String pwd=request.getParameter("pwd");


try{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");

	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt1=con.prepareStatement("insert into teammember values(?,?,?,?,?,?)");
	pstmt1.setString(2, fname);
	pstmt1.setString(3,lname);
	pstmt1.setInt(1, uname);
	pstmt1.setString(4,email);
	pstmt1.setLong(5, phone);
	pstmt1.setString(6,pwd);
	int n=pstmt1.executeUpdate();
	if(n>0)
	{
		out.println("Succuessful");
	}
	else
	{
		out.println("unsuccessful");
	}
}
catch(Exception e)
{
out.println(e);
}

%>