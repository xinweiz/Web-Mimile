package com.hwadee.mimile.action;

import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.Manager;
import com.hwadee.mimile.pojo.User;
import com.hwadee.mimile.service.ManagerService;

//���ڿ��ƹ���Ա��½�Ƿ�ɹ�
public class ManagerAction 
{
	public Manager manager=new Manager();
	
	private ManagerService managerService= new ManagerService();
	public String execute()
	{
		ServletActionContext.getRequest().getSession().setAttribute("mid", manager.getMid());
		if(managerService.check(manager))
		return "T";
		else return "F";
	}
}
