package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.Address;
import com.hwadee.mimile.util.DatabaseHelper;

public class AddressDao {

	public DatabaseHelper databaseHelper;
	public Address address;
	
	
	public String saveAddre(){
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
		
//		int uid = 1;
		System.out.println("8989" + uid);
		String province = ServletActionContext.getRequest().getParameter("hw_1");
		String city = ServletActionContext.getRequest().getParameter("hw_2");
		String addr = ServletActionContext.getRequest().getParameter("addr");
		Integer code = Integer.parseInt(ServletActionContext.getRequest().getParameter("postCode"));
		String rname = ServletActionContext.getRequest().getParameter("rName");
		String rpho = ServletActionContext.getRequest().getParameter("rPho");
		
		
		addr = city + addr;
		
		
		
		String sql = "insert into address(province,addr,rname,rpho,uid,code) " +
				"value('" + province + "','" + addr + "','" + rname + "','" +
				rpho + "'," + uid + "," + code + ");";
		System.out.println("the sql language is " + sql);
		
		databaseHelper.executeUpdate(sql);
		
		return "T";
		
	}
	
	
	public List<Address> showAllAddr() throws SQLException{
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
		
//		int uid = 1;
		
		String sql = "select * from address where uid =" + uid + ";";
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		List<Address> list = new ArrayList<Address>();
		
		while(resultSet.next()){
			int aid = resultSet.getInt("aid");
			String province = resultSet.getString("province");
			String addr = resultSet.getString("addr");
			String rname = resultSet.getString("rname");
			String rpho = resultSet.getString("rpho");
			int code=resultSet.getInt("code"); 
			Address address = new Address();
			
			address.setCode(code);
			address.setAddr(addr);
			address.setAid(aid);
			address.setProvince(province);
			address.setRname(rname);
			address.setRpho(rpho);
			address.setUid(uid);
			
			list.add(address);
		}
		
		return list;
		
	}
	
	public String delAddr(){
		
		int aid = Integer.parseInt(ServletActionContext.getRequest().getParameter("aid"));
		
		String sql = "delete from address where aid=" + aid + ";";
		
		databaseHelper.executeUpdate(sql);
		
		return "T";
		
	}
	
}
