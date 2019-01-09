package com.hwadee.mimile.pojo;
//��Ʒ��
public class Goods {
	
	/*��ݿ������  ��Ʒ��*/
    private int gid;
    /*��ݿ������  ��Ʒ���ͺ�*/
    private int tid;
    /*��Ʒ�������*/
	private int gnum;
    /*��Ʒ���*/
    private String gname;
    /*��ص�ַ*/
    private String gaddress;
    /*��Ʒ״̬*/
    private String gstatus;
    /*��Ʒ����*/
    private double gprice;
    
    private String gimageurl;
    
    public double getGprice() {
		return gprice;
	}
	public void setGprice(double gprice) {
		this.gprice = gprice;
	}
	/*ͼƬ����*/
    
    
    
    
	public String getGimageurl() {
		return gimageurl;
	}
	public void setGimageurl(String gimageurl) {
		this.gimageurl = gimageurl;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGaddress() {
		return gaddress;
	}
	public void setGaddress(String gaddress) {
		this.gaddress = gaddress;
	}
	public String getGstatus() {
		return gstatus;
	}
	public void setGstatus(String gstatus) {
		this.gstatus = gstatus;
	}
	
    
}
