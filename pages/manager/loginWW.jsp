<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginWW.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>管理员后台登录入口</title>
  </head>
  
  <body style="background-image: url(image/managerimage/bk.jpg); background-repeat:no-repeat;background-size: cover">
<div style="background-image: url(image/managerimage/mlogin.png); background-repeat:no-repeat;position:relative;height:364px;width: 405px;margin: 150px auto">
    <div>
        <form action="managerAction" method="post" style="color:#031564;position:absolute;margin: 15px;padding: 15px;top:30%;">
           请输入密码：
            <br/>
            <br/>
            <input type="password" name="manager.mpwd">
            <br/>
            <br/>
            <input type="submit" value="确认登录">
        </form>
    </div>
</div>

</body>
</html>
