package com.model2.mvc.service.review.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;
	
	public ReviewServiceImpl() {
	}

	@Override
	public void addReview(Review review) throws Exception {
		reviewDao.addReview(review);
	}

	@Override
	public void deleteReview(int tranNo) throws Exception {
		reviewDao.deleteReview(tranNo);
	}

	@Override
	public Map<String, Object> getReviewList(Map<String, Object> map) throws Exception {
		map.put("list", reviewDao.getReviewList(map));
		map.put("totalCount", reviewDao.getTotalCount(map));
		return map;
	}

	@Override
	public void updateReview(Review review) throws Exception {
		reviewDao.updateReview(review);
	}

	@Override
	public Review getReview(int tranNo) throws Exception {
		return reviewDao.getReview(tranNo);
	}

}
