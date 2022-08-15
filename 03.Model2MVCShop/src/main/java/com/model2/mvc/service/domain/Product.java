package com.model2.mvc.service.domain;

import java.sql.Date;
import java.util.List;


public class Product {

	private UploadFile mainFile;
	private List<UploadFile> extraFileList;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;
	private int rowNum;
	private int amount;
	private float prodGrade;
	
	public Product(){
	}
	
	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public UploadFile getMainFile() {
		return mainFile;
	}

	public void setMainFile(UploadFile mainFile) {
		this.mainFile = mainFile;
	}

	public List<UploadFile> getExtraFileList() {
		return extraFileList;
	}
	public void setExtraFileList(List<UploadFile> extraFileList) {
		this.extraFileList = extraFileList;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public float getProdGrade() {
		return prodGrade;
	}

	public void setProdGrade(float prodGrade) {
		this.prodGrade = prodGrade;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Product [mainFile=");
		builder.append(mainFile);
		builder.append(", extraFileList=");
		builder.append(extraFileList);
		builder.append(", manuDate=");
		builder.append(manuDate);
		builder.append(", price=");
		builder.append(price);
		builder.append(", prodDetail=");
		builder.append(prodDetail);
		builder.append(", prodName=");
		builder.append(prodName);
		builder.append(", prodNo=");
		builder.append(prodNo);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append(", proTranCode=");
		builder.append(proTranCode);
		builder.append(", rowNum=");
		builder.append(rowNum);
		builder.append(", amount=");
		builder.append(amount);
		builder.append(", prodGrade=");
		builder.append(prodGrade);
		builder.append("]");
		return builder.toString();
	}
}