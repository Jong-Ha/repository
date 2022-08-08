package com.model2.mvc.service.review.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;

@Repository("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
	}

	@Override
	public void addReview(Review review) throws Exception {
		sqlSession.insert("ReviewMapper.addReview", review);
	}

	@Override
	public void updateReview(Review review) throws Exception {
		sqlSession.update("ReviewMapper.updateReview", review);
	}

	@Override
	public void deleteReview(int tranNo) throws Exception {
		sqlSession.delete("ReviewMapper.deleteReview", tranNo);
	}

	@Override
	public List<Review> getReviewList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("ReviewMapper.getReviewList", map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getTotalCount", map);
	}

}
