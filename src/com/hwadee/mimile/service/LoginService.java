package com.hwadee.mimile.service;

import com.hwadee.mimile.dao.LoginDao;
import com.hwadee.mimile.pojo.User;

//���ߣ������
public class LoginService {
	public LoginDao loginDao=new LoginDao();
	public boolean check(User user)
	{
		return loginDao.check(user);
	}
	public boolean register(User user) {
		// TODO Auto-generated method stub
		int phonumLength=user.getUphonenum().length();
		int upwdLength=user.getUpwd().length();
		
		if(phonumLength==11&&upwdLength>=6&&upwdLength<=16)
		{loginDao.register(user);
		
		return true;
		}
		else {
			System.out.println("LoginService:用户手机号长度有"+phonumLength+"位,密码长度有"+upwdLength+"位，请重新注册");
			return false;//否则不去dao里面注册
		}
	}
	public int getUserLevel(User user)
	{
		return loginDao.getUserLevel(user);
	}
	public int findById(){
		return 1;
	}
}
