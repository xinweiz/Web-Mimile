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
  .arrow{
   top:26.5%;
   position:absolute;
   clip:rect(0px 15px 20px 0px);
  }

  @font-face {
   font-family: 'footstrap-fonts';
   src: url('../../css/fonts/glyphicons-halflings-regular.eot');
   src: url('../../css/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'),
   url('../../css/fonts/glyphicons-halflings-regular.woff2') format('woff2'),
   url('../../css/fonts/glyphicons-halflings-regular.woff') format('woff'),
   url('../../css/fonts/glyphicons-halflings-regular.ttf') format('truetype'),
   url('../../css/fonts/glyphicons-halflings-regular.svg#footstrap-fonts') format('svg');
   font-weight: normal;
   font-style: normal;
  }

  .glyphicon-collapse-down{
  }

  .glyphicon-collapse-down:before{
   font-family:'footstrap-fonts';
   cursor:pointer;
   content:"\e159";
   position:relative;
   color: #4ca8d8;
   font-size:18px;
   position:relative;
   top:3px;
   left:54%;
   padding-left: 10px;
  }

  .glyphicon-arrow-down{
   font-family:'footstrap-fonts';
   position:relative;
   top:3px;
   padding-left: 5px;
   color: #080810;
   font-size:10px;
  }

  .glyphicon-arrow-down:after{
   content:"\e094";
  }
 </style>

</head>
<body>
 <%
                    if(session.getAttribute("mid")!=null){ %>
                  

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
    <dd><a href="http://localhost:8080/pages/manager/goodListWW.jsp" class="active">商品列表</a></dd>
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
  <section  id="list">
   <h2><strong style="color:grey;"></strong></h2>
   <div class="page_title">
    <h2 class="fl">商品列表</h2>
   </div>
   <table class="table">
    <tr>
     <th>
      <!--<input name="chkAll" id="chkAll" onClick="ChkAllClick('chkSon','chkAll')" type="checkbox">-->
     </th>
     <th>商品编号</th>
     <th>商品名称</th>
     <th style="position:relative;right:23px;"><span class="glyphicon-collapse-down" onMousedown="showCategory()"></span>分类<span>
         <ul id="category" style="display: none;position:absolute;top:90%;left:70%;background-color: #048f74;width: 50%;">
          <li style="border-bottom:0.5px solid #FFFFFF;"><a id="1" style="color: #080810;cursor:pointer;" onclick="choose(this)">服装</a></li>
          <li style="border-bottom:0.5px solid #FFFFFF;"><a id="2" style="color: #080810;cursor:pointer;" onclick="choose(this)">化妆品</a></li>
          <li style="border-bottom:0.5px solid #FFFFFF;"><a id="3" style="color: #080810;cursor:pointer;" onclick="choose(this)">食品</a></li>
          <li style="border-bottom:0.5px solid #FFFFFF;"><a id="4" style="color: #080810;cursor:pointer;" onclick="choose(this)">农产品</a></li>
          <li style="border-bottom:0.5px solid #FFFFFF;"><a id="5" style="color: #080810;cursor:pointer;" onclick="choose(this)">运动户外</a></li>
         </ul>
        </span></th>
     <th>价格<a id="price" class="glyphicon-arrow-down" style="cursor:pointer;" onclick="sortPrice()"></a></th>
     <th>库存</th>
     <th>仓库点</th>
     <th>上下架状态</th>
     <th>图片</th>
    </tr>
    <%
    /////////////
    ////////////////// 
	//这段答案用来控制分类！
   int type=-1;
    int price=-1;
   if(request.getParameter("goods.tid")!=null)
   {
   		type=Integer.parseInt(request.getParameter("goods.tid").toString());
   }
   if(request.getParameter("price")!=null)
   {
   		price=Integer.parseInt(request.getParameter("price").toString());
   }
   
   
   GoodsService service = new GoodsService();
   List<Goods> goodss =service.findAll();
   if(price==-1&&type==-1)//默认
   goodss=service.findAll();
   if(price==1&&type==-1)//全部升序
   goodss=service.sortAscByGprice();
   if(price==2&&type==-1)//全部降序
   goodss=service.sortDescByGprice();
   if(price==-1&&type!=-1)//不排序，只分类
 	goodss=service.findByType(type);
 	if(price==1&&type!=-1)//分类后升序
 	goodss=service.sortAscByGpriceByType(type);
 	if(price==2&&type!=-1)//分类后降序
 	goodss=service.sortDescByGpriceByType(type);
   for(Goods goods:goodss)
   {
   %>
    
    
    <tr>
     <!--<td style="text-align: center"><input name="chkSon" id="chkSon1" onclick="ChkSonClick('chkSon','chkAll')" type="checkbox"></td>-->
     <td><input type="radio" name="check" checked="checked" value="<%=goods.getGid() %>"/> </td>
     <td style="width:265px;"><div class="cut_title ellipsis"><a href="http://localhost:8080/pages/manager/goodDetailWW.jsp?goods.gid=<%=goods.getGid() %>">
     	<%=goods.getGid() %></a></div></td>
     <td><%=goods.getGname() %></td>
     <td><%=goods.getTid() %></td>
     <td><%=goods.getGprice() %></td>
     <td><%=goods.getGnum() %></td>
     <td><%=goods.getGaddress() %></td>
     <td><%=goods.getGstatus() %></td>
     <td><%=goods.getGimageurl() %></td>
    </tr>
    
    <%} %>
  
   </table>
   <aside class="paging">
    <a name="add" class=".group_btn" style="position:absolute;left: 0px;" href="http://localhost:8080/pages/manager/goodAddWW.jsp">添加商品</a>
    <a style="position:absolute;left: 8%;"onclick="deleteGoods()" >删除所选商品</a>
    <a>第一页</a>
    <a>1</a>
    <a>2</a>
    <a>3</a>
    <a>…</a>
    <a>1004</a>
    <a>最后一页</a>
   </aside>
  </section>
  <SCRIPT LANGUAGE="JavaScript">

   function showCategory(){
    if(document.getElementById("category").style.display=="none"){
     document.getElementById("category").style.display="block";
    }
    else{
     document.getElementById("category").style.display="none";
    }
   }

  </script>
  <!--<script>-->
   <!--function showAdd(){-->
    <!--document.getElementById("add").style.display="block";-->
    <!--document.getElementById("list").style.display="none";-->
   <!--}-->
   <!--function hideAdd(){-->
    <!--alert("添加成功，确认返回");-->
    <!--document.getElementById("add").style.display="none";-->
    <!--document.getElementById("list").style.display="block";-->
   <!--}-->
  <!--</script>-->
  <script language="javascript">
   // --列头全选框被单击---
   function ChkAllClick(sonName, cbAllId){
    var arrSon = document.getElementsByName(sonName);
    var cbAll = document.getElementById(cbAllId);
    var tempState=cbAll.checked;
    for(var i=0;i<arrSon.length;i++) {
     if(arrSon[i].checked!=tempState)
      arrSon[i].click();
    }
   }

   // --子项复选框被单击---
   function ChkSonClick(sonName, cbAllId) {
    var arrSon = document.getElementsByName(sonName);
    var cbAll = document.getElementById(cbAllId);
    for(var i=0; i<arrSon.length; i++) {
     if(!arrSon[i].checked) {
      cbAll.checked = false;
      return;
     }
    }
    cbAll.checked = true;
   }

   // --反选被单击---
   function ChkOppClick(sonName){
    var arrSon = document.getElementsByName(sonName);
    for(i=0;i<arrSon.length;i++) {
     arrSon[i].click();
    }
   }
  </script>


  <script>
   function choose(option){
    window.open(changeURLArg(window.location.href,"goods.tid",option.id.toString()),"_self");
   }
   function sortPrice(){
    window.open(changeURLArg(window.location.href,"price","1"),"_self");
   }
   
   
   function deleteGoods(){
    if(window.confirm('删除不可恢复，确认删除吗？')){
     //alert("确定");
     window.open("goodsActionDel?goods.gid="+$("input[name='check']:checked").val());
     return true;
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
    *1为升序，2位降序
    */
   function changeURLArg(url,arg,arg_val){
    var pattern=arg+'=([^&]*)';
    var replaceText=arg+'='+arg_val;
    if(url.match(pattern)){
     var tmp='/('+ arg+'=)([^&]*)/gi';
     if(arg=="price"){
      pattern=arg+'=1';
      if(url.match(pattern)){
        replaceText=arg+'=2';
      }
      else{
       replaceText=arg+'=1';
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
  
   
  </script>
  
  
  
 </div>
</section>

<%}
                    else{ %>
                    <ul class="nav">
                        <li><a >管理员还没有登录</a></li>
                        
                        
                        <li><a href="http://localhost:8080/pages/manager/loginWW.jsp">点击登录</a></li>
                    </ul>
                    <%} %>

</body>
</html>
