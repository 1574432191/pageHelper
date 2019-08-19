package com.lishan.gjq.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.cart.Cart;
import com.lishan.gjq.cart.CartInfo;
import com.lishan.gjq.cart.CartService;
import com.lishan.gjq.item.Item;
import com.lishan.gjq.item.ItemService;

@Controller
@RequestMapping(value="/cart/data",produces="text/html;charset=utf-8")
public class CartDataController {
	    @Autowired
		@Qualifier(value="caService")
		private CartService cartService;
	    @Autowired
		@Qualifier(value="iService")
	    private ItemService itemService;
		
	    @ResponseBody
		@RequestMapping(value="/addCart.do",produces="text/html;charset=utf-8")
		public String addCart(int uid,int gid,int buynum){
			System.out.println("购物车"+uid+"="+gid+"="+buynum);
			JSONObject json = new JSONObject();
//			cartService.addCart(uid, gid, buynum);
			List<CartInfo> cartInfo = cartService.findByPidAndUid(uid);
			Cart cart = cartService.findSame(uid, gid);
			System.out.println("购物车="+cartInfo);
			System.out.println("gouwuche="+cart);
			if (cart==null) {
				//购物车里不存在就添加
				cartService.addCart(uid, gid, buynum);
				int num = cartService.findBynum(uid, gid);
				System.out.println("商品不存在="+num);
				List<CartInfo> cartInfo1 = cartService.findByPidAndUid(uid);
				System.out.println("添加后的购物车"+cartInfo1);
				json.put("error_code", 0);
				json.put("error_msg",cartInfo1);
				json.put("error_num",num);
			}else {
				// 购物车里存在就修改商品数量
				int num = cartService.findBynum(uid, gid);
				System.out.println("商品存在="+num);
				int newNum = buynum+num;
				cartService.updateItemNum(uid, gid, newNum);
				int num1 = cartService.findBynum(uid, gid);
				System.out.println(cartInfo);
				System.out.println("商品存在="+newNum);
				List<CartInfo> cartInfo1 = cartService.findByPidAndUid(uid);
				System.out.println("carinfo1"+cartInfo1);
				System.out.println(cartInfo1.equals(cartInfo));
				json.put("error_code", 1);
				json.put("error_msg",cartInfo1);
				json.put("newNum", newNum);
			}
			return json.toJSONString();			
		}
	    @ResponseBody
		@RequestMapping(value="/findCount.do",produces="text/html;charset=utf-8")
		public String fengYe(int uid){
	    	int count = cartService.findCount(uid);
			JSONObject json = new JSONObject();
			if (count>0) {
				json.put("error_code", 0);
				json.put("error_msg", count);
			}else {
				json.put("error_code", 1);
				json.put("error_msg", "页数查询失败");
			}
			return json.toJSONString();			
		}
	    
	    @ResponseBody
		@RequestMapping(value="/findFY.do",produces="text/html;charset=utf-8")
		public String findFY(int uid,int pageIndex){
	    	int pageIndex1 = pageIndex-1; 
			JSONObject json = new JSONObject();
			if (pageIndex1<0) {
				List<CartInfo> cartInfo=cartService.findFY(uid, 1);
				json.put("error_code", 0);		
				json.put("error_msg",cartInfo);	
				json.put("error_page", pageIndex);
			}else {
				int start = pageIndex1*6;
				List<CartInfo> cartInfo=cartService.findFY(uid, start);
				System.out.println("跳转+"+cartInfo);
				if (cartInfo!=null) {
					json.put("error_code", 1);
					json.put("error_msg",cartInfo);	
					json.put("error_page", pageIndex);
				}else {
					json.put("error_code", 2);
					json.put("error_msg", "数据查询失败");
					json.put("error_page", pageIndex);
				}
			}
			return json.toJSONString();			
		}
	   
	    
	    @ResponseBody
	 		@RequestMapping(value="/findByCount.do",produces="text/html;charset=utf-8")
	 		public String findByCount(int uid,int gid,int buynum){
	 			System.out.println("购物车"+uid+"="+uid);
	 			JSONObject json = new JSONObject();
//	 			cartService.addCart(uid, gid, buynum);
	 			List<CartInfo> cartInfo = cartService.findByPidAndUid(uid);
	 			Cart cart = cartService.findSame(uid, gid);
	 			int start = 0;
	 			System.out.println("购物车="+cartInfo);
	 			System.out.println("gouwuche="+cart);
	 			if (cart==null) {
	 				//购物车里不存在就添加
	 				cartService.addCart(uid, gid, buynum);
	 				int num = cartService.findBynum(uid, gid);
	 				System.out.println("商品不存在="+num);
	 				List<CartInfo> cartInfo1 = cartService.findFY(uid, start);
	 				System.out.println("添加后的购物车"+cartInfo1);
	 				json.put("error_code", 0);
	 				json.put("error_msg",cartInfo1);
	 				json.put("error_num",num);
	 			}else {
	 				// 购物车里存在就修改商品数量
	 				int num = cartService.findBynum(uid, gid);
	 				System.out.println("商品存在="+num);
	 				int newNum = buynum+num;
	 				cartService.updateItemNum(uid, gid, newNum);
	 				int num1 = cartService.findBynum(uid, gid);
	 				System.out.println(cartInfo);
	 				System.out.println("商品存在="+newNum);
	 				List<CartInfo> cartInfo1 = cartService.findFY(uid, start);
	 				System.out.println("carinfo1"+cartInfo1);
	 				System.out.println(cartInfo1.equals(cartInfo));
	 				json.put("error_code", 1);
	 				json.put("error_msg",cartInfo1);
	 				json.put("newNum", newNum);
	 			}
	 			return json.toJSONString();			
	 		}
	    
	    @ResponseBody
 		@RequestMapping(value="/upPage.do",produces="text/html;charset=utf-8")
 		public String upPage(int uid,int pageIndex){
 			
	    	int pageIndex1 = pageIndex-1; 
			JSONObject json = new JSONObject();
			if (pageIndex1<0) {
				List<CartInfo> cartInfo=cartService.findFY(uid, 0);
				json.put("error_code", 0);		
				json.put("error_msg",cartInfo);	
				json.put("error_page", 1);
			}else {
				int start = (pageIndex1-1)*6;
				List<CartInfo> cartInfo=cartService.findFY(uid, start);
				System.out.println("跳转+"+cartInfo);
				if (cartInfo!=null) {
					json.put("error_code", 1);
					json.put("error_msg",cartInfo);	
					json.put("error_page", pageIndex-1);
				}else {
					json.put("error_code", 2);
					json.put("error_msg", "数据查询失败");
					json.put("error_page", pageIndex-1);
				}
			}
// 			
 			return json.toJSONString();			
 		}
	    
	    @ResponseBody
 		@RequestMapping(value="/downPage.do",produces="text/html;charset=utf-8")
 		public String downPage(int uid,int pageIndex){
 			
	    	int pageIndex1 = pageIndex-1; 
			JSONObject json = new JSONObject();
			int count = cartService.findCount(uid);
			int start = pageIndex*6;
			if (pageIndex>=count) {
				
				List<CartInfo> cartInfo = cartService.findFY(uid, count-1);
				json.put("error_code", 0);
				json.put("error_msg", cartInfo);
				json.put("page", count);
			}else {
				List<CartInfo> cartInfo = cartService.findFY(uid, start);
				json.put("error_code", 1);
				json.put("error_msg", cartInfo);
				json.put("error_page", pageIndex+1);
			}
// 			
 			return json.toJSONString();			
 		}
	    
	    // 清空购物车
	    @RequestMapping("/deleteAllCart.do") 
	    @ResponseBody
	    public void deleteAllCart(int uid){
	    	JSONObject json = new JSONObject();
	    	   cartService.deleteAllCart(uid);	
	    }
	
	    
   @RequestMapping("/deleteCart.do")  
   @ResponseBody
	    public String deleteCart(int uid,int gid){
	    	   cartService.deleteCart(uid, gid);
			return null;
 	
	    }
   
   // 直接进入购物车时
   @ResponseBody
	@RequestMapping(value="/findByCount1.do",produces="text/html;charset=utf-8")
	public String findByCount1(int uid){
		JSONObject json = new JSONObject();
//		cartService.addCart(uid, gid, buynum);
		int start = 0;
			List<CartInfo> cartInfo1 = cartService.findFY(uid, start);
			System.out.println("添加后的购物车"+cartInfo1);
			json.put("error_code", 0);
			json.put("error_msg",cartInfo1);
			json.put("error_num",1);
		return json.toJSONString();			
	}
 // 从购物车添加商品到订单界面
   @RequestMapping(value="/cartToOrder.do/{ids}/{uid}",produces="text/html;charset=utf-8")
   @ResponseBody
   public String cartToOrder(@PathVariable("ids")List<Integer>ids
		      ,@PathVariable("uid")int uid){
	   System.out.println(ids+"   ="+uid);
	   Cart cart = new Cart();
	   cart.setIds(ids);
	   cart.setUid(uid);
	   System.out.println(cart);
	   List<Cart> list = cartService.cartToOrder(cart);
	   System.out.println(list);	   
	   JSONObject json = new JSONObject();
	   json.put("error_msg", list);
	return json.toJSONString();
	   
	   
   }
}
