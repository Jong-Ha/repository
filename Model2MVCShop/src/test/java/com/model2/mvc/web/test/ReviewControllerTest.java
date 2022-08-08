package com.model2.mvc.web.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml", "classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class ReviewControllerTest {

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService service;
	
	public ReviewControllerTest() {
	}
	
//	@Test
	public void addReview() throws Exception {
		Review review = new Review();
		review.setTranNo(10000);
		review.setProdNo(10011);
		review.setUserId("user09");
		review.setFileName("asdf.jpg");
		review.setGrade(5);
		review.setDetail("test용 리뷰입니다.");
		
		service.addReview(review);
	}
	
//	@Test
	public void deleteReview() throws Exception {
		service.deleteReview(10000);
	}
	
//	@Test
	public void updateReview() throws Exception {
		Review review = new Review();
		review.setTranNo(10000);
		review.setFileName("qwer.jpg");
		review.setGrade(3.5);
		review.setDetail("test용 수정된 리뷰입니다.");
		
		service.updateReview(review);
	}
	
//	@Test
	public void getReviewList() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setPageUnit(5);
		int prodNo = 10011;
		
		map.put("search", search);
		map.put("prodNo", prodNo);
		
		service.getReviewList(map);
		
		System.out.println(map.get("search"));
		System.out.println("\n================================\n");
		System.out.println(map.get("totalCount"));
		System.out.println("\n================================\n");
		System.out.println(map.get("list"));
		
	}

}
