package com.lishan.gjq.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/item",produces="text/html;charset=utf-8")
public class ItemController {
	@RequestMapping(value="/index.html",produces="text/html;charset=utf-8")
	public String toIndex(){
		return "index";
	}
	@RequestMapping(value="/sort.html" ,produces="text/html;charset=utf-8")
	public String sort(){
		return "sort";
	}
	/*@PathVariable 可以将URL中占位符参数绑定到控制器处理方法的参数中
	 * URL中的{XXX}占位符可以通过@PathVariable("XXX")绑定到操作方法的参数中
	 * 
	 */
	@RequestMapping(value="/itemInfo.html/{id}" ,produces="text/html;charset=utf-8")
	public String itemInfo(@PathVariable("id")int id){
		System.out.println(id);
		return "itemInfo";
	}
	
	@RequestMapping(value="/ItemStatus.html" ,produces="text/html;charset=utf-8")
	public String deleteItem(){
		System.out.println();
		return "admin/downgood";
	}
	@RequestMapping(value="/order.do" ,produces="text/html;charset=utf-8")
	public String order(){
		System.out.println();
		return "admin/order";
	}
	@RequestMapping(value="/orderInfo.do" ,produces="text/html;charset=utf-8")
	public String orderInfo(){
		System.out.println();
		return "admin/orderInfo";
	}
	 @RequestMapping(value="/emp.do",produces="text/html;charset=utf-8")
	  public String empManage(){	
		return "admin/empmanage";
		  
	  }
	 @RequestMapping(value="/limit.do",produces="text/html;charset=utf-8")
	  public String limit(){	
		return "admin/limit";
		  
	  }
	@RequestMapping(value="/good.do" ,produces="text/html;charset=utf-8")
	public String good(){
		System.out.println();
		return "admin/good";
	}
	@RequestMapping(value="/goodInfo.do" ,produces="text/html;charset=utf-8")
	public String goodInfo(){
		System.out.println();
		return "admin/goodInfo";
	}
	@RequestMapping(value="/empInfo.do" ,produces="text/html;charset=utf-8")
	public String empInfo(){
		System.out.println();
		return "admin/empInfo";
	}
	@RequestMapping(value="/downgood.do" ,produces="text/html;charset=utf-8")
	public String downgood(){
		System.out.println();
		return "admin/downgood";
	}
	@RequestMapping(value="/addItems.do" ,produces="text/html;charset=utf-8")
	public String addItems(){
		System.out.println();
		return "admin/addItems";
	}

}
