package com.lishan.gjq.admin;

import com.alibaba.fastjson.JSON;

public class Role {
	private int id;
	private String roles;
	public Role() {
		super();
	}
	public Role(int id, String roles) {
		super();
		this.id = id;
		this.roles = roles;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRole() {
		return roles;
	}
	public void setRole(String role) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
