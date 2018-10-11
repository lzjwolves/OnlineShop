package com.base.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.base.pojo.user.UserAccountInfo;

public interface UserAccountInfoMappper {
	  @Select("SELECT * FROM user_account_info WHERE id = #{userId}")
	  UserAccountInfo getUser(@Param("userId") Long userId);
	  
	  @Insert("insert into user_account_info(user_name,user_password,is_realname_verified,is_locked,"
				+ "safe_question1,safe_answer1,create_time,last_visit_time,total_visits,account_type) values" +
				"(#{userName},#{userPassword},#{isRealnameVerified},#{isLocked},#{safeQuestion1}," +
				"#{safeAnswer1},#{createTime},#{lastVisitTime},#{totalVisits}, #{accountType})")
	  void insert(UserAccountInfo userAccountInfo);  
	  
	  
	  @Select("SELECT gold FROM user_account_info WHERE user_name = #{userName}")
	  Integer getUserGold(@Param("userName") String userName);
	  
	  
	 @Update("update  user_account_info set gold =gold+#{gold} WHERE user_name = #{userName}")
	 void addUserGold(@Param("userName") String userName,@Param("gold") Integer addNum);
}
