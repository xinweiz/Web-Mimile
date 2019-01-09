<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hwadee.mimile.dao.DetailDao"%>
<%@page import="com.hwadee.mimile.dao.OrdersDao"%>
<%@page import="com.hwadee.mimile.dao.*"%>
<%@page import="com.hwadee.mimile.pojo.*"%>
<%@page import="com.hwadee.mimile.pojo.Order"%>
<%@page import="com.hwadee.mimile.pojo.Goods"%>
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
                    <a href="http://localhost:8080/pages/homepage/index.jsp"><img src="../../pictures/logo.png" style=""></a>
                </li>
                <li class="header_search" style="top: 40px;">
                    
                </li>
            </ul>
        </div>
    </div>
</div>
<!--会员信息-->
<div class="bs-docs-example" style="position: relative;top:50px;left: 15%;width: 70%;">
    <div class="tabbable" style="margin-bottom: 18px;">
        <ul class="nav nav-tabs">
            <li><a href="http://localhost:8080/pages/buyer/BuyInformation.jsp#reg1" >基本信息</a></li>
            <li><a href="http://localhost:8080/pages/buyer/BuyInformation.jsp#reg2" >收货地址</a></li>
            <li class="active"><a href="#tab3" data-toggle="tab">订单记录</a></li>
        </ul>
        <div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
            <div class="tab-pane" id="tab1">
                <div class="details_right" style="margin: 0 5%;">
                    <dl style="margin: 20px 20px;">
                        <dt style="width: 80px;">账&nbsp;&nbsp;号：</dt>
                        <dd>1343886****</dd>
                    </dl>
                    <dl style="margin: 20px 20px;">
                        <dt style="width: 80px;">性&nbsp;&nbsp;别：</dt>
                        <dd>女</dd>
                    </dl>
                    <dl style="margin: 20px 20px;">
                        <dt style="width: 80px;">生&nbsp;&nbsp;日：</dt>
                        <dd>1996-4-10</dd>
                    </dl>
                    <dl style="margin: 20px 20px;">
                        <dt style="width: 80px;">地&nbsp;&nbsp;址：</dt>
                        <dd>山东省青岛市黄岛区</dd>
                    </dl>
                    <dl style="margin: 20px 20px;">
                        <dt style="width: 80px;">会员等级：</dt>
                        <dd>***</dd>
                    </dl>
                    <dl style="margin: 20px 20px;">
                        <dt style="width: 80px;">会员积分：</dt>
                        <dd>**</dd>
                    </dl>
                    <dl style="margin: 20px 20px;margin-bottom: 100px;">
                        <dt style="width: 80px;">账户余额：</dt>
                        <dd>***</dd>
                    </dl>
                </div>
            </div>
            <div class="tab-pane" id="tab2">
                <table class="table table-bordered table-hover" contenteditable="true">
                    <thead>
                    <tr>
                        <th>收货人</th>
                        <th>所在地区</th>
                        <th>详细地址</th>
                        <th>邮编</th>
                        <th>电话/手机</th>
                        <th>操作</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>zxw</td>
                        <td>省 市</td>
                        <td>区-街道-楼</td>
                        <td>611731</td>
                        <td>1343886****</td>
                        <td><a href="/member/fresh/deliver_address.htm?spm=0.0.0.0.Zbpzsm&type=home&action=deliver_address_mgr&_tb_token_=Hz4Nnupl34Ai&event_submit_do_delete_in_fresh=submit&id=5628217773">删除</a></td>
                        <td>Default</td>
                    </tr>
                    <tr class="success">
                        <td>1</td>
                        <td>TB - Monthly</td>
                        <td>01/04/2012</td>
                        <td>Approved</td>
                        <td>Default</td>
                        <td>Default</td>
                        <td>Default</td>
                    </tr>
                    </tbody>
                </table>
                <div class="add_address">
                    <p style="color: #E02423;font-weight: 900;position: relative;left: 30px;top: 20px;width: 80%;">新增收货地址：</p>
                    <div class="add_address_details" style="width:40%;position: relative;left: 16%;top: -28px;">
                        <dl style="margin: 30px 23px;">
                            <dt style="width: 90px;">所在地区<a style="color: red">*</a>：</dt>
                            <dt class="select_city">
                            <form style="">
                                <select name="hw_1" onChange = "hw_select()"></select>
                                <select name="hw_2" onChange = "hw_select()"></select>
                            </form>
                            </dt>
                            <script language="JavaScript">
                                var hw_selecttext =
                                        "北京|东城^西城^崇文^宣武^朝阳^丰台^石景山^海淀^门头沟^房山^通州^顺义^昌平^大兴^平谷^怀柔^密云^延庆*" +
                                        "上海|黄浦^卢湾^徐汇^长宁^静安^普陀^闸北^虹口^杨浦^闵行^宝山^嘉定^浦东^金山^松江^青浦^南汇^奉贤^崇明*" +
                                        "天津|和平^东丽^河东^西青^河西^津南^南开^北辰^河北^武清^红挢^塘沽^汉沽^大港^宁河^静海^宝坻^蓟县*" +
                                        "重庆|万州^涪陵^渝中^大渡口^江北^沙坪坝^九龙坡^南岸^北碚^万盛^双挢^渝北^巴南^黔江^长寿^綦江^潼南^铜梁^大足^荣昌^壁山^梁平^城口^丰都^垫江^武隆^忠县^开县^云阳^奉节^巫山^巫溪^石柱^秀山^酉阳^彭水^江津^合川^永川^南川*" +
                                        "河北|石家庄^邯郸^邢台^保定^张家口^承德^廊坊^唐山^秦皇岛^沧州^衡水*山西|太原^大同^阳泉^长治^晋城^朔州^吕梁^忻州^晋中^临汾^运城*" +
                                        "内蒙古|呼和浩特^包头^乌海^赤峰^呼伦贝尔盟^阿拉善盟^哲里木盟^兴安盟^乌兰察布盟^锡林郭勒盟^巴彦淖尔盟^伊克昭盟*" +
                                        "辽宁|沈阳^大连^鞍山^抚顺^本溪^丹东^锦州^营口^阜新^辽阳^盘锦^铁岭^朝阳^葫芦岛*" +
                                        "吉林|长春^吉林^四平^辽源^通化^白山^松原^白城^延边*" +
                                        "黑龙江|哈尔滨^齐齐哈尔^牡丹江^佳木斯^大庆^绥化^鹤岗^鸡西^黑河^双鸭山^伊春^七台河^大兴安岭*" +
                                        "江苏|南京^镇江^苏州^南通^扬州^盐城^徐州^连云港^常州^无锡^宿迁^泰州^淮安*" +
                                        "浙江|杭州^宁波^温州^嘉兴^湖州^绍兴^金华^衢州^舟山^台州^丽水*" +
                                        "安徽|合肥^芜湖^蚌埠^马鞍山^淮北^铜陵^安庆^黄山^滁州^宿州^池州^淮南^巢湖^阜阳^六安^宣城^亳州*" +
                                        "福建|福州^厦门^莆田^三明^泉州^漳州^南平^龙岩^宁德*" +
                                        "江西|南昌市^景德镇^九江^鹰潭^萍乡^新馀^赣州^吉安^宜春^抚州^上饶*" +
                                        "山东|济南^青岛^淄博^枣庄^东营^烟台^潍坊^济宁^泰安^威海^日照^莱芜^临沂^德州^聊城^滨州^菏泽*" +
                                        "河南|郑州^开封^洛阳^平顶山^安阳^鹤壁^新乡^焦作^濮阳^许昌^漯河^三门峡^南阳^商丘^信阳^周口^驻马店^济源*" +
                                        "湖北|武汉^宜昌^荆州^襄樊^黄石^荆门^黄冈^十堰^恩施^潜江^天门^仙桃^随州^咸宁^孝感^鄂州*" +
                                        "湖南|长沙^常德^株洲^湘潭^衡阳^岳阳^邵阳^益阳^娄底^怀化^郴州^永州^湘西^张家界*" +
                                        "广东|广州^深圳^珠海^汕头^东莞^中山^佛山^韶关^江门^湛江^茂名^肇庆^惠州^梅州^汕尾^河源^阳江^清远^潮州^揭阳^云浮*" +
                                        "广西|南宁^柳州^桂林^梧州^北海^防城港^钦州^贵港^玉林^南宁地区^柳州地区^贺州^百色^河池*海南|海口^三亚*" +
                                        "四川|成都^绵阳^德阳^自贡^攀枝花^广元^内江^乐山^南充^宜宾^广安^达川^雅安^眉山^甘孜^凉山^泸州*" +
                                        "贵州|贵阳^六盘水^遵义^安顺^铜仁^黔西南^毕节^黔东南^黔南*" +
                                        "云南|昆明^大理^曲靖^玉溪^昭通^楚雄^红河^文山^思茅^西双版纳^保山^德宏^丽江^怒江^迪庆^临沧*" +
                                        "西藏|拉萨^日喀则^山南^林芝^昌都^阿里^那曲*陕西|西安^宝鸡^咸阳^铜川^渭南^延安^榆林^汉中^安康^商洛*" +
                                        "甘肃|兰州^嘉峪关^金昌^白银^天水^酒泉^张掖^武威^定西^陇南^平凉^庆阳^临夏^甘南*" +
                                        "宁夏|银川^石嘴山^吴忠^固原*青海|西宁^海东^海南^海北^黄南^玉树^果洛^海西*" +
                                        "新疆|乌鲁木齐^石河子^克拉玛依^伊犁^巴音郭勒^昌吉^克孜勒苏柯尔克孜^博尔塔拉^吐鲁番^哈密^喀什^和田^阿克苏*" +
                                        "香港|*" +
                                        "澳门|*" +
                                        "台湾|台北^高雄^台中^台南^屏东^南投^云林^新竹^彰化^苗栗^嘉义^花莲^桃园^宜兰^基隆^台东^金门^马祖^澎湖*"+
                                        "其它|北美洲^南美洲^亚洲^非洲^欧洲^大洋洲"
                                var TheSplit1 = "*",TheSplit2 = "|",TheSplit3 = "^", TheSplit4 = "@"
                                var hwallselecttext = hw_selecttext
                                var hwdefault_value = "请选择"
                                var hwallselecttextarr
                                hwallselecttextarr = hwallselecttext.split(TheSplit1)
                                hwArraylength = hwallselecttextarr.length
                                var hwwhere = new Array(hwArraylength);
                                hwwhere[0]= new hw_comefrom("请选择@","请选择@");

                                for (var hwl=0;hwl<hwArraylength;hwl++) {
                                    eval(hwwhere[hwl+1] = new hw_comefrom(hwallselecttextarr[hwl].split(TheSplit2)[0],hwallselecttextarr[hwl].split(TheSplit2)[1]))
                                }
                                function hw_comefrom(hwSelect_s1,hwSelect_s2) { this.hwSelect_s1 = hwSelect_s1; this.hwSelect_s2 = hwSelect_s2; }
                                function hw_select() {
                                    with(document.all.hw_1) {
                                        var hwSelect_s12 = options[selectedIndex].value;
                                    }
                                    for(hwi = 0;hwi < hwwhere.length;hwi ++) {
                                        if (hwwhere[hwi].hwSelect_s1.indexOf(TheSplit4)!=-1) {
                                            var hwThisV = hwwhere[hwi].hwSelect_s1.split(TheSplit4)[1]
                                        }
                                        else {
                                            var hwThisV = hwwhere[hwi].hwSelect_s1
                                        }
                                        if (hwThisV == hwSelect_s12) {
                                            hwSelect_s13 = (hwwhere[hwi].hwSelect_s2).split(TheSplit3);
                                            for(hwj = 0;hwj < hwSelect_s13.length;hwj++) {
                                                with(document.all.hw_2) {
                                                    length = hwSelect_s13.length;
                                                    if (hwSelect_s13[hwj].indexOf(TheSplit4)!=-1) {
                                                        options[hwj].text = hwSelect_s13[hwj].split(TheSplit4)[0]
                                                        options[hwj].value = hwSelect_s13[hwj].split(TheSplit4)[1]
                                                    }
                                                    else {
                                                        options[hwj].text = hwSelect_s13[hwj];
                                                        options[hwj].value = hwSelect_s13[hwj];
                                                    }
                                                    var hwSelect_s14=options[selectedIndex].value;
                                                }
                                            }
                                            break;
                                        }
                                    }
                                    document.all.hw.value=hwSelect_s12+""+hwSelect_s14;
                                }
                                function hw_init() {
                                    with(document.all.hw_1) {
                                        length = hwwhere.length;
                                        var hwm = 0
                                        for(hwk=0;hwk<hwwhere.length;hwk++) {
                                            if (hwwhere[hwk].hwSelect_s1.indexOf(TheSplit4)!=-1) {
                                                options[hwk].text = hwwhere[hwk].hwSelect_s1.split(TheSplit4)[0];
                                                options[hwk].value = hwwhere[hwk].hwSelect_s1.split(TheSplit4)[1];
                                                if (hwdefault_value.indexOf(hwwhere[hwk].hwSelect_s1.split(TheSplit4)[1])!=-1){hwm = hwk}
                                            }
                                            else {
                                                options[hwk].text = hwwhere[hwk].hwSelect_s1;
                                                options[hwk].value = hwwhere[hwk].hwSelect_s1;
                                                if (hwdefault_value.indexOf(hwwhere[hwk].hwSelect_s1)!=-1){hwm = hwk}
                                            }
                                        }
                                        selectedIndex = hwm
                                    }
                                    with(document.all.hw_2)
                                    {
                                        var hwn = 0
                                        hwSelect_s13 = (hwwhere[hwm].hwSelect_s2).split(TheSplit3);
                                        length = hwSelect_s13.length;
                                        for(hwl=0;hwl<length;hwl++) {
                                            if (hwSelect_s13[hwl].indexOf(TheSplit4)!=-1) {
                                                options[hwl].text = hwSelect_s13[hwl].split(TheSplit4)[0];
                                                options[hwl].value = hwSelect_s13[hwl].split(TheSplit4)[1];
                                                if (hwdefault_value.indexOf(hwSelect_s13[hwl].split(TheSplit4)[1])!=-1){hwn = hwl}
                                            }
                                            else {
                                                options[hwl].text = hwSelect_s13[hwl];
                                                options[hwl].value = hwSelect_s13[hwl];
                                                if (hwdefault_value.indexOf(hwSelect_s13[hwl])!=-1){hwn = hwl}
                                            }
                                        }
                                        selectedIndex = hwn
                                    }
                                }
                                hw_init();
                            </script>
                        </dl>
                        <dl style="margin: 30px 23px;">
                            <dt style="width: 90px;">详细地址<a style="color: red">*</a>：</dt>
                            <dt style="width: 70%;"><textarea class="input" size="15" type="input" value="" name="hw" rows="3" style="margin-bottom: 30px;width: 90%;"></textarea></dt>
                        </dl>
                        <dl style="margin: 30px 23px;">
                            <dt style="width: 90px;">邮政编码：</dt>
                            <input class="input" size="15" type="input" value="" name="hw">
                        </dl>
                        <dl style="margin: 30px 23px;">
                            <dt style="width: 90px;">收货人<a style="color: red">*</a>：</dt>
                            <input class="input" size="15" type="input" value="" name="hw">
                        </dl>
                        <dl style="margin: 30px 23px;">
                            <dt style="width: 90px;">手机号码<a style="color: red">*</a>：</dt>
                            <input class="input" size="15" type="input" value="" name="hw">
                        </dl>
                        <button class="reg_bt" style="float:right;height: 30px;width: 90px;font-size: 15px;margin: 5px 25px;"><a href="#">提交</a></button>
                    </div>
                </div>
            </div>
            
            
            
            
            
            
            <div class="tab-pane active" id="tab3">
                <div class="accordion" id="accordion-328009">
                    <div class="accordion-group" >
                        <div class="accordion-heading"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-328009" href="#accordion1"> 待支付订单 </a></div>
                        <div id="accordion1" class="accordion-body in collapse" style="height: auto;">
                            <div class="accordion-inner">
                                <div style="position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 0px auto;">
                                    <ul style="margin: 0;">
                                        <li style="width: 465px;text-align: center;margin: 0px;"><p style="margin: 0;">商品详情</p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">单价</p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">数量</p></li>
                                        <li style="width: 225px;margin: 0;"><p>时间</p></li>
                                        <li style="width: 50px;margin: 0;"><a href="" style="margin: 0;">操作</a></li>
                                    </ul>
                                </div>
                                
                                
                                
                               <!-- 待支付 --> 
                                
                                
                                
                                <%
                                	DetailDao detailDao = new DetailDao();
                                	OrdersDao ordersDao = new OrdersDao();
                                	GoodsDao goodsDao = new GoodsDao();
                                	
                                	List<Integer> oList = new ArrayList<Integer>();
                                	List<Detail> dList = new ArrayList<Detail>();
                                	
                                	oList = detailDao.showDetailsIng();
                                	for(Integer oid : oList){
                                		Order order = ordersDao.findOrdersByAllId(oid);
                                		dList = detailDao.forDetailList(oid);
                                		for(Detail detail : dList){
                                		 	int gid = detail.getGid();
                                		 	Goods goods = goodsDao.findById(gid);
                                			
                                 %>
                                
                                
                                <div style="border: 1px #CCC solid;position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 10px auto;">
                                    <ul>
                                        <li style=""><a><img alt="100x100" src="/img/<%=goods.getGimageurl() %>" style="width: 100px;height: 100px;"></a></li>
                                        <li style="width: 270px;text-align: left;margin-top: 40px;"><p><%=goods.getGname() %></p></li>
                                        <li style="width: 50px;margin-top: 40px;"><em><%=goods.getGprice() %></em></li>
                                        <li style="width: 30px;margin-top: 40px;"><em><%=detail.getNum() %></em></li>
                                        <li style="width: 200px;margin-top: 40px;"><p><%=order.getOtime() %></p></li>
                                        <li style="width: 50px;margin-top: 40px;"><a href="">删除</a></li>
                                    </ul>
                                </div>
												<!--  -->
								<%} %>
								<div style="position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 0px auto;">
                                    <p style="font-size: 18px;float: left;font-weight: 600;">总金额：</p>
                                    <em style="font-size: 18px;float: left;font-weight: 900;"><%=order.getAmmount() %></em>
                                    <a id="modal-968751" href="#pay" role="button" class="btn" data-toggle="modal" style="width: 125px;height: 20px;float: right;margin-right: 20px;">立即支付</a>
                                </div>
     
                                
                                
                                <%} %>
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="accordion-group">
                        <div class="accordion-heading"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-328009" href="#accordion2"> 已完成订单 </a> </div>
                        <div id="accordion2" class="accordion-body collapse" style="height: 0px;">
                            <div class="accordion-inner">
                                <div style="position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 0px auto;">
                                    <ul style="margin: 0;">
                                        <li style="width: 465px;margin: 0px;text-align:center;"><p style="margin: 0;">商品详情</p></li>
                                        <li style="width: 68px;margin: 0;"><p style="margin: 0;">单价</p></li>
                                        <li style="width: 58px;margin: 0;"><p style="margin: 0;">数量</p></li>
                                        <li style="width: 225px;margin: 0;"><p>时间</p></li>
                                        <li style="width: 50px;margin: 0;"><a href="" style="margin: 0;">操作</a></li>
                                    </ul>
                                </div>
                                
                                
                                
                                
                                <%
                                	DetailDao detailDao2 = new DetailDao();
                                	OrdersDao ordersDao2 = new OrdersDao();
                                	GoodsDao goodsDao2 = new GoodsDao();
                                	
                                	List<Integer> oid2 = new ArrayList<Integer>();
                                	List<Detail> did = new ArrayList<Detail>();
                                	
                                	oid2 = detailDao2.showDetailsEd();
                                	
                                	for(Integer oid : oid2){
                                	
                                		Order order = ordersDao2.findOrdersByAllId(oid);
                                		
                                		did = detailDao2.forDetailList(oid);
                                		
                                		for(Detail detail : did){
                                	
                                			int gid = detail.getGid();
                                			
                                			Goods goods = goodsDao2.findById(gid);
                                
                                 %>
                                
                                
                                <div style="border: 1px #CCC solid;position:relative;left:5%;top: 0px;width:90%;height: auto;display: inline-block;margin: 10px auto;">
                                    <ul>
                                        <li style=""><a><img alt="100x100" src="/img/<%=goods.getGimageurl() %>" style="width: 100px;height: 100px;"></a></li>
                                        <li style="width: 280px;text-align: left;margin-top: 40px;"><p><%=goods.getGname() %></p></li>
                                        <li style="width: 50px;margin-top: 40px;"><em><%=goods.getGprice() %></em></li>
                                        <li style="width: 30px;margin-top: 40px;"><em><%=detail.getNum() %></em></li>
                                        <li style="width: 200px;margin-top: 40px;"><p><%=order.getOtime() %></p></li>
                                        <li style="width: 50px;margin-top: 40px;"><a href="saveComments?gid=<%=goods.getGid() %>">评价</a></li>
                                    </ul>
                                </div>
                                <%} %>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- /tabbable -->
</div>
<!--支付页面-->
<div id="pay" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 65%;left: 40%;">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel" style="text-align: center;">支付</h3>
    </div>
    <div class="modal-body">
        <table class="table table-bordered table-hover" contenteditable="true" style="width: 100%;">
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
            <tbody>
            
            
             <%
            	AddressDao addressDao = new AddressDao();
            	List<Address> list = new ArrayList<Address>();
            	list = addressDao.showAllAddr();
            	
            	for(Address address : list){
             %>
            
            <tr>
                <td><%=address.getRname() %></td>
                <td><%=address.getProvince() %></td>
                <td><%=address.getAddr() %></td>
                <td><%=address.getCode() %></td>
                <td><%=address.getRpho() %></td>
                <td><label class="checkbox"><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked></label></td>
            </tr>
            <%} %>
            </tbody>
        </table>
        
        
        <%
        	OrdersDao ordersDao3 = new OrdersDao();
        	GoodsDao goodsDao3 = new GoodsDao();
        	int oid = ordersDao3.findMaxOid();
        	
        	List<Detail> lDetails = ordersDao3.showDetailByOid(oid);
        	Order order = ordersDao3.findOrdersByAllId(oid);
        	for(Detail detail : lDetails){
        		int gid = detail.getGid();
        		Goods goods = goodsDao3.findById(gid);
        
         %>
        
        
        <div style="border: 1px #CCC solid;position:relative;left:5%;width:90%;height: auto;display: inline-block;margin: 10px auto;">
            <ul>
                <li style=""><a><img alt="100x100" src="/img/<%=goods.getGimageurl() %>" style="width: 100px;height: 100px;"></a></li>
                <li style="margin-right: 200px;"><p><%=goods.getGname() %></p></li>
                <li style=""><em><%=goods.getGprice() %></em></li>
                <li><em><%=detail.getNum() %></em></li>
                <li><em><%=detail.getNum() * goods.getGprice() %></em></li>
            </ul>
            <%} %>
        </div>
        
        <h4 style="float: left;margin-left:50px;margin-top:20px;margin-right:20px;">总计：</h4>
        <em style="font-size: 20px;font-weight: 900;float: left;margin-top:20px;"><%=order.getAmmount() %></em>
  
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true" style="float: right;">取消</button>
        <a id="modal" href="PaySccess?oid=<%=order.getOid() %>" role="button" class="btn" data-toggle="modal" style="vertical-align: central;width: 125px;height: 20px;float: right;margin-right: 20px;">确定</a>
    </div>      
    </div>
</div>
<!--页脚-->
<div class="footer" class="" style="position:relative; top:100px; left: 17%;height: 50px;width: 66%;">
    <ul>
        <li><a href="https://www.taobao.com/"> 淘宝</a> |
            <a href="https://www.tmall.com/">天猫</a> |
            <a href="http://www.jd.com/">京东</a> |
            <a href="http://www.dangdang.com/">当当</a> |
            <a href="http://beauty.vip.com/">唯品会</a> |
            <a href="http://www.mogujie.com/">蘑菇街</a>
        </li>
        <li style="border-bottom: 5px solid #fff;">Copyright © 2016-2026 www.mmloo.com All Rights Reserved</li>
    </ul>
</div>
</body>
</html>