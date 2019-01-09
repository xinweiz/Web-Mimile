<%@ page language="java" import="java.util.*,com.hwadee.mimile.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/mmile.css" rel="stylesheet" type="text/css">
    <title>注册页面</title>
</head>
<body onload="YYYYMMDDstart(document.form1,document.form1.SYear,document.form1.SMonth,document.form1.SDay)">
<div style="width: 1250px;line-height:10px;border-bottom: 1px solid #fff;"></div>
<!--上-->
 <a href="http://localhost:8080/pages/homepage/index.jsp"><img class="logo" src="../../pictures/logo.png"></a>
<div style="position: absolute;top: 110px;left:370px;font-size: 18px;">欢迎注册!</div>
<!--注册部分-->
<div class="rgt" style="">     
        
        <%String ltx=null; 
        if(session.getAttribute("ltx")!=null){ 
        ltx=session.getAttribute("ltx").toString();
        System.out.println("ltx:"+ltx);
        }
        
        %>
             
    <ul>
        <li><span class="badge badge-inverse" contenteditable="true">1</span> 个人用户注册</li><i class=" icon-chevron-right"></i>
        <li><span class="badge badge-inverse" contenteditable="true">2</span> 个人信息完善</li><i class=" icon-chevron-right"></i>
        <li><span class="badge badge-inverse" contenteditable="true">3</span> 注册成功</li>
    </ul>
    <div class="tab-content">
        <div id="reg1" class="tab-pane active">
            <form id="verification" type="post" action="verification" onsubmit="return check1();" style="position:absolute;top: 95px;left: 100px; width: 600px;">
                <div style="margin-left: 30%;">
                     <input id="phoneID" name="phoneID" type="text" size="20" placeholder="手机号码（11位）" style="text-indent: 1em;font-size: 16px;height: 40px;width: 370px;margin: 15px auto;" autofocus="autofocus" required="required" pattern="[0-9]{11}">
                    <small id="error1" style="color:#991411;position: absolute;text-align: left;right:40%;top:16%;"></small>
                    <input id="password" name="password" type="password" size="20" placeholder="设置密码" style="text-indent: 1em;font-size: 16px;height: 40px;width: 370px;margin: 15px auto;" required="required">
                    <small id="error2" style="color:#991411;position: absolute;text-align: left;right:47%;top:35%;"></small>

                    <div style="margin: 15px 18px;display: inline-block;">
                        <input name="verification"id="yanzhengma" type="text" size="20" placeholder="验证码" style="text-indent: 1em;font-size: 16px;width: 170px;float: left;height: 40px;position:relative;right:52px;" required="required">
	                        <img  style="position:relative;width: 100px;height: 40px;margin: 3px 50px;bottom:47px;left:150px;" id="imagecode"  src="picture">
	                        <a href="javascript:reloadCode();" style="position:absolute;bottom:180px;left:410px;">看不清楚</a>
	    					
	    					
	    					
                    </div><br>
                    <%
                    if(ltx=="false"){
                    %>
                    <small id="error3" style="color:#991411;position: absolute;text-align: left;right:48.5%;top:53%;">请输入正确的验证码</small>
                     <% 
                    }
                     %>
					<div style="margin: 10px 20px;float: left;">
                        <input type="checkbox" style="" id="protocol" required="required" checked="checked"/> 阅读并同意<a href="ServiceProtocol.html" target="_blank" style="font-weight: 700">服务协议</a><br>
                    </div>
                    <small id="error4" style="color:#991411;position: absolute;text-align: left;right:50%;top:75%;"></small>
                    
                    <input type="submit" class="reg_bt" style="height:40px;width: 390px;font-size: 16px; margin: 25px 2px;" value="注册">
                    
                    <!-- <button class="reg_bt" style="height: 40px;width: 390px;font-size: 16px; margin: 25px 2px;" onclick="return check1();"><a href="#">注册</a></button> -->
                      
                      
                      
                          
                    <button class="reg_bt" style="height: 40px;width: 390px;font-size: 16px; margin: 25px 2px;display: none" disabled><a id="toTag2" href="#reg2" data-toggle="tab">注册</a></button>

                </div>
            </form>
        </div>
        
        
                   
        <div id="reg2" class="tab-pane" style="text-align: left;">
            <div class="details_right" style="margin: auto 230px;font-size: 15px;">
                <dl style="margin: 30px 23px;">
                    <dt style="width: 70px;">账&nbsp;号：</dt>
                     <dd id="getPhoneID"  >temp</dd>
                </dl>
                
                
                
                <dl style="margin: 30px 23px;">
                    <dt style="width: 70px;">性&nbsp;别：</dt>
                    <label class="radio">
                        <input type="radio" name="sexOption" id="man" value="man" checked>
                        男
                    </label>
                    <label class="radio">
                        <input type="radio" name="sexOption" id="woman" value="woman">
                        女
                    </label>
                </dl>
                <dl style="margin: 30px 23px;">
                    <dt style="width: 70px;">生&nbsp;日：</dt>
                    <div class="select_date">
                         <form name=form1 id="form1">
                            <select id="year" name=SYear onchange="YYYYDD(this.value,document.form1.SMonth,document.form1.SDay)">
                                <option value="">年</option>
                            </select>年
                            <select id="month" name=SMonth onchange="MMDD(this.value,document.form1.SYear,document.form1.SDay)">
                                <option value="">月</option>
                            </select>月
                            <select id="day" name=SDay>
                                <option value="">日</option>
                            </select>日
                        </form>
                    </div>
                    <small id="birthError" style="color:#991411;position: absolute;text-align: left;right:17%;top:39%;"></small>

                      <script>
                      //王炜的大招
                
                function pushPhoneID(){
                    document.getElementById("getPhoneID").innerHTML=document.getElementById("phoneID").value;
                }

                function postData(){
                    var tempID = document.getElementById("getPhoneID").innerHTML;
                    var tempPassword = document.getElementById("password").value;
                    var tempSex = $("input[name='sexOption']:checked").val();
                    var tempYear = $('#year option:selected').text();
                    var tempMonth = $('#month option:selected').text();
                    var tempDay = $('#day option:selected').text();
                    var tempProvince = $('#province option:selected').text();
                    var tempCity = $('#city option:selected').text();
                    var tempDistrict = $("input[name='hw']").val();

                    var dynamicForm = document.getElementById("dynamicForm");
                    var tagElements = dynamicForm.getElementsByTagName('input');
                    var input;
                    tagElements[0].setAttribute("value",tempID);
                    tagElements[1].setAttribute("value",tempPassword);
                    tagElements[2].setAttribute("value",tempSex);
                    tagElements[3].setAttribute("value",tempYear);
                    tagElements[4].setAttribute("value",tempMonth);
                    tagElements[5].setAttribute("value",tempDay);
                    tagElements[6].setAttribute("value",tempProvince);
                    tagElements[7].setAttribute("value",tempCity);
                    tagElements[8].setAttribute("value",tempDistrict);
                    submitLoad('../../pages/HomePage/index.html');
                }

            </script>
                    
                    <script language="JavaScript">
                    
                    //蓝天翔
                    	function reloadCode()
                    {
						var time =  new Date().getTime();
						document.getElementById("imagecode").src="picture?d=" + time;
					}
					
                    //蓝天翔
                      function check1(){
                    var mass = false;
                    var tempPhoneID = document.getElementById("phoneID").value;
                    var tempPassword = document.getElementById("password").value;
                    if(tempPhoneID.length!=11){
                        document.getElementById("error1").innerHTML="手机号码为11位，请检查格式";
                    }else if(!tempPhoneID.match(/^1[3|4|5|8][0-9]\d{4,8}$/)){
                        document.getElementById("error1").innerHTML="手机号码为11位，请检查格式";
                    }else if(tempPassword.length<6){
                        document.getElementById("error2").innerHTML="密码长度为6位到16位";
                    }else if(tempPassword.length>16){
                        document.getElementById("error2").innerHTML="密码长度为6位到16位";
                    }else if(!document.getElementById("protocol").checked){
                        document.getElementById("error4").innerHTML="请勾选协议";
                    }else{
                        mass=true;
                    }
                    if(mass==true){
                        //pushPhoneID();
                        //alert("验证充公");
                        //document.getElementById("toTag2").click();
                    }
					return mass;
                }
                    
                  function check2(){
                    var tempYear = $('#year option:selected').text();
                    var tempMonth = $('#month option:selected').text();
                    var tempDay = $('#day option:selected').text();
                    var tempProvince = $('#province option:selected').text();
                    if(tempYear=="年"||tempMonth=="月"||tempDay=="日"){
//                        alert("kkkk");
                        document.getElementById("birthError").innerHTML="请选择生日";
                    }else if(tempProvince=="请选择"){
//                        alert("qqqq");
                        document.getElementById("addressError").innerHTML="请选择地址";
                    }else{
                        document.getElementById("toTag3").click();
//                        alert("jjj");
                        postData();
                    }
                }
                    
                    
                        function YYYYMMDDstart(form,year,month,day){
                            MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                            //先给年下拉框赋内容
                            var y = new Date().getFullYear();
                            for (var i = (y-70); i < (y+1); i++) //以今年为准，前30年，后30年
                                year.options.add(new Option(i,i));
                            //赋月份的下拉框
                            for (var i = 1; i < 13; i++)
                                month.options.add(new Option(i,i));
                            year.value = y;
                            month.value = new Date().getMonth() + 1;
                            var n = MonHead[new Date().getMonth()];
                            if (new Date().getMonth() ==1 && IsPinYear(year.options[year.selectedIndex].value)) n++;
                            writeDay(n,day); //赋日期下拉框Author:meizz
                            day.value = new Date().getDate();
                        }
                        function YYYYDD(str,month,day) {//年发生变化时日期发生变化(主要是判断闰平年)
                            var MMvalue = month.options[month.selectedIndex].value;
                            if (MMvalue == "" ){ var e = day; optionsClear(e); return;}
                            var n = MonHead[MMvalue - 1];
                            if (MMvalue ==2 && IsPinYear(str)) n++;
                            writeDay(n,day)
                        }
                        function MMDD(str,year,day) {//月发生变化时日期联动
                            var YYYYvalue = year.options[year.selectedIndex].value;
                            if (YYYYvalue == "" ){ var e = day; optionsClear(e); return;}
                            var n = MonHead[str - 1];
                            if (str ==2 && IsPinYear(YYYYvalue)) n++;
                            writeDay(n,day)
                        }
                        function writeDay(n,day) {//据条件写日期的下拉框
                            var e = day; optionsClear(e);
                            for (var i=1; i<(n+1); i++)
                                e.options.add(new Option(i,i));
                        }
                        function IsPinYear(year){//判断是否闰平年
                            return(0 == year%4 && (year%100 !=0 || year%400 == 0));
                        }
                        function optionsClear(e) {
                            for (var i=e.options.length; i>0; i--)e.remove(i);
                        }
                        function compDate(SY,SM,SD,EY,EM,ED) {}
                    </script>
                </dl>
                <dl style="margin: 30px 23px;">
                      <dt style="width: 70px;">居住地：</dt>
                    <div class="select_city">
                        <form id="form2">
                            <select id="province" name="hw_1" onChange = "hw_select()"></select>
                            <select id="city" name="hw_2" onChange = "hw_select()"></select>
                            <input id="district" class="input" size="15" type="input" value="" name="hw">(区)(选填)
                        </form>
                    </div>
                    <small id="addressError" style="color:#991411;position: absolute;text-align: left;right:-6%;top:53%;"></small>

				
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
                <div class="alert" style="width: 70%;position: relative;left: 5%;margin-bottom: 30px;margin-top: 10px;">
                    <button type="button" class="close" data-dismiss="alert">×</button>
					<h4>提示!</h4> 此信息不可修改，请认真填写！
                </div>
                <button type="button" class="reg_bt" style="height: 30px;width: 90px;font-size: 15px;margin: 5px 25px;" onclick="check2();"><a href="#reg3">提交</a></button>
                <button type="button" class="reg_bt" style="height: 30px;width: 90px;font-size: 15px;margin: 5px 25px;display:none"><a id="toTag3" href="#reg3" data-toggle="tab">提交</a></button>

            </div>
        </div>
        <!-- 王炜的大招 -->
         <form id="dynamicForm" action="registerAction" method="post" style="display: none;">
            <input type="hidden" name="user.uphonenum" value=""/>
            <input type="hidden" name="user.upwd" value=""/>
            <input type="hidden" name="user.usex" value=""/>
            <input type="hidden" name="user.ubirth" value=""/>
            <input type="hidden" name="user.umonth" value=""/>
            <input type="hidden" name="user.uday" value=""/>
            <input type="hidden" name="user.uprovince" value=""/>
            <input type="hidden" name="user.uaddress" value=""/>
            <input type="hidden" name="postDistrict" value=""/>
        </form>
        
        <div id="reg3" class="tab-pane">
            <span style="position: absolute;top: 230px;left:420px;font-size: 50px;color: #E02423;font-family: STCaiyun;">注册成功！</span>
            <script language='javascript' type='text/javascript'>
                var secs =3; //倒计时的秒数
                var URL ;
                function submitLoad(url){
                    URL =url;
                    for(var i=secs;i>=0;i--) {
                        window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);
                    }
                }
                   function doUpdate(num) {
                    document.getElementById('ShowDiv').innerHTML = '将在'+num+'秒后自动跳转到 主页' ;
                    if(num == 0) {
                        document.getElementById("dynamicForm").submit();
                    }
                }
            </script>
            <div id="ShowDiv" style="position: absolute;top: 300px;left:440px;font-size: 15px;font-weight: 500;"></div>
            <script language="javascript">
                Load("../../pages/homepage/index.jsp");
            </script>
        </div>
    </div>
</div>
<!--页尾-->
<div id="footer" class="wrapper" style="position:absolute; top:700px; left: 220px;height: 50px;width: 800px;">
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
</body>
</html>
