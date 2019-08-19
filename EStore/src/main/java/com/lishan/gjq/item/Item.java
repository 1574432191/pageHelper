package com.lishan.gjq.item;

import java.util.Date;

import com.alibaba.fastjson.JSON;

public class Item {
	private Integer id;
	private String name;
	private Double marketprice;
	private Double estoreprice;
	private Integer category_id;
	private Integer num;
	private String titleimage;
	private String description;
	private Date production_date;//生产日期
	private Date expiry_date;//保质期
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Date getProduction_date() {
		return production_date;
	}
	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}
	public Date getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
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
