package com.lishan.gjq.category;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service(value="cService")
public class CategoryServiceImpl implements CategoryService{
	@Resource
	private CategoryDao categoryDao;
	public List<Category> getCategoryList() {
		
		return categoryDao.getCategoryList();
	}
	public List<Category> getCategory(int pid) {
		// TODO Auto-generated method stub
		return categoryDao.getCategory(pid);
	}

}
