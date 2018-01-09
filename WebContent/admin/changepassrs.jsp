<%@page import="util.UserUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
<%
String uname = UserUtil.getuname(request);
String changepass = request.getParameter("changepass");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
System.out.println(uname);
System.out.println(changepass);

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
PreparedStatement sta = con.prepareStatement("update users set upass=? where uname=?");
sta.setString(1, changepass);
sta.setString(2, uname);

int i = sta.executeUpdate();
if (i == 1) {
%>
<br>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">密码修改成功！下次登录请使用新密码。并且请牢记你的新密码：</h3>
    </div>
    <div class="panel-body">
     <%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
    sta = con.prepareStatement("select uname,upass from users where uname=?");
    sta.setString(1, uname);
    ResultSet rs = sta.executeQuery();
	%>
    	<table class="table table-hover">  
 		<thead>
        <tr>  
            <th>  
                <%  
                    out.print("用户名");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("密码");  
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
    </div>
</div>
<%
} else {
%>
<%
}
sta.close();
con.close();
%>
</body>
</html>