package com.lishan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lishan.pojo.User;
import com.lishan.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	@Qualifier("uService")
	
	private UserService userService;	
	@RequestMapping("/getAllPerson")	
	public String getAllPerson(Model model,
			@RequestParam(defaultValue="1",value="pageNum") int pageNum){
		//PageHelper.startPage(int PageNum,int PageSize)设置页面的位置和显示的条数
		PageHelper.startPage(pageNum,5);
		List<User> list = userService.getUserList();
		//PageInfo用来封装页面信息，返回给前台页面
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		model.addAttribute("pageInfo",pageInfo);
		return "user";		
	}
}
