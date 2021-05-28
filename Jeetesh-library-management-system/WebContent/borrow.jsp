<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "library";
String userId = "root";
String password = "12345";
try {
Class.forName(driverName);
} 
catch (ClassNotFoundException e)
{
    e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

   String stu_n = request.getParameter("stu_n");
   String st_name = request.getParameter("st_name");
   String last = request.getParameter("last");
   String cou = request.getParameter("cou");
   String year = request.getParameter("year");
   String lib_id = request.getParameter("lib_id");
   String bo_id = request.getParameter("bo_id");
   String bo_tit = request.getParameter("bo_tit");
   String iss_dat = request.getParameter("iss_dat");
   
  String connectionURL = "jdbc:mysql://localhost:3306/library";      
     PreparedStatement pstatement = null;

     Class.forName("com.mysql.jdbc.Driver").newInstance();
     int updateQuery = 0;
     int updateQuery_1 = 0;
     String date = new java.util.Date().toString();
     
	            try {
		              connection = DriverManager.getConnection
		              (connectionURL, "root", "12345");
		              String queryString = "insert into student(student_id,student_name,last_name,course,year) VALUES (?, ?, ?, ?, ?)";
		              pstatement = connection.prepareStatement(queryString);
		              pstatement.setString(1, stu_n);		
					  pstatement.setString(2, st_name);
					  pstatement.setString(3, last);
					  pstatement.setString(4, cou);
					  pstatement.setString(5, year);
		              updateQuery = pstatement.executeUpdate();
			            if(updateQuery != 0)
			              {
			                connection = DriverManager.getConnection
						              (connectionURL, "root", "12345");
						              String queryString_1 = "insert into borrow(librarian_id,book_id,book_title,issue_date,student_id) VALUES (?, ?, ?, ?, ?)";
						              pstatement = connection.prepareStatement(queryString_1);
						              pstatement.setString(1, lib_id);		
									  pstatement.setString(2, bo_id);
									  pstatement.setString(3, bo_tit);
									  pstatement.setString(4, iss_dat);
									  pstatement.setString(5, stu_n);
									  updateQuery_1 = pstatement.executeUpdate();
				            	
									  if(updateQuery_1 != 0)
				              {
			            	    out.println("you borrowed Book Successfully!"+"<a href='libra.html'>Go back to admin</a>");
			              }
			              }
	            }
			              
	            
	            
	            catch (Exception ex) 
	            {
	              ex.printStackTrace();
	              out.println("Unable to connect to batabase.");	              
	            }

            finally{
            	
	                  pstatement.close();
  		              connection.close();
		           	}
	            
     
	            

%>	            