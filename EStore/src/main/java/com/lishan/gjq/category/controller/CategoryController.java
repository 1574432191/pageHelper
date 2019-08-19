package com.lishan.gjq.category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/category" ,produces="text/html;charset=utf-8")
public class CategoryController {
	@RequestMapping(value="/category.html" ,produces="text/html;charset=utf-8")
	public String left(){
		return "comm/left";
	}
	@RequestMapping(value="/sort.html" ,produces="text/html;charset=utf-8")
	public String sort(){
		return "comm/left";
	}
	@RequestMapping(value="/leftsort.html/{id}" ,produces="text/html;charset=utf-8")
	public String sortleft(@PathVariable("id") int id){
		System.out.println("qwertyui"+id);
		return "leftsort";
	}
}
