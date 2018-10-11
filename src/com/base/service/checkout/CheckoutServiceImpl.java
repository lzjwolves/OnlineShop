package com.base.service.checkout;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.base.mapper.CartMapper;
import com.base.mapper.GoodsMapper;
import com.base.mapper.OrderMapper;
import com.base.mapper.UserAccountInfoMappper;
import com.base.pojo.cart.CartItem;
import com.base.pojo.order.OrderDetailInfo;
import com.base.pojo.order.OrderItem;
import com.base.utils.CommonUtil;
import com.base.utils.validator.CommonConst;
@Service
public class CheckoutServiceImpl implements CheckoutService{
	@Resource
	private CartMapper cartMapper;
	@Resource
	private OrderMapper orderMapper;
	@Resource
	private UserAccountInfoMappper userAccountInfoMappper;
	@Resource
	private GoodsMapper goodsMapper;
	@Override
	@Transactional(rollbackFor={RuntimeException.class, Exception.class})
	public void checkout(List<CartItem> cartInfoList,Double totalPrice,String recipient,String mobile,String address,String remark) {
		String orderId =CommonUtil.generateOderId();
		Date nowTime =new Date();
		try{
			//1.先插入订单表
			OrderItem orderItem =new OrderItem();
			orderItem.setUserName(cartInfoList.get(0).getUserName());
			orderItem.setOrderId(orderId);
			orderItem.setTotalPay(totalPrice);
			orderItem.setAddress(address);
			orderItem.setMobile(mobile);
			orderItem.setReceiver(recipient);
			orderItem.setPayment(0);
			orderItem.setState(0);
			orderItem.setRemark(remark);
			orderItem.setCreateTime(nowTime);
			
			orderMapper.insertOrderItem(orderItem);
			//2.插入订单明细表
			for(int i=0;i<cartInfoList.size();i++){
				OrderDetailInfo o =new  OrderDetailInfo();
				o.setCreateTime(nowTime);
				o.setOrderId(orderId);
				o.setCurrency(cartInfoList.get(i).getCurrency());
				o.setGoodsId(cartInfoList.get(i).getGoodsId());
				o.setGoodsName(cartInfoList.get(i).getGoodsName());
				o.setAmount(cartInfoList.get(i).getAmount());
				o.setPrice(cartInfoList.get(i).getPrice());
				orderMapper.insertOrderDetailInfo(o);
			}
			//3.扣除用户金币
			userAccountInfoMappper.addUserGold(cartInfoList.get(0).getUserName(), (int)-totalPrice*CommonConst.RMBGOLDRATE);
			//4.删除相应的购物车信息 并更新库存量
			for(int i=0;i<cartInfoList.size();i++){
				cartMapper.delete(cartInfoList.get(i).getUserName(), cartInfoList.get(i).getGoodsId());
				goodsMapper.updateInventory(cartInfoList.get(i).getGoodsId(), -cartInfoList.get(i).getAmount());
			}
			}catch(Exception e){
				e.printStackTrace();
				throw new RuntimeException();
			}
		
	}

}
