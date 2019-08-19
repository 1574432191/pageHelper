package com.lishan.gjq.user.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.photo.Photo;
import com.lishan.gjq.user.Addres;
import com.lishan.gjq.user.User;
import com.lishan.gjq.user.UserService;
import com.lishan.gjq.util.CookieUtil;
import com.lishan.gjq.util.DateConversion;
import com.lishan.gjq.util.MailUtils;
import com.lishan.gjq.util.MySendMailThread;
import com.lishan.gjq.util.SendMsgUtil;


@Controller
@RequestMapping("/user")
public class UserDataController {
	@Autowired
	@Qualifier(value="uService")
	private UserService userService;
	@ResponseBody
	@RequestMapping("/login.do")
	/**
	 * @RequestParam  主要用于将请求参数区域的数据映射到控制方法的参数上
	 * @return
	 */	
	//用户登录功能
	public String login(@RequestParam(value="username")String username
			,@RequestParam(value="password")String password,
			HttpSession session,String code,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		/*
		 * 验证码被保存到session中，所以，这里就是通过getSession().getAttribute()来获取验证码
		 */
		String codes = (String) request.getSession().getAttribute("code");
		System.out.println("dd"+code+"ssss"+codes);
		// 构建一个JSONObject对象，然后再调用put方法将数据写入
		JSONObject json = new JSONObject();
//S		CookieUtil cookieUtil = new CookieUtil();
		User user = userService.login(username, password);
		System.out.println(user);
		if (user!=null&&code.equals(codes)) {
			request.getSession().setAttribute("user", user);
			json.put("error_code", 0);
			json.put("error_msg", "登陆成功");
		    session.setAttribute("user", user);	
			json.put("error_user", user);
			
			
			
		}else if (user!=null&&!code.equals(codes)) {
			json.put("error_code", -2);
			json.put("error_msg", "验证码错误");
			session.setAttribute("user", user);
		}else {
			
			json.put("error_code", -1);
			json.put("error_msg", "用户名密码无效");
			session.setAttribute("user", user);
		}
		
		return json.toJSONString();
		
	}
	/**
	 * 
	 * @RequestParam(value="username")String username,@RequestParam(value="password")String password,
				@RequestParam(value="rePassword")String reRassword,@RequestParam(value="email")String email,
				@RequestParam(value="sex")String sex,@RequestParam(value="name")String name
				,@RequestParam(value="birthday")Date birthday,@RequestParam(value="address")String address,
	 */
	//注册功能
	    @ResponseBody
		@RequestMapping("/reg.do")
		public String reg(String username,String rePassword,String sex,String email,
				String name,String address,String password,String birthday,
				String code,HttpSession session,HttpServletRequest request)throws Exception{
	    	String codes = (String) request.getSession().getAttribute("code");
			System.out.println("注册"+code+" "+rePassword);
			JSONObject json = new JSONObject();
			System.out.println(username+"sss"+birthday);
			DateConversion conversion = new DateConversion();
			Date time = conversion.convert(birthday);
			System.out.println("tttt"+username);
			User user = userService.findByUserName(username);
			System.out.println("userController"+user);
			//邮箱的格式
			String reg2 = "/^([0-9a-zA-Z])+\\@([a-zA-Z0-9])+\\.([a-zA-Z])+$/";
			if (user!=null) {
				json.put("error_code", 0);
				json.put("error_msg", "该用户已经注册过");
				session.setAttribute("user", user);
			}else {
				System.out.println("111");
				System.out.println(password+"  "+rePassword);
				if (!password.equals(rePassword)) {
					System.out.println("进来了");
					json.put("error_code", 1);
					json.put("error_msg", "密码不一致");
					session.setAttribute("user", user);
				}else{
					System.out.println("2222");
					if (email.matches(reg2)) {
						System.out.println("邮箱格式不正确");
						json.put("error_code", 2);
						json.put("error_msg", "邮箱格式不正确");
						session.setAttribute("user", user);
					}else{
						System.out.println("333333");
						if (!code.equals(codes)) {
							json.put("error_code", 3);
							json.put("error_msg", "验证码不正确");
							session.setAttribute("user", user);
						}else {
							System.out.println("4444");
							
							System.out.println("进行注册");
							userService.reg(username, password, name, email, time, sex, address);
							json.put("error_code", 4);
							json.put("error_msg", "注册成功");
							User user2 = new User();
							user2.setEmail(email);
							user2.setUsername(username);
							MySendMailThread eMailThread = new MySendMailThread(user2);
							eMailThread.start();
						}
					}
				}
			}
			
			return json.toJSONString();
		}
	    
	    //发送短信验证码
	    @RequestMapping("/phoneLogin.do")
	    public String getPhoneCode(String phoneNumber,HttpServletRequest req) throws Exception{
	    	System.out.println(phoneNumber);
	    	User user = userService.findByPhone(phoneNumber);
	    	JSONObject json = new JSONObject();
	    	if (user==null) {
				json.put("error_code", 0);
				json.put("error_code", "该手机好未注册");
			}else {
				
				String sss = new SendMsgUtil().sendCode(phoneNumber);
				System.out.println(sss);
				String phoneCode = JSON.parseObject(sss).getString("obj");
				System.out.println(phoneCode);
				json.put("error_code", 0);
				json.put("error_msg", user);
				HttpSession session =req.getSession();
				session.setAttribute("phoneCode", phoneCode);
			}
	    	return json.toJSONString();
	    	
	    }
	    //短信登录
	    @RequestMapping("/phoneLogin1.do")
	    @ResponseBody
	    public String phoneLogin1(String phoneNumber,String phoneCode,HttpServletRequest req) throws Exception{
	    	System.out.println(phoneNumber+"    "+phoneCode);
	    	User user = userService.findByPhone(phoneNumber);
	    	JSONObject json = new JSONObject();
	    	String code = (String) req.getSession().getAttribute("phoneCode");
	    	if (!code.equals(phoneCode)) {
				json.put("error_code", 0);
				json.put("error_msg", "验证码错误");
			}else {
				json.put("error_code", 1);
				json.put("error_msg", user);
			}
	    	return json.toJSONString();
	    	
	    }
	    
	    
	    //邮箱激活
	    @RequestMapping("/emailActive.do")
	    @ResponseBody
	    public String emailActive(String username){
	    	JSONObject json = new JSONObject();
	    	userService.emailActive(username);
	    	System.out.println("邮箱激活");
	    	int stat = userService.findStat(username);
	    	System.out.println(stat);
	    	if (stat==1) {
				json.put("error_code", 0);
				json.put("error_msg", "邮箱激活成功");
			}else {
				json.put("error_code", 1);
				json.put("error_msg", "邮箱激活失败");
			}
			return json.toJSONString();
	    	
	    }
	    //邮箱找回密码
	    @RequestMapping("/findPassWord.do")
	    @ResponseBody
	    public String findPassWord(String email) throws MessagingException, GeneralSecurityException{
	    	JSONObject json = new JSONObject();
	    	MailUtils mailUtils = new MailUtils();
	    	User user = userService.findByEmail(email);
	    	if (user!=null) {
	    		int mailNumber = mailUtils.send_mail(email, "发送邮件");
	    		System.out.println("发送邮件"+mailNumber);
	    		json.put("error_code", 0);
	    		json.put("error_user", user.getUsername());
	    		json.put("error_msg", mailNumber);				
			}else {
				json.put("error_code", 1);
	    		json.put("error_msg", "该邮箱不存在，发送失败");
			}
	    	
			return json.toJSONString();
	    	
	    }
	    
	    //邮箱找回密码
	    @RequestMapping("/alterPassWord.do")
	    @ResponseBody
	    public String alterPassWord(String username,String password) throws MessagingException, GeneralSecurityException{
	    	JSONObject json = new JSONObject();
	    	MailUtils mailUtils = new MailUtils();
	    	userService.updatePassword(password, username);    	
			return json.toJSONString();
	    	
	    }
	    
	  // 查看个人信息
	    @RequestMapping("/findUserInfo.do")
	    @ResponseBody
	    public String findUserInfo(int id){
	    	User user = userService.findUserById(id);
	    	JSONObject json = new JSONObject();
	    	if (user!=null) {
				json.put("error_code", 0);
				json.put("error_msg", user);
			}else {
				json.put("error_code", 1);
				json.put("error_msg", "信息查找失败");
			}
			return json.toJSONString();
	    	
	    }
	    
	    // 在个人中心修改密码
	    @RequestMapping("/updatePassword.do")
	    @ResponseBody
	    public String updatePassword(String username,String password,
	    		String newPassword,String rnewpassword){
	    	
	    	JSONObject json = new JSONObject();
	    	String pWord = userService.findPassword(username);
	    	System.out.println(pWord+"  "+password);
	    	if (!pWord.equals(password)) {
				json.put("error_code", 0);
				json.put("error_msg", "密码错误");				
			}else if (!rnewpassword.equals(newPassword)) {
				json.put("error_code", 1);
				json.put("error_msg", "确认密码错误");
			}else {
				userService.updatePassword(newPassword, username);
				json.put("error_code", 2);
				json.put("error_msg", "密码修改成功");
			}
			return json.toJSONString();
	    	
	    }
	    
	    @RequestMapping("/updateUser.do")
	    @ResponseBody
	    public String updateUser(String email,int id,String name,
	    		String sex,String birthday,String address){
	    	JSONObject json = new JSONObject();
	    	System.out.println("修改个人信息"+birthday);
	    	DateConversion conversion = new DateConversion();
			Date time = conversion.convert(birthday);
	    	User user = new User();
	    	user.setAddress(address);
	    	user.setBirthday(time);
	    	user.setEmail(email);
	    	user.setSex(sex);
	    	user.setId(id);
	    	user.setName(name);
	    	System.out.println(user);
	    	userService.updateUser(user);
	    	json.put("error_msg", "信息修改成功");
	    	return json.toJSONString();
	    }
	    
	    @RequestMapping("/upPhoto.do")
	    public String upPhoto(MultipartFile file ,HttpServletRequest request) throws IllegalStateException, IOException{
	    	User user = (User) request.getSession().getAttribute("user");
	    	System.out.println("gggggggggggggggggggg"+user);
	    	String filePath = request.getSession().
					getServletContext().getRealPath("image");
	    	// 获取文件名
	    	int id =user.getId();
			String fileName = file.getOriginalFilename();
			System.out.println("上传头像="+filePath+"   "+fileName);
			userService.insertPhotos(id, fileName);
			File dir = new File(filePath,fileName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			file.transferTo(dir);
	    	
	    	
	    	
	    	return "redirect:/user/userInfo1.html";
	    }
	    
	    @RequestMapping("/findPhoto.do")
	    @ResponseBody
	    public String findPhoto(int uid){
	    	JSONObject json = new JSONObject();
	     List<Photo> list = userService.findPhoto(uid);
	     if (list.size()>0) {
			json.put("error_code", 0);
			json.put("error_msg", list);
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "查询历史头像失败");
		}
	    	
	    	return json.toJSONString();
	    } 
	    @RequestMapping("/addAddress.do")
	    @ResponseBody
	    public String addAddress(int uid,String address){
	    	JSONObject json = new JSONObject();
	    	Addres addres = new Addres();
	    	Date date = new Date(System.currentTimeMillis());
	    	addres.setAddress(address);
	    	addres.setUid(uid);
	    	addres.setCreateTime(date);
	    	System.out.println(addres);
	    	Addres addres2 = userService.findAddressByUid(uid,address);
	    	System.out.println("-------"+addres2);
	    	
	    	if (addres2==null){
	    		 userService.addAddress(addres);
				  json.put("error_code", 0);
			        json.put("error_msg", "地址添加成功");
			}else{
				json.put("error_code", 1);
		        json.put("error_msg", "该地址近期已保存");
			}
	    	return json.toJSONString();
	    } 
	    
	    @RequestMapping("/findAddressOrderByTime.do")
	    @ResponseBody
	    public String findAddressOrderByTime(int uid){
	    	System.out.println(uid);
	    	JSONObject json = new JSONObject();
	    	List<Addres> list = userService.findAddressOrderByTime(uid);
	    	System.out.println("前五个地址="+list);
	    	if (list.size()>0) {
				json.put("error_code", 0);
				json.put("error_msg", list);
			}else {
				json.put("error_code", 1);
				json.put("error_msg", "查询地址失败");
			}
	    	return json.toJSONString();
	    }
	    
	    @RequestMapping("/deleteAddress.do")
	    @ResponseBody
	    public String deleteAddress(int id){
	    	System.out.println(id);
	    	JSONObject json = new JSONObject();
	        userService.deleteAddress(id);
	        json.put("error_msg", "删除成功");
	    	return json.toJSONString();
	    }
	    
	    @RequestMapping("/findAllAddress.do")
	    @ResponseBody
	    public String findAllAddress(int uid){
	    	System.out.println(uid);
	    	JSONObject json = new JSONObject();
	        List<Addres> list = userService.findAllAddress(uid);
	        System.out.println("asdfghjkl;"+list);
	        json.put("error_msg", list);
	    	return json.toJSONString();
	    }
	
}
