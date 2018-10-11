package com.base.service.order;

import java.util.Date;
import java.util.List;

import com.base.pojo.order.OrderDetailInfo;
import com.base.pojo.order.OrderItem;

public interface OrderService {
	List<OrderItem> getOrderInfo(String userName,String beginTime,String endTime);
	List<OrderDetailInfo> getOrderDetailInfoList(String orderId);
   
}
