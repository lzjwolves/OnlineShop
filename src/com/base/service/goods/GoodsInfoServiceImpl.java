package com.base.service.goods;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.dao.goods.GoodsInfoDao;
import com.base.mapper.CartMapper;
import com.base.mapper.GoodsMapper;
import com.base.pojo.goods.GoodsInfo;
import com.base.pojo.page.PageInfo;

@Service
public class GoodsInfoServiceImpl implements GoodsInfoService{
	@Resource
	private GoodsInfoDao goodsInfoDao;
	@Resource
	private GoodsMapper goodsMapper;
	@Transactional //事物管控
	@Override
	public List<GoodsInfo> inSellGoodsList(PageInfo page, String categoryId,
			String... orderBys) {
		// TODO Auto-generated method stub
		return goodsInfoDao.inSellGoodsList(page, categoryId, orderBys);
	}
	
	@Transactional //事物管控
	@Override
	public List<GoodsInfo> GoodsSearch(PageInfo page, String searchKeywords,
			String... orderBy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GoodsInfo getGoodsInfo(String goodsId) {
		// TODO Auto-generated method stub
		return goodsMapper.getGoodsInfoById(goodsId);
	}

}
