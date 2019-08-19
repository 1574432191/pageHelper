package com.lishan.gjq.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.admin.Admin;
import com.lishan.gjq.admin.AdminService;
import com.lishan.gjq.admin.Lim;
import com.lishan.gjq.order.Order;
import com.lishan.gjq.order.OrderService;
import com.lishan.gjq.util.Result;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	@Qualifier("aService")
	private AdminService adminservice;
	@Autowired
	@Qualifier("oService")
	private OrderService orderService;
	@RequestMapping("/login.do")
	public  String adminLogin(){
		return "admin/adminlogin";	
	}
	@RequestMapping("/index.do")
	public  String toIndex(){
		return "admin/index";	
	}
	@RequestMapping("/toLogin.do")
	@ResponseBody
	public Result login(String username,String password,HttpSession session){
	//	System.out.println(username+" "+password);
		session.setAttribute("username", username);
		return adminservice.findByUsername(username, password);
		
	}
	
	@RequestMapping("/toIndex.do")
	@ResponseBody
	public String toIndex(HttpServletRequest request){
		String username = (String) request.getSession().getAttribute("username");
		Admin admin = adminservice.findAdmin(username);
		JSONObject json = new JSONObject();
		if (admin==null) {
			json.put("error_code", 0);
			json.put("error_msg", "用户异常");
		}else {
			int id =admin.getId();
			System.out.println("后台页面展示="+id);
			List<Lim> list =  adminservice.findIndexByid(id);
			System.out.println(list+"    =====");
			json.put("error_code", 1);
			json.put("error_msg", list);
		}
		
		return json.toJSONString();
		
	}
	
	@RequestMapping(value="/empInfo1.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String empInfo(){
		JSONObject json = new JSONObject();
		List<Admin> list = adminservice.findEmp();
		System.out.println("员工详情"+list);
		json.put("error_msg", list);
		return json.toJSONString();
	
		
	}
	@RequestMapping(value="/empInfo.do",produces="text/html;charset=utf-8")
	public String empInfo1(){		
		return "admin/empInfo";	
	}
	
	 @RequestMapping(value="/orderInfo.do",produces="text/html;charset=utf-8")
	  public String findAll(){	
		return "admin/orderInfo";
		  
	  }
	 @RequestMapping(value="/orderInfo1.do",produces="text/html;charset=utf-8")
	  @ResponseBody
	  public String findAll1(){
		  JSONObject json = new JSONObject();
		 List<Order> list = orderService.findAll();
		 System.out.println("==============="+list);
		 json.put("error_msg", list);
		return json.toJSONString();
		  
	  }
	 
	 @RequestMapping(value="/order.do",produces="text/html;charset=utf-8")
	  public String order(){	
		return "admin/order";	  
	  }
	 @RequestMapping(value="/goodInfo.do",produces="text/html;charset=utf-8")
	  public String goodInfo(){	
		return "admin/goodInfo";
		  
	  }
	 @RequestMapping(value="/addEmp.do",produces="text/html;charset=utf-8")
	  public String good(){	
		return "admin/addEmp";
		  
	  }
	 @RequestMapping(value="/good.do",produces="text/html;charset=utf-8")
	  public String good1(){	
		return "admin/good";
		  
	  }
	 
	 @RequestMapping(value="/findInfo.do",produces="text/html;charset=utf-8")
	  @ResponseBody
	  public String findInfo(String username){
		  JSONObject json = new JSONObject();
		 List<Admin> admin = adminservice.findInfo(username);
		 System.out.println("asdfghj"+admin);
		 json.put("error_msg", admin);
		return json.toJSONString();
		  
	  }
	 @RequestMapping(value="/emp.do",produces="text/html;charset=utf-8")
	  public String empManage(){	
		return "admin/empmanage";
		  
	  }
	 @RequestMapping(value="/limit.do",produces="text/html;charset=utf-8")
	  public String limit(){	
		return "admin/limit";
		  
	  }
	 @RequestMapping(value="/updatePassword.do",produces="text/html;charset=utf-8")
	  @ResponseBody
	  public String updatePassword(String password,int id){
		  JSONObject json = new JSONObject();
		  Admin admin= new Admin();
		  admin.setId(id);
		  admin.setPassword(password);
		  adminservice.updatePassword(admin);
		return json.toJSONString();
		  
	  }
	 @RequestMapping(value="/addEmps.do",produces="text/html;charset=utf-8")
	 
	  public String addEmps(int role,String username,
			  String password,String name,String age,String sex){
		  JSONObject json = new JSONObject();
		  Admin admin= new Admin();
		  System.out.println(role);
		  admin.setRid(role);
		  admin.setAge(age);
		  admin.setName(name);
		  admin.setPassword(password);
		  admin.setSex(sex);
		  admin.setUsername(username);
		 adminservice.addEmps(admin);
		return "admin/empmanage";
		  
	  }
	 @RequestMapping(value="/deleteEmps.do",produces="text/html;charset=utf-8")
	  @ResponseBody
	  public String deleteEmps(int id){
		  JSONObject json = new JSONObject();
		 adminservice.delectEmps(id);
		
		return json.toJSONString();
		  
	  }
	 
	 @RequestMapping(value="/updateRole.do",produces="text/html;charset=utf-8")
	  @ResponseBody
	  public String updateRole(int rid,int id){
		  JSONObject json = new JSONObject();
		  Admin admin= new Admin();
		  admin.setId(id);
		  admin.setRid(rid);
		  adminservice.updateRole(admin);
		return json.toJSONString();
		  
	  }
}
