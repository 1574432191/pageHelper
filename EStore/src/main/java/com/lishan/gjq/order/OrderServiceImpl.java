package com.lishan.gjq.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service("oService")
public class OrderServiceImpl implements OrderService{
		@Autowired
		private OrderDao orderDao;
	public Boolean addOrderAndOrderItems(List<OrderItems> orderItems, Order order) {
		System.out.println("++++++++++++++++"+orderItems.toString());
		//返回值为1时就说明数据插入成功
		Integer result1 = orderDao.insertOrderItems(orderItems);
		Integer result2 = orderDao.insertOrder(order);
		if (result1>0) {
			if (result2>0) {
				return true;
			}
		}
		
		return false;
	}
	public Integer insertOrderItems(List<OrderItems> orderItems) {
		orderDao.insertOrderItems(orderItems);
		return null;
	}
	public Integer insertOrder(Order order) {
		orderDao.insertOrder(order);
		return null;
	}
	public List<OrderItems> makeSureOrder(String oid) {
		// TODO Auto-generated method stub
		return orderDao.makeSureOrder(oid);
	}
	public List<Order> findAllOrder(int uid) {
		// TODO Auto-generated method stub
		return orderDao.findAllOrder(uid);
	}
	public List<OrderItems> findOrderItemList(Order order) {
		// TODO Auto-generated method stub
		return orderDao.findOrderItemList(order);
	}
	public Order findOrderItemsById(String id) {
		// TODO Auto-generated method stub
		return orderDao.findOrderItemsById(id);
	}
	public void deleteOrder(String id) {
		orderDao.deleteOrder(id);
		
	}
	public boolean updateOrder(Order order) throws Exception {
		Integer result = orderDao.updateOrder(order);
		if (result>0) {
			return true;
		}
		
		return false;
	}
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return orderDao.findAll();
	}

}
