package com.model2.mvc.service.uploadFile.impl;

import java.util.List;
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
	public void addFile(UploadFile file) throws Exception {
		sqlSession.insert("UploadFileMapper.addFile", file);
	}
	
	@Override
	public void deleteFile(List<String> list) throws Exception {
		sqlSession.delete("UploadFileMapper.deleteFile", list);
	}

	@Override
	public void deleteObject(Map<String, Object> map) throws Exception {
		sqlSession.delete("UploadFileMapper.deleteObject", map);
		
	}

}
