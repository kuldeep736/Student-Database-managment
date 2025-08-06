<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
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
<form action="savestudent.jsp">
<%
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{
	out.print(msg);
}
int rno=0;
try
{
	rno=Integer.parseInt(request.getParameter("s1"));
}
catch(NumberFormatException e)
{
out.print("error in type casting:");	
}

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
	PreparedStatement ps = con.prepareStatement("select * from student where Rollno = ?");
	ps.setInt(1, rno);
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()==true)
	{
		%>
	Rollno<input  type="text" name="Rollno" value="<%=rs.getInt("Rollno")%>"><br><br>
	 Name<input  type="text" name="Name" value="<%=rs.getString("Name")%>"><br><br>
	Marks<input  type="text" name="Marks" value="<%=rs.getDouble("Marks")%>"><br><br>
	<input type="submit" value="upgrade student" name="b1">
		<br>
		<% 

	}
	else
	{
		
	}
}
catch(SQLException E)
{
	out.print("there is an erron in sql syntax:"+E);
}
%>
<br>
<a href="home.jsp"> Back to home page</a>
<br>
<hr>
</form>
</body>
</html>