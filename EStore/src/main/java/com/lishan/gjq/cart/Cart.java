package com.lishan.gjq.cart;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.lishan.gjq.item.Item;

public class Cart {
	private Integer uid;
	private Integer gid;
	private Integer buynum;	
	private Item item;
	private List<Integer> ids;
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getBuynum() {
		return buynum;
	}
	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	
	
}
