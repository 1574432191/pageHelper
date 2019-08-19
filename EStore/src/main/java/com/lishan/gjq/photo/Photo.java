package com.lishan.gjq.photo;

import java.util.Date;

import com.alibaba.fastjson.JSON;

public class Photo {
	private int id;
	private int uid;
	private String photo;
	private Date time;
	public Photo() {
		super();
	}
	public Photo(int id, int uid, String photo, Date time) {
		super();
		this.id = id;
		this.uid = uid;
		this.photo = photo;
		this.time = time;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return  JSON.toJSONString(this);
	}
	

}
