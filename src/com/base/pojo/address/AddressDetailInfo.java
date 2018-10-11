package com.base.pojo.address;

import java.util.Date;

public class AddressDetailInfo {
private Long id;
private String userName;
private String recipient;
private String mobile;
private String province;
private String city;
private String district;
private String street;
private String zipcode;
private String address;
private Integer isDefault;
private Date createTime;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getRecipient() {
	return recipient;
}
public void setRecipient(String recipient) {
	this.recipient = recipient;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getProvince() {
	return province;
}
public void setProvince(String province) {
	this.province = province;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getDistrict() {
	return district;
}
public void setDistrict(String district) {
	this.district = district;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public String getZipcode() {
	return zipcode;
}
public void setZipcode(String zipcode) {
	this.zipcode = zipcode;
}
public Integer getIsDefault() {
	return isDefault;
}
public void setIsDefault(Integer isDefault) {
	this.isDefault = isDefault;
}
public Date getCreateTime() {
	return createTime;
}
public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

}
