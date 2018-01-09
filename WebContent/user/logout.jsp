<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>退出</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="col-xs-4">
<h1>已完成工作？</h1>
<form action="../Logout" method="post">
<div class="col-xs-3">
<button type="submit" class="btn btn-danger btn-block" onclick="javascript:top.location='../login.jsp';">退出</button>
</div>
</form>
</div>
</body>
</html>