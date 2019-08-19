package com.lishan.gjq.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("iService")
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDao itemDao;
	public List<Item> findItemByNew() {
		
		return itemDao.findItemByNew();
	}

	public List<Item> findItemByHot() {
		// TODO Auto-generated method stub
		return itemDao.findItemByHot();
	}

	public List<Item> findItem() {
		// TODO Auto-generated method stub
		return itemDao.findItem();
	}

	public int findCount() {
		//返回的是总页数
		return itemDao.findCount()/8+1;
	}

	public List<Item> findByCount(int start) {
		// TODO Auto-generated method stub
		System.out.println(start);
		return itemDao.findByCount(start);
	}

	public Item findItemById(int id) {

		return itemDao.findItemById(id);
	}

	public List<Item> findCount5(int start) {
		// TODO Auto-generated method stub
		return itemDao.findCount5(start);
	}

	public void updateStatus(int id) {
		itemDao.updateStatus(id);
		
	}

	public List<Item> findItemByStstus(int start) {
		// TODO Auto-generated method stub
		return itemDao.findItemByStstus(start);
	}

	public int findCountByStatus() {
		// TODO Auto-generated method stub
		return itemDao.findCountByStatus()/5+1;
	}

	public int findAllCount() {
		// TODO Auto-generated method stub
		return itemDao.findAllCount()/5+1;
	}

	public void upItemSatus(int id) {
		// TODO Auto-generated method stub
		itemDao.upItemSatus(id);
	}

	public void insertItems(Item item) {
		// TODO Auto-generated method stub
		itemDao.insertItems(item);
	}

	public List<Item> findItemByCate(int category_id) {
		// TODO Auto-generated method stub
		return itemDao.findItemByCate(category_id);
	}

}
