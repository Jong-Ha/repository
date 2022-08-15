package com.model2.mvc.service.impl.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class CartSqlTest {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//@Test
	public void checkCart() {
		Cart cart = new Cart();
		Product prod = new Product();

		prod.setProdNo(10000);
		cart.setUserId("user09");
		prod.setProdName("vaio vgn FS70B");
		prod.setProdDetail("소니 바이오 노트북 신동품");
		prod.setPrice(2000000);
		cart.setAmount(1);
		cart.setProd(prod);
		
		Integer i = sqlSession.selectOne("CartMapper.checkCart", cart);
		System.out.println("\n\n\n");
		System.out.println(i);
		System.out.println("\n\n\n");
		
		if(i==null) {
			sqlSession.insert("CartMapper.addCart", cart);
		}else {
			cart.setCartNo(i);
			sqlSession.update("CartMapper.updateCart", cart);
		}
		
	}
	
	//@Test
	public void getCartList() {
		String userId = "user09";

		List<Cart> list = sqlSession.selectList("CartMapper.getCartList", userId);

		System.out.println("\n\n\n");
		System.out.println(list);
		System.out.println("\n\n\n");
	}

}
