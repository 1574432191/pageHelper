package com.lishan.gjq.order;

import java.util.List;

public interface OrderService {
	Boolean addOrderAndOrderItems(List<OrderItems> orderItems,Order order);
	Integer insertOrderItems(List<OrderItems> orderItems);// 添加到订单列表
	Integer insertOrder(Order order);//添加到订单详情表
	List<OrderItems> makeSureOrder(String oid);
	List<Order> findAllOrder(int uid);//查看全部订单
	List<OrderItems> findOrderItemList(Order order);
	Order findOrderItemsById(String id);
	void deleteOrder(String id);
	public boolean updateOrder(Order order)throws Exception;
	List<Order> findAll();
}
