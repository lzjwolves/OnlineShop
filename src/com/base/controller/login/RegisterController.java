package com.base.controller.login;

import java.util.Date;

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
 *         注册页面
 * 
 */
@Controller
public class RegisterController {
	 @Autowired
	private UserAccountInfoService userAccountInfoService;
	// 注册页面
	@RequestMapping(value = "register.do")
	public String register() {
		return "register";
	}

	// 注册提交表单验证
	@RequestMapping(value = "registerCrf.do", method = RequestMethod.POST)
	public String registerCrf(String username, String password,HttpSession session) {
		if(AccountValidatorUtil.isUsername(username)&&AccountValidatorUtil.isPassword(password)){
			UserAccountInfo uacc =new UserAccountInfo();
	    	uacc.setUserName(username);
	    	uacc.setUserPassword(MD5Utils.md5(password));
	    	uacc.setIsRealnameVerified(0);
	    	uacc.setIsLocked(0);
	    	uacc.setSafeQuestion1("");
	    	uacc.setSafeAnswer1("");
	    	uacc.setCreateTime(new Date());
	    	uacc.setLastVisitTime(new Date());
	    	uacc.setTotalVisits((long) 0);
	    	uacc.setAccountType(username.contains("@")?1:0);
	    	int result =userAccountInfoService.register(uacc);
	    	if(result==CommonConst.SUCCESS){
	    		session.setAttribute("userAccountInfo", uacc);
	    		return "home";
	    	}
		}
		return "page-500";
	}
}