package com.lishan.gjq.category.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.category.Category;
import com.lishan.gjq.category.CategoryService;

@Controller
@RequestMapping(value="/category/data",produces="text/html;charset=utf-8")
public class CategoryDataController {
	@Autowired
    @Qualifier(value="cService")
	private CategoryService categoryService;
	@RequestMapping(value="/getlist.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getCategoryList(){
	JSONObject json = new JSONObject();
	List<Category> categoryList = categoryService.getCategoryList();
	if(categoryList.size()>0){
		json.put("error_code", 0);
		json.put("error_msg", categoryList);
	}else {
		json.put("error_code", 1);
		json.put("error_msg", "商品查询失败");
	}
		return json.toJSONString();
		
	}
	@RequestMapping(value="/getCategory.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getCategory(@RequestParam("pid")int pid){
		System.out.println(pid);
	JSONObject json = new JSONObject();
	List<Category> categoryList = categoryService.getCategory(pid);
	System.out.println(categoryList);
	if(categoryList.size()>0){
		json.put("error_code", 0);
		json.put("error_msg", categoryList);
	}else {
		json.put("error_code", 1);
		json.put("error_msg", "商品查询失败");
	}
		return json.toJSONString();
		
	}
}
