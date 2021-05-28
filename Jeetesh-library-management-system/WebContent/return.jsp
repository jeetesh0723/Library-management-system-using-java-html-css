<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
 margin: 0;
    padding: 0;
    background: url(bckg.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;
}

.btn {
  background-color: blue;
  color: white;
  font-size: 1.1em;
  padding: 10px 40px;
  border: 3;
  cursor: pointer;
  width: 33%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

.navbar {
  overflow: hidden; /* Hide overflow */
  background-color: #333; /* Dark background color */
}
/* Style the navigation bar links */
.navbar a {
  float: left; /* Make sure that the links stay side-by-side */
  display: block; /* Change the display to block, for responsive reasons (see below) */
  color: white; /* White text color */
  text-align: center; /* Center the text */
  padding: 14px 20px; /* Add some padding */
  text-decoration: none; /* Remove underline */
}
.navbar a.right {
  float: right; /* Float a link to the right */
}

/* Change color on hover/mouse-over */
.navbar a:hover {
  background-color: #ddd; /* Grey background color */
  color: black; /* Black text color */
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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

<!-- Navigation -->
<nav class="navbar">
  <a href="Homemain.html" class="w3-button w3-bar-item">Home</a>
  <a href="About.html" class="w3-button w3-bar-item">About</a>
  <a href="#contact" class="w3-button w3-bar-item">Contact</a>
  <a href="Home.html"  class="w3-button w3-bar-item" style=" float: right; ">Logout</a>
</nav>

<!-- Navigation -->
<nav class="navbar">
<button onClick="parent.location='borrow.html'" type="button" class="btn" style="Font-Family:Lucida Handwriting;">Borrow</button>
<button onClick="parent.location='return.jsp'"  type="button" class="btn" style="Font-Family:Lucida Handwriting;">Return</button>
<button onClick="parent.location='borrowd.jsp'" type="button" class="btn" style="Font-Family:Lucida Handwriting;">Borrow Details</button>
</nav>

<h2 align="center" style="Font-Family:Algerian; font-size:40px;"><font><strong>Borrow Details</strong></font></h2> <h2 align="right"></h2>
      <form action = "update_return.jsp" method = "post">
         <label style="Font-Family:Mongolian Baiti; font-size:20px;"><b>UPDATE THE RECORD</b></label>
         <input type="text" placeholder="student_id" id="student_id" value="" name="student_id">
           <label for="button_type" style="Font-Family:Mongolian Baiti; font-size:20px;"><b>Select Record value</b></label>
			    <input type="text" placeholder="status" id="status" value="" name="status">
         <button onClick="parent.location='update_return.jsp'" id=btnSubmit type="submit" class="cancelbtn" style="Font-Family:Lucida Handwriting;">Submit</button>
      </form></br>
<table align="center" cellpadding="15" cellspacing="15" border="10">
<tr>
</tr>
<tr bgcolor="cyan">
<td style="Font-Family:Algerian; font-size:20px;"><b>Book_title</b></td>
<td style="Font-Family:Algerian; font-size:20px;"><b>Book_id</b></td>
<td style="Font-Family:Algerian; font-size:20px;"><b>issue_date</b></td>
<td style="Font-Family:Algerian; font-size:20px;"><b>student_id</b></td>
<td style="Font-Family:Algerian; font-size:20px;"><b>librarian_id</b></td>
<td style="Font-Family:Algerian; font-size:20px;"><b>status</b></td>
</tr>

<%
try{ 
//String uname = request.getParameter("uname");
//String pass = request.getParameter("psw");

connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
//String pass = "7352625265";
String sql ="select book_title,book_id,issue_date,student_id,librarian_id,status from borrow;";
resultSet = statement.executeQuery(sql);	
while(resultSet.next())
		{
					%>
					<tr bgcolor="littlepink">
					<td><%=resultSet.getString("book_title") %></td>
					<td><%=resultSet.getString("book_id") %></td>
					<td><%=resultSet.getString("issue_date") %></td>
					<td><%=resultSet.getString("student_id") %></td>
					<td><%=resultSet.getString("librarian_id") %></td>
					<td><%=resultSet.getString("status") %></td>
					</tr>
					<% 
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