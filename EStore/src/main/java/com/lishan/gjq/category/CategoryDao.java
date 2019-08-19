package com.lishan.gjq.category;

import java.util.List;

public interface CategoryDao {
	//查询所有的商品的类型
	List<Category> getCategoryList();
	List<Category> getCategory(int pid);

}
