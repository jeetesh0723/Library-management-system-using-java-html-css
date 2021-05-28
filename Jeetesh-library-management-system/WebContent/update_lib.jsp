<%@page import="java.sql.*"%>
<%

String id=request.getParameter("librarian_id");
int no=Integer.parseInt(id);
//String librarian_id = request.getParameter("librarian_id");
String phone_number = request.getParameter("phone_number");
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "12345");
Statement st = conn.createStatement();
st.executeUpdate("update staff set phone_number='"+phone_number+"' where librarian_id='"+no+"'");
response.sendRedirect("viewlib.jsp");
}
catch(Exception e){}
%>
