package com.base.pojo.page;

public class PageInfo {
private Integer curentPage;
private Integer tagetPage;
private Integer maxLine;
private Boolean isAsc;
public Integer getCurentPage() {
	return curentPage;
}
public void setCurentPage(Integer curentPage) {
	this.curentPage = curentPage;
}
public Integer getTagetPage() {
	return tagetPage;
}
public void setTagetPage(Integer tagetPage) {
	this.tagetPage = tagetPage;
}
public Integer getMaxLine() {
	return maxLine;
}
public void setMaxLine(Integer maxLine) {
	this.maxLine = maxLine;
}
public Boolean getIsAsc() {
	return isAsc;
}
public void setIsAsc(Boolean isAsc) {
	this.isAsc = isAsc;
}

}
