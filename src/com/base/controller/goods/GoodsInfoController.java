package com.base.controller.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.goods.GoodsInfo;
import com.base.pojo.page.PageInfo;
import com.base.pojo.user.UserAccountInfo;
import com.base.service.goods.GoodsInfoService;
import com.base.utils.GoodsOrder;

@Controller
public class GoodsInfoController {
	@Autowired
	private GoodsInfoService goodsInfoService;

	@RequestMapping(value = "goods_list.do", method = RequestMethod.POST)
	public String goodsInfo(HttpServletRequest request, HttpSession session,
			String categoryId, String menuName, String categoryName,
			Integer curentPage, Integer tagetPage, Integer maxLine,
			Boolean isAsc, String... orderBys) {
		if (maxLine == null) {
			maxLine = 9;
		}
		PageInfo pageInfo = new PageInfo();
		if (curentPage != null && tagetPage != null && maxLine != null) {
			pageInfo.setCurentPage(curentPage);
			pageInfo.setTagetPage(tagetPage);
			pageInfo.setMaxLine(maxLine);
			// 默认由高到低排序
			pageInfo.setIsAsc(isAsc == null || !isAsc ? false : true);
		} else {
			pageInfo.setCurentPage(1);
			pageInfo.setTagetPage(1);
			pageInfo.setMaxLine(9);
			pageInfo.setIsAsc(true);
		}
		List<GoodsInfo> goodsList;
		if (orderBys == null) {
			goodsList = goodsInfoService.inSellGoodsList(pageInfo, categoryId,
					GoodsOrder.DEFAULT);
		} else {
			goodsList = goodsInfoService.inSellGoodsList(pageInfo, categoryId,
					orderBys);
		}
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("maxLine", maxLine);
		request.setAttribute("menuName", menuName);
		request.setAttribute("categoryName", categoryName);
		return "goods_list";
	}
	@RequestMapping(value = "goods_detail.do", method = RequestMethod.GET)
	public String goodsDetail(HttpServletRequest request, HttpSession session,
			String goodsId) {
		GoodsInfo goodsInfo =new GoodsInfo();
		goodsInfo=goodsInfoService.getGoodsInfo(goodsId);
		request.setAttribute("goodsInfo", goodsInfo);
	return "goods_detail";
	}
}
