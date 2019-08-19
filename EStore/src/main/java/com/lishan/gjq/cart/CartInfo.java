package com.lishan.gjq.cart;

import java.util.Date;

import com.alibaba.fastjson.JSON;

public class CartInfo {
	private Integer uid;
	private Integer gid;
	private Integer buynum;
	private Integer id;
	private String name;
	private Double marketprice;
	private Double estoreprice;
	private Integer category_id;
	private Integer num;
	private String titleimage;
	private String description;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getMarketprice() {
		return marketprice;
	}
	public void setMarketprice(Double marketprice) {
		this.marketprice = marketprice;
	}
	public Double getEstoreprice() {
		return estoreprice;
	}
	public void setEstoreprice(Double estoreprice) {
		this.estoreprice = estoreprice;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getTitleimage() {
		return titleimage;
	}
	public void setTitleimage(String titleimage) {
		this.titleimage = titleimage;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
