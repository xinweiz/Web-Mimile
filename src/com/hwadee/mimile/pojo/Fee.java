package com.hwadee.mimile.pojo;

public class Fee {
	
    /*����ʡ��*/
    private String from_addr;
    /*�ջ�ʡ��*/
    private String to_addr;
    /*�ʼĹ�˾*/
    private String express;
    /*�ʼķ���*/
    private double cost;
    /*�շѺ�*/
    private int fee_id;
    
    
    
    
	public String getFrom_addr() {
		return from_addr;
	}
	public void setFrom_addr(String fromAddr) {
		from_addr = fromAddr;
	}
	public String getTo_addr() {
		return to_addr;
	}
	public void setTo_addr(String toAddr) {
		to_addr = toAddr;
	}
	public String getExpress() {
		return express;
	}
	public void setExpress(String express) {
		this.express = express;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public int getFee_id() {
		return fee_id;
	}
	public void setFee_id(int feeId) {
		fee_id = feeId;
	}
    
    
    
}
