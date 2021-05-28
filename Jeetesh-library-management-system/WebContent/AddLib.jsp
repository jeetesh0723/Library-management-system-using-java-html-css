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

   String lib_n = request.getParameter("lib_n");
   String lib_name = request.getParameter("lib_name");
   String pho_num = request.getParameter("pho_num");
   String eml = request.getParameter("eml");
   String addres = request.getParameter("addres");
   String pswc = request.getParameter("pswc");

  String connectionURL = "jdbc:mysql://localhost:3306/library";      
     PreparedStatement pstatement = null;

     Class.forName("com.mysql.jdbc.Driver").newInstance();
     int updateQuery = 0;
     
	            try {
		              connection = DriverManager.getConnection
		              (connectionURL, "root", "12345");
		              String queryString = "insert into staff(librarian_id,librarian_name,phone_number,email,address,password) VALUES (?, ?, ?, ?, ?, ?)";
		              pstatement = connection.prepareStatement(queryString);
		              pstatement.setString(1, lib_n);		
					  pstatement.setString(2, lib_name);
					  pstatement.setString(3, pho_num);
					  pstatement.setString(4, eml);
					  pstatement.setString(5, addres);
					  pstatement.setString(6, pswc);
		              updateQuery = pstatement.executeUpdate();
			            if(updateQuery != 0)
			              {
			            	    
			            	    out.println("you added librarian Successfully!"+"<a href='AdminSection.html'>Go back to admin</a>");
		                    
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