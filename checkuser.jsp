<%@page import="java.sql.SQLException"%>
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
<body>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
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
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo","root","Kuldeepp1424#");
	PreparedStatement ps=con.prepareStatement("select * from user where username=? and password=?");
	ps.setString(1,username);
	ps.setString(2,password);
ResultSet rs=ps.executeQuery();
	if(rs.next()==true)
	{
		request.setAttribute("msg", "<font color= green size=6>Welcome to student section :</font>");
		%>
		<jsp:forward page="home.jsp"></jsp:forward>
		<%
	}
	else
	{
		request.setAttribute("msg", "<font color= red size=6>Invalid username or password :</font>");
		%>
		<jsp:forward page="login.jsp"></jsp:forward>
		<%	
	}
	
}
catch(SQLException e)
{
	out.println(e);
	
}

%>

</body>
</html>