package com.base.dao.category;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.base.pojo.category.BrandItem;
import com.base.pojo.category.CategoryItem;
/**
 * 获取数据源
 * 
 * @param dataSource
 *            来源于 bean.xml配置文件的dataSource
 */
@Repository
public class CategoryDAOImpl extends JdbcDaoSupport implements CategoryDAO {
	@Resource
	public final void setJdbcDaoDataSource(DataSource dataSource) {
		super.setDataSource(dataSource);
	}

	@Override
	public List<CategoryItem> getCategory() {
		List<CategoryItem> categoryItemList =new ArrayList<CategoryItem>();
		String sql = "select id,category_name,parent_id,child_id,category_id,is_enable from category_item where is_enable=1";
		List<Map<String, Object>> result= this.getJdbcTemplate().queryForList(sql);
		Iterator<Map<String, Object>> resultIterator =result.iterator();
		while(resultIterator.hasNext()){
			Map<String, Object> resultMap =(Map<String, Object>) resultIterator.next();
			CategoryItem c =new  CategoryItem();
			c.setId((Long) resultMap.get("id"));
			c.setCategoryName((String) resultMap.get("category_name"));
			c.setParentId((Integer) resultMap.get("parent_id"));
			c.setChildId((Integer) resultMap.get("child_id"));
			c.setCategoryId((String) resultMap.get("category_id"));
			c.setIsEnable((Integer) resultMap.get("is_enable"));
			categoryItemList.add(c);
		}
		return categoryItemList;
	}

	@Override
	public List<BrandItem> getBrands() {
		List<BrandItem> brandItemList =new ArrayList<BrandItem>();
		String sql = "select id,parent_id,brand_name,img_url,category_id,is_enable from brand_item where is_enable=1";
		List<Map<String, Object>> result= this.getJdbcTemplate().queryForList(sql);
		Iterator<Map<String, Object>> resultIterator =result.iterator();
		while(resultIterator.hasNext()){
			Map<String, Object> resultMap =(Map<String, Object>) resultIterator.next();
			BrandItem b =new  BrandItem();
			b.setId((Long) resultMap.get("id"));
			b.setParentId((Integer) resultMap.get("parent_id"));
			b.setBrandName((String) resultMap.get("brand_name"));
			b.setImgUrl((String) resultMap.get("img_url"));
			b.setCategoryId((String) resultMap.get("category_id"));
			b.setIsEnable((Integer) resultMap.get("is_enable"));
			brandItemList.add(b);
		}
		return brandItemList;
	}

}
