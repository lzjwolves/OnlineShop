package com.base.utils.validator;

import java.net.URLDecoder;
import java.security.Timestamp;
import java.util.Iterator;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.base.pojo.user.UserAccountInfo;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.MD5Utils;

/**
 * 账户相关属性验证工具
 * 
 */
public class AccountValidatorUtil {
	/**
	 * 正则表达式：验证密码
	 */
	public static final String REGEX_PASSWORD = "^[a-zA-Z0-9]{6,20}$";

	/**
	 * 正则表达式：验证手机号
	 */
	public static final String REGEX_MOBILE = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";

	/**
	 * 正则表达式：验证邮箱
	 */
	public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";

	/**
	 * 正则表达式：验证汉字
	 */
	public static final String REGEX_CHINESE = "^[\u4e00-\u9fa5],{0,}$";

	/**
	 * 正则表达式：验证身份证
	 */
	public static final String REGEX_ID_CARD = "(^\\d{18}$)|(^\\d{15}$)";

	/**
	 * 正则表达式：验证URL
	 */
	public static final String REGEX_URL = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";

	/**
	 * 正则表达式：验证IP地址
	 */
	public static final String REGEX_IP_ADDR = "(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)";

	/**
	 * 校验用户名
	 * 
	 * @param username
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isUsername(String username) {
		if (username != null && !username.contains("@")) {
			return Pattern.matches(REGEX_MOBILE, username);
		}
		return username != null && Pattern.matches(REGEX_EMAIL, username);
	}

	public static void main(String args[]) {
String s ="[{\"realPrice\":\"34652.34\"},{\"goods_id\":\"040101153672634300000006\",\"amount\":\"3\",\"price\":\"28815.00\"}," +
		"{\"goods_id\":\"040101153672634300000002\",\"amount\":\"1\",\"price\":\"5837.34\"}]";
JSONArray jsonArray=JSONArray.fromObject(s);
//System.out.println(jsonArray.getJSONObject(0).get("realPrice"));
double price=0.00;
Integer i =(new Double(price)).intValue();
System.out.println(i==0);

			
	}

	/**
	 * 校验密码
	 * 
	 * @param password
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isPassword(String password) {
		return password != null && Pattern.matches(REGEX_PASSWORD, password);
	}

	/**
	 * 校验手机号
	 * 
	 * @param mobile
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isMobile(String mobile) {
		return mobile != null && Pattern.matches(REGEX_MOBILE, mobile);
	}

	/**
	 * 校验邮箱
	 * 
	 * @param email
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isEmail(String email) {
		return email != null && Pattern.matches(REGEX_EMAIL, email);
	}

	/**
	 * 校验汉字
	 * 
	 * @param chinese
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isChinese(String chinese) {
		return chinese != null && Pattern.matches(REGEX_CHINESE, chinese);
	}

	/**
	 * 校验身份证
	 * 
	 * @param idCard
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isIDCard(String idCard) {
		return idCard != null && Pattern.matches(REGEX_ID_CARD, idCard);
	}

	/**
	 * 校验URL
	 * 
	 * @param url
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isUrl(String url) {
		return url != null && Pattern.matches(REGEX_URL, url);
	}

	/**
	 * 校验IP地址
	 * 
	 * @param ipAddr
	 * @return
	 */
	public static boolean isIPAddr(String ipAddr) {
		return ipAddr != null && Pattern.matches(REGEX_IP_ADDR, ipAddr);
	}

/**
 * 校验用户登录信息
 * 
 * 
 * @param request
 * @param userAccountInfoService
 * @return 验证成功返回UserAccountInfo 验证失败返回null
 */
	public static UserAccountInfo accAvalidate(HttpServletRequest request,
			UserAccountInfoService userAccountInfoService) {
		HttpSession session = request.getSession(false);
		UserAccountInfo u = new UserAccountInfo();
		if (session != null) {
			u = (UserAccountInfo) session.getAttribute("userAccountInfo");
			if (u != null) {
				if (AccountValidatorUtil.isUsername(u.getUserName())) {
					int result = userAccountInfoService.loginCrf(u);
					if (result == CommonConst.SUCCESS) {
						return u;
					}
				}
			}
		}
		Cookie[] cookies = request.getCookies();
		String username = "";
		String password = "";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("username")) {
					username = URLDecoder.decode(cookies[i].getValue());// 获取用户名
				}
				if (cookies[i].getName().equals("password")) {
					password = URLDecoder.decode(cookies[i].getValue());// 获取密码
				}
			}
			if (AccountValidatorUtil.isUsername(username)
					&& AccountValidatorUtil.isPassword(password)) {
				UserAccountInfo u2 = new UserAccountInfo();
				u2.setUserName(username);
				u2.setUserPassword(MD5Utils.md5(password));
				int result = userAccountInfoService.loginCrf(u2);
				if (result == CommonConst.SUCCESS) {
					//session.setAttribute("userAccountInfo", u2);
					return u2;
				}
			}
		}

		return null;
	}
}