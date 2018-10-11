package com.base.dao.goods;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.base.pojo.category.CategoryItem;
import com.base.pojo.goods.GoodsInfo;
import com.base.pojo.page.PageInfo;

@Repository
public class GoodsInfoDaoImpl extends JdbcDaoSupport implements GoodsInfoDao {
	/**
	 * 获取数据源
	 * 
	 * @param dataSource
	 *            来源于 bean.xml配置文件的dataSource
	 */
	@Resource
	public final void setJdbcDaoDataSource(DataSource dataSource) {
		super.setDataSource(dataSource);
	}

	@Override
	public List<GoodsInfo> inSellGoodsList(PageInfo page, String categoryId,
			String... orderBys) {
		if (page != null) {
			List<GoodsInfo> goodsList = new ArrayList<GoodsInfo>();
			String sql = "";
			Integer curPage = page.getCurentPage();
			Integer tarPage = page.getTagetPage();
			Integer rownum = page.getMaxLine();

			Integer beginIndex = (tarPage - curPage) * rownum;
			Integer endIndex = tarPage * rownum;

			StringBuffer sqlbuf = new StringBuffer(
					" select * from (select @r:=@r+1 as row_num,a.* from goods_info a,(select @r:=0) b  where a.category_id=? ) c "
							+ "where  row_num>? and row_num<=? ");
			if (orderBys != null && orderBys.length > 0) {
				sqlbuf = sqlbuf.append(" order by ");
				for (String s : orderBys) {
					sqlbuf.append(s + ",");
				}
				sql = sqlbuf.substring(0, sqlbuf.length() - 1);
				if (page.getIsAsc() != null && !page.getIsAsc()) {
					sql = sql + " desc";
				}
			} else {
				sql = sqlbuf.toString();
			}
			List<Map<String, Object>> result = this.getJdbcTemplate()
					.queryForList(sql,categoryId,beginIndex,endIndex);
			Iterator<Map<String, Object>> resultIterator = result.iterator();
			while (resultIterator.hasNext()) {
				Map<String, Object> resultMap = (Map<String, Object>) resultIterator
						.next();
				GoodsInfo g = new GoodsInfo();
				g.setId((Long) resultMap.get("id"));
				g.setCategoryId((String) resultMap.get("category_id"));
				g.setGoodsId((String) resultMap.get("goods_id"));
				g.setGoodsName((String) resultMap.get("goods_name"));
				g.setUnitPrice((Double) resultMap.get("unit_price"));
				g.setCurrentPrice((Double) resultMap.get("current_price"));
				g.setCurrency((String) resultMap.get("currency"));
				g.setIsSpecialPrice((Integer) resultMap.get("is_special_price"));
				g.setIsNew((Integer) resultMap.get("is_new"));
				g.setIsHot((Integer) resultMap.get("is_hot"));
				g.setMonthlySales((Long) resultMap.get("monthly sales"));
				g.setTotalSales((Long) resultMap.get("total_sales"));
				g.setInventory((Long) resultMap.get("inventory"));
				g.setImgUrl((String) resultMap.get("img_url"));
				g.setIsSell((Integer) resultMap.get("is_sell"));
				g.setCreateTime((Date) resultMap.get("create_time"));
				goodsList.add(g);
			}
			return goodsList;
		}
		return null;
	}

	@Override
	public List<GoodsInfo> GoodsSearch(PageInfo page, String searchKeywords,
			String... orderBy) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String args[]) {
		String s = "123456";
		System.out.println(s.substring(0, s.length() - 1));
	}
}
