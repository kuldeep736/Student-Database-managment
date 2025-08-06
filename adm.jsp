<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style=" border:2px solid black;margin-top:5rem;margin-left:20rem;margin-right:20rem;background-color:beige">
<centre>
<h2>Hello students  </h2>
<br>
<br>
<hr style="color:red">
<br>
<br>
<h2> Student service page</h2>
<%
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{
	out.println(msg);
}

%>
<br>
<form action="savestudent.jsp">
<br>
Rollno<input type="text" name="Rollno">
<br>
<br>
Name<input type="text" name="Name">
<br>
<br>
Marks<input type="text" name="Marks">
<br>
<br>
<input type="submit" value="Add student"name="b1">
<input type="submit"  value="Update student"name="b1">
<input type="submit" value="Delete setudent"name="b1">
<a href="home.jsp"> Back To Home Page</a>
</form>
<br>
<br>
<address>
<h3> Designed by ***</h3>
</address>
</centre>
</body>
</html>