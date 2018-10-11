package com.base.controller.login;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.user.UserAccountInfo;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.validator.AccountValidatorUtil;
/**
 * 
 * @author lzj
 * 
 *         签到页面
 * 
 */
@Controller
public class SignInController {
	 @Autowired
		private UserAccountInfoService userAccountInfoService;
		// 注册页面
		@RequestMapping(value = "signIn.do",method=RequestMethod.POST)
		public String signIn(HttpServletRequest request) {
			UserAccountInfo u = AccountValidatorUtil.accAvalidate(request,
					userAccountInfoService);
			// 验证用户登录信息
			if(u != null){
				String userName =u.getUserName();
				//判断用户当天是否签到
				if(!userAccountInfoService.isUserSignIn(userName)){
					userAccountInfoService.signIn(userName);
				}else{
					System.out.println("用户当天已签到!!");
					return null;
				}
			}
			return "home";
		}
		@RequestMapping(value = "my_account.do",method=RequestMethod.GET)
		public String myAccount(HttpServletRequest request) {
			UserAccountInfo u = AccountValidatorUtil.accAvalidate(request,
					userAccountInfoService);
			// 验证用户登录信息
			if(u != null){
				String userName =u.getUserName();
			Integer gold =	userAccountInfoService.getUserGold(userName);
                request.setAttribute("gold", gold);
			}
			return "my_account";
		}
}
