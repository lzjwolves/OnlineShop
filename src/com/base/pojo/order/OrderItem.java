package com.base.pojo.order;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderItem {
private Long id;
private String orderId;
private String userName;
private String receiver;
private String mobile;
private String address;
private Double totalPay;
private Integer payment;
private String remark;
private Integer state;
private Date createTime;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getReceiver() {
	return receiver;
}
public void setReceiver(String receiver) {
	this.receiver = receiver;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public Double getTotalPay() {
	return totalPay;
}
public void setTotalPay(Double totalPay) {
	this.totalPay = totalPay;
}
public Integer getPayment() {
	return payment;
}
public void setPayment(Integer payment) {
	this.payment = payment;
}
@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
public Date getCreateTime() {
	return createTime;
}
public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public Integer getState() {
	return state;
}
public void setState(Integer state) {
	this.state = state;
}

}
