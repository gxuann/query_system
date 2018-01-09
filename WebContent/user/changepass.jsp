<%@page import="util.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="../css/select.css" rel="stylesheet">
</head>
<body>
<br>
<div class="col-lg-12">
<h3>现在登录的是：
<%
	String uname = UserUtil.getuname(request);
	out.print(uname);
%>
</h3>
</div>
<hr>
<div class="col-lg-12">
<form class="form-inline" action="changepassrs.jsp" method="post">
	<input type="password" name="changepass" id="changepass" class="form-control" placeholder="请输入新密码" aria-describedby="sizing-addon1">
	<button type="submit" class="btn btn-success btn-block form-control-select">提交</button><br>
</form>
</div>
</body>
</html>