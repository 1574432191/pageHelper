package com.lishan.gjq.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CartDao {
	void addCart(Cart cart);//添加到购物车
	void updateItemNum(Cart cart);//添加购物车时，相同商品合并
	List<CartInfo> findByPidAndUid(int uid);
	int findBynum(@Param("uid")int uid,@Param("gid")int gid);
	Cart findSame(@Param("uid")int uid,@Param("gid")int gid);//查看商品上是否存在该商品
	int findCount(int uid);
	List<CartInfo> findFY(@Param("uid")int uid,@Param("start")int start);
	void deleteAllCart(int uid);//清空购物车
	void deleteCart(@Param("uid")int uid,@Param("gid")int gid);
	List<Cart> cartToOrder(Cart cart);//从购物车中将商品显示到订单页面
	Integer deleteCartByCheck(Cart cart);//删除从购物车里选中的商品

}
