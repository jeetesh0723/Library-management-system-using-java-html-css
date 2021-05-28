<%@page import="java.sql.*"%>
<%

String id=request.getParameter("student_id");
int no=Integer.parseInt(id);
String status = request.getParameter("status");
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "12345");
Statement st = conn.createStatement();
st.executeUpdate("update borrow set status='"+status+"' where student_id='"+no+"'");
response.sendRedirect("return.jsp");
}
catch(Exception e){}
%>