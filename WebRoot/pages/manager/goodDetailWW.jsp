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
        ul li span{
            font-size:13px;
            text-align: left;
        }
        ul li span.item_name{
            font-size:15px;
            font-weight:bold;
            text-align: left;
            width:120px;
        }
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



		<%
		int gid=-1;
  		if(request.getParameter("goods.gid")!=null)
  		{
	   		gid=Integer.parseInt(request.getParameter("goods.gid").toString());
	   }
	   GoodsService service = new GoodsService();
	   Goods goods=new Goods();
	   
	 	goods=service.findById(gid);
	   
  		 %>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <section id="add">
            <h2 style="color:#2f2f2f; text-align: left"><strong>商品详情</strong></h2>
            <hr/>
            <form action="goodsActionMod" method="post" enctype="multipart/form-data">
            <ul class="ulColumn2">
                <li>
                    <span class="item_name" style="width:120px;">商品名称：</span>
                    <input name="goods.gname" value="<%=goods.getGname() %>" type="text" class="textbox textbox_295" placeholder="请输入商品名称..."/>
                    <!--<span class="errorTips">.</span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">类别：</span>
                    <select name="goods.tid"class="select">
                        <option value="1" name="none">服装</option>
                        <option value="2"name="fuzhuang">化妆品</option>
                        <option value="3"name="eat">食品</option>
                        <option value="4"name="eat">农产品</option>
                        <option value="5"name="eat">运动户外</option>
                    </select>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">价格：</span>
                    <input name="goods.gprice" value="<%=goods.getGprice() %> "type="text" class="textbox textbox_295" placeholder="设定价格..."/>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">数量：</span>
                    <input value="<%=goods.getGnum() %>" name="goods.gnum" type="text" class="textbox textbox_295" placeholder="设定数量..."/>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">仓库点：</span>
                    <input value="<%=goods.getGaddress() %>" name="goods.gaddress" type="text" class="textbox textbox_295" placeholder="货物仓库点..."/>
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                    <span class="item_name" style="width:120px;">上传图片：</span>
                    <label class="uploadImg" >
                        <input name="file" id="upImg" type="file" />
                        <span>上传图片</span>
                    </label>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">状态：</span>
                    <span>上架</span><input name="goods.gstatus" type="radio">
                    <span>下架</span><input name="goods.gstatus" type="radio">
                    <!--<span class="errorTips"></span>-->
                </li>
                <li>
                <li>
                    <span class="item_name" style="width:120px;"></span>
                    <input type="hidden" name="goods.gid" value="<%=goods.getGid() %>"/>"
                    <input type="submit" class="link_btn"/>
                    &nbsp;&nbsp;<a href="http://localhost:8080/pages/manager/goodListWW.jsp" style="">返回商品列表</a>
                </li>
            </ul>
            </form>
            <!--<span id="test"></span>-->
        </section>
    </div>
</section>
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
    function edit(){
        document.getElementById("show1").style.display="none";
        document.getElementById("hide1").style.display="";
        document.getElementById("show2").style.display="none";
        document.getElementById("hide2").style.display="";
        document.getElementById("show3").style.display="none";
        document.getElementById("hide3").style.display="";
        document.getElementById("show4").style.display="none";
        document.getElementById("hide4").style.display="";
        document.getElementById("show5").style.display="none";
        document.getElementById("hide5").style.display="";
        document.getElementById("editShow").style.display="none";
        document.getElementById("editHide").style.display="";
        document.getElementById("opt1").style.display="none";
        document.getElementById("opt2").style.display="";
        document.getElementById("img1").style.display="none";
        document.getElementById("img2").style.display="";
    }
    function disEdit(){
        document.getElementById("hide1").style.display="none";
        document.getElementById("show1").style.display="";
        document.getElementById("hide2").style.display="none";
        document.getElementById("show2").style.display="";
        document.getElementById("hide3").style.display="none";
        document.getElementById("show3").style.display="";
        document.getElementById("hide4").style.display="none";
        document.getElementById("show4").style.display="";
        document.getElementById("hide5").style.display="none";
        document.getElementById("show5").style.display="";
        document.getElementById("editHide").style.display="none";
        document.getElementById("editShow").style.display="";
        document.getElementById("opt2").style.display="none";
        document.getElementById("opt1").style.display="";
        document.getElementById("img2").style.display="none";
        document.getElementById("img1").style.display="";
    }
</script>
</body>
</html>
