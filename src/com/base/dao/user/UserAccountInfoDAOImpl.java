package com.base.dao.user;

import java.util.Date;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.base.pojo.user.UserAccountInfo;

@Repository
public class UserAccountInfoDAOImpl extends JdbcDaoSupport implements
		UserAccountInfoDAO {
	/**
	 * 获取数据源
	 * 
	 * @param dataSource
	 *            来源于 bean.xml配置文件的dataSource
	 */
	@Resource
	public final void setJdbcDaoDataSource(DataSource dataSource) {
		super.setDataSource(dataSource);
	}

	@Override
	public int insertUserAccountInfo(UserAccountInfo userAccountInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into user_account_info(user_name,user_password,is_realname_verified,is_locked,"
				+ "safe_question1,safe_answer1,create_time,last_visit_time,total_visits,account_type) values(?,?,?,?,?,?,?,?,?,?)";
		int retValue = this.getJdbcTemplate().update(sql,
				userAccountInfo.getUserName(), userAccountInfo.getUserPassword(),
				userAccountInfo.getIsRealnameVerified(),
				userAccountInfo.getIsLocked(),
				userAccountInfo.getSafeQuestion1(),
				userAccountInfo.getSafeAnswer1(),
				userAccountInfo.getCreateTime(),
				userAccountInfo.getLastVisitTime(),
				userAccountInfo.getTotalVisits(),
				userAccountInfo.getAccountType());
		// 抛出异常 测试是否回滚
		// int a = 1/0;
		return retValue;
	}

	@Override
	public boolean isUserAccountExist(String username) {
		// TODO Auto-generated method stub
		String sql = "select 1 from user_account_info where user_name=?";
		return this.getJdbcTemplate().queryForList(sql, username).size() != 0;
	}

	@Override
	public boolean isPasswordCorrect(String username, String password) {
		String sql = "select 1 from user_account_info where user_name=? and user_password=?";
		// TODO Auto-generated method stub
		return this.getJdbcTemplate().queryForList(sql, username, password)
				.size() != 0;
	}

	@Override
	public boolean isUserAccountLocked(String username) {
		String sql = "select 1 from user_account_info where user_name=? and is_locked=1";
		// TODO Auto-generated method stub
		return this.getJdbcTemplate().queryForList(sql, username).size() != 0;
	}

	@Override
	public void updateLoginRecord(String username) {
		String sql = "update user_account_info set last_visit_time =?,total_visits=total_visits+1 where user_name=?";
		// TODO Auto-generated method stub
	    this.getJdbcTemplate().update(sql, new Date(),username);
	}
}
