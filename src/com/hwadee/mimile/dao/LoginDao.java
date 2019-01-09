package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hwadee.mimile.pojo.User;
import com.hwadee.mimile.util.DatabaseHelper;

public class LoginDao {
	DatabaseHelper databaseHelper=new DatabaseHelper();
	public boolean check(User user)
	{
		String sql="select * from user where user.uphonenum = '"+user.getUphonenum()+"' and user.upwd = '"
		+user.getUpwd()+"'";
		System.out.println("LoginDao:"+sql);
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
	public void register(User user) {
		// TODO Auto-generated method stub
//蓝天翔		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//蓝天翔      String currentTime = simpleDateFormat.format(new Date());
       String currentTime=user.getUbirth()+"-"+user.getUmonth()+"-"+user.getUday();
        String sql="insert into user(uid,uphonenum,upwd,uprovince,ucredit,umoney,ucard,uaddress,usex,ubirth)values('"+
		user.getUid()+"','"+
		user.getUphonenum()+"','"+
		user.getUpwd()+"','"+
		user.getUprovince()+"','"+
		user.getUcredit()+"','"+
		user.getUmoney()+"','"+
		user.getUcard()+"','"+
		user.getUaddress()+"','"+
		user.getUsex()+"','"+
		currentTime+
		
		"')";
	System.out.println(sql);
	DatabaseHelper.executeUpdate(sql);
	
}
	public int getUserLevel(User user) {
		// TODO Auto-generated method stub
		String sql="select * from user where user.uphonenum='"+user.getUphonenum()+"'and user.upwd='"+user.getUpwd()+"'";
		ResultSet rs=DatabaseHelper.executeQuery(sql);
		int ucredit=0;
		try {
			if(rs.next()){
				int uid=rs.getInt("uid");
				String uphonenum=rs.getString("uphonenum");
				String upwd = rs.getString("upwd");
				String uprovince=rs.getString("uprovince");
				ucredit=rs.getInt("ucredit");//关键
				double umoney=rs.getDouble("umoney");
				String ucard=rs.getString("ucard");
				String uaddress=rs.getString("uaddress");
				String usex=rs.getString("usex");
				String ubirth=rs.getString("ubirth");
				
				
				user.setUid(uid);
				user.setUphonenum(uphonenum);
				user.setUpwd(upwd);
				user.setUprovince(uprovince);
				user.setUcredit(ucredit);
				user.setUmoney(umoney);
				user.setUcard(ucard);
				user.setUaddress(uaddress);
				user.setUsex(usex);
				user.setUbirth(ubirth);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//0~100 LEVEL 1
		//200~300 LEVEL 2
		//300~400 LEVEL 3
		//400~500 LEVEL 4
		//500~ LEVEL 5
		int level=1;
		if(ucredit<100)
			return level;
		if(ucredit>=100&&ucredit<200) 
			return 2;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
		if(ucredit>=200&&ucredit<300) 
			return 3;
		if(ucredit>=300&&ucredit<400) 
			return 4;
		if(ucredit>=500) 
			return 5;
		return 1;
	}
	public User findByUid(int uid) {
		// TODO Auto-generated method stub
		User user=new User();
		String sql="select * from user where user.uid='"+uid+"'";
		ResultSet rs=DatabaseHelper.executeQuery(sql);
		int ucredit=0;
		try {
			if(rs.next()){
				uid=rs.getInt("uid");
				String uphonenum=rs.getString("uphonenum");
				String upwd = rs.getString("upwd");
				String uprovince=rs.getString("uprovince");
				ucredit=rs.getInt("ucredit");//关键
				double umoney=rs.getDouble("umoney");
				String ucard=rs.getString("ucard");
				String uaddress=rs.getString("uaddress");
				
				
				
				user.setUid(uid);
				user.setUphonenum(uphonenum);
				user.setUpwd(upwd);
				user.setUprovince(uprovince);
				user.setUcredit(ucredit);
				user.setUmoney(umoney);
				user.setUcard(ucard);
				user.setUaddress(uaddress);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}


	
}
