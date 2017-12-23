<%@page import="util.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>航班查询系统</title>
<style>
body
{
  scrollbar-base-color:#C0D586;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-shadow-color:DEEFC6;
}
</style>
</head>
<noframes>
<body>
<%
	String uname = UserUtil.getuname(request);
	String rid = UserUtil.getRid(request);
	if(uname == null || rid == null){
		out.println("请先<a href='login.html'>登录</a>");
		return;
	}
	if(!rid.equals("1")) {
		out.println("请先<a href='login.html'>以管理员身份登录</a>");
		return;
	}

%>
</body>
</noframes>
<frameset rows="50,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.html" name="topFrame" scrolling="no">
  <frameset cols="225,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
    <frame src="left.html" noresize name="menu" scrolling="yes">
    <frame src="inform.jsp" class="frame_r" noresize name="main" scrolling="yes">
  </frameset>
</frameset>

</html>