<%@page import="util.UserUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>删除结果</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<%
	String uname = UserUtil.getuname(request);
	String rid = UserUtil.getRid(request);
	if(uname == null || rid == null){
		out.println("请先<a href='../login.jsp'>登录</a>");
		return;
	}
	if(!rid.equals("1")) {
		out.println("请先<a href='../login.jsp'>以管理员身份登录</a>");
		return;
	}
%>
<br>
<hr>
<%
String delflight = request.getParameter("delflight");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
System.out.println(delflight);
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
PreparedStatement sta = con.prepareStatement("Delete from detail where flight=?");
sta.setString(1, delflight);
int i = sta.executeUpdate();
if (i > 0) {
%>
<div id="success" class="alert alert-success">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>删除成功！</strong>该项数据已从数据库中删除。
</div>
<%
} else {
%>
<div id="faild" class="alert alert-warning">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>删除失败！</strong>未在数据库中找到该项数据。
</div>
<%
}
%>
<hr>
<button class="btn btn-info" onclick="javascript:window.location.href='delete.jsp' ">返回</button>
</body>
</html> 
