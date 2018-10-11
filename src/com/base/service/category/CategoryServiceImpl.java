package com.base.service.category;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.dao.category.CategoryDAO;
import com.base.pojo.category.BrandItem;
import com.base.pojo.category.CategoryItem;
@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	private CategoryDAO categoryDAO;
	@Transactional //事物管控
	@Override
	public List<CategoryItem> getCategory() {
		try{
		return categoryDAO.getCategory();
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	@Transactional //事物管控
	@Override
	public List<BrandItem> getBrands() {
		try{
			return categoryDAO.getBrands();
			}catch(Exception e){
				e.printStackTrace();
				throw new RuntimeException();
			}
	}

}
