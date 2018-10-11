package com.base.service.order;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.base.mapper.OrderMapper;
import com.base.pojo.order.OrderDetailInfo;
import com.base.pojo.order.OrderItem;
@Service
public class OrderServiceImpl implements OrderService{
@Resource
private OrderMapper orderMapper;
	@Override
	public List<OrderItem> getOrderInfo(String userName, String beginTime,
			String endTime) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderInfo(userName, beginTime, endTime);
	}

	@Override
	public List<OrderDetailInfo> getOrderDetailInfoList(String orderId) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderDetailInfoList(orderId);
	}
	
	

}
