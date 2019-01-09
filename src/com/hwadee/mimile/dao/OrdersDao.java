package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.Detail;
import com.hwadee.mimile.pojo.Goods;
import com.hwadee.mimile.pojo.Order;
import com.hwadee.mimile.util.DatabaseHelper;

public class OrdersDao {
	
	DatabaseHelper databaseHelper = new DatabaseHelper();
	GoodsDao goodsDao = new GoodsDao();
	
	
	/*先保存一个只包含用户id与订单id的order元组，并将该订单的oid返回*/
//	public void createOrders(){
//		
//		int uid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getSession().getAttribute("uid")));
//		
////		String sql = "insert into orders(uid) values(" + uid + ");";
//		/*将新插入的元组的状态属性欧status设置为F*/
//		/*查询出新插入的元组的oid*/
//		String sqlSr = "select * from orders where ostatus='F';";
//		
//		databaseHelper.executeUpdate(sql);
//		
//		ResultSet resultSet = databaseHelper.executeQuery(sqlSr);
//		try {
//			resultSet.next();
//			int oid = resultSet.getInt("oid");
//			ServletActionContext.getRequest().getSession().setAttribute("oid", oid);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
//	
	
	
	
	/*将map中的商品加入detail表中，并对orders表进行操作，将其状态初始化为F*/
	public String saveOrders(){
		
//		createOrders();
		
		float ammount = 0;
		int uid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getSession().getAttribute("uid")));
		int oid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getSession().getAttribute("oid")));
		Map<Integer, Integer> map = (Map<Integer, Integer>)ServletActionContext.getRequest().getSession().getAttribute("mapCart");
		
		System.out.println("poioo"+oid);
		
		
		Set<Integer> set = new HashSet<Integer>();
    	set = map.keySet();
    	
    	for(Integer gid : set){
    		
    		Goods goods = goodsDao.findById(gid);
    		int num = map.get(gid);
    		
    		int stock = goods.getGnum();
    		
    		stock = stock - num;
    		
    		ammount += num * goods.getGprice();
    		
    		oid = oid -1;
    		
    		String sqlD = "insert into detail(gid,oid,num)"
    						+ "values(" + gid + "," + oid + "," + num + ");";
    		
    		String sqlU = "update goods set gnum=" + stock + " where gid=" + gid + ";";
    		
    		
    		System.out.println("85"+sqlD);
    		
    		databaseHelper.executeUpdate(sqlU);
    		databaseHelper.executeUpdate(sqlD);
    	}
    	
    	map.clear();
    	
    	System.out.println(ammount);
    	String sqlO = "insert into orders(uid,ammount)"
    					+ "values(" + uid + "," + ammount + ");";
    	
    	ServletActionContext.getRequest().getSession().setAttribute("ammount", ammount);
    	
    	System.out.println(sqlO);
    	
    	databaseHelper.executeUpdate(sqlO);
    	
    	return "T";
	}
	
	
	
	public String bought(){
		
		
		
		String check = saveOrders();
		int oid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getSession().getAttribute("oid")));
		
		Map<Integer, Integer> map = (Map<Integer, Integer>)ServletActionContext.getRequest().getSession().getAttribute("mapCart");
		
		String sql = "update orders set ostatus='T' where oid=" + oid + ";";
		
		System.out.println(sql);
		
		databaseHelper.executeUpdate(sql);
		
		map.clear();
		
		return "T";
		
	}
	
	
	
	public Order findOrdersById(){
		
		int oid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getAttribute("oid")));
		String sql = "select * from orders where oid=" + oid + ";";
		
		System.out.println(sql);
		
		System.out.println(sql);
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		Order order = new Order();
		
		
		try {
			
			resultSet.next();
			
			int uid = resultSet.getInt("uid");
			String ostatus = resultSet.getString("ostatus");
			String otime = resultSet.getString("otime");
			float amount = resultSet.getFloat("ammount");
			
			order.setOid(oid);
			order.setOstatus(ostatus);
			order.setAmmount(amount);
			order.setOtime(otime);
			order.setUid(uid);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return order;
		
	}
	
	public List<Order> getOrdersByUid() throws SQLException{
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getAttribute("uid").toString());
		String sql = "select * from orders where ostatus='T' and uid=" + uid +";";
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		List<Order> list = new ArrayList<Order>();
		
		while(resultSet.next()){
			
			Order order = new Order();
			
			int oid = resultSet.getInt("oid");
			String ostatus = resultSet.getString("ostatus");
			String otime = resultSet.getString("otime");
			float amount = resultSet.getFloat("ammount");
			
			order.setOid(oid);
			order.setOstatus(ostatus);
			order.setAmmount(amount);
			order.setOtime(otime);
			order.setUid(uid);
			
			list.add(order);
		}
		
		return list;
		
	}
	
	
public Order findOrdersByAllId(Integer oid){
		
		String sql = "select * from orders where oid=" + oid + ";";
		
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		Order order = new Order();
		
		
		try {
			
			resultSet.next();
			
			int uid = resultSet.getInt("uid");
			String ostatus = resultSet.getString("ostatus");
			String otime = resultSet.getString("otime");
			float amount = resultSet.getFloat("ammount");
			
			order.setOid(oid);
			order.setOstatus(ostatus);
			order.setAmmount(amount);
			order.setOtime(otime);
			order.setUid(uid);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return order;
		
	}

public Integer findMaxOid() throws SQLException{
	
//	int uid = 1;
	int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
	
	String sql = "select oid from orders where uid=" + uid + " order by oid DESC;";
	
	ResultSet resultSet = databaseHelper.executeQuery(sql);
	
	resultSet.next();
	int oid = resultSet.getInt("oid");
	
	System.out.println("the max oid is :" + oid);
	
	return oid;
	
}


public List<Detail> showDetailByOid(Integer oid) throws SQLException{
	
	String sql = "select * from detail where oid =" + oid + ";";
	
	ResultSet resultSet = databaseHelper.executeQuery(sql);
	
	List<Detail> list = new ArrayList<Detail>();
	
	while(resultSet.next()){
		
		int did = resultSet.getInt("did");
		int gid = resultSet.getInt("gid");
		int oid2 = resultSet.getInt("oid");
		int num = resultSet.getInt("num");
		
		Detail detail = new Detail();
		
		detail.setDid(did);
		detail.setGid(gid);
		detail.setNum(num);
		detail.setOid(oid2);
		
		list.add(detail);
	}
	
	return list;
	
}


public String payOff() throws SQLException{
	
//	int oid = Integer.parseInt(ServletActionContext.getRequest().getParameter("oid").toString());
//	
//	OrdersDao ordersDao = new OrdersDao();
//	GoodsDao goodsDao = new GoodsDao();
//	
//	Order order = ordersDao.findOrdersByAllId(oid);
//	
//	List<Detail> list = ordersDao.showDetailByOid(oid);
//	
//	for(Detail detail : list){
//		
//		int gid = detail.getGid();
//		Goods goods = this.goodsDao.findById(gid);
//		int num = goods.getGnum()-detail.getNum();
//		
//		String sql = "update goods set gnum="+num+";";
//		
//		databaseHelper.executeUpdate(sql);
//	}
	return "T";
	
}
	
	
}
