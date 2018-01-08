<%@page import="db.DBAccess"%>
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
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
String selectdetail = request.getParameter("selectdetail");
String select = request.getParameter("optionsRadios");
DBAccess db = new DBAccess();
System.out.println(select);
System.out.println(selectdetail);

db.Open();
ResultSet rs = db.ExecuteQuery(String.format("select * from detail where ？=？", select, selectdetail));

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
db.Close();
%>
<hr>
<button class="btn btn-info" onclick="javascript:window.location.href='select.jsp' ">返回</button>
</body>
</html>