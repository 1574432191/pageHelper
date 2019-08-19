package com.lishan.gjq.category;

import java.util.List;

public interface CategoryService {
	List<Category> getCategoryList();
	List<Category> getCategory(int pid);
}
