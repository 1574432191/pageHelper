package com.lishan.gjq.order;

import java.util.List;

public interface OrderDao {
	Integer insertOrderItems(List<OrderItems> orderItems);// 添加到订单列表
	Integer insertOrder(Order order);//添加到订单详情表
	List<OrderItems> makeSureOrder(String oid);
	List<Order> findAllOrder(int uid);//查看全部订单
	List<OrderItems> findOrderItemList(Order order);//查看订单的详情
	Order findOrderItemsById(String id);
	void deleteOrder(String id);
	/**
	 * 支付成功之后修改订单的相关信息
	 * @param order
	 * @throws Exception
	 */
	public Integer updateOrder(Order order)throws Exception;
	List<Order> findAll();
	

}
