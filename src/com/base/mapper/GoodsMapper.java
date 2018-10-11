package com.base.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.base.pojo.goods.GoodsInfo;

public interface GoodsMapper {
	 @Select ("select * from goods_info where goods_id =#{goodsId}")
	  GoodsInfo getGoodsInfoById(@Param("goodsId") String goodsId  );
	 @Select ("select * from goods_info where is_new =1  group by  category_id order by create_time desc limit #{num} ")
	  GoodsInfo getNew(@Param("num") Integer num );
	 @Select ("select * from goods_info where is_hot =1  group by  group by  category_id order by create_time desc limit #{num} ")
	  GoodsInfo getHot(@Param("num") Integer num );
	 @Select ("select * from goods_info where is_special_price =1  group by   category_id  order by create_time desc limit #{num} ")
	  GoodsInfo getSpecialPrice(@Param("num") Integer num ); 
	 
	 @Update ("update goods_info set inventory =inventory+ #{num} where goods_id =#{goodsId}")
	  void updateInventory(@Param("goodsId") String goodsId,@Param("num") Integer addNum ); 
}
