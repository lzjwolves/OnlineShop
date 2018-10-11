package com.base.dao.category;

import java.util.List;

import com.base.pojo.category.BrandItem;
import com.base.pojo.category.CategoryItem;

public interface CategoryDAO {
	public List<CategoryItem> getCategory(); 
	public List<BrandItem> getBrands(); 

}
