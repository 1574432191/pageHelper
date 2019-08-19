package com.lishan.gjq.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端页面映射
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/user",produces="text/html;charset=utf-8")
public class UserController {

	@RequestMapping(value="/login.html",produces="text/html;charset=utf-8")
	public String login()throws Exception{
		return "login";
	}
	@RequestMapping(value="/test.html",produces="text/html;charset=utf-8")
	public String test(){
		return "test";
	}
	@RequestMapping(value="/regist.html",produces="text/html;charset=utf-8")
	public String reg()throws Exception{
		return "regist";
	}
	@RequestMapping(value="/phoneLogin.html",produces="text/html;charset=utf-8")
	public String phoneLogin()throws Exception{
		return "phoneLogin";
	}
	@RequestMapping(value="/findPassword.html",produces="text/html;charset=utf-8")
	public String findPassword()throws Exception{
		return "findPassword";
	}
	@RequestMapping(value="/alterPassword.html/{username}",produces="text/html;charset=utf-8")
	public String alterPassword(@PathVariable("username")String username)throws Exception{
		System.out.println("后台"+username);
		return "alterPassword";
	}
	@RequestMapping(value="/userInfo.html/{id}",produces="text/html;charset=utf-8")
	public String userInfo(@PathVariable("id")int id)throws Exception{
		return "userInfo";
	}
	@RequestMapping(value="/updatePassWord.html",produces="text/html;charset=utf-8")
	public String updatePassword()throws Exception{
		return "updatePassword";
	}
	@RequestMapping(value="/userInfo1.html",produces="text/html;charset=utf-8")
	public String userInfo1()throws Exception{
		return "userInfo";
	}
	@RequestMapping(value="/updateUser.html",produces="text/html;charset=utf-8")
	public String updateUser()throws Exception{
		return "updateUser";
	}
	@RequestMapping(value="/notify_url.html",produces="text/html;charset=utf-8")
	public String ajaxTest()throws Exception{
		return "notify_url";
	}
	@RequestMapping(value="/userphoto.html",produces="text/html;charset=utf-8")
	public String userPhoto()throws Exception{
		return "userphoto";
	}
	@RequestMapping(value="/address.html",produces="text/html;charset=utf-8")
	public String address()throws Exception{
		return "address";
	}
	@RequestMapping(value="/userorders.html",produces="text/html;charset=utf-8")
	public String userorders()throws Exception{
		return "userorders";
	}
	
}
