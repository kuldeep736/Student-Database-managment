<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="margin-top:5rem;margin-left:20rem;margin-right:20rem;background-color:beige">
<h2 style="color: green">List of all Students</h2>
<br>
<br>
<hr style="color:red">
<br>
<br>
<table style="border:2px solid yellow;background-color:pink">
<tr>
<th> S.no</th>
<th> Roll no</th>
<th> Student Name</th>
<th> Marks</th>
</tr>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}

try
{
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","Kuldeepp1424#");
	PreparedStatement ps = con.prepareStatement("select *from student");
	ResultSet rs = ps.executeQuery();
	int i=1;
	while(rs.next())
	{
		%>
		<tr>
			<td><%= i %></td>
			<td><%= rs.getInt("Rollno") %></td>
			<td><%= rs.getString("Name") %></td>
			<td><%= rs.getDouble("Marks") %></td>
		</tr>
		<%
		i++;
	}

	
}
catch(SQLException e)
{
	out.println("No record found");
	out.println(e);
}
%>
<br>
<br>
</table>
<br>
<br>
<a href="home.jsp">Back To Student Home</a><br><br>
<hr>
<address>
<h3> designed by ***</h3>
</address>
</body>
</html>