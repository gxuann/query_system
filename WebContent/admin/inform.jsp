<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
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
					亲爱的：<%
				String uname = UserUtil.getuname(request);
				out.print(uname);
			%>
				</h3>
			</h1>
			<hr>
			<br>
			<br>
			<h4>你可以在下面的表单中添加服务器通知。</h4>
			<hr>
			<div class="col-md-6">
				<form class="form-horizontal" role="form" action="informrs.jsp"
					method="get">
					<div class="form-group">
						<label name="num" class="col-sm-2 control-label">序号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="num"
								placeholder="请输入序号">
						</div>
					</div>
					<div class="form-group">
						<label name="informdetail" class="col-sm-2 control-label">详细内容</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="informdetail"
								placeholder="请输入详细内容">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-success">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<hr>
		<div class="col-lg-4">
			<h4>这里是服务器通知：</h4>
			<%
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection con = DriverManager
						.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
				PreparedStatement sta = con.prepareStatement("select * from inform");
				ResultSet rs = sta.executeQuery();
			%>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>
							<%
								out.print("序号");
							%>
						</th>
						<th>
							<%
								out.print("内容");
							%>
						</th>
					</tr>
				</thead>
				<%
					while (rs.next()) {
				%>
				<tbody>
					<tr>
						<td>
							<%
								out.print(rs.getString(1));
							%>
						</td>
						<td>
							<%
								out.print(rs.getString(2));
							%>
						</td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
			<%
				sta.close();
				sta.close();
			%>
		</div>
	</div>
</body>
</html>