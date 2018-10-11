package com.base.service.checkout;

import java.util.List;

import com.base.pojo.cart.CartItem;

public interface CheckoutService {
 void checkout(List<CartItem> cartList,Double totalPrice,String recipient,String mobile,String address,String remark);
}
