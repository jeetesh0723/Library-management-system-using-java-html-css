<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
//String uname = request.getParameter("uname");
//String pass = request.getParameter("psw");

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "library";
String userId = "root";
String password = "12345";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Incorrect Password</strong></font></h2>

<%
try{ 
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");

connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
//String pass = "7352625265";
resultSet = statement.executeQuery("select email,password from staff where email = '"+uname+"' and password = '"+pass+"'; ");
if(resultSet.next())
		{
			if(resultSet.getString(2).equals(pass))
			{
				 response.sendRedirect("libra.html");
			}
			else
			{
				out.println("invalid user ");
			}
		}

   } 
catch (Exception e) 
{
	e.printStackTrace();
}
%>
</table>

</body>
</html>