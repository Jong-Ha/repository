package com.model2.mvc.service.domain;

import java.sql.Date;

public class Review {
	
	private int tranNo;
	private int prodNo;
	private String userId;
	private String fileName;
	private double grade;
	private String detail;
	private Date reviewDate;
	private int rowNum;

	public Review() {
	}
	public int getTranNo() {
		return tranNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Review [tranNo=");
		builder.append(tranNo);
		builder.append(", prodNo=");
		builder.append(prodNo);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", detail=");
		builder.append(detail);
		builder.append(", reviewDate=");
		builder.append(reviewDate);
		builder.append(", rowNum=");
		builder.append(rowNum);
		builder.append("]");
		return builder.toString();
	}

}
