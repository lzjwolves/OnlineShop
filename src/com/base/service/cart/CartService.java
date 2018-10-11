package com.base.service.cart;

import java.util.List;

import com.base.pojo.cart.CartItem;

public interface CartService {
	
	void addTocart(CartItem cartItem);
	List<CartItem> getCartItemByUserName(String userName);
	void deleteFromCart(String userName,String goodsId);  
	Integer count(String username,String goodsId);
}
