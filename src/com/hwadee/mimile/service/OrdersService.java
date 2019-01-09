package com.hwadee.mimile.service;

import javax.servlet.http.HttpSession;

import com.hwadee.mimile.dao.OrdersDao;
import com.hwadee.mimile.pojo.Order;

public class OrdersService {
	
	OrdersDao ordersDao;
	
	
	
	public Order findOrdersById(){
		return ordersDao.findOrdersById();
	}
	
}
