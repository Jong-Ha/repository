package com.model2.mvc.service.domain;

import java.sql.Date;
import java.util.List;

public class Review {
	
	private int tranNo;
	private Product prod;
	private String userId;
	private List<UploadFile> FileList;
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
	public Product getProd() {
		return prod;
	}
	public void setProd(Product prod) {
		this.prod = prod;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<UploadFile> getFileList() {
		return FileList;
	}
	public void setFileList(List<UploadFile> fileList) {
		FileList = fileList;
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
		builder.append(", prod=");
		builder.append(prod);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", FileList=");
		builder.append(FileList);
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
