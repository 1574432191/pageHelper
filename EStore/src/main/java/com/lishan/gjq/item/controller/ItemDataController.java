package com.lishan.gjq.item.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.lishan.gjq.item.Item;
import com.lishan.gjq.item.ItemService;
import com.lishan.gjq.user.User;
import com.lishan.gjq.util.DateConversion;
import com.lishan.gjq.util.Page;

@Controller
@RequestMapping(value="/item/data",produces="text/html;charset=utf-8")
public class ItemDataController {
	
	@Autowired
	@Qualifier(value="iService")
	private ItemService itemService;
	
	@RequestMapping(value="/index.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String index() throws Exception{
		JSONObject json = new JSONObject();
		List<Item> newItem=itemService.findItemByNew();
		List<Item> hotItem = itemService.findItemByHot();
		if (newItem.size()>0||hotItem.size()>0) {
			json.put("error_code", 0);
			json.put("error_msg1", newItem);
			json.put("error_msg2", hotItem);
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "数据查询失败");
		}
		
		return json.toJSONString();
		
	}
	@RequestMapping("/findItem.do")
	@ResponseBody
	public String findItem(){
		JSONObject json = new JSONObject();
		List<Item> list = itemService.findItem();
		if (list.size()>0) {
			json.put("error_code", 0);
			json.put("error_msg", list);
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "商品查询失败");
		}
		return json.toJSONString();
	}
	//查询页数，返回总页数
	@RequestMapping("/findCount.do")
	@ResponseBody
	public String fenYe(){
		JSONObject json = new JSONObject();
		int pageCount = itemService.findCount();
		System.out.println(pageCount);
		if (pageCount>0) {
			json.put("error_code", 0);
			json.put("error_msg", pageCount);
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "查询页数失败");
		}
		return json.toJSONString();
	}
	@RequestMapping("/findByCount.do")
	@ResponseBody
	public String findByCount(){
		JSONObject json = new JSONObject();
		int pageCount = itemService.findCount();
		System.out.println(pageCount);
		if (pageCount>0) {
			json.put("error_code", 0);
			json.put("error_msg", pageCount);
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "查询页数失败");
		}
		return json.toJSONString();
	}
	@RequestMapping("/findItemByCount.do")
	@ResponseBody
	public String findItemByCount(){
		JSONObject json = new JSONObject();
		Page page = new Page();
		page.setStart(0);
		int start = page.getStart();
		int count=1;
		List<Item> item= itemService.findByCount(start);
		if (item!=null) {
			json.put("error_code", 0);
			json.put("error_msg", item);
			json.put("error_count", count);
		}else {
			json.put("error_code", 1);
			json.put("error_msg", "查询页数失败");
			json.put("error_page", count);
		}
		return json.toJSONString();
	}
	//页面跳转
	@RequestMapping("/findCountTZ.do")
	@ResponseBody
	public String findCountTZ(int pageIndex){
		System.out.println(pageIndex);
		JSONObject json = new JSONObject();
		int pageCount = itemService.findCount();
		if(pageIndex>pageCount){
			json.put("error_code", 0);
			json.put("error_msg", "输入数据超过总页数");
		}else {
			int start = (pageIndex-1)*8;
			List<Item> item= itemService.findByCount(start);
			System.out.println(item);
			if (item!=null) {
				json.put("error_code", 1);
				json.put("error_msg", item);
				json.put("error_page", pageIndex);
			}else {
				
					json.put("error_code", 2);
					json.put("error_msg", "查询页数失败");
					json.put("error_page", pageIndex);	
			}
		}
		return json.toJSONString();
	}
	
	//上一页跳转
	@RequestMapping("/findUpPage.do")
	@ResponseBody
	public String findUpPage(int pageIndex){
		System.out.println("上一页"+pageIndex);
		JSONObject json = new JSONObject();
		int pageIndex1 =pageIndex-1;
		System.out.println("pageIndex1"+pageIndex1);
		if (pageIndex1<0) {
			json.put("error_code", 0);
			json.put("error_msg", "本页为首页，无法跳转");
			
		}else {
			int start = (pageIndex1-1)*8;
			List<Item> list = itemService.findByCount(start);
			if (list!=null) {
				json.put("error_code", 1);
				json.put("error_msg", list);
				json.put("error_page", pageIndex1);
			}else {
				json.put("error_code", 2);
				json.put("error", "数据查询失败");
				json.put("error_page", pageIndex);
			}
		}
		return json.toJSONString();
	}
	
	//下一页跳转
		@RequestMapping("/findNextPage.do")
		@ResponseBody
		public String findNextPage(int pageIndex){
			System.out.println("上一页"+pageIndex);
			JSONObject json = new JSONObject();
			int pageIndex1 =pageIndex+1;
			int countPage = itemService.findCount();
			if (pageIndex1>countPage) {
				json.put("error_code", 0);
				json.put("error_msg", "本页为最后一页，无法跳转");
				
			}else {
				int start = (pageIndex1-1)*8;
				List<Item> list = itemService.findByCount(start);
				if (list!=null) {
					json.put("error_code", 1);
					json.put("error_msg", list);
					json.put("error_page", pageIndex1);
				}else {
					json.put("error_code", 2);
					json.put("error", "数据查询失败");
					json.put("error_page", pageIndex);
				}
			}
			return json.toJSONString();
		}
		
		
		
		//商品详情
				@RequestMapping("/findItemInfo.do")
				@ResponseBody
				public String ItemInfo(int id){
					System.out.println("商品详情"+id);
					Item item = itemService.findItemById(id);
					System.out.println(item);
					JSONObject json = new JSONObject();
					if (item!=null) {
						json.put("error_code", 0);
						json.put("error_msg", item);	
					}else {
						json.put("error_code", 1);
						json.put("error_msg", "商品查询失败");
					}
					return json.toJSONString();
				}
				
				@RequestMapping("/findItemByCount5.do")
				@ResponseBody
				public String findItemByCount5(){
					JSONObject json = new JSONObject();
					Page page = new Page();
					page.setStart(0);
					int start = page.getStart();
					int count=1;
					List<Item> item= itemService.findCount5(start);
					if (item!=null) {
						json.put("error_code", 0);
						json.put("error_msg", item);
						json.put("error_count", count);
					}else {
						json.put("error_code", 1);
						json.put("error_msg", "查询页数失败");
						json.put("error_page", count);
					}
					return json.toJSONString();
				}
				//页面跳转
				@RequestMapping("/findCountTZ1.do")
				@ResponseBody
				public String findCountTZ1(int pageIndex){
					System.out.println(pageIndex);
					JSONObject json = new JSONObject();
					int pageCount = itemService.findAllCount();
					if(pageIndex>pageCount){
						json.put("error_code", 0);
						json.put("error_msg", "输入数据超过总页数");
					}else {
						int start = (pageIndex-1)*5;
						List<Item> item= itemService.findCount5(start);
						System.out.println(item);
						if (item!=null) {
							json.put("error_code", 1);
							json.put("error_msg", item);
							json.put("error_page", pageIndex);
						}else {
							
								json.put("error_code", 2);
								json.put("error_msg", "查询页数失败");
								json.put("error_page", pageIndex);	
						}
					}
					return json.toJSONString();
				}
				//查询页数，返回总页数
				@RequestMapping("/findCount5.do")
				@ResponseBody
				public String fenYe1(){
					JSONObject json = new JSONObject();
					int pageCount = itemService.findAllCount();
					System.out.println("分页="+pageCount);
					System.out.println(pageCount);
					if (pageCount>0) {
						json.put("error_code", 0);
						json.put("error_msg", pageCount);
					}else {
						json.put("error_code", 1);
						json.put("error_msg", "查询页数失败");
					}
					return json.toJSONString();
				}
				//上一页跳转
				@RequestMapping("/upPage1.do")
				@ResponseBody
				public String findUpPage1(int pageIndex){
					System.out.println("上一页"+pageIndex);
					JSONObject json = new JSONObject();
					int pageIndex1 =pageIndex-1;
					System.out.println("pageIndex1"+pageIndex1);
					if (pageIndex1<0) {
						json.put("error_code", 0);
						json.put("error_msg", "本页为首页，无法跳转");
						
					}else {
						int start = (pageIndex1-1)*5;
						List<Item> list = itemService.findCount5(start);
						if (list!=null) {
							json.put("error_code", 1);
							json.put("error_msg", list);
							json.put("error_page", pageIndex1);
						}else {
							json.put("error_code", 2);
							json.put("error", "数据查询失败");
							json.put("error_page", pageIndex);
						}
					}
					return json.toJSONString();
				}
				
				//下一页跳转
				@RequestMapping("/downPage1.do")
				@ResponseBody
				public String findNextPage1(int pageIndex){
					System.out.println("上一页"+pageIndex);
					JSONObject json = new JSONObject();
					int pageIndex1 =pageIndex+1;
					int countPage = itemService.findAllCount();
					if (pageIndex1>countPage) {
						json.put("error_code", 0);
						json.put("error_msg", "本页为最后一页，无法跳转");
						
					}else {
						int start = (pageIndex1-1)*5;
						List<Item> list = itemService.findCount5(start);
						if (list!=null) {
							json.put("error_code", 1);
							json.put("error_msg", list);
							json.put("error_page", pageIndex1);
						}else {
							json.put("error_code", 2);
							json.put("error", "数据查询失败");
							json.put("error_page", pageIndex);
						}
					}
					return json.toJSONString();
				}
				
		// 商品下架
		@RequestMapping("/updateStatus.do")
		@ResponseBody
		public String updateStatus(int id){
			JSONObject json = new JSONObject();
			itemService.updateStatus(id);
			return json.toJSONString();
			
		}
		
		// 查看下架商品
		@RequestMapping("/findItemByStatus.do")
		@ResponseBody
	
		public String findItemByStatus(){
			JSONObject json = new JSONObject();
			Page page = new Page();
			page.setStart(0);
			int start = page.getStart();
			int count=1;
			List<Item> item= itemService.findItemByStstus(start);
			if (item!=null) {
				json.put("error_code", 0);
				json.put("error_msg", item);
				json.put("error_count", count);
			}else {
				json.put("error_code", 1);
				json.put("error_msg", "查询页数失败");
				json.put("error_page", count);
			}
			return json.toJSONString();
		}
		
		//查询下架商品页数页数，返回总页数
		@RequestMapping("/findCountByStatus.do")
		@ResponseBody
		public String fenYe2(){
			JSONObject json = new JSONObject();
			int pageCount = itemService.findCountByStatus();
			System.out.println("分页="+pageCount);
			System.out.println(pageCount);
			if (pageCount>0) {
				json.put("error_code", 0);
				json.put("error_msg", pageCount);
			}else {
				json.put("error_code", 1);
				json.put("error_msg", "查询页数失败");
			}
			return json.toJSONString();
		}
		
		//上一页跳转
		@RequestMapping("/upPage2.do")
		@ResponseBody
		public String findUpPage2(int pageIndex){
			System.out.println("上一页"+pageIndex);
			JSONObject json = new JSONObject();
			int pageIndex1 =pageIndex-1;
			System.out.println("pageIndex1"+pageIndex1);
			if (pageIndex1<0) {
				json.put("error_code", 0);
				json.put("error_msg", "本页为首页，无法跳转");
				
			}else {
				int start = (pageIndex1-1)*5;
				List<Item> list = itemService.findItemByStstus(start);
				if (list!=null) {
					json.put("error_code", 1);
					json.put("error_msg", list);
					json.put("error_page", pageIndex1);
				}else {
					json.put("error_code", 2);
					json.put("error", "数据查询失败");
					json.put("error_page", pageIndex);
				}
			}
			return json.toJSONString();
		}
		
		//下一页跳转
		@RequestMapping("/downPage2.do")
		@ResponseBody
		public String findNextPage2(int pageIndex){
			System.out.println("上一页"+pageIndex);
			JSONObject json = new JSONObject();
			int pageIndex1 =pageIndex+1;
			int countPage = itemService.findAllCount();
			if (pageIndex1>countPage) {
				json.put("error_code", 0);
				json.put("error_msg", "本页为最后一页，无法跳转");
				
			}else {
				int start = (pageIndex1-1)*5;
				List<Item> list = itemService.findItemByStstus(start);
				if (list!=null) {
					json.put("error_code", 1);
					json.put("error_msg", list);
					json.put("error_page", pageIndex1);
				}else {
					json.put("error_code", 2);
					json.put("error", "数据查询失败");
					json.put("error_page", pageIndex);
				}
			}
			return json.toJSONString();
		}
		
		//页面跳转
		@RequestMapping("/findCountTZ2.do")
		@ResponseBody
		public String findCountTZ2(int pageIndex){
			System.out.println(pageIndex);
			JSONObject json = new JSONObject();
			int pageCount = itemService.findAllCount();
			if(pageIndex>pageCount){
				json.put("error_code", 0);
				json.put("error_msg", "输入数据超过总页数");
			}else {
				int start = (pageIndex-1)*5;
				List<Item> item= itemService.findItemByStstus(start);
				System.out.println(item);
				if (item!=null) {
					json.put("error_code", 1);
					json.put("error_msg", item);
					json.put("error_page", pageIndex);
				}else {
					
						json.put("error_code", 2);
						json.put("error_msg", "查询页数失败");
						json.put("error_page", pageIndex);	
				}
			}
			return json.toJSONString();
		}
		
		// 商品上架
				@RequestMapping("/upItemStatus.do")
				@ResponseBody
				public String upItemStatus(int id){
					JSONObject json = new JSONObject();
					itemService.upItemSatus(id);;
					return json.toJSONString();
					
				}
				
		// 上传商品
				 @RequestMapping("/upTitleImage.do")
				    public String upPhoto(MultipartFile file ,HttpServletRequest request,
				    		int categoryname,String name,Double marketprice,Double estoreprice,
				    		int num,String production_date ,String expiry_date,String description) throws IllegalStateException, IOException{
				    	System.out.println("添加商品="+categoryname+description);
				    	String filePath = request.getSession().
								getServletContext().getRealPath("image");
				    	// 获取文件名
				    
						String fileName = file.getOriginalFilename();
						System.out.println("上传头像="+filePath+"   "+fileName);
					
						File dir = new File(filePath,fileName);
						if (!dir.exists()) {
							dir.mkdirs();
						}
						DateConversion conversion = new DateConversion();
						Date time1 = conversion.convert(production_date);
						Date time2 = conversion.convert(expiry_date);
						file.transferTo(dir);
				    	Item item = new Item();
				    	item.setCategory_id(categoryname);
				    	item.setName(name);
				    	item.setMarketprice(marketprice);
				    	item.setEstoreprice(estoreprice);
				    	item.setNum(num);
				    	item.setTitleimage(fileName);
				    	item.setProduction_date(time1);
				    	item.setExpiry_date(time2);
				    	item.setDescription(description);
				    	itemService.insertItems(item);
				    	
				    	
				    	return "redirect:/item/goodInfo.do";
				    }
				 
				// 分类查找商品
					@RequestMapping("/findItemByCate.do")
					@ResponseBody
					public String findItemByCate(int id){
						JSONObject json = new JSONObject();
						List<Item> list = itemService.findItemByCate(id);
						if(list.size()>0){
							json.put("error_code", 0);
							json.put("error_msg", list);
						}else {
							json.put("error_code", 1);
							json.put("error_msg", "暂无此商品");
						}
						return json.toJSONString();
						
					}
}
