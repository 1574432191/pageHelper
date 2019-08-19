package com.lishan.gjq.phone;

import java.util.Date;

import com.alibaba.fastjson.JSON;

public class phone {
	private int id;
	private String phoneNumber;
	private String phoneCode;
	private Date loginTime;
	public phone() {
		super();
	}
	public phone(int id, String phoneNumber, String phoneCode, Date loginTime) {
		super();
		this.id = id;
		this.phoneNumber = phoneNumber;
		this.phoneCode = phoneCode;
		this.loginTime = loginTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPhoneCode() {
		return phoneCode;
	}
	public void setPhoneCode(String phoneCode) {
		this.phoneCode = phoneCode;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	
	
	

}
