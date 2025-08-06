
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException" %>
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
	out.println("error in loading drivers;");
	
}
try
{
Connection con=	DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo","root" ,"Kuldeepp1424#");
PreparedStatement ps=con.prepareStatement("insert into user values(?,?)");
ps.setString(1, username);
ps.setString(2, password);
int x=ps.executeUpdate();


if(x>0)
{ 
request.setAttribute("msg","<font color=red> User ragistration succesfully:</font>" );

%>
<jsp:forward page="login.jsp"></jsp:forward>
<% 
}
else
{
	request.setAttribute("msg","<font color=red> User could not be registered:</font>");
%>
<jsp:forward page="reg1.jsp"></jsp:forward>
<% 
}
}
catch(SQLException e)
{
	
	request.setAttribute("msg","<font color=red> User could not be registered:");
	%>
	<jsp:forward page="reg1.jsp"></jsp:forward>
	<% 
}

%>

</body>
</html>