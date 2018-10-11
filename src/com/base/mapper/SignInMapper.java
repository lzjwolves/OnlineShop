package com.base.mapper;

import java.sql.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface SignInMapper {
	
	@Select("select count(*) from sign_in_info where user_name=#{userName} and sign_in_date =#{nowDate}")
	Integer isUserSignIn(@Param("userName")String username,@Param("nowDate")Date nowDate); 
	
	@Insert("insert into sign_in_info (user_name,sign_in_time,sign_in_date) select #{userName},now(),now()")
	void insert(@Param("userName")String username);

}
