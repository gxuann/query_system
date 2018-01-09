<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新数据</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<br>
<div class="col-lg-12">
<h3>请填写下面的信息：</h3>
<br>
</div>
<hr>
<div class="col-md-6">
<form class="form-horizontal" role="form" action="updaters.jsp" method="get">
  <div class="form-group">
    <label name="company" class="col-sm-2 control-label">航空公司</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="company" placeholder="请输入航空公司">
    </div>
  </div>
  <div class="form-group">
    <label name="flight" class="col-sm-2 control-label">航班号</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="flight" placeholder="请输入航班号">
    </div>
  </div>
    <div class="form-group">
    <label name="start" class="col-sm-2 control-label">出发地</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="start" placeholder="请输入出发地">
    </div>
  </div>
    <div class="form-group">
    <label name="finish" class="col-sm-2 control-label">目的地</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="finish" placeholder="请输入目的地">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">提交</button>
    </div>
  </div>
</form>
</div>
</body>
</html>