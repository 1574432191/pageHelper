package com.lishan.gjq.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/order",produces="text/html;charset=utf-8")
public class OrderController {
	@RequestMapping(value="/orderInfo.html/{ids}",produces="text/html;charset=utf-8")
	public String toOrder(@PathVariable("ids") List<Integer> ids){
		System.out.println("订单进来了");
		System.out.println("hhhhhhhhhhhhh"+ids);
		return "orderInfo";		
	}
	@RequestMapping(value="/myorder.html/{uid}",produces="text/html;charset=utf-8")
	public String myOrder(@PathVariable("uid") Integer uid){
		System.out.println("订单进来了");
		System.out.println("hhhhhhhhhhhhh"+uid);
		return "myOrder";		
	}
	@RequestMapping(value="/findOrderInfo.html/{uid}/{oid}",produces="text/html;charset=utf-8")
	public String orderInfos(@PathVariable("uid") Integer uid
			,@PathVariable("oid")String oid){
		System.out.println("订单进来了");
		System.out.println("hhhhhhhhhhhhh"+uid+"  "+oid);
		return "orderInfos";		
	}
	@RequestMapping(value="/test.html",produces="text/html;charset=utf-8")
	public String test(){
	
		return "test";		
	}
	
}
