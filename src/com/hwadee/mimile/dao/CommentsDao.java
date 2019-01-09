package com.hwadee.mimile.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;

import com.hwadee.mimile.pojo.Comments;
import com.hwadee.mimile.pojo.User;
import com.hwadee.mimile.util.DatabaseHelper;

public class CommentsDao {
	DatabaseHelper databaseHelper;
	Comments comments;
	public void println(String sql)
	{
		System.out.println("CommentsDao:"+sql);;
	}
	
	
	public List findAll(int gid) {
		// TODO Auto-generated method stub
		String sql = "select * from comments where comments.gid = '"+gid+"'";
		ResultSet rs = DatabaseHelper.executeQuery(sql);
		List<Comments> commentss = new ArrayList();
		try {
			while(rs.next()) {
				gid = rs.getInt("gid");
				int uid=rs.getInt("uid");
				String cwords = rs.getString("cwords");
				String ctime=rs.getDate("ctime").toString();
				int cid=rs.getInt("cid");
				
				
				Comments comments = new Comments();
				comments.setCid(cid);
				comments.setUid(uid);
				comments.setCwords(cwords);
				comments.setGid(gid);
				comments.setCtime(ctime);
				
				commentss.add(comments);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentss;
	}
	public User findUserByUid(int uid) {
		
		
		String sql = "select * from user where user.uid = '"+uid+"'";
		ResultSet rs = DatabaseHelper.executeQuery(sql);
		User user=new User();
		try {
			while(rs.next()) {
				
				uid = rs.getInt("uid");
				String uphonenum = rs.getString("uphonenum");
				
				user.setUid(uid);
				user.setUphonenum(uphonenum);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public String saveComments() throws SQLException{
		
		int uid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("uid").toString());
//		int uid = 1;
		
		int gid = Integer.parseInt(ServletActionContext.getRequest().getParameter("gid").toString());
		String sql = "insert into comments(uid,gid) values(" + uid + "," + gid + ") ;";
		
		databaseHelper.executeUpdate(sql);
		
		String sqlS = "select cid from comments where uid=" + uid + " and gid =" + gid + " order by cid desc;";
		
		ResultSet resultSet = databaseHelper.executeQuery(sqlS);
		
		resultSet.next();
		
		int cid = resultSet.getInt("cid");
		
		ServletActionContext.getRequest().getSession().setAttribute("cid", cid);
		
		return "T";
		
	}
	
	
	public String completeComments(){
		
		String comment = ServletActionContext.getRequest().getParameter("hw");
		
		
		int cid = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("cid").toString());
		
		String sql = "update comments set cwords='" + comment + "' where cid=" + cid + ";";
		
		System.out.println(sql);
		
		databaseHelper.executeUpdate(sql);
		
		return "T";
		
		
		
	}
	

}
