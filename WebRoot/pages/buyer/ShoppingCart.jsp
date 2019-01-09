<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hwadee.mimile.action.CartAction"%>
<%@page import="com.hwadee.mimile.dao.GoodsDao"%>
<%@page import="com.hwadee.mimile.pojo.Goods"%>
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
    <title>我的购物车</title>
    
    
    
</head>
<script>
function logOut()
    {
        if(window.confirm('真的要退出吗？')){
            window.open("logoutAction","_self");
        }else{
            //alert("取消");
            return false;
        }

    }
   
    function changeNum(tag){
        if(tag=="0"){
            if(document.getElementById("appendedInputButtons").value>1){
                document.getElementById("appendedInputButtons").value--;
            }
        }else{
            document.getElementById("appendedInputButtons").value++;
        }
    }
</script>
<body>
<%
                    if(session.getAttribute("user")!=null){ %>
                  
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
                <li class="logo" style="position: relative;top:30px;left: 10%;"><a href="http://localhost:8080/pages/homepage/index.jsp"><img src="../../pictures/logo.png" style=""></a></li>
                <div class="bs-docs-example" style="position: relative;top:70px;left: 15%;width: 50%;">
                    <ul class="nav nav-pills">
                        <li><a href="http://localhost:8080/pages/homepage/index.jsp" style="background-color: #f2f2f2;">首页</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="" style="background-color: #f2f2f2;">用户信息 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="http://localhost:8080/pages/buyer/BuyInformation.jsp">基本信息</a></li>
                                <li><a href="http://localhost:8080/pages/buyer/BuyInformation.jsp">收货地址</a></li>
                                <li><a href="http://localhost:8080/pages/buyer/original.jsp">订单记录</a></li>
                            </ul>
                        </li>
                        <li><a href="" style="background-color: #f2f2f2;">消息</a></li>
                    </ul>
                </div>
            </ul>
        </div>
    </div>
</div>
<!--购物车详情-->
<div class="shopping_cart">
    <div style="position:relative;left:15%;top: 60px;width:70%;height: auto;display: inline-block;">
        <ul>
            <li style="width:390px;margin-right: 200px;text-align:center;"><p>商品名</p></li>
            <li style="width:35px;margin-right: 45px;text-align:center;"><em>单价</em></li>
            <li style="width:35px;margin-right: 50px;text-align:center;">数量</li>
            <li style="">总价</li>
            
        </ul><br>
    </div>
    
    
    <%
    	CartAction cartAction = new CartAction();
    	GoodsDao goodsDao = new GoodsDao();
    	Map<Integer,Integer> map = (Map<Integer,Integer>)session.getAttribute("mapCart");
    	
    	Set<Integer> set = new HashSet<Integer>();
    	set = map.keySet();
    	
    	double ammount = 0;
    	
    	for(Integer gid : set){
    		int num = map.get(gid);
    		
    		
    		Goods good = goodsDao.findById(gid);
    		ammount += num * good.getGprice();
    		
     %>
    
    <div style="border: 1px #CCC solid;position:relative;left:15%;top: 60px;width:70%;height: auto;display: inline-block;margin: 10px auto;">
        <ul>
            <li style=""><a><img alt="100x100" src="/img/<%=good.getGimageurl() %>" style="width: 100px;height: 100px;"></a></li>
            <li style="width:250px;margin-right: 200px;"><p><%=good.getGname() %></p></li>
            <li style=""><em><%=good.getGprice() %></em></li>
            <li>
            	<input class="span2" id="appendedInputButtons" readonly="readonly"  value="<%=num %>" type="text" style="width: 30px;text-align: center;cursor:default">
            </li>
            <li><em><%=num * good.getGprice()  %></em></li>
            <li><a href="delCart?gid=<%=gid %>">删除</a></li>
        </ul>
    </div>
    
    <%} %>
    
    
    <br>
    <div style="position:relative;left:15%;top: 60px;width:70%;height: auto;display: inline-block;margin: 20px auto;">
        <a id="modal-968751" href="#pay" role="button" class="btn" data-toggle="modal" style="float: right;width: 125px;height: 25px;margin-right: 40px;">立即支付</a>
        <em style="font-size: 16px;font-weight: 900;float: right;margin: 10px 10px;margin-right: 80px;"><%=ammount %></em>
        <h4 style="float: right;">总计：</h4>
    </div>
    <br>
</div>
<!--支付页面-->
<div id="pay" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 65%;left: 40%;">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel" style="text-align: center;">支付</h3>
    </div>
    <div class="modal-body">
        <table class="table table-bordered table-hover" style="width: 100%;">
            <thead>
            <tr>
                <th>收货人</th>
                <th>所在地区</th>
                <th>详细地址</th>
                <th>邮编</th>
                <th>电话/手机</th>
                <th>操作</th>
            </tr>
            </thead>
            
            
            <%
            	AddressDao addressDao = new AddressDao();
            	List<Address> list = new ArrayList<Address>();
            	list = addressDao.showAllAddr();
            	
            	for(Address address : list){
            		
            
             %>
             
            <tbody>
            <tr>
                <td><%=address.getRname() %></td>
                <td><%=address.getProvince() %></td>
                <td><%=address.getAddr() %></td>
                <td><%=address.getCode() %></td>
                <td><%=address.getRpho() %></td>
                <td><label class="checkbox"><input type="radio" name="addr" id="addr" value="<%=address.getAid() %>" checked></label></td>
            </tr>
            
            </tbody>
            <% } %>
            
        </table>
        
        
        
        
        <%
    	CartAction cartAction1 = new CartAction();
    	GoodsDao goodsDao1 = new GoodsDao();
    	Map<Integer,Integer> map1 = (Map<Integer,Integer>)session.getAttribute("mapCart");
    	
    	Set<Integer> set1 = new HashSet<Integer>();
    	set1 = map.keySet();
    	
    	double ammount1 = 0;
    	
    	for(Integer gid : set1){
    		int num = map.get(gid);
    		
    		
    		Goods good = goodsDao1.findById(gid);
    		ammount1 += num * good.getGprice();
    		
     %>
        
        <div style="border: 1px #CCC solid;position:relative;left:5%;width:90%;height: auto;display: inline-block;margin: 10px auto;">
            <ul>
                <li style=""><a><img alt="100x100" src="/img/<%=good.getGimageurl() %>" style="width: 100px;height: 100px;"></a></li>
                <li style="margin-right: 200px;"><p><%=good.getGname() %></p></li>
                <li><em>数量：<%=num %></em></li>
                <li><em>总计：<%=num * good.getGprice() %></em></li>
            </ul>
        </div>
        
        <%} %>
        
        <em style="font-size: 16px;font-weight: 900;float: right;margin: 10px 10px;margin-right: 80px;"><%=ammount1 %></em>
        <h4 style="float: right;">总计：</h4>
        
    </div>
    <div class="modal-footer">
         <a id="modal" href="cancel" role="button" class="btn"  style="vertical-align: central;width: 125px;height: 20px;float: right;margin-right: 20px;">取消</a>
        
        <a id="modal" href="buy" role="button" class="btn"  style="vertical-align: central;width: 125px;height: 20px;float: right;margin-right: 20px;">确定</a>
        
        
    </div>
</div>
<!--页尾-->
<div id="footer" class="wrapper" style="position:relative; top:150px; left: 220px;height: 50px;width: 800px;">
    <ul>
        <li><a href="https://www.taobao.com/">淘宝</a> |
            <a href="https://www.tmall.com/">天猫</a> |
            <a href="http://www.jd.com/">京东</a> |
            <a href="http://www.dangdang.com/">当当</a> |
            <a href="http://beauty.vip.com/">唯品会</a> |
            <a href="http://www.mogujie.com/">蘑菇街</a>|
            <a href="http://localhost:8080/pages/manager/loginWW.jsp">管理员界面</a> 
        </li>
        <li>Copyright © 2016-2026 www.mmloo.com All Rights Reserved</li>
    </ul>
</div>
<%}
                    else{ %>
                    <ul class="nav">
                        <li><a >用户还没有登录</a></li>
                        
                        
                        <li><a href="http://localhost:8080/pages/login/login.html">点击登录</a></li>
                    </ul>
                    <%} %>
</body>
</html>