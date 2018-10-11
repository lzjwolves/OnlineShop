package com.base.dao.user;

import com.base.pojo.user.UserAccountInfo;

public interface UserAccountInfoDAO {

	public boolean isUserAccountExist(String username);

	public int insertUserAccountInfo(UserAccountInfo userAccountInfo);

	public boolean isPasswordCorrect(String username, String password);

	public boolean isUserAccountLocked(String username);

	public void updateLoginRecord(String username);

}
