package com.model2.mvc.service.domain;

import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	
	private int refKey;
	private String fileName;
	private String originalFileName;
	private String path;
	private long size;
	private String imageType;

	public UploadFile() {
	}
	public UploadFile(MultipartFile mf) {
		this.originalFileName = mf.getOriginalFilename();
		this.size = mf.getSize();
		this.fileName = UUID.randomUUID().toString() + mf.getOriginalFilename();
	}

	public int getRefKey() {
		return refKey;
	}

	public void setRefKey(int refKey) {
		this.refKey = refKey;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getImageType() {
		return imageType;
	}
	public void setImageType(String imageType) {
		this.imageType = imageType;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UploadFile [refKey=");
		builder.append(refKey);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", originalFileName=");
		builder.append(originalFileName);
		builder.append(", path=");
		builder.append(path);
		builder.append(", size=");
		builder.append(size);
		builder.append(", imageType=");
		builder.append(imageType);
		builder.append("]");
		return builder.toString();
	}

}
