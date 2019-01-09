package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.Detail;
import com.hwadee.mimile.pojo.Goods;
import com.hwadee.mimile.util.DatabaseHelper;

public class DetailDao {
	
	DatabaseHelper databaseHelper = new DatabaseHelper();
	public Goods goods = new Goods();
	public Detail detail = new Detail();
	public OrdersDao ordersDao = new OrdersDao();
	
	
	
	public void saveDetail(Detail detail , Integer oid){
		 
		String sql = "insert into detail(gid,oid,num) values(" + detail.getGid() +
					"," + oid + "," + detail.getNum() + ");";
		
		databaseHelper.executeUpdate(sql);
		
	}
	
	
	
	public void saveDetails(){
		
		Map<Integer,Integer> map = (Map<Integer,Integer>)ServletActionContext.getRequest().getSession().getAttribute("mapCart");
		int oid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getAttribute("oid")));
		
		Set<Integer> set = new HashSet<Integer>();
    	set = map.keySet();
    	
    	double ammount = 0;
    	
    	for(Integer gid : set){
    		
    		int num = map.get(gid);
    		
    		String sql = "insert into detail(gid,oid,num) " +
    			"values(" + gid + "," + oid + "," + num + ")";
    		
    		databaseHelper.executeUpdate(sql);
		
    	}
		
	}
	
	
	public List<Detail> showDetails() throws SQLException{
		
		int oid = Integer.parseInt(String.valueOf(ServletActionContext.getRequest().getAttribute("oid")));
//		int oid = 1;
		String sql = "select * from detail where oid = " + oid + ";";
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		List<Detail> list = new ArrayList<Detail>();
		
		while(resultSet.next()){
			int did = resultSet.getInt("did");
			int gid = resultSet.getInt("gid");
			int num = resultSet.getInt("num");
			
			Detail detail = new Detail();
			detail.setDid(did);
			detail.setGid(gid);
			detail.setOid(oid);
			detail.setNum(num);
			
			list.add(detail);
		}
		
		return list;
		
	}
	

	/**根据oid去查询购买详情**/
	public List<Detail> forDetailList(Integer oid) throws SQLException{
	
		String sql = "select * from detail where oid = " + oid + ";";
		
		System.out.println("101" + sql);
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		List<Detail> list = new ArrayList<Detail>();
		
		while(resultSet.next()){
			int did = resultSet.getInt("did");
			int gid = resultSet.getInt("gid");
			int num = resultSet.getInt("num");
			
			Detail detail = new Detail();
			detail.setDid(did);
			detail.setGid(gid);
			detail.setOid(oid);
			detail.setNum(num);
			
			list.add(detail);
		}
		
		return list;
	}
	
	
	public String delGoodsFromDetail(Integer gid){

//		int gid = detail.getGid();
		
//		System.out.println("test gid "+gid);
		
		String sql = "delete from detail where gid=" + gid + ";";
		
		databaseHelper.executeUpdate(sql);
		
//		ordersDao.saveOrders();
		
		return "T";
		
	}
	
	public int findDetailByOidAndGid(Integer oid , Integer gid) throws SQLException{
		
		String sql = "select num from detail where gid=" + gid + " and oid=" + oid + ";";
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		resultSet.next();
		
		int num = resultSet.getInt("num");
		
		return num;
		
	}
	
	
	
	
	
	//已完成订单
	public List<Integer> showDetailsEd() throws SQLException{
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
//		int uid = 1;
		String sqlO = "select oid from orders where ostatus='T' and uid = " + uid + ";";
		
		ResultSet resultSet = databaseHelper.executeQuery(sqlO);
		
		List<Integer> oList = new ArrayList<Integer>();
//		List<Detail> dList = new ArrayList<Detail>();
		
		while(resultSet.next()){
			
			Integer oid = resultSet.getInt("oid");
			oList.add(oid);
			
		}
		
//		ServletActionContext.getRequest().getSession().setAttribute("eList", oList);
		
//		for(Integer oid : oList){
//			
//			String sqlD = "select * from detail where oid =" + oid + ";";
//			
//			System.out.println("182"+sqlD);
//			
//			ResultSet rsD = databaseHelper.executeQuery(sqlD);
//			
//			
//			while(rsD.next()){
//				
//				
//				int did = resultSet.getInt("did");
//				int gid = resultSet.getInt("gid");
//				int num = resultSet.getInt("num");
//				
//				Detail detail = new Detail();
//				detail.setDid(did);
//				detail.setGid(gid);
//				detail.setOid(oid);
//				detail.setNum(num);
//				
//				dList.add(detail);
//			}
//			
//		}
//		
		return oList;
	}
	
	
//	未完成订单
	public List<Integer> showDetailsIng() throws SQLException{
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
//		int uid = 1;
		String sqlO = "select oid from orders where ostatus='F' and uid =" + uid + ";";
		
		System.out.println("211"+sqlO);
		
		
		ResultSet resultSet = databaseHelper.executeQuery(sqlO);
		
		List<Integer> oList = new ArrayList<Integer>();
//		List<Detail> dList = new ArrayList<Detail>();
		
		while(resultSet.next()){
			
			int oid = resultSet.getInt("oid");
			oList.add(oid);
			
		}
		
//		ServletActionContext.getRequest().getSession().setAttribute("oList", oList);
		
//		for(Integer oid : oList){
//			
//			String sqlD = "select * from detail where oid =" + oid + ";";
//			
//			System.out.println("233"+sqlD);
//			
//			ResultSet rsD = databaseHelper.executeQuery(sqlD);
//			
//			rsD.next();
//			
//			int did = rsD.getInt("did");
//			int gid = rsD.getInt("gid");
//			int num = rsD.getInt("num");
//			
//			Detail detail = new Detail();
//			detail.setDid(did);
//			detail.setGid(gid);
//			detail.setOid(oid);
//			detail.setNum(num);
//			
//			dList.add(detail);
//			
//		}
		
		return oList;
		
		
	}
	
	
	

}
