<%@ page language="java" import="java.util.*,com.hwadee.mimile.pojo.*,com.hwadee.mimile.service.*" pageEncoding="UTF-8"%>
<%@page import="com.hwadee.mimile.service.DetailService"%>
<%@page import="com.hwadee.mimile.pojo.Detail"%>
<%@page import="com.hwadee.mimile.pojo.Order"%>
<%@page import="com.hwadee.mimile.service.OrdersService"%>
<%@page import="com.hwadee.mimile.service.GoodsService"%>
<%@page import="com.hwadee.mimile.pojo.Goods"%>
<%@page import="com.hwadee.mimile.dao.DetailDao"%>
<%@page import="com.hwadee.mimile.dao.OrdersDao"%>
<%@page import="com.hwadee.mimile.dao.AddressDao"%>
<%@page import="com.hwadee.mimile.pojo.Address"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title>我的米米乐</title>
</head>
<body>
                  
<!--页头-->
<div class="header">
    <div class="navbar" style="">
        <div class="navbar-inner" style="border-radius: 0px;">
            <div class="container-fluid">
                <div class="nav-collapse collapse navbar-responsive-collapse">
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="">用户信息</a>
                            <ul class="dropdown-menu">
                                <li><a href="../../pages/buyer/BuyInformation.jsp#reg1">基本信息</a></li>
                                <li><a href="../../pages/buyer/BuyInformation.jsp#reg2">收货地址</a></li>
                                <li><a href="../../pages/buyer/BuyInformation.jsp#reg3">个人订单</a></li>
                                <li class="divider"></li>
                                <li><a href="../../pages/register/ServiceProtocol.html">客户协议</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="">个人订单</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">下拉导航1</a></li>
                                <li><a href="#">下拉导航2</a></li>
                                <li><a href="#">其他</a></li>
                                <li class="divider"></li>
                                <li><a href="#">链接3</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="">客户服务</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">下拉导航1</a></li>
                                <li><a href="#">下拉导航2</a></li>
                                <li><a href="#">其他</a></li>
                                <li class="divider"></li>
                                <li><a href="#">链接3</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="nav-collapse collapse navbar-responsive-collapse">
            <ul class="header_top">
                <li class="logo" style="position: relative;top:30px;left: 10%;"><a href="http://localhost:8080/pages/homepage/index.jsp"><img src="../../pictures/logo.png" style=""></a></li>
                <div class="bs-docs-example" style="position: relative;top:70px;left: 15%;width: 50%;">
                    <ul class="nav nav-pills">
                        <li><a href="http://localhost:8080/pages/homepage/index.jsp" style="background-color: #f2f2f2;">首页</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="" style="background-color: #f2f2f2;">用户信息 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#tab1">基本信息</a></li>
                                <li><a href="#tab2">收货地址</a></li>
                                <li><a href="#tab3">订单记录</a></li>
                            </ul>
                        </li>
                        <li><a href="http://localhost:8080/pages/buyer/WebNews.jsp" style="background-color: #f2f2f2;">消息</a></li>
                    </ul>
                </div>
            </ul>
        </div>
    </div>
</div>
<!--会员信息-->
<div class="bs-docs-example" style="position: relative;top:50px;left: 15%;width: 70%;">
    <div class="tabbable" style="margin-bottom: 18px;">
        <ul class="nav nav-tabs">
            <li><a href="#tab1" data-toggle="tab">基本信息</a></li>
            <li><a href="#tab2" data-toggle="tab">收货地址</a></li>
            <li class="active"><a href="#tab3" data-toggle="tab">订单记录</a></li>
        </ul>
  
        
        
        
        
        
        
        
        
        
        
        <div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
        
                <div class="accordion" id="accordion-328009">
                    <div class="accordion-group" >
                        <div class="accordion-heading"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-328009" href="#accordion1" contenteditable="true"> 待支付订单 </a></div>
                        <div id="accordion1" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <div style="position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 0px auto;">
                                    <ul style="margin: 0;">
                                        <li style="margin: 0;"></li>
                                        <li style="width: 175px;text-align: left;margin: 0;margin-left: 280px;"><p style="margin: 0;">商品详情</p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">单价</p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">数量</p></li>
                                        <li style="width: 125px;margin: 0;"><p>时间</p></li>
                                        <li style="width: 50px;margin: 0;"><a href="" style="margin: 0;">操作</a></li>
                                    </ul>
                                </div>
                              
                                <div style="border: 1px #CCC solid;position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 10px auto;">
                                    <ul>
                                        <li style="width: 10px;margin: 0;margin-top: 40px;"><label class="checkbox"><input type="checkbox"></label></li>
                                        <li style=""><a><img alt="100x100" src="" style="width: 100px;height: 100px;"></a></li>
                                        <li style="width: 270px;text-align: left;"><p></p></li>
                                        <li style="width: 30px;"><em></em></li>
                                        <li style="width: 30px;"><em></em></li>
                                        <li style="width: 100px;"><p></p></li>
                                        <li style="width: 50px;"><a href="delGoodsFromDetail?detail.gid=dd.getGid()%">删除</a></li>
                                    </ul>
                           
                                </div>
                                
                                
                                
                                
                                
                                
                                
                                <div style="position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 0px auto;">
                                    <p style="font-size: 18px;float: left;font-weight: 600;">总金额：</p>
                                    <em style="font-size: 18px;float: left;font-weight: 900;"></em>
                                    <a id="modal" href="#" role="button" class="btn" data-toggle="modal" style="width: 125px;height: 20px;float: right;margin-right: 20px;">立即支付</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <div class="accordion-group">
                        <div class="accordion-heading"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-328009" href="#accordion2" contenteditable="true"> 已完成订单 </a> </div>
                        <div id="accordion2" class="accordion-body collapse" style="height: 0px;">
                            <div class="accordion-inner">
                                <div style="position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 0px auto;">
                                
                                
                                
                              <%
                              		DetailDao detailDao = new DetailDao();
                              		List<Detail> list = new ArrayList<Detail>();
                              		List<Integer> oList  = new ArrayList<Integer>();
                              		System.out.println("TYC1");
                              		list=detailDao.showDetailsEd();
                              		System.out.println("TYC2");
                              		oList = (List<Integer>)session.getAttribute("eList");
                              		
                              		
                              		for(Detail detail : list){
                              		
                              
                               %>  
                                
                                
                                
                                <!-- 已完成订单 -->
                                    <ul style="margin: 0;">
                                        <li style="margin: 0;"><br></li>
                                        <li style="width: 175px;text-align: left;margin: 0;margin-left: 280px;"><p style="margin: 0;">商品详情</p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">单价<%=detail.getDid() %></p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">数量<%=detail.getGid() %></p></li>
                                        <li style="width: 125px;margin: 0;"><p>时间<%=detail.getNum() %></p></li>
                                        <li style="width: 50px;margin: 0;"><a href="" style="margin: 0;">操作</a></li>
                                    </ul>
                                    
                                    <%} %>
                                    
                                    </div>
                                <div style="border: 1px #CCC solid;position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 10px auto;">
                                    <ul>
                                        <li style=""><a><img alt="100x100" src="" style="width: 100px;height: 100px;"></a></li>
                                        <li style="width: 280px;text-align: left;"><p>goods.getGname() %></p></li>
                                        <li style="width: 30px;"><em>goods.getGprice() %></em></li>
                                        <li style="width: 30px;"><em>detail.getNum() %></em></li>
                                        <li style="width: 100px;"><p>order.getOtime() %></p></li>
                                        <li style="width: 50px;"><a href="/pages/buyer/Estimate.jsp?detail.gid=detail.getGid() %&detail.oid=">评价</a></li>
                                    </ul>
                                </div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </div> <!-- /tabbable -->
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

                    <ul class="nav">
                        <li><a >用户还没有登录</a></li>
                        
                        
                        <li><a href="http://localhost:8080/pages/login/login.html">点击登录</a></li>
                    </ul>
</body>
</html>