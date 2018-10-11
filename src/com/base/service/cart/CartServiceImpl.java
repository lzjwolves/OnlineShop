package com.base.service.cart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.mapper.CartMapper;
import com.base.pojo.cart.CartItem;

@Service
public class CartServiceImpl implements  CartService{
	@Resource
	private CartMapper cartMapper;
	@Transactional
	@Override
	public void addTocart(CartItem cartItem) {
		try{
		Integer num =cartMapper.count(cartItem.getUserName(), cartItem.getGoodsId());
		if(num==null||num==0){
			cartMapper.insert(cartItem);
		}
		else{
			cartItem.setAmount(num+cartItem.getAmount());
			cartMapper.updateAmount(cartItem);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@Transactional
	@Override
	public  List<CartItem> getCartItemByUserName(String userName) {
		// TODO Auto-generated method stub
		return cartMapper.getCartItemByUserName(userName);
	}
	@Override
	public void deleteFromCart(String userName, String goodsId) {
		try{
		cartMapper.delete(userName, goodsId);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@Transactional
	@Override
	public Integer count(String username, String goodsId) {
		// TODO Auto-generated method stub
		return cartMapper.count(username, goodsId);
	}

}
