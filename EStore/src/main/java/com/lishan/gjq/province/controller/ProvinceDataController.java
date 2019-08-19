package com.lishan.gjq.province.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.province.Province;
import com.lishan.gjq.province.ProvinceService;

@Controller
@RequestMapping("/province/data")
public class ProvinceDataController {
	@Autowired
	@Qualifier(value="pService")
	private ProvinceService provinceService;
	
	@RequestMapping("/getProvince.do")
	@ResponseBody
	public String getProvince(@RequestParam("parentid")int parentid){
		JSONObject json = new JSONObject();
		List<Province> lists = provinceService.getProvince(parentid);
		System.out.println("省份+"+lists);
		if (lists.size()>0) {
			json.put("error_code", 1);
			json.put("error_msg", lists.toString());
		}else {
			json.put("error_code", 0);
			json.put("error_msg", "数据查询失败,请稍后再试!");
		}
		return json.toJSONString();
		
	}

}
