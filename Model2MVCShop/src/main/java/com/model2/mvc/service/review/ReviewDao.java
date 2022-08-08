package com.model2.mvc.service.review;

import java.util.List;
import java.util.Map;

import com.model2.mvc.service.domain.Review;

public interface ReviewDao {
	
	public void addReview(Review review) throws Exception ;
	
	public void updateReview(Review review) throws Exception ;
	
	public void deleteReview(int tranNo) throws Exception ;

	public List<Review> getReviewList(Map<String, Object> map) throws Exception ;
	
	public int getTotalCount(Map<String, Object> map) throws Exception ;

}
