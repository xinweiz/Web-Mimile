package com.hwadee.mimile.action;

import com.hwadee.mimile.pojo.Goods;
import com.hwadee.mimile.service.GoodsService;

public class GoodsAction {
	public Goods goods=new Goods();
	GoodsService goodsService=new GoodsService();
	public String  save()
	{
		goodsService.save(goods);
		return "showGoods";
	}
	
	public String delete(){
		goodsService.delete(goods.getGid());
		return "showGoods";
	}
	public String findById(){
		goods = goodsService.findById(goods.getGid());
		return "modGoods";
	}
	public String update(){
		System.out.println(goods.getGid());
		goodsService.update(goods);
		return "showGoods";
	}
}

