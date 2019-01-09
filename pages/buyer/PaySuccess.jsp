<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title>支付成功</title>
</head>

<%
	String ammount = session.getAttribute("ammount").toString();
	int oo = (int)Double.parseDouble(ammount);
	if(oo>100){
		oo /=100;
	}else{
		oo=1;
	}
	
 %>

<body  onload="YYYYMMDDstart(document.form1,document.form1.SYear,document.form1.SMonth,document.form1.SDay)">
<!--支付成功页面-->
<div class="pay_success">
    <h2>恭喜！</h2><br>
    <p>此次交易您将获得</p>
    <em><%=oo %></em>
    <p>积分(≧∇≦)ﾉ</p><br>
    <p id="ShowDiv" style="top: 30px;font-size: 15px;font-weight: 500;float: none;margin: 70px 180px;"></p>
    <script language='javascript' type='text/javascript'>
        var secs =5; //倒计时的秒数
        var URL ;
        function Load(url){
            URL =url;
            for(var i=secs;i>=0;i--) {
                window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);
            }
        }
        function doUpdate(num) {
            document.getElementById('ShowDiv').innerHTML = '将在'+num+'秒后自动跳转到 购物车' ;
            if(num == 0) { window.location=URL; }
        }
    </script>
    <!--<p id="ShowDiv" style="position: relative;top: 30px;font-size: 15px;font-weight: 500;display: inline-block;"></p>-->
    <script language="javascript">
        Load("../../pages/buyer/ShoppingCart.jsp");
    </script>
</div>
</body>
</html>
