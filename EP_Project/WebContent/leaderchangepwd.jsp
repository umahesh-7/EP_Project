<%@ page import=" java.util.*,java.sql.*"%>


<%

int uname=Integer.parseInt(request.getParameter("user"));
String pwd=request.getParameter("pwd");

try{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");

	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement pstmt1=con.prepareStatement("select * from teamleader where username=?");
	pstmt1.setInt(1,uname);
	ResultSet rs=pstmt1.executeQuery();
	if(rs.next())
	{
		PreparedStatement pstmt2=con.prepareStatement("update teamleader set password=? where username=?");
		pstmt2.setString(1,pwd);
		pstmt2.setInt(2,uname);
            int n=pstmt2.executeUpdate();
            if(n>0)
            {
            	out.println("password changed Succesfully");
            }
	}
	else{
	
	}
	
	
}
catch(Exception e)
{
out.println(e);
}


%>