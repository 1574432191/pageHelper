package com.lishan.gjq.order;

import java.util.Date;
import java.util.List;

public class Order {
	private String id;
	private Integer uid;
	private Double totalprice;
	private String address;
	private Integer status;
	private Date createtime;
	private String phone;
	private String receivename;
	private String trade_no;
	private List<OrderItems> orderItems;
	
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReceivename() {
		return receivename;
	}
	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}
	
	
	public List<OrderItems> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItems> orderItems) {
		this.orderItems = orderItems;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", uid=" + uid + ", totalprice=" + totalprice + ", address=" + address + ", status="
				+ status + ", createtime=" + createtime + ", phone=" + phone + ", receivename=" + receivename
				+ ", orderItems=" + orderItems + "]";
	}
	
}
