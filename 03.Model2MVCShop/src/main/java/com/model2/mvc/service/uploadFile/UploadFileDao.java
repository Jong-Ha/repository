package com.model2.mvc.service.uploadFile;

import java.util.List;
import java.util.Map;

import com.model2.mvc.service.domain.UploadFile;

public interface UploadFileDao {
	
	public void addFile(UploadFile file) throws Exception ;
	
	public void deleteFile(List<String> list) throws Exception ;
	
	public void deleteObject(Map<String, Object> map) throws Exception ;
}
