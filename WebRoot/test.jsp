<%@ page language="java" import="java.util.*,com.hwadee.mimile.service.*,com.hwadee.mimile.pojo.*" pageEncoding="utf-8"%>
<%!int type=1; %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

	GoodsService service=new GoodsService();
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
	<script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>  
  <script type="text/javascript">
function getQueryString(name) { 
var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
var r = window.location.search.substr(1).match(reg); 
if (r != null) return unescape(r[2]); 
return null; 

} 
function test(){

alert(getQueryString("t"));
}

</script>
  <body>
  	<select name="goods.tid" >
						<option value="1">服装</option>
						<option value="2">化妆品</option>
						<option value="3" selected="selected">食物</option>
						<option value="4">电器</option>
						<option value="5">书籍</option>
						<option value="6">数码</option>
					</select>
       <h2 align="center">测试专用！</h2>
       <hr>
       <table width="80%" border="1" align="center" style="border: 1px solid blue;border-collapse: collapse;">
           <tr align="center">
               <td>操作</td>
               
               <td>商品编号</td>
               <td>种类编号</td>
               <td>商品名称</td>
               <td>商品价格</td>
               <td>商品数量</td>
               <td>产地</td>
               <td>上下架状态</td>
               <td>图片（链接）</td>
           </tr>
           
           <%
           List<Goods> goodss=service.findByType(type);
              for(Goods goods:goodss){
           %>
           <tr align="center">
               <td><input type="radio" name="gid" value="<%=goods.getGid()%>"></td>
               
               <td><%=goods.getGid()%></td>
               <td><%=goods.getTid()%></td>
               <td><%=goods.getGname() %></td>
               <td><%=goods.getGprice()%></td>
               <td><%=goods.getGnum()%></td>
       		   <td><%=goods.getGaddress()%></td>
        	   <td><%=goods.getGstatus()%></td>
        	   <td><%=goods.getGimageurl()%></td>
           </tr>
           <%}%>
           
       </table>
       <table width="80%" border="0" align="center">
       <tr>
               <td>
                   <button onclick="addGoods()">添加</button>
                   <button onclick="modGoods()">修改</button>
                   <button onclick="delGoods()">删除</button>
                   <input type="submit" onclick="test()" >
               </td>
           </tr>
       </table>
   </body>
</html>
