package com.model2.mvc.service.uploadFile.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.UploadFile;
import com.model2.mvc.service.uploadFile.UploadFileDao;

@Repository("uploadFileDaoImpl")
public class UploadFileDaoImpl implements UploadFileDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;


	public UploadFileDaoImpl() {
	}

	@Override
	public void addProdFile(UploadFile file) throws Exception {
		sqlSession.insert("UploadFileMapper.addFile", file);
	}
	
	@Override
	public void deleteProdFile(Map<String, Object> map) throws Exception {
		sqlSession.delete("UploadFileMapper.deleteFile", map);
	}

	@Override
	public void addReviewFile(UploadFile file) throws Exception {
	}
	
	@Override
	public void deleteReviewFile(Map<String, Object> map) throws Exception {
	}

}
