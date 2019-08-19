package com.lishan.gjq.user;

import java.util.Date;

import com.alibaba.fastjson.JSON;

public class Addres {
	private int id;
	private int uid;
	private String address;
	private Date createTime;
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Addres() {
		super();
	}
	public Addres(int id, int uid, String address) {
		super();
		this.id = id;
		this.uid = uid;
		this.address = address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
