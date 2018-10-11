package com.base.pojo.goods;

import java.util.Date;

public class GoodsInfo {
	private Long id;
	private String categoryId;
	private String goodsId;
	private String goodsName;
	private Double unitPrice;
	private Double currentPrice;
	private String currency;
	private Integer isSpecialPrice;
	private Integer isNew;
	private Integer isHot;
	private Long monthlySales;
	private Long totalSales;
	private Long inventory;
	private String imgUrl;
	private Integer isSell;
	private Date createTime;
	private String description;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Double getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Double currentPrice) {
		this.currentPrice = currentPrice;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public Integer getIsSpecialPrice() {
		return isSpecialPrice;
	}
	public void setIsSpecialPrice(Integer isSpecialPrice) {
		this.isSpecialPrice = isSpecialPrice;
	}
	public Integer getIsNew() {
		return isNew;
	}
	public void setIsNew(Integer isNew) {
		this.isNew = isNew;
	}
	public Integer getIsHot() {
		return isHot;
	}
	public void setIsHot(Integer isHot) {
		this.isHot = isHot;
	}
	public Long getMonthlySales() {
		return monthlySales;
	}
	public void setMonthlySales(Long monthlySales) {
		this.monthlySales = monthlySales;
	}
	public Long getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(Long totalSales) {
		this.totalSales = totalSales;
	}
	public Long getInventory() {
		return inventory;
	}
	public void setInventory(Long inventory) {
		this.inventory = inventory;
	}
	
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Integer getIsSell() {
		return isSell;
	}
	public void setIsSell(Integer isSell) {
		this.isSell = isSell;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
	
}
