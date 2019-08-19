package com.lishan.gjq.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {
	@RequestMapping("/shoppingCard.html")
	public String toShoppingCart(int id,int num ,HttpServletRequest request,HttpServletResponse response){
		  request.setAttribute("id", id);  
          request.setAttribute("num", num);  
		  System.out.println("id="+id+"  "+" num="+num);
		return "shoppingCard";	
	}
	
	@RequestMapping("/shoppingCard1.html")
	public String toShoppingCart1(){        
		return "shoppingCard1";
	}
}
