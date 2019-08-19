package com.lishan.gjq.order.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.cart.Cart;
import com.lishan.gjq.cart.CartService;
import com.lishan.gjq.item.ItemService;
import com.lishan.gjq.order.Order;
import com.lishan.gjq.order.OrderItems;
import com.lishan.gjq.order.OrderService;
import com.lishan.gjq.user.User;
import com.lishan.gjq.util.AlipayUtil;
import com.lishan.gjq.util.DateUtil;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
@RequestMapping(value="/order/data")
public class OrderDataController {
	
	  @Autowired
	  @Qualifier(value="caService")
	  private CartService cartService;	
	  @Autowired
	  @Qualifier(value="oService")
	  private OrderService orderService;
	  
	  
	  @RequestMapping(value="/addOrder.do/{ids}")
	  @ResponseBody
	  public String goOrder(@PathVariable("ids")List<Integer>ids,
			 String address,String receivename,String phone,Integer uid,HttpSession session){
		  System.out.println("添加到订单");
		  System.out.println("添加订单"+ids+address+receivename+" "+phone+" "+uid);
		  // 创建订单编号，订单编号是用户id+时间戳
		  DateUtil dateUtil = new DateUtil();
		  String oid = uid+dateUtil.getTimeStamp();
		  List<OrderItems> orderItems = new ArrayList<OrderItems>();
		  /**
		   * 根据传过来的ids来从购物车(cart表)里查找商品的id以及商品的购买数量
		   * 这里ids为一个集合，调用cartToOrder方法得到的也是一个集合，因此需要遍历
		   */
		  Cart cart = new Cart();
		  cart.setUid(uid);
		  cart.setIds(ids);
		  List<Cart> carts = cartService.cartToOrder(cart);
		  System.out.println("kkk="+carts);
		  double totalprice=0.0;
		  for(Cart c:carts){
			  totalprice +=c.getBuynum()*c.getItem().getEstoreprice();
			  OrderItems orderItem= new OrderItems();
			  orderItem.setOid(oid);
			  orderItem.setGid(c.getGid());
			  orderItem.setBuynum(c.getBuynum());
			  //将值放到集合中
			  orderItems .add(orderItem);	  
		  }
		  //下面开始保存订单信息，就是将信息保存到orders表中
		  Order order =new Order();
		  order.setId(oid);
		  order.setUid(uid);
		  order.setAddress(address);
		  order.setPhone(phone);
		  order.setReceivename(receivename);
		  order.setTotalprice(totalprice);
		  order.setCreatetime(new Date());
		  order.setStatus(0);
		  System.out.println(order);
		  JSONObject json = new JSONObject();
		 Integer result =  orderService.insertOrder(order);
		 Integer re = orderService.insertOrderItems(orderItems);
		  List<OrderItems> orderItems2 = orderService.makeSureOrder(oid);
		System.out.println("================="+orderItems2);
		if(orderItems2!=null){
			json.put("error_code", 0);
			json.put("error_msg", "订单添加成功");
			json.put("oid", oid);
			session.setAttribute("oid", oid);
		}else{
			json.put("error_code", 1);
			json.put("error_msg", "订单添加失败");
		}
		return json.toJSONString();
	  }
      
	  @RequestMapping("/findAllOrder.do")
	  @ResponseBody
	  public String findAllOrder(int uid){
		  JSONObject json = new JSONObject();
		  List<Order> orders = orderService.findAllOrder(uid);
		  System.out.println(orders);
		  json.put("error_msg", orders);
		return json.toJSONString();
		  
	  }
	  
	  @RequestMapping("/getOrderInfos.do")
	  @ResponseBody
	  public String getOrderInfos(int uid,String id){
		  JSONObject json = new JSONObject();
		  Order order = new Order();
		  order.setId(id);
		  order.setUid(uid);
		  List<OrderItems> list = orderService.findOrderItemList(order);
		  Order order2= orderService.findOrderItemsById(id);
		  System.out.println("订单详情="+list);
		  if (list.size()>0) {
			json.put("error_code", 0);
			json.put("error_msg", list);
			json.put("error_msg1", order2);
			
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "订单查询失败");
		}
		  
		return json.toJSONString();
		  
	  }
	  
	  
	  @RequestMapping("/deleteOrder.do")
	  @ResponseBody
	  public String deleteOrder(String id){
		  JSONObject json = new JSONObject();
		  System.out.println("删除订单="+id);
	      orderService.deleteOrder(id);
		return json.toJSONString();
		  
	  }
	  //支付
		@RequestMapping(value="/alipay.do",produces="text/html;charset=utf-8")
		@ResponseBody
		public String alipay(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="money",required=true)String money,
				@RequestParam(value="orderId",required=true)String orderId,@RequestParam(value="id",required=true)int id
				)throws Exception{
			System.out.println("支付"+money+"  "+orderId);
			
			JSONObject json = new JSONObject();
			String info="商品描述";
			
				String result = AlipayUtil.pay(response, money, info, id, orderId);
				request.getSession().setAttribute("result",result );
				System.out.println(result);
				json.put("error_code", 1);
				json.put("error_msg", result);
			
			return json.toJSONString();
		}
		//支付成功后修改订单信息
				@RequestMapping(value="/update.do",produces="text/html;charset=utf-8")
				public String updateOrder(HttpServletRequest request,HttpSession session)throws Exception{
					//如果得到支付宝编号不为空的话，就更新数据，进入if更新当前订单状态为1即已支付
					System.out.println("jjjjjjjjjjjjjjjjjjjj");
					String trade_no=request.getParameter("trade_no");
					if(trade_no!=null ||trade_no!=""){
						//获取支付宝交易号
						trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
						//获取订单编号
						String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
					   //封装到订单对象
						Order order = new Order();
						order.setStatus(1);
						order.setId(out_trade_no);
						order.setTrade_no(trade_no);
						System.out.println("dingdan+"+trade_no+order);
						orderService.updateOrder(order);
					}
					return "myOrder";
				}
	  
				 @RequestMapping("/findAll.do")
				  @ResponseBody
				  public String findAll(){
					  JSONObject json = new JSONObject();
					 List<Order> list = orderService.findAll();
					return json.toJSONString();
					  
				  }
}
