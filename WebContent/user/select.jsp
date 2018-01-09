<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="../css/select.css" rel="stylesheet">
</head>
<body>
<br>
<div class="col-lg-12">
<form class="form-inline" action="selectrs.jsp" method="get">
	<input name="selectdetail" id="selectdetail" class="form-control" placeholder="请输入查询关键字" aria-describedby="sizing-addon1">
	<button type="submit" class="btn btn-success btn-block form-control-select">提交</button><br>
</form>
<br>
<blockquote>
  <p style="font-size:13px;">查询条件支持：航空公司、航班号、出发地或目的地。</p>
</blockquote>
<hr>
</div>
</body>
</html>