
<%@ page language="java" import="java.util.*,org.apache.struts2.ServletActionContext,com.hwadee.mimile.service.CommentsService,com.hwadee.mimile.service.GoodsService,
com.hwadee.mimile.pojo.Comments,com.hwadee.mimile.pojo.Goods" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title>MMLOO【米米乐】</title>
    <style>
        .filterCategory:hover  .filterCategoryContent{
            display: block;
        }
        .filterCategoryContent{
            display:none;
        }

    </style>
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
                <li class="logo" style="position: relative;top:30px;left: 10%;">
                    <a href="http://localhost:8080/pages/homepage/index.jsp"><img src="../../pictures/logo.png" style="" ></a>
                </li>


                <%
                GoodsService goodsService=new GoodsService();
                List<Goods> goodss=new ArrayList();

                String keyWords=null;///////!!-->
                /////////////-->
                ///////////////////-->
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
                if(price==1&&type==-1)//全部升序-->
                goodss=goodsService.sortAscByGprice();
                if(price==2&&type==-1)//全部降序-->
                goodss=goodsService.sortDescByGprice();
                if(price==-1&&type!=-1)//不排序，只分类-->
                goodss=goodsService.findByType(type);
                if(price==1&&type!=-1)//分类后升序-->
                goodss=goodsService.sortAscByGpriceByType(type);
                if(price==2&&type!=-1)//分类后降序-->
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
<!--导航+滚动图-->
<div class="navtabs">
    
    <!--图片-->
    <div id="myCarousel" class="carousel slide" style="width:100%;position: relative;top: 64px;float: left;margin: 0;">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="active item"><a href="http://www.mmloo.com/shop/activity-1316.html" target="_blank"><img alt="" src="../../pictures/05205251581973868.jpg" /></a></div>
            <div class="item"><a href="http://www.mmloo.com/shop/activity-1315.html" target="_blank"><img alt="" src="../../pictures/05206021892615622.jpg" /></a></div>
            <div class="item"><a href="http://www.mmloo.com/shop/activity-1318.html" target="_blank"><img alt="" src="../../pictures/05213159393440371.jpg" /></a></div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
</div>
<!--商品栏-->
<div class="homepage_products">
    <ul class="products_nav" style="position:relative;top: 0px;height: 30px;border-bottom: 2px solid rgb(255,83,10);margin: 30px 18px;">
        <li style="font-family: cursive;font-weight: 900;font-size: 22px;padding:0px 20px;width:auto;color: rgb(255,83,10);">热销推荐</li>
        <div style="position:relative;display: inline;margin:0px;text-align: center;">
            <!--<a href="javascript:shrMenu();" style="position:relative;float:left;top:15%;right:1%;"><sub>筛选</sub></a>-->
            <ul id="filterMenu" style="position:relative;float:left;margin:0px;top:15%;">
                <li class="filterCategory" style="display:inline-block;float:left;width: auto;left:20px;margin-bottom: 10px"><a style="display:block;width:100px;">
                    <img src="../../img/list.png" width="15" height="5" style="position:relative;bottom:1px;"/>&nbsp;分类</a>
                    <ul class="filterCategoryContent" style="float:left;width: auto;margin:0px;position:absolute;left:12px;text-align: left;">
                        <li style="width:150px;clear:left;"><a id="1" onclick="choose(this)" style="cursor:pointer;margin:10px 35px;">服装</a></li>
                        <li style="width:150px;clear:left;"><a id="2" onclick="choose(this)" style="cursor:pointer;margin:10px 35px;">化妆品</a></li>
                        <li style="width:150px;clear:left;"><a id="3" onclick="choose(this)" style="cursor:pointer;margin:10px 35px;">食品</a></li>
                        <li style="width:150px;clear:left;"><a id="4" onclick="choose(this)" style="cursor:pointer;margin:10px 35px;">农产品</a></li>
                        <li style="width:150px;clear:left;"><a id="5" onclick="choose(this)" style="cursor:pointer;margin:10px 35px;">运动户外</a></li>
                    </ul>
                </li>
                <li style="display:inline-block;float:left;width: auto;"><a href="javascript:sortPrice();" style="display:block;width:100px;">
                    <img src="../../img/sort.png" width="22" height="12" style="position:relative;bottom:1px;"/>&nbsp;价格排序</a></li>
            </ul>
        </div>
        <li style="float: right;text-align: right;margin: auto 20px;padding:0px;">
            <a href="http://localhost:8080/pages/homepage/index.jsp" style="color: rgb(255,83,10);">更多</a></li>
    </ul>



    <ul class="thumbnails">
        <%for(Goods goods:goodss)
        {


        %>
        <li class="span4" style="padding-left: 25px;">
            <div class="thumbnail">
                <img data-src="/img/<%=goods.getGimageurl() %>" alt="100x100" src="/img/<%=goods.getGimageurl() %>" style="width:230px;height:230px;">
                <div class="caption">



                    <h4 id="<%=goods.getGid() %>" style="cursor:pointer;" onclick="getGid2(this)"><%=goods.getGname() %></h4>
                    <em style="color: #ff6d00">￥<%=goods.getGprice() %></em>
                    <!--<p style="float: right;"><i class="icon-shopping-cart" ></i><a href="#">加入购物车</a></p>-->



                </div>
            </div>
        </li>

        <%} %>

    </ul>

</div>
<script>
//    function showFilterMenu(){
//        if(document.getElementById("filterMenu").style.display=="none"){
////            alert(document.getElementById("filterMenu"));
//            document.getElementById("filterMenu").style.display="block";
//        }
//        else{
//            document.getElementById("filterMenu").style.display="none";
//        }
//    }
</script>

<script>
    //王炜
    function CheckInfo()
    {
        if (event.keyCode==13)
        {
            searchGoods();
        }
    }
    //唐雨操
    function logOut()
    {
        if(window.confirm('真的要退出吗？我是萌萌哒王炜')){
            window.open("logoutAction","_self");
        }else{
            //alert("取消");
            return false;
        }

    }
    function getGid2(obj){
        var temp=obj.id;
        window.open(changeURLArg("http://localhost:8080/pages/productsdetail/productsdetail.jsp","goods.gid",temp),"_self");
    }
    function searchGoods(){
        var search = document.getElementById("search").value;
        window.open(changeURLArg(window.location.href,"keyWords",search),"_self");
    }
    function getGid(){
        var temp = $("input[name='check']:checked").val();
        window.open(changeURLArg(window.location.href,"goodGid",temp),"_self");
    }
    function choose(option){
        window.open(changeURLArg(window.location.href,"type",option.id.toString()),"_self");
    }
    function sortPrice(){
        window.open(changeURLArg(window.location.href,"price","2"),"_self");
    }
    function deleteGoods(){
        if(window.confirm('删除不可恢复，确认删除吗？')){
            alert("确定");
            window.open("action?goods.gid="+$("input[name='check']:checked").val());
        }else{
            //alert("取消");
            return false;
        }
    }
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
</script>

<div class="End" style="position: relative;top: 90px;left: 45%;width: 10%;">
    <p style="color: #CDCDCD;font-size: 25px;font-weight: 600;font-family: monospace;height: 60px;">—&nbsp;END&nbsp;—</p>
</div>
<!--待编辑部分-->
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
<!--页脚-->
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