package com.model2.mvc.common;


public class Search {
	
	private int currentPage;
	String searchCondition;
	String searchKeyword;
	int pageSize;
	int pageUnit;
	String tranCondition;
	String prodListCondition;
	int minPrice;
	int maxPrice;
	String checkSoldOut;
	
	public Search(){
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getTranCondition() {
		return tranCondition;
	}
	public void setTranCondition(String tranCondition) {
		this.tranCondition = tranCondition;
	}
	public String getProdListCondition() {
		return prodListCondition;
	}
	public void setProdListCondition(String prodListCondition) {
		this.prodListCondition = prodListCondition;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public String getCheckSoldOut() {
		return checkSoldOut;
	}
	public void setCheckSoldOut(String checkSoldOut) {
		this.checkSoldOut = checkSoldOut;
	}
	@Override
	public String toString() {
		return "Search [currentpage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", pageUnit=" + pageUnit + ", tranCondition=" + tranCondition
				+ ", prodListCondition=" + prodListCondition + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice
				+ ", checkSoldOut=" + checkSoldOut + "]";
	}
}