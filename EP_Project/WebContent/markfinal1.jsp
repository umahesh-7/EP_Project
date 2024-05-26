
<%@ page import="java.sql.*"%>

<%
String eid = (String)session.getAttribute("eid");
int leadid=(Integer)session.getAttribute("leaderid");


System.out.println(eid+","+leadid);

try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	
	ResultSet rs = con.createStatement().executeQuery("  select count(*) from registered where eventid='"+eid+"'  ");
	
	int count=0;
	
	if(rs.next())
	{
		count = rs.getInt(1);
	}
	
	
	String[] status = new String[count];
	
	for(int i=0;i<count;i++)
	{
		status[i]=request.getParameter("status"+(i+1));
	}


	
	
	
	ResultSet rs1 = con.createStatement().executeQuery("  select * from registered where eventid='"+eid+"' order by memberid asc ");
	
	int i=0;
	

	while(rs1.next())
	{

		PreparedStatement preparedStatement = con.prepareStatement(" insert into attendence(eventid,memberid,leaderid,status) values(?,?,?,?)");
		
		preparedStatement.setString(1, eid);
		preparedStatement.setInt(2, rs1.getInt("memberid"));
		preparedStatement.setInt(3, leadid);
		preparedStatement.setString(4, status[i]);
		
		System.out.println(eid+","+rs1.getInt("memberid")+","+leadid+","+status[i]);
		
		preparedStatement.execute();
		
		i++;
	}

	
	%>
	
	Attendance Updated Successfully !!! <br><br>
	<a href="leaderhomepage.html">Back to home</a>
	
	<%

}
catch(Exception e)
{
	out.println(e);
}
%>
