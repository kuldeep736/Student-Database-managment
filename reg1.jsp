<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="burlywood">
<center style=" border:2px solid black;margin-top:5rem;margin-left:28rem;margin-right:28rem;background-color:beige">
<br>
<hr style="color:red">
<br>
<form action="saveuser.jsp">
<h3>New  user Ragistration Form</h3>
<% 
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{
	out.println(" <font color=red>User could not be ragistered:</font>");
}
%>
<br>
<br>
Username<input type="text" name="username"><br><br>
Password<input type="password" name="password"><br><br>
<input type="submit" value="Register Here">
<a href="login.jsp">Back To Login Page</a>
</form>
<br>
<br>
<hr>
<address>
designed by ****<br>
</address>
</center>
</body>
</html>