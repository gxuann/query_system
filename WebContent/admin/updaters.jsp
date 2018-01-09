<%@page import="util.UserUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新结果</title>
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
<%
String company = request.getParameter("company");
String flight = request.getParameter("flight");
String start = request.getParameter("start");
String finish = request.getParameter("finish");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
PreparedStatement sta = con.prepareStatement("insert into detail values(?,?,?,?)");
sta.setString(1, company);
sta.setString(2, flight);
sta.setString(3, start);
sta.setString(4, finish);

int i = sta.executeUpdate();
if (i == 1) {
%>
<br>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">
        	数据插入成功！，以下是详细信息。
        </h3>
    </div>
    <div class="panel-body">
    <%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
    sta = con.prepareStatement("select * from detail where flight=?");
    sta.setString(1, flight);
    ResultSet rs = sta.executeQuery();
	%>
        	 <table class="table table-hover">  
 		<thead>
        <tr>  
            <th>  
                <%  
                    out.print("航空公司");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("航班号");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("出发地");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("目的地");  
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
            <td>  
                <%  
                    out.print(rs.getString(3));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(4));  
                %>  
            </td>  
        </tr>  
        </tbody>
        <%  
            }  
        %>  
    </table>  
    </div>
</div>
<%
} else {
%>
<div class="panel panel-danger">
    <div class="panel-heading">
        <h3 class="panel-title">插入失败！</h3>
    </div>
    <div class="panel-body">
        请重试。
    </div>
</div>
<%
}
sta.close();
con.close();
%>
<hr>
<button class="btn btn-info" onclick="javascript:window.location.href='update.jsp' ">返回</button>
</body>
</html>