<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hwadee.mimile.dao.GoodsDao"%>
<%@page import="com.hwadee.mimile.pojo.Goods"%>
<%@page import="com.hwadee.mimile.dao.DetailDao"%>
<%@page import="com.hwadee.mimile.pojo.Detail"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title>订单评价</title>
</head>
<body>
<!--页头-->

<div class="header">
    <div class="navbar" style="">
        <div class="navbar-inner" style="border-radius: 0px;">
            <div class="container-fluid">
                <div class="nav-collapse collapse navbar-responsive-collapse">
                <%
                    if(session.getAttribute("user.uphonenum")!=null){ %>
                    <ul class="nav">
                        <li><a href="http://localhost:8080/pages/login/login.html">
                            <%=session.getAttribute("user.uphonenum").toString() %>，你好
                        </a></li>
                        <li><a href="javascript:logOut()">退出登录</a></li>
                    </ul>
                    <%}
                    else{ %>
                    <ul class="nav">
                        <li><a href="http://localhost:8080/pages/login/login.html">登录</a></li>
                        <li><a href="http://localhost:8080/pages/register/register.jsp">注册</a></li>
                    </ul>
                    <%} %>
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="../../buyer/BuyerInformation.html">用户信息</a>
                            <ul class="dropdown-menu">
                                <li><a href="../../pages/buyer/BuyInformation.jsp#tab1">基本信息</a></li>
                                <li><a href="../../pages/buyer/BuyInformation.jsp#tab2">收货地址</a></li>
                                <li><a href="../../pages/buyer/original.jsp">个人订单</a></li>
                                <li class="divider"></li>
                                <li><a href="../../pages/register/ServiceProtocol.html">客户协议</a></li>
                            </ul>
                        </li>
                        <li><a href="../../pages/buyer/ShoppingCart.jsp">我的购物车</a></li>
                        <li><a href="../../pages/buyer/WebNews.jsp">我的消息</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid">
        <div class="nav-collapse collapse navbar-responsive-collapse">
            <ul class="header_top">
                <li class="logo" style="position: relative;top:30px;left: 10%;"><img src="../../pictures/logo.png" style=""></li>
                <div class="bs-docs-example" style="position: relative;top:70px;left: 15%;width: 50%;">
                    <ul class="nav nav-pills">
                        <li><a href="../../pages/homepage/index.jsp" style="background-color: #f2f2f2;">首页</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="" style="background-color: #f2f2f2;">用户信息 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="../../pages/buyer/BuyInformation.jsp#tab1">基本信息</a></li>
                                <li><a href="../../pages/buyer/BuyInformation.jsp#tab2">收货地址</a></li>
                                <li><a href="../../pages/buyer/original.jsp">订单记录</a></li>
                            </ul>
                        </li>
                        <li><a href="../../pages/buyer/WebNews.jsp" style="background-color: #f2f2f2;">消息</a></li>
                    </ul>
                </div>
            </ul>
        </div>
    </div>
</div>
<!--评价-->

		<%
			GoodsDao goodsDao = new GoodsDao();
			int gid = Integer.parseInt(request.getParameter("gid"));
			
			Goods goods = goodsDao.findById(gid);
		
		
		 %>
	 

<div class="pro">
    <div style="border: 1px #CCC solid;position:relative;left:20%;top: 60px;width:60%;height: auto;display: inline-block;margin: 10px auto;">
        <ul>
            <li style=""><a><img alt="150x150" src="/img/<%=goods.getGimageurl() %>" style="width: 150px;height: 150px;"></a></li>
            <li style="font-size:25px;width: 300px;text-align:center;line-height:150px;"><p><%=goods.getGname() %></p></li>
            <li style="font-size:25px;width: 300px;text-align:center;line-height:150px;"><em><%= goods.getGprice() %></em></li>
        </ul>
    </div>
</div>


	<form action="completeComments" method="post">
		<div class="estimate" style="margin: 50px 250px;">
		    <p style="margin: auto 10px;font-size: 16px;margin-top: 90px;">买家评价</p>
		    <dl><dt style="width: 98%;"></dt></dl>
		    <textarea size="15"   name="hw" rows="5" style="width: 100%;"></textarea>
		    <input type="submit" value="提交">
		    
		</div>
</form>


<!--
	之前的版本
	<div class="estimate" style="margin: 50px 250px;">
    <p style="margin: auto 10px;font-size: 16px;margin-top: 90px;">买家评价</p>
    <dl><dt style="width: 98%;"><textarea class="input" size="15" type="input" value="" name="hw" rows="5" style="width: 100%;"></textarea></dt></dl>
    <div class="Ebuttons">
        <button><a href="saveComments?comments.gid=gi&cwords=request.getParameter("hw") %>">提交</a></button>
        <button><a href="/pages/buyer/BuyInformation.jsp>返回</a></button>
    </div>
</div>
-->


<!--页脚-->
<div id="footer" class="wrapper" style="position:relative; top:90px; left: 220px;height: 50px;width: 800px;">
    <ul>
        <li><a>淘宝</a> |
            <a>淘宝</a> |
            <a>淘宝</a> |
            <a>淘宝</a> |
            <a>淘宝</a> |
            <a>淘宝</a>
        </li>
        <li>Copyright © 2016-2026 www.mmloo.com All Rights Reserved</li>
    </ul>
</div>
</body>
</html>
