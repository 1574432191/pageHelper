package com.lishan.gjq.item;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lishan.gjq.util.PageUtil;

public interface ItemService {
	List<Item> findItemByNew();//查询最新的商品,根据生产日期
	List<Item> findItemByHot();//查询最热的商品
	List<Item> findItem();
	int findCount();//查询总记录数
	List<Item> findByCount(int start);//根据页数来显示商品
	Item findItemById(int id);//根据id来查找商品
	List<Item> findCount5(int start);
	void updateStatus(int id);
	List<Item> findItemByStstus(int start);//查看下架商品
	int findCountByStatus();
	int findAllCount();
	void upItemSatus(int id);
	void insertItems(Item item);
	List<Item> findItemByCate(int category_id);
}
