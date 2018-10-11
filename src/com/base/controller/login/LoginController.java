package com.base.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.user.UserAccountInfo;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.MD5Utils;
import com.base.utils.validator.AccountValidatorUtil;
import com.base.utils.validator.CommonConst;

/**
 * 
 * @author lzj
 * 
 *         登录页面
 * 
 */
@Controller
public class LoginController {
	 @Autowired
	private UserAccountInfoService userAccountInfoService;
	private String errorMessage;
	@RequestMapping(value = "login.do")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "loginCrf.do", method = RequestMethod.POST)
	public String loginCrf(HttpServletRequest request,String username, String password) {
		HttpSession session = request.getSession();	 
		if(AccountValidatorUtil.isUsername(username)&&AccountValidatorUtil.isPassword(password)){
			UserAccountInfo uacc =new UserAccountInfo();
	    	uacc.setUserName(username);
	    	uacc.setUserPassword(MD5Utils.md5(password));
	    	int result =userAccountInfoService.loginCrf(uacc);
	    	System.out.println("登录状态："+result);
	    	if(result==CommonConst.SUCCESS){
	    		session.setAttribute("userAccountInfo", uacc);
	    		return "home";
	    	}
		}
		return "page-500";
	}
	@RequestMapping(value = "settings.do", method = RequestMethod.GET)
	public String settings(){
		return "address";
	}
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute("userAccountInfo");
		//session.removeAttribute("username");
		//session.removeAttribute("password");
		return "home";
	}
}