package com.lishan.gjq.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CartService {
	void addCart(int uid,int gid,int buynum);//添加到购物车
	void updateItemNum(int uid,int gid,int buynum);//添加购物车时，相同商品合并
	List<CartInfo> findByPidAndUid(int uid);
	int findBynum(int uid,int gid);
	Cart findSame(@Param("uid")int uid,@Param("gid")int gid);//查看商品上是否存在该商品
	int findCount(int uid);
	List<CartInfo> findFY(int uid,int start);
	void deleteAllCart(int uid);//清空购物车
	void deleteCart(int uid,int gid);
	List<Cart> cartToOrder(Cart cart);
	boolean deleteCartByCheck(Cart cart);
	
}
