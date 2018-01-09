<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询结果</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<h3>以下是查询结果：</h3>
<hr>
<%
String selectdetail = request.getParameter("selectdetail");
String select = request.getParameter("select");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
System.out.println(select);
System.out.println(selectdetail);
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
PreparedStatement sta = con.prepareStatement("select * from detail where (company=? or flight=? or start=? or finish=?)");
sta.setString(1, selectdetail);
sta.setString(2, selectdetail);
sta.setString(3, selectdetail);
sta.setString(4, selectdetail);
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
<%
sta.close();
sta.close();
%>
<hr>
<button class="btn btn-info" onclick="javascript:window.location.href='select.jsp' ">返回</button>
</body>
</html>