package com.hwadee.mimile.action;

import java.util.Iterator;
import java.util.List;

import com.hwadee.mimile.pojo.Goods;
import com.hwadee.mimile.pojo.Manager;
import com.hwadee.mimile.pojo.User;
import com.hwadee.mimile.service.GoodsService;
import com.hwadee.mimile.service.LoginService;
import com.hwadee.mimile.service.ManagerService;
//�ɹ�֤��service��dao�������е�
public class testForAction {
public static void main(String[] args) {
//	User user=new User();
//	String tyc="15198032281";
//	user.setUphonenum(tyc);
//	user.setUpwd("1");
//	LoginService loginService=new LoginService();
//	System.out.println(loginService.check(user));
//	
//	Manager manager=new Manager();
//	manager.setMpwd("1");
//	ManagerService managerService=new ManagerService();
//	System.out.println(managerService.check(manager));
//	GoodsService goodsservice= new GoodsService();
//	List list=goodsservice.findAll();
//	Iterator it = list.iterator();
//    while (it.hasNext()){
//    Goods goods = (Goods) it.next();
//	System.out.println(goods.getGname()+goods.getGid()+goods.getGimageurl()+goods.getGnum());
//	Goods goods=new Goods();
//	goods.setTid(1);
//	goods.setGaddress("1");
//	goods.setGname("tyc");
	GoodsService goodsservice=new GoodsService();
	String keyWords="老妈";
	List<Goods> goodss=goodsservice.searchByKeyWords(keyWords);
	for(Goods goods:goodss)
	{
		System.out.println(goods.getGname());
	}
    
}
}
