package com.model2.mvc.service.review.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewService;

@Service("testReviewService")
public class TestReviewService implements ReviewService {

	public TestReviewService() {
	}

	@Override
	public void addReview(Review review) throws Exception {
		if(review.getProd().getProdNo()!=0) {
			if(review.getUserId()!=null) {
				if(review.getTranNo()!=0) {
					System.out.println(review.getGrade());
					System.out.println(review.getFileName());
					System.out.println(review.getDetail());
					System.out.println("addReview");
				}
			}
		}
	}

	@Override
	public void deleteReview(int tranNo) throws Exception {
		System.out.println(tranNo);
		System.out.println("deleteReview");
	}

	@Override
	public Map<String, Object> getReviewList(Map<String, Object> map) throws Exception {
		System.out.println("getReviewList");
		List<Review> list = new ArrayList<Review>();
		Review review = new Review();
		Product product = new Product();
		product.setProdNo(10011);
		product.setProdName("testProduct");
		product.setFileName("test img 颇老");
		product.setProdDetail("asdjfklasdlkasdhfkljasdhfkjlasdhfklasdhjkflasdjkfdajkflhk");
		review.setDetail("test侩 府轰");
		review.setFileName("test.jpg");
		review.setGrade(5);
		review.setProd(product);
		review.setRowNum(1);
		review.setTranNo(10000);
		review.setUserId("user09");
		review.setReviewDate(Date.valueOf("2022-08-08"));
		list.add(review);
		map.put("list", list);
		map.put("totalCount", 1);
		return map;
	}

	@Override
	public void updateReview(Review review) throws Exception {
		if(review.getTranNo()!=0) {
			System.out.println(review.getGrade());
			System.out.println(review.getFileName());
			System.out.println(review.getDetail());
			System.out.println("updateReview");
		}
	}

	@Override
	public Review getReview(int tranNo) throws Exception {
		Review review = new Review();
		Product product = new Product();
		product.setProdNo(10011);
		review.setDetail("test侩 府轰");
		product.setProdName("testProduct");
		product.setFileName("test img 颇老");
		review.setFileName("test.jpg");
		review.setGrade(5);
		review.setProd(product);
		review.setRowNum(1);
		review.setTranNo(10000);
		review.setUserId("user09");
		review.setReviewDate(Date.valueOf("2022-08-08"));
		return review;
	}

}
