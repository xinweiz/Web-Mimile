<%@ page language="java" import="java.util.*,com.hwadee.mimile.service.GoodsService,com.hwadee.mimile.pojo.Goods" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>米米乐后台管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <!--[if lt IE 9]>
    <script src="../../js/html5.js"></script>
    <![endif]-->
    <script src="../../js/jquery.js"></script>
    <script src="../../js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>  
     function logOut()
    {
        if(window.confirm('真的要退出吗？我是萌萌哒王炜')){
            window.open("logoutAction","_self");
        }else{
            //alert("取消");
            return false;
        }

    }
        (function($){
            $(window).load(function(){

                $("a[rel='load-content']").click(function(e){
                    e.preventDefault();
                    var url=$(this).attr("href");
                    $.get(url,function(data){
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo","h2:last");
                    });
                });

                $(".content").delegate("a[href='top']","click",function(e){
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
                });

            });
        })(jQuery);
    </script>

    <style>

    </style>

</head>
<body>
<!--header-->
<header>
    <h1><img src="../../images/admin_logo.png"/></h1>
    <ul class="rt_nav">
       <li><a href="javascript:logOut()" class="quit_icon">退出登录</a></li>
    </ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
    <ul>
        <li>
            <dl>
                <dt>商品信息</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="#" class="active">商品列表</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="#">订单列表</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>用户管理</dt>
                <dd><a href="#">用户列表</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>配送与支付设置</dt>
                <dd><a href="#">配送方式</a></dd>
                <dd><a href="#">支付方式</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>数据统计</dt>
                <dd><a href="#">流量统计</a></dd>
                <dd><a href="#">销售额统计</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>其他</dt>
                <dd><a href="#">商城信息</a></dd>
                <dd><a href="#">关于</a></dd>
            </dl>
        </li>
    </ul>
</aside>



<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <section id="add">
            <h2 style="color:#2f2f2f; text-align: left"><strong>商品添加</strong></h2>
            <hr/>
            <form action="goodsActionAdd"  method="post">
            <ul class="ulColumn2">
                <li>
                    <span class="item_name" style="width:120px;">商品名称：</span>
                    <input type="text" class="textbox textbox_295" placeholder="请输入商品名称..."                          name="goods.gname"/>
                    <!--<span class="errorTips">.</span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">类别：</span>
                    <select name="goods.tid" class="select">
                     <option value="1">服装</option>
				     <option value="2">化妆品</option>
					<option value="3" >食物</option>
					<option value="4">农产品</option>
					<option value="5">运动户外</option>
                    </select>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">价格：</span>
                    <input type="text" class="textbox textbox_295" placeholder="设定价格..."                              name="goods.gprice"/>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">数量：</span>
                    <input type="text" class="textbox textbox_295" placeholder="设定数量..."                               name="goods.gnum"/>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">仓库点：</span>
                    <input type="text" class="textbox textbox_295" placeholder="货物仓库点..."                                 name="goods.gaddress"         />
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">上传图片：</span>
                    <label class="uploadImg">
                        <input type="file"/>
                        <span>上传图片</span>
                    </label>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">状态：</span>
                    <span>上架</span><input value="T" type="radio"                                                name="goods.gstatus" />
                    
                    <span>下架</span><input value="F" name="shelf" type="radio"                                   name="goods.gstatus"/>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                <li>
                    <span class="item_name" style="width:120px;"></span>
                    <input type="submit" class="link_btn"/>
                    
                    
           	 </form>
                    &nbsp;&nbsp;<a href="http://localhost:8080/pages/manager/goodListWW.jsp" style="">返回商品列表</a>
                </li>
            </ul>
        </section>
    </div>
</section>


</body>
</html>
