package com.base.controller.cart;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.cart.CartItem;
import com.base.pojo.user.UserAccountInfo;
import com.base.service.cart.CartService;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.validator.AccountValidatorUtil;
import com.base.utils.validator.CommonConst;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private UserAccountInfoService userAccountInfoService;
	
	@RequestMapping(value = "common_part/add_to_cart.do", method = RequestMethod.GET)
	public String  cartUpdate(HttpServletRequest request,String goodsId, Integer amount){
		 List<CartItem> cartItemList =new ArrayList<CartItem>();
		String username="";
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		 if(u!=null){
			 username=u.getUserName();
			 CartItem cartItem = new CartItem();
			// 用户放东西在购物车了
				if (goodsId != null && amount != null) {

						// 验证商品id是否存在
						// 以后再补充
						cartItem.setUserName(username);
						cartItem.setGoodsId(goodsId);
						cartItem.setAmount(amount);
						cartService.addTocart(cartItem);
				}
				//JSONArray json =JSONArray.fromObject(cartItemList);
		     //  System.out.println(json);
				cartItemList =	cartService.getCartItemByUserName(username);
		       request.setAttribute("cartItemList", cartItemList);
		       return "common_part/add_to_cart";
		}else{
				return null;
		 } 
		
	}
	@RequestMapping(value = "common_part/deleteItem.do", method = RequestMethod.POST)
	public String  cartDelete(HttpServletRequest request,String goodsId){
		String username="";
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		 if(u!=null){
			 if(userAccountInfoService.loginCrf(u)==CommonConst.SUCCESS){
				 username=u.getUserName(); 
				 cartService.deleteFromCart(username, goodsId);
			 }else{
				 System.out.println("delete from cart:用户密码不正确或非法侵入！");
			 } 
		 }else{
			 System.out.println("用户还没登录");
		 }
		return "common_part/add_to_cart";
	}
	@RequestMapping(value = "shopping_cart.do", method = RequestMethod.GET)
	public String  shoppingCart(HttpServletRequest request){
		String username="";
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		 if(u!=null){
			 if(userAccountInfoService.loginCrf(u)==CommonConst.SUCCESS){
				 username=u.getUserName();
				 List<CartItem> cartItemList =new ArrayList<CartItem>();
				 cartItemList =	cartService.getCartItemByUserName(username);
			     request.setAttribute("cartItemList", cartItemList);
			 }else{
				 System.out.println("查看购物车:用户密码不正确或非法侵入！");
			 } 
		 }else{
			 System.out.println("用户还没登录");
		 }
		return "shopping_cart";
	}
	
}
