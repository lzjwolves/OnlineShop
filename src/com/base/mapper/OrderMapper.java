package com.base.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.base.pojo.order.OrderDetailInfo;
import com.base.pojo.order.OrderItem;

public interface OrderMapper {
	@Insert("insert into order_item (order_id,user_name,receiver,mobile,address,total_pay,payment,create_time,remark,state)" +
			" select #{orderId},#{userName},#{receiver},#{mobile},#{address},#{totalPay},#{payment},#{createTime},#{remark},#{state}")
	void insertOrderItem(OrderItem orderItem);
	
	
	@Insert("insert into order_detail_info(order_id,goods_id,goods_name,price,currency,amount,img_url,create_time)" +
			" select #{orderId},#{goodsId},goods_name,current_price,currency,#{amount},img_url,#{createTime}  from goods_info where goods_id =#{goodsId}")
	void insertOrderDetailInfo(OrderDetailInfo orderDetailInfo);
	
	@Select("select * from order_item where user_name=#{userName} and create_time> #{beginTime}" +
			" order by create_time desc")
	List<OrderItem> getOrderInfo(@Param("userName") String userName,@Param("beginTime") String beginTime,
			String endTime);
	
	@Select("select * from order_detail_info where order_id=#{orderId}")
	List<OrderDetailInfo> getOrderDetailInfoList(@Param("orderId") String orderId);

}
