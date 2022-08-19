package com.model2.mvc.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.UploadFile;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;
import com.model2.mvc.service.uploadFile.UploadFileDao;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;
	
	@Autowired
	@Qualifier("uploadFileDaoImpl")
	private UploadFileDao uploadFileDao;
	
	public ReviewServiceImpl() {
	}

	@Override
	public void addReview(Review review) throws Exception {
		List<UploadFile> list = review.getFileList();
		if(list!=null) {
			for(UploadFile file : list) {
				uploadFileDao.addFile(file);
			}
		}
		reviewDao.addReview(review);
	}

	@Override
	public void deleteReview(int tranNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("refKey", tranNo);
		map.put("target", "review");
		uploadFileDao.deleteObject(map);
		reviewDao.deleteReview(tranNo);
	}

	@Override
	public Map<String, Object> getReviewList(Map<String, Object> map) throws Exception {
		map.put("list", reviewDao.getReviewList(map));
		map.put("totalCount", reviewDao.getTotalCount(map));
		return map;
	}

	@Override
	public void updateReview(Map<String, Object> map) throws Exception {
		List<String> deleteFileList = (List<String>)map.get("deleteFileList");
		if(deleteFileList!=null) {
			uploadFileDao.deleteFile(deleteFileList);
		}
		Review review = (Review)map.get("review");
		List<UploadFile> files = review.getFileList();
		if(files!=null) {
			for(UploadFile file : files) {
				uploadFileDao.addFile(file);
			}
		}
		reviewDao.updateReview(review);
	}

	@Override
	public Review getReview(int tranNo) throws Exception {
		return reviewDao.getReview(tranNo);
	}

}
