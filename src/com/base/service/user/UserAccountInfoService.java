package com.base.service.user;

import com.base.pojo.user.UserAccountInfo;

public interface UserAccountInfoService {
	// 注册
	public int register(UserAccountInfo userAccountInfo);

	// 登录验证
	public int loginCrf(UserAccountInfo userAccountInfo);
	
	// 登录验证
	public int updateLoginRecord(String username);
	
	//获取用户金币数
	public Integer getUserGold(String username);
	
	//判断用户当天是否签到
	boolean isUserSignIn(String username);
	
	//签到
	void signIn(String userName);
	
}
