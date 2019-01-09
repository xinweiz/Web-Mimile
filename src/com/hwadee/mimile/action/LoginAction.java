package com.hwadee.mimile.action;
//���ߣ������

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;





import com.hwadee.mimile.pojo.User;
import com.hwadee.mimile.service.LoginService;
import com.hwadee.mimile.util.DatabaseHelper;

public class LoginAction { 
	public DatabaseHelper databaseHelper;
	public User user=new User();
	private LoginService loginService= new LoginService();
	public String execute()
	{
		boolean result=loginService.check(user);
		if(result){
		System.out.println("用户等级："+
				loginService.getUserLevel(user));
		Map <Integer,Integer> map=new HashMap<Integer,Integer>();
		
		ServletActionContext.getRequest().getSession().setAttribute("mapCart", map);
		ServletActionContext.getRequest().getSession().setAttribute("uid", user.getUid());
		
		ServletActionContext.getRequest().getSession().setAttribute("user.uphonenum", user.getUphonenum());
		
		
		ServletActionContext.getRequest().getSession().setAttribute("user", user);
		
		
		
		
		String sql = "insert into orders(uid) values(" + user.getUid() + ");";
		/*将新插入的元组的状态属性欧status设置为F*/
		/*查询出新插入的元组的oid*/
		String sqlSr = "select * from orders where ostatus='F' and uid=" + user.getUid() + ";";
		
		databaseHelper.executeUpdate(sql);
		
		ResultSet resultSet = databaseHelper.executeQuery(sqlSr);
		try {
			resultSet.next();
			int oid = resultSet.getInt("oid");
			ServletActionContext.getRequest().getSession().setAttribute("oid", oid+1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return "T";
		}
		else return "F";
		
	}
	public String register()
	{
		boolean result=loginService.register(user);
		if(result)
		return "mainPage";
		else return"fail";
		
	}

	


}
