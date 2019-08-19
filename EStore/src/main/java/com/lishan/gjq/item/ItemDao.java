package com.lishan.gjq.item;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lishan.gjq.user.User;

public interface ItemDao {
	public List<Item> findItemByNew();//查询最新的商品
	public List<Item> findItemByHot();//查询最热的商品
	List<Item> findItem();//查找所有的商品
	int findCount();//查询数据库中的总记录数
	List<Item> findByCount(@Param("start")int start);//根据页数来显示商品
	Item findItemById(int id);//根据id来查找商品
	List<Item> findCount5(@Param("start")int start);
	int findAllCount();
	void updateStatus(int id);
	List<Item> findItemByStstus(@Param("start")int start);//查看下架商品
	int findCountByStatus();
	void upItemSatus(int id);
	void insertItems(Item item);
	List<Item> findItemByCate(int category_id);
}
