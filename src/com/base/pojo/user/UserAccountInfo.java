package com.base.pojo.user;

import java.io.Serializable;
import java.util.Date;

public class UserAccountInfo implements Serializable{
	
	/**
	 * 序列化是为了保证session 中对象不丢失。
	 */
	private static final long serialVersionUID = -7669915162369164897L;
	private Long id;
	private String userName;
	private String userPassword;
	private Integer isRealnameVerified;
	private Integer isLocked;
	private String safeQuestion1;
	private String safeAnswer1;
	private Date createTime;
	private Date lastVisitTime;
	private Long totalVisits;
	private Integer accountType;
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
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public Integer getIsRealnameVerified() {
		return isRealnameVerified;
	}
	public void setIsRealnameVerified(Integer isRealnameVerified) {
		this.isRealnameVerified = isRealnameVerified;
	}
	public Integer getIsLocked() {
		return isLocked;
	}
	public void setIsLocked(Integer isLocked) {
		this.isLocked = isLocked;
	}
	public String getSafeQuestion1() {
		return safeQuestion1;
	}
	public void setSafeQuestion1(String safeQuestion1) {
		this.safeQuestion1 = safeQuestion1;
	}
	public String getSafeAnswer1() {
		return safeAnswer1;
	}
	public void setSafeAnswer1(String safeAnswer1) {
		this.safeAnswer1 = safeAnswer1;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastVisitTime() {
		return lastVisitTime;
	}
	public void setLastVisitTime(Date lastVisitTime) {
		this.lastVisitTime = lastVisitTime;
	}
	public Long getTotalVisits() {
		return totalVisits;
	}
	public void setTotalVisits(Long totalVisits) {
		this.totalVisits = totalVisits;
	}
	public Integer getAccountType() {
		return accountType;
	}
	public void setAccountType(Integer accountType) {
		this.accountType = accountType;
	}
	
}
