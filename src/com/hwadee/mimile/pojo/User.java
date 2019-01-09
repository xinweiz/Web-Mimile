package com.hwadee.mimile.pojo;
//用户
public class User {
	/*数据库的主键  用户号*/
    private int uid;
    /*用户积分*/
    private int ucredit;
    /*用户信用卡号*/
    private String ucard;
	/*用户手机号，长度11位的手机号，用来登陆*/
    private String uphonenum;
    /*用户密码*/
    private String upwd;
    /*用户省份*/
    private String uprovince;
    /*用户收货地址*/
    private String uaddress;
    /*用户账户余额*/
    private double umoney;
    public double getUmoney() {
		return umoney;
	}
	public void setUmoney(double umoney) {
		this.umoney = umoney;
	}
	/*用户性别*/
    private String usex;
    /*用户出生年月*/
    private String ubirth;
    
    /*用户出生月*/
    private String umonth;
    /*用户出生日*/
    private String uday;
    
	public String getUmonth() {
		return umonth;
	}
	public void setUmonth(String umonth) {
		this.umonth = umonth;
	}
	public String getUday() {
		return uday;
	}
	public void setUday(String uday) {
		this.uday = uday;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getUcredit() {
		return ucredit;
	}
	public void setUcredit(int ucredit) {
		this.ucredit = ucredit;
	}
	public String getUcard() {
		return ucard;
	}
	public void setUcard(String ucard) {
		this.ucard = ucard;
	}
	
	public String getUphonenum() {
		return uphonenum;
	}
	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUprovince() {
		return uprovince;
	}
	public void setUprovince(String uprovince) {
		this.uprovince = uprovince;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUbirth() {
		return ubirth;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
    
    
	
    
    
	
    
}
