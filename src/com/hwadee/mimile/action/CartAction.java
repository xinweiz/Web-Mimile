package com.hwadee.mimile.action;

import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPOutputStream;

import org.apache.struts2.ServletActionContext;


public class CartAction{
	
	Map<Integer, Integer> map = (Map<Integer, Integer>) ServletActionContext.getRequest().getSession().getAttribute("mapCart");
	public String addCart(){
		
		int gid = Integer.parseInt(ServletActionContext.getRequest().getParameter("gid").toString());
		int gnum = Integer.parseInt(ServletActionContext.getRequest().getParameter("gnum").toString());
		
		map.put(gid, gnum);
		System.out.println(map.get(gid).toString());
		
		ServletActionContext.getRequest().getSession().setAttribute("mapCart",map);
		
//		return map;
		return "T";
		
	}
	
	
	public String delCart(){
		
		Map<Integer,Integer> map = (Map<Integer,Integer>)ServletActionContext.getRequest().getSession().getAttribute("mapCart");
		
		int gid = Integer.parseInt(ServletActionContext.getRequest().getParameter("gid").toString()); 
		
		map.remove(gid);
		
		return "T";
		
	}
	
	
	
}