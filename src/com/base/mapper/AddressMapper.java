package com.base.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.base.pojo.address.AddressDetailInfo;


public interface AddressMapper {
@Select("select id,user_name,recipient,mobile,province,city,district,street,zipcode,address,is_default,create_time "
		+"from address_detail_info where user_name=#{userName} order by is_default desc")
 List<AddressDetailInfo> getAddressListByUserName(@Param("userName") String userName);

@Insert("insert into address_detail_info(user_name,recipient,mobile,province,city,district,street,zipcode,address,is_default,create_time)" +
		"values(#{userName},#{recipient},#{mobile},#{province},#{city}," +
		"#{district},#{street},#{zipcode},#{address},#{isDefault},#{createTime})")
void insert(AddressDetailInfo addressDetailInfo);

@Delete("delete from address_detail_info where user_name=#{userName} and id =#{id}")
void delete(AddressDetailInfo addressDetailInfo);

@Update("update address_detail_info set recipient =#{recipient},mobile=#{mobile},address=#{address}" +
		" where user_name=#{userName} and id =#{id}")
void update(AddressDetailInfo addressDetailInfo);


@Update("update address_detail_info set is_default =1 where user_name=#{userName} and id =#{id}")
void setDefault_1(AddressDetailInfo addressDetailInfo);


@Update("update address_detail_info set is_default =0 where user_name=#{userName} and id <>#{id}")
void setDefault_0(AddressDetailInfo addressDetailInfo);



}
