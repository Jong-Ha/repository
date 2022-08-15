package com.model2.mvc.service.uploadFile;

import java.util.Map;

import com.model2.mvc.service.domain.UploadFile;

public interface UploadFileDao {
	
	public void addProdFile(UploadFile file) throws Exception ;
	
	public void deleteProdFile(Map<String, Object> map) throws Exception ;
	
	public void addReviewFile(UploadFile file) throws Exception ;
	
	public void deleteReviewFile(Map<String, Object> map) throws Exception ;
}
