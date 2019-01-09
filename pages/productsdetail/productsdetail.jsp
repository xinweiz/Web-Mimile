<%@ page language="java" import="java.util.*,com.hwadee.mimile.service.CommentsService,com.hwadee.mimile.service.GoodsService,
com.hwadee.mimile.pojo.Comments,com.hwadee.mimile.pojo.*" pageEncoding="utf-8"%>
<%
/////////////
////这段代码用来判断该页面的url中的goods.gid！
int gid=1;///////!!
/////////////
///////////////////
if(request.getParameter("goods.gid")==null)
{

}
else{
gid=Integer.parseInt(request.getParameter("goods.gid").toString());
};
GoodsService goodsService=new GoodsService();
Goods goods=new Goods();
goods=goodsService.findById(gid);
%>


<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
    /*
     * url 目标url
     * arg 需要替换的参数名称
     * arg_val 替换后的参数的值
     * return url 参数替换后的url
     */
    function changeURLArg(url,arg,arg_val){
        var pattern=arg+'=([^&]*)';
        var replaceText=arg+'='+arg_val;
        if(url.match(pattern)){
            var tmp='/('+ arg+'=)([^&]*)/gi';
            if(arg=="price"){
                pattern=arg+'=2';
                if(url.match(pattern)){
                    replaceText=arg+'=1';
                }
                else{
                    replaceText=arg+'=2';
                }
            }
            tmp=url.replace(eval(tmp),replaceText);
            return tmp;
        }else{
            if(url.match('[\?]')){
                return url+'&'+replaceText;
            }else{
                return url+'?'+replaceText;
            }
        }
        return url+'\n'+arg+'\n'+arg_val;
    }
    function searchGoods(){
        var search = document.getElementById("search").value;
        window.open(changeURLArg("http://localhost:8080/pages/homepage/index.jsp","keyWords",search),"_self");
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
     function CheckInfo()
    {
        if (event.keyCode==13)
        {
            searchGoods();
        }
    }
    function gotoCart(){
		//window.open("../buyer/ShoppingCart.jsp","blank");
		var num=document.getElementById("appendedInputButtons").value;
		var gid="<%=gid%>";
		url="CartAction?gid="+gid+"&gnum="+num;
		window.open(url);
	}
	
	function addCart(){
		var num=document.getElementById("appendedInputButtons").value;
		var gid="<%=gid%>";
		url="addCart?gid="+gid+"&gnum="+num;
		window.open(url);
	}
	
    </script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title><%=goods.getGname() %></title>
</head>
<body>
<div style="width: 1250px;line-height:10px;border-bottom: 1px solid #fff;"></div>
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
                                <li><a href="../../pages/buyer/BuyInformation.jsp#reg1">基本信息</a></li>
                                <li><a href="../../pages/buyer/BuyInformation.jsp#reg2">收货地址</a></li>
                                <li><a href="../../pages/buyer/BuyInformation.jsp#reg3">个人订单</a></li>
                                <li class="divider"></li>
                                <li><a href="../../register/ServiceProtocol.html">客户协议</a></li>
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
                <li class="logo" style="position: relative;top:30px;left: 10%;">
                    <a href="http://localhost:8080/pages/homepage/index.jsp"><img src="../../pictures/logo.png" style="" ></a>
                    
                </li>


                <%
                List<Goods> goodss=new ArrayList();

                String keyWords=null;///////!!
                /////////////
                ///////////////////
                if(request.getParameter("keyWords")==null)
                {//优先执行！
                int type=-1;
                int price=-1;
                if(request.getParameter("type")!=null)
                {
                type=Integer.parseInt(request.getParameter("type").toString());
                }
                if(request.getParameter("price")!=null)
                {
                price=Integer.parseInt(request.getParameter("price").toString());
                }
                if(price==-1&&type==-1)//默认
                goodss=goodsService.findAll();
                if(price==1&&type==-1)//全部升序
                goodss=goodsService.sortAscByGprice();
                if(price==2&&type==-1)//全部降序
                goodss=goodsService.sortDescByGprice();
                if(price==-1&&type!=-1)//不排序，只分类
                goodss=goodsService.findByType(type);
                if(price==1&&type!=-1)//分类后升序
                goodss=goodsService.sortAscByGpriceByType(type);
                if(price==2&&type!=-1)//分类后降序
                goodss=goodsService.sortDescByGpriceByType(type);
                }
                else{
                System.out.println(keyWords);
                keyWords=request.getParameter("keyWords").toString();
                keyWords=new String(keyWords.getBytes("iso-8859-1"),"utf-8");
                System.out.println(keyWords);
                goodss=goodsService.searchByKeyWords(keyWords);
                };


	

                %>
                <%
	            CommentsService commentsService=new CommentsService();
	
	            List<Comments> commentss=commentsService.findAll(gid);
	
	          
          	  %>
                <li class="header_search" style="top: 40px;">
                    <div class="input-append">
                        <input id="search" type="text" value="搜索 小饰品 试试 >▽<" onfocus="this.value='';" onblur="if(this.value==''){this.value='';}" onkeydown="CheckInfo()">
                        <a href="javascript:searchGoods();"><i class="icon-search" style="margin: 0px 10px;position:relative;top:10px;"></i></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="header_bottom">
        <div class="container">
            <div class="btn-group">
                <button href="http://localhost:8080/pages/homepage/index.jsp" class="btn" style="font-size:16px;background-color: #f8f8f8;outline-style: none;border-radius: 0px;">所有商品分类</button>
                <button class="btn dropdown-toggle" data-toggle="dropdown" style="background-color: #f8f8f8;border-radius: 0px;width: 30px;">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" style="padding: 0;margin-left: 1px;;border: 0">
                    <li><a href="http://localhost:8080/pages/homepage/index.jsp?type=1">服装</a></li>
                    <li><a href="http://localhost:8080/pages/homepage/index.jsp?type=2">化妆品</a></li>
                    <li><a href="http://localhost:8080/pages/homepage/index.jsp?type=3">食品</a></li>
                    <li><a href="http://localhost:8080/pages/homepage/index.jsp?type=4">农产品</a></li>
                    <li><a href="http://localhost:8080/pages/homepage/index.jsp?type=5">运动户外</a></li>
                </ul>
            </div>
            <div class="recommended_items" style="">
                <span><a href="http://localhost:8080/pages/homepage/index.jsp?type=1">服装</a></span>
                <span><a href="http://localhost:8080/pages/homepage/index.jsp?type=2">化妆品</a></span>
                <span><a href="http://localhost:8080/pages/homepage/index.jsp?type=3">食品</a></span>
                <span><a href="http://localhost:8080/pages/homepage/index.jsp?type=4">农产品</a></span>
                <span><a href="http://localhost:8080/pages/homepage/index.jsp?type=5">运动户外</a></span>
            </div>
        </div>
    </div>
</div>
<!--详情-->
<div class="details">
    <div class="pro_picture">
        <a href="" class="thumbnail"><img data-src="holder.js/300x200" alt="300x200" src="/img/<%=goods.getGimageurl() %>"></a>
    </div>
    <div class="details_right" style="margin: 0;margin-left: 160px;">
        <h1 class="name"><%=goods.getGname() %></h1>
        <dl>
            <dt>价&nbsp;&nbsp;格：</dt>
            <dd style="color: #D93600;font-size: 16px;font-weight: 900;">¥<%=goods.getGprice() %></dd>
        </dl>
        <dl>
            <dt style="letter-spacing: 3.8px;">库存量：</dt>
            <dd><%=goods.getGnum() %></dd>
        </dl>
        <dl>
            <dt>购买数量：</dt>
            <button class="btn" type="button" onclick="changeNum(0);">-</button>
            <input class="span2" id="appendedInputButtons" value="1" type="text" style="width: 30px;">
            <button class="btn" type="button" onclick="changeNum(1);">+</button>
        </dl>
          <button style="margin: 30px 10px;" onclick="gotoCart();">立即购买</button>
        <p style="margin: 0px 65px;"><i class="icon-shopping-cart" ></i>&nbsp;&nbsp;<button style="margin: 30px 10px;" onclick="addCart();">加入购物车</a></p>
    </div>
</div>
<!--商品评价-->
<div class="evaluate">
    <div class="tabbable" id="tabs-101201"><!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs">
            <li class="active"><a contenteditable="true" data-toggle="tab" href="#panel-403430" style="text-align: center;width: 130px;margin-left: 40px;">商品评价</a></li>
        </ul>
    </div>
    <div class="tab-content" style="margin: 20px auto;">
        <ul class="thumbnails" style="padding: 0;">

		<%   for(Comments comments:commentss)
	            {
	            User user=new User();
	            user=commentsService.findUserByUid(comments.getUid());%>
            
            <li class="span4" style="margin:10px 60px;width: 90%;">
                <div class="thumbnail" >
                    <div class="caption">
                        <p>用户:<%=user.getUphonenum() %></p>
                        <p>评论:<%=comments.getCwords() %></p>
                        <p style="text-align: right;">时间：<%=comments.getCtime() %></p>
                    </div>
                </div>
            </li>
            <%} %>
        </ul>
    </div>
</div>
<div><span></span></div>
<!--待编辑-->
<img src="../../pictures/bottom.png" style="width: 100%;position: relative;top: 120px;">
<div class="" style="width: 100%;position: relative;top: 150px;">
    <div class="">
        <ul class="">
            <li class="lis"><p>购物指南</p>
                <ul>
                    <li>购物流程</li>
                    <li>账户管理</li>
                    <li>常见问题</li>
                    <li>联系客服</li>
                </ul>
            </li>
            <li class="lis"><p>配送方式</p>
                <ul>
                    <li>上门自提</li>
                    <li>海外配送</li>
                    <li>服务查询</li>
                </ul>
            </li>
            <li class="lis"><p>订单服务</p>
                <ul>
                    <li>订单状态</li>
                    <li>取消订单</li>
                </ul>
            </li>
            <li class="lis"><p>售后服务</p>
                <ul>
                    <li>售后政策</li>
                    <li>价格保护</li>
                    <li>退款说明</li>
                    <li>取消订单</li>
                </ul>
            </li>
            <li class="lis"><p>消费者保障</p>
                <ul>
                    <li>保障范围</li>
                    <li>退货流程</li>
                    <li>退款流程</li>
                    <li>服务中心</li>
                    <li>特色服务</li>
                </ul>
            </li>
            <li class="lis" style=""><p style="border: none;padding-bottom: 0;">关于米米乐商城</p>
                <img src="../../pictures/scmmloo.png" style="width: 100px;margin-left: 15px;">
            </li>
        </ul>
    </div>
</div>
<!--页尾-->
<div class="footer" class="" style="position:relative; top:240px; left: 220px;height: 50px;width: 800px;">
    <ul>
        <li><a href="https://www.taobao.com/">淘宝</a> |
            <a href="https://www.tmall.com/">天猫</a> |
            <a href="http://www.jd.com/">京东</a> |
            <a href="http://www.dangdang.com/">当当</a> |
            <a href="http://beauty.vip.com/">唯品会</a> |
            <a href="http://www.mogujie.com/">蘑菇街</a>|
            <a href="http://localhost:8080/pages/manager/loginWW.jsp">管理员界面</a> 
        </li>
        <li style="border-bottom: 5px solid #fff;">Copyright © 2016-2026 www.mmloo.com All Rights Reserved</li>
    </ul>
</div>
</body>
</html>