package com.lishan.gjq.category;

import java.util.List;

import com.alibaba.fastjson.JSON;
/**
 * Category:种类，人或事务的集合
 * @author Administrator
 *
 */
public class Category {
	private Integer id;
	private String type;
	private int pid;
	//一对多的关联关系
	/**
	 * 在处理一对多的时候，首先要在实体类中创建一个关联关系，也就是多个组成一个的集合
	 * 然后再在mapper中使用collection标签来建立映射关系，property是所建的集合的属性
	 * ofType则是集合所要映射的实体类的全路径
	 */
	private List<Category> lists;
	
	
	public List<Category> getLists() {
		return lists;
	}
	public void setLists(List<Category> lists) {
		this.lists = lists;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
