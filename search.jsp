<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="margin-top:5rem;margin-left:20rem;margin-right:20rem;background-color:beige">
<br>
<h3> Search Student</h3>
<br>
<br>
<h3> select roll no of student for details</h3>
<br>
<br>
<form action="upgrade.jsp">
<hr>
<select name="s1">
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
} 

catch(ClassNotFoundException e)
{
	out.println("driver are not loadeded");
}

try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","Kuldeepp1424#");
	
	PreparedStatement ps=con.prepareStatement("select* from student");
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next())
	{
		%>
		<option><%=rs.getInt("Rollno")%></option>
		<%
	}
	
}
	
catch(SQLException e)
{
	out.println("there is an error in sql syntax in search");
}

%>
</select>
<br>
<br>
<input type="submit" value="Search Student">
<br>
</form>
<a href="home.jsp"> Back to Home page</a>
<br>
<br>
</body>
</html>