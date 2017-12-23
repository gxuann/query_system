<%@page import="util.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>

<body>
	<div class="row show-grid">
		<div class="col-lg-8">
			<h1>
				Hello，欢迎你
				<h3>
					<%
						String uname = UserUtil.getuname(request);
						out.print(uname);
					%>
				</h3>
			</h1>
		</div>

		<hr>
		<div class="col-lg-4">
			<h4>这里是服务器通知：</h4>
		</div>
	</div>
</body>
</html>