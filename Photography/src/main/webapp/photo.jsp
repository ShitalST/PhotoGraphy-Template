<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
String name=request.getParameter("name");
String mobile=request.getParameter("mb");
String email=request.getParameter("mail");
String event=request.getParameter("state");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Photography","root","Shital2002");
PreparedStatement psmt=con.prepareStatement("insert into form values(?,?,?,?)");
psmt.setString(1,name);
psmt.setString(2,mobile);
psmt.setString(3,email);
psmt.setString(4,event);
psmt.executeUpdate();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from form");

%>
<h1 style="color:red;text-align:center;"><%out.print("Thank you ForYour Booking");%></h1>
<table BORDER="1" class="center">
<tr>
<th>Name</th>
<th>Mobile</th>
<th>Email</th>
<th>Event</th>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%out.println(rs.getString(1)); %></td>
<td><%out.println(rs.getString(2)); %></td>
<td><%out.println(rs.getString(3)); %></td>
<td><%out.println(rs.getString(4)); %></td>
</tr>

<% } %>
</table>

</body>
</html>