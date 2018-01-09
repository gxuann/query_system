<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>informdetailrs</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<%
String num = request.getParameter("num");
String informdetail = request.getParameter("informdetail");

response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
PreparedStatement sta = con.prepareStatement("insert into inform values(?,?)");
sta.setString(1, num);
sta.setString(2, informdetail);

int i = sta.executeUpdate();
if (i == 1) {
	} else {
}
sta.close();
con.close();
response.sendRedirect("inform.jsp");
%>

</body>
</html>