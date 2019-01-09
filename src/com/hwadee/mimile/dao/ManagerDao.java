package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.hwadee.mimile.pojo.Manager;
import com.hwadee.mimile.util.DatabaseHelper;

public class ManagerDao {
	DatabaseHelper databaseHelper=new DatabaseHelper();
	public boolean check(Manager manager)
	{
		String sql="select * from manager where manager.mpwd = '"
		+manager.getMpwd()+"'";
		System.out.println("ManageDao:"+sql);
		ResultSet rs=databaseHelper.executeQuery(sql);
		try {
			if(rs.next())
			{
			return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return false;
		
	}
}
