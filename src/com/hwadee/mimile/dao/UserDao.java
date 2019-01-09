package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.User;
import com.hwadee.mimile.util.DatabaseHelper;

public class UserDao {
	
	public DatabaseHelper databaseHelper;
	
	public User findById() throws SQLException{
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
		
		String sql = "select * from user where uid=" + uid + ";";
		
		ResultSet resultSet = databaseHelper.executeQuery(sql);
		
		resultSet.next();
		
		User user = new User();
		
		return user;
		
	}
	

}
