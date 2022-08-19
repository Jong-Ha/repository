package com.model2.mvc.service.review;

import java.util.Map;

import com.model2.mvc.service.domain.Review;

public interface ReviewService {
	
	public void addReview(Review review) throws Exception;
	
	public void deleteReview(int tranNo) throws Exception;

	public Map<String, Object> getReviewList(Map<String, Object> map) throws Exception;
	
	public void updateReview(Map<String, Object> map) throws Exception;
	
	public Review getReview(int tranNo) throws Exception;

}
