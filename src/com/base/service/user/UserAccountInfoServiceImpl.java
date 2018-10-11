package com.base.service.user;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import com.base.dao.user.UserAccountInfoDAO;
import com.base.mapper.SignInMapper;
import com.base.mapper.UserAccountInfoMappper;
import com.base.pojo.user.UserAccountInfo;
import com.base.pojo.user.UserAccountInfo;
import com.base.utils.validator.CommonConst;

@Service
public class UserAccountInfoServiceImpl implements UserAccountInfoService {
	@Resource
	private UserAccountInfoDAO userAccountInfoDAO;
	 @Resource
	 private UserAccountInfoMappper userAccountInfoMappper;
	 @Resource
	private SignInMapper signInMapper;
	@Transactional
	// 事物管控
	@Override
	public int register(UserAccountInfo userAccountInfo) {
		if (userAccountInfoDAO
				.isUserAccountExist(userAccountInfo.getUserName())) {
			return CommonConst.FAIL;
		}
		try {
			userAccountInfoDAO.insertUserAccountInfo(userAccountInfo);
			// userAccountInfoMappper.insert(userAccountInfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return CommonConst.SUCCESS;
	}

	@Transactional
	// 事物管控
	@Override
	public int loginCrf(UserAccountInfo userAccountInfo) {
		String username = userAccountInfo.getUserName();
		String password = userAccountInfo.getUserPassword();
		try {
			if (userAccountInfoDAO.isPasswordCorrect(username, password)) {
				if (!userAccountInfoDAO.isUserAccountLocked(username)) {
					return CommonConst.SUCCESS;
				}
				return CommonConst.USERLOCKED;
			}
			return CommonConst.INVALIDNAMEORPWD;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	@Transactional
	// 事物管控
	@Override
	public int updateLoginRecord(String username) {
		// TODO Auto-generated method stub
		userAccountInfoDAO.updateLoginRecord(username);
		return 0;
	}

	@Override
	public Integer getUserGold(String username) {
		// TODO Auto-generated method stub
		return userAccountInfoMappper.getUserGold(username);
	}
	@Transactional
	@Override
	public boolean isUserSignIn(String username) {
		java.sql.Date nowDate= new java.sql.Date(new java.util.Date().getTime());
		Integer count =signInMapper.isUserSignIn(username, nowDate);
		if(count==null||count==0){
			return false;
		}else{
			return true;
		}
	}
	@Transactional
	@Override
	public void signIn(String userName) {
		// TODO Auto-generated method stub
		try{
		signInMapper.insert(userName);
		userAccountInfoMappper.addUserGold(userName, CommonConst.GOLD_FOR_SIGNIN);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}
