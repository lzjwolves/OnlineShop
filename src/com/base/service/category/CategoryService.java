package com.base.service.category;

import java.util.List;

import com.base.pojo.category.BrandItem;
import com.base.pojo.category.CategoryItem;

public interface CategoryService {
public List<CategoryItem> getCategory(); 
public List<BrandItem> getBrands();
}
