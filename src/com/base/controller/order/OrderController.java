package com.base.controller.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.order.OrderDetailInfo;
import com.base.pojo.order.OrderItem;
import com.base.pojo.user.UserAccountInfo;
import com.base.service.order.OrderService;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.validator.AccountValidatorUtil;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserAccountInfoService userAccountInfoService;
@RequestMapping(value="order.do",method=RequestMethod.GET)
 String  getOrderInfo(HttpServletRequest request,String beginTime, String endTime){
	List<OrderItem> orderItemList =new ArrayList<OrderItem>();
	UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
	if(u!=null){
		String userName =u.getUserName();
		if(beginTime!=null&&beginTime!=null){
			orderItemList =orderService.getOrderInfo(userName, beginTime, endTime);
		}else{
			//默认查询 最近3个月的订单
			Date dNow = new Date();   //当前时间  
		    Date dBefore = new Date();  
		    Calendar calendar = Calendar.getInstance(); //得到日历  
		    calendar.setTime(dNow);//把当前时间赋给日历  
		    calendar.add(Calendar.MONTH, -3);  //设置为前3月  
		    dBefore = calendar.getTime();   //得到前3月的时间  
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式  
		    String defaultStartDate = sdf.format(dBefore);    //格式化前3月的时间  
		    String defaultEndDate = sdf.format(dNow); //格式化当前时间
		    System.out.println(userName);
		    System.out.println(defaultStartDate);
		    System.out.println(defaultEndDate);
		    orderItemList =orderService.getOrderInfo(userName, defaultStartDate, defaultEndDate);
		}	
	}
	request.setAttribute("orderItemList", orderItemList);
	return "order";
}

@RequestMapping(value="order_detail.do",method=RequestMethod.GET)
String  getOrderDetailInfo(HttpServletRequest request,String orderId){
	List<OrderDetailInfo> orderDetailInfoList =new ArrayList<OrderDetailInfo>();
	UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
	if(u!=null){
		orderDetailInfoList =orderService.getOrderDetailInfoList(orderId);
		}else{
			System.out.println("getOrderDetailInfo：用户还没登录");
		}	
	request.setAttribute("orderDetailInfoList", orderDetailInfoList);
	return "order_detail";
}
}
