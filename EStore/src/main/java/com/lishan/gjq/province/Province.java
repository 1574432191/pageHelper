package com.lishan.gjq.province;

import java.io.Serializable;

import com.alibaba.fastjson.JSON;

public class Province implements Serializable{
   
	private int codeid;
	private int parentid;
	private String cityname;
	public int getCodeid() {
		return codeid;
	}
	public void setCodeid(int codeid) {
		this.codeid = codeid;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	
	
}
