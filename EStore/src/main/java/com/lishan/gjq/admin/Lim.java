package com.lishan.gjq.admin;

import com.alibaba.fastjson.JSON;

public class Lim {
	private int id;
	private int oid;
	private String info;
	private String url;
	public Lim() {
		super();
	}
	public Lim(int id, int oid, String info, String url) {
		super();
		this.id = id;
		this.oid = oid;
		this.info = info;
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
