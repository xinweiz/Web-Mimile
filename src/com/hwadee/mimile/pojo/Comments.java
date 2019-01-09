package com.hwadee.mimile.pojo;

import java.util.Date;

public class Comments {
	
	/*���۱��*/
    private int cid;
	/*�û���*/
    private int uid;
	/*��������*/
    private String cwords;
	/*����ʱ��*/
    private String ctime;
	/*��Ʒ��*/
    private int gid;
    
    
    
    
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCwords() {
		return cwords;
	}
	public void setCwords(String cwords) {
		this.cwords = cwords;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
    
    
    
    
    
}
