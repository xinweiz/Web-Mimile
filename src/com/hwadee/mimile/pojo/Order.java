package com.hwadee.mimile.pojo;


public class Order {
	
	/*��ݿ������  ������*/
    private int oid;
	/*����״̬*/
    private String ostatus;
	/*����ʱ��*/
    private String otime;
	/*�ܽ��*/
    private float ammount;
	/*�û���*/
    private int uid;
    
    
    
    
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public float getAmmount() {
		return ammount;
	}
	public void setAmmount(float ammount) {
		this.ammount = ammount;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
    
    
}
