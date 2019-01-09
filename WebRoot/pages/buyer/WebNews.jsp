<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title>我的消息</title>
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
                        <li><a href="../buyer/BuyInformation.jsp">
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
                        <li><a href="" style="background-color: #f2f2f2;">首页</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="" style="background-color: #f2f2f2;">用户信息 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="">基本信息</a></li>
                                <li><a href="">收货地址</a></li>
                                <li><a href="">订单记录</a></li>
                            </ul>
                        </li>
                        <li><a href="" style="background-color: #f2f2f2;">消息</a></li>
                    </ul>
                </div>
            </ul>
        </div>
    </div>
</div>
<!--站内信-->
<%




 %>
<div class="news">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span6" style="width: 15%;position: relative;left: 13%;top: 60px;">
                <ul class="nav nav-list">
                    <li class="nav-header" style="font-size: 16px;">我的消息</li>
                    <li class="active"><a href="#unread"  data-toggle="tab" >未读消息</a></li>
                    <li><a href="#read"  data-toggle="tab" >已读消息</a></li>
                    <li class="divider" style="width: 50%;"></li>
                    <li><a href="#"  data-toggle="tab">帮助</a></li>
                </ul>
            </div>
            <div class="span6" style="width: 50%;position:relative;left: 0px;">
                <div class="tab-content" style="position:relative;left:15%;top: 60px;width:130%;height: auto;display: inline-block;margin: 10px auto;">
                    <div id="unread" class="tab-pane active">
                        <div  class="message" style="position:relative;left:0;top: 0px;width:70%;height: 25px;display: inline-block;">
                            <ul>
                                <li style=""><label class="checkbox"><input type="checkbox"></label></li>
                                <li style="margin-right: 20px">全选</li>
                                <li style="margin-right: 20px;"><a href="#">删除</a></li>
                                <li style=""><a href="#">一键已读</a></li>
                            </ul>
                        </div>
                        <div  class="message" style="border: 1px #CCC solid;position:relative;left:0;top: 0px;width:99%;height: auto;display: inline-block;margin: 10px auto;">
                        <%for(int i=1;i<8;i++)
                        	{
                        	int random=(int)(Math.random()*10);
                        
                         %>
                            <ul style="display: inline-block;border-bottom: 1px dashed #CCC;">
                                <li style="margin-top: 20px;"><label class="checkbox"><input type="checkbox"></label></li>
                                <li style="width: 250px;"><h4><a href="#">未读信息:<%=i %></a></h4></li>
                                <li style="width: 400px;"><p><a href="#">信息详情</a></p></li>
                                <li style=""><em>2016-7-<%=random %></em></li>
                            </ul>
                           <%
                           
                           } %>
                        </div>
                    </div>
                    <div id="read" class="tab-pane">
                        <div  class="message" style="position:relative;left:0;top: 0px;width:70%;height: 25px;display: inline-block;">
                            <ul>
                                <li style=""><label class="checkbox"><input type="checkbox"></label></li>
                                <li style="margin-right: 20px">全选</li>
                                <li style="margin-right: 20px;"><a href="#">删除</a></li>
                            </ul>
                        </div>
                        <div  class="message" style="border: 1px #CCC solid;position:relative;left:0;top: 0px;width:99%;height: auto;display: inline-block;margin: 10px auto;">
                            <%for(int i=1;i<8;i++)
                        	{
                        	int random=(int)(Math.random()*20);
                        
                         %>
                            <ul style="display: inline-block;border-bottom: 1px dashed #CCC;">
                                <li style="margin-top: 20px;"><label class="checkbox"><input type="checkbox"></label></li>
                                <li style="width: 250px;"><h4><a href="#">信息:<%=8-i %></a></h4></li>
                                <li style="width: 400px;"><p><a href="#">信息详情</a></p></li>
                                <li style=""><em>2016-7-<%=random %></em></li>
                            </ul>
                           <%
                           
                           } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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