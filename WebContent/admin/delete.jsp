<%@page import="util.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>删除</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="../css/select.css" rel="stylesheet">
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
<div class="col-lg-12">
<form class="form-inline" action="deleters.jsp" method="get">
	<input type="text" name="delflight" id="delflight" class="form-control" placeholder="请输入要删除的航班号" aria-describedby="sizing-addon1">
	<button type="submit" class="btn btn-danger btn-block form-control-select">提交</button><br>
</form>
<br>
<blockquote>
  <p style="font-size:13px;">注意！仅支持航班号删除</p>
</blockquote>
<hr>

</div>
</body>
</html>