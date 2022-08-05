package com.model2.mvc.service.cart.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.cart.CartDao;
import com.model2.mvc.service.domain.Cart;

@Repository("cartDaoImpl")
public class CartDaoImpl implements CartDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CartDaoImpl() {
	}

	@Override
	public Integer checkCart(Cart cart) throws Exception {
		return sqlSession.selectOne("CartMapper.checkCart", cart);
	}

	@Override
	public Integer checkProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("CartMapper.checkProduct",prodNo);
	}

	@Override
	public void addCart(Cart cart) throws Exception {
		sqlSession.insert("CartMapper.addCart", cart);
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		sqlSession.update("CartMapper.updateCart", cart);
	}

	@Override
	public void deleteCart(int cartNo) throws Exception {
		sqlSession.delete("CartMapper.deleteCart", cartNo);
	}

	@Override
	public void deleteCart(List<Integer> list) throws Exception {
		sqlSession.delete("CartMapper.deleteCartList", list);
	}

	@Override
	public List<Cart> getCartList(String userId) throws Exception {
		return sqlSession.selectList("CartMapper.getCartList", userId);
	}

}
