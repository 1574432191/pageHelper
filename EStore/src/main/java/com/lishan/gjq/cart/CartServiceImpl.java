package com.lishan.gjq.cart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service(value="caService")
public class CartServiceImpl implements CartService{
   @Resource
   private CartDao cartDao;

public void addCart(int uid,int gid,int buynum) {
	Cart cart = new Cart();
	cart.setUid(uid);
	cart.setGid(gid);
	cart.setBuynum(buynum);
	cartDao.addCart(cart);
}

public void updateItemNum(int uid,int gid,int buynum) {
	Cart cart = new Cart();
	cart.setUid(uid);
	cart.setGid(gid);
	cart.setBuynum(buynum);
	cartDao.updateItemNum(cart);
	
}



public int findBynum(int uid,int gid) {
	
	return cartDao.findBynum(uid, gid);
}

public List<CartInfo> findByPidAndUid(int uid) {
	
	return cartDao.findByPidAndUid(uid);
}

public Cart findSame(int uid, int gid) {
	
	return cartDao.findSame(uid, gid);
}

public int findCount(int uid) {
	// TODO Auto-generated method stub
	return cartDao.findCount(uid)/6+1;
}

public List<CartInfo> findFY(int uid, int start) {
	
	return cartDao.findFY(uid, start);
}

public void deleteAllCart(int uid) {
	cartDao.deleteAllCart(uid);
	
}

public void deleteCart(int uid, int gid) {
	cartDao.deleteCart(uid, gid);
	
}

public List<Cart> cartToOrder(Cart cart) {
	// TODO Auto-generated method stub
	return cartDao.cartToOrder(cart);
}

public boolean deleteCartByCheck(Cart cart) {
	Integer result = cartDao.deleteCartByCheck(cart);
	if (result>1) {
		return true;
	}
	return false;
}
	
}
