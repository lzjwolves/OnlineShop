package com.base.controller.checkout;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.address.AddressDetailInfo;
import com.base.pojo.cart.CartItem;
import com.base.pojo.user.UserAccountInfo;
import com.base.service.address.AddressInfoService;
import com.base.service.cart.CartService;
import com.base.service.checkout.CheckoutService;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.validator.AccountValidatorUtil;
import com.base.utils.validator.CommonConst;

@Controller
public class CheckoutController {
	@Autowired
	private UserAccountInfoService userAccountInfoService;
	@Autowired
	private CheckoutService checkoutService;
	@Autowired
	private CartService cartService;
	@Autowired
	private AddressInfoService addressInfoService;

	@RequestMapping(value = "checkout.do", method = RequestMethod.POST)
	public String checkout(HttpServletRequest request, String json) {
		UserAccountInfo u = AccountValidatorUtil.accAvalidate(request,
				userAccountInfoService);
		// 验证用户登录信息
		if (u != null) {
			List<CartItem> checkoutList = new ArrayList<CartItem>();
			List<AddressDetailInfo> addressList = new ArrayList<AddressDetailInfo>();
			JSONArray jsonArray = JSONArray.fromObject(json);
			Double totalRealPrice = Double.parseDouble((jsonArray
					.getJSONObject(0).get("realPrice")).toString());

			for (int i = 0; i < jsonArray.size(); i++) {
				if (i != 0) {
					CartItem c = new CartItem();
					c.setUserName(u.getUserName());
					c.setGoodsId(jsonArray.getJSONObject(i).get("goods_id")
							.toString());
					c.setAmount(Integer.parseInt(jsonArray.getJSONObject(i)
							.get("amount").toString()));
					c.setPrice(Double.parseDouble(jsonArray.getJSONObject(i)
							.get("unit_price").toString()));
					c.setGoodsName(jsonArray.getJSONObject(i).get("goods_name")
							.toString());
					c.setImgUrl(jsonArray.getJSONObject(i).get("img_url")
							.toString());
					if (cartService.count(c.getUserName(), c.getGoodsId()) != null
							&& cartService.count(c.getUserName(),
									c.getGoodsId()) > 0) {
						checkoutList.add(c);
					}
				}
			}
			addressList = addressInfoService.getAddressListByUserName(u
					.getUserName());
			request.setAttribute("checkoutList", checkoutList);
			request.setAttribute("addressList", addressList);
			request.setAttribute("goldNum",userAccountInfoService.getUserGold(u.getUserName()));
		}

		return "checkout";
	}

	@RequestMapping(value = "checkoutCfm.do", method = RequestMethod.POST)
	public String checkoutCfm(HttpServletRequest request, String json) {
		// 0.验证用户，1.验证金额 2.查购物车，3.删除购物车 4.生成订单流水表
		UserAccountInfo u = AccountValidatorUtil.accAvalidate(request,
				userAccountInfoService);
		// 验证用户登录信息
		if (u != null) {
			List<CartItem> cartInfoList = new ArrayList<CartItem>();
			JSONArray jsonArray = JSONArray.fromObject(json);

			// 商品总价
			Double totalRealPrice = Double.parseDouble((jsonArray
					.getJSONObject(0).get("realPrice")).toString());
			// 查询用户金币余额
			Integer userGold = userAccountInfoService.getUserGold(u
					.getUserName());
			// 收货地址
			String address = jsonArray.getJSONObject(0).get("address")
					.toString();
			// 收货人
			String mobile = jsonArray.getJSONObject(0).get("mobile").toString();
			// 收货人联系电话
			String recipient = jsonArray.getJSONObject(0).get("recipient")
					.toString();
			//用戶备注
			String remark =jsonArray.getJSONObject(0).get("remark")
			.toString();
			if (userGold > totalRealPrice * CommonConst.RMBGOLDRATE) {
				for (int i = 0; i < jsonArray.size(); i++) {
					if (i != 0) {
						CartItem c = new CartItem();
						c.setUserName(u.getUserName());
						c.setGoodsId(jsonArray.getJSONObject(i).get("goods_id")
								.toString());
						c.setAmount(Integer.parseInt(jsonArray.getJSONObject(i)
								.get("amount").toString()));
						c.setPrice(Double.parseDouble(jsonArray
								.getJSONObject(i).get("unit_price").toString()));
						cartInfoList.add(c);
					}
				}
				checkoutService.checkout(cartInfoList, totalRealPrice,
						recipient, mobile, address,remark);
				request.removeAttribute("chckoutList");
			} else {
				System.out.println("checkoutCfm:用户余额不足！！");
				return null;
			}
		} else {
			System.out.println("checkoutCfm:用户还没登录!!");
			return null;
		}

		return "home";
	}

}
