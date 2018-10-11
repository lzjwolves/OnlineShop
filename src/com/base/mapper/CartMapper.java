package com.base.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.base.pojo.cart.CartItem;
import com.base.pojo.goods.GoodsInfo;

public interface CartMapper {
	  @Insert("insert into cart_item(user_name,goods_id,goods_name,price,currency,create_time,amount,state,img_url) select " +
				"#{userName},goods_id,goods_name,current_price,currency,now(),#{amount},is_sell,img_url from goods_info where goods_id =#{goodsId}")
	  void insert(CartItem cartItem);

	  
	  @Select("select amount from cart_item where user_name=#{userName} and goods_id =#{goodsId}")
	  Integer count(@Param("userName") String userName,@Param("goodsId") String goodsId);
	  
	  @Update("update cart_item set amount =#{amount} where user_name=#{userName} and goods_id =#{goodsId}")
	  void updateAmount(CartItem cartItem);
	  
	  @Select("select * from cart_item where user_name=#{userName}")
	 List<CartItem> getCartItemByUserName(@Param("userName") String userName); 
	  
	  @Delete("delete from cart_item where user_name=#{userName} and goods_id =#{goodsId}")
	  void delete(@Param("userName") String userName,@Param("goodsId") String goodsId); 
	  
	  @Select ("select * from goods_info where goods_id =#{goodsId}")
	  GoodsInfo getGoodsInfoById(@Param("goodsId") String goodsId  );

}
