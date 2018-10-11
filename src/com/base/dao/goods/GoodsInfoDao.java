package com.base.dao.goods;

import java.util.List;

import com.base.pojo.goods.GoodsInfo;
import com.base.pojo.page.PageInfo;

public interface GoodsInfoDao {
	//获取销售中的商品列表	
	public List<GoodsInfo> inSellGoodsList(PageInfo page,String categoryId ,String ...orderBys);

	//关键字搜索获取商品列表
	public List<GoodsInfo> GoodsSearch(PageInfo page,String searchKeywords ,String ...orderBy);
}
