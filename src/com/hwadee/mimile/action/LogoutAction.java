package com.hwadee.mimile.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


public class LogoutAction {

	
	
	public String logout(){
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		
		return "logout";
	
		
	}
	
	
}
