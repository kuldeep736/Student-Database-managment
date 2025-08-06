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
int r=0;
String n="";
double m=0;
try
{
	r=Integer.parseInt(request.getParameter("Rollno"));
	
}
catch(NumberFormatException e)
{
	out.println("String is not Allowed");
}

try
{
	m=Double.parseDouble(request.getParameter("Marks"));
	
	
}
catch(NumberFormatException e)
{
	out.println("String is not Allowed");
}
n=request.getParameter("Name");

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
} 

catch(ClassNotFoundException e)
{
	out.println("driver are not loadeded");
}
String op=request.getParameter("b1");
try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","Kuldeepp1424#");
	if(op.equals("Add student"))
	{
	PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?)");
	ps.setInt(1,r);
	ps.setString(2,n);
	ps.setDouble(3, m);
int x=ps.executeUpdate();
if(x>0)
{
	request.setAttribute("msg","<font size=2 color=green>Student Added  Succesfully</font>");
}
else
{
	request.setAttribute("msg","<font size=2 color=red>Stduent Could Not Be Added</font>");
}
}

			if(op.equals("Update student"))
			{
			PreparedStatement ps=con.prepareStatement("update student set Name=?,Marks=? where Rollno=?)");
			ps.setInt(1,r);
			ps.setString(2,n);
			ps.setDouble(3, m);
		int x=ps.executeUpdate();
		if(x>0)
		{
			request.setAttribute("msg","<font size=2 color=green>Student Added  Succesfully</font>");
		}
		else
		{
			request.setAttribute("msg","<font size=2 color=red>Stduent Could Not Be Added</font>");
		}
		}
			
			if(op.equals("Upgrade student"))
			{
			PreparedStatement ps=con.prepareStatement("update student set Name=?,Marks=? where Rollno=?)");
			ps.setInt(3,r);
			ps.setString(1,n);
			ps.setDouble(2, m);
		int x=ps.executeUpdate();
		if(x>0)
		{
			request.setAttribute("msg","<font size=2 color=green>Student upgraded Succesfully</font>");
		}
		else
		{
			request.setAttribute("msg","<font size=2 color=red>Stduent Could Not Be upgraded</font>");
		}
		%>
		<jsp:forward page="upgrade.jsp"></jsp:forward>
		
		
		<%
		}
			if(op.endsWith("Delete student"))
			{
				PreparedStatement ps=con.prepareStatement("delete from student  where Rollno=?)");
				ps.setInt(1,r);
			int x=ps.executeUpdate();
			if(x>0)
			{
				request.setAttribute("msg","<font size=2 color=green>Student Added  Succesfully</font>");
			}
			else
			{
				request.setAttribute("msg","<font size=2 color=red>Stduent Could Not Be Added</font>");
			}
			}
}
catch(SQLException e)
{
	request.setAttribute("msg","<font size=6 color=red>Student Rollno Already Exist</font>");
}


%>
<jsp:forward page="adm.jsp"></jsp:forward>
</body>
</html>