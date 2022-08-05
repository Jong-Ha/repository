package com.model2.mvc.service.impl.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class PurchaseSqlTest {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//@Test
	public void testAdd() {
		Purchase p = new Purchase();
		User user = new User();
		Product product = new Product();
		user.setUserId("user02");
		product.setProdNo(10007);
		
		p.setBuyer(user);
		p.setPurchaseProd(product);
		
	 	Assert.assertEquals(1, sqlSession.insert("PurchaseMapper.addPurchase",p));
	}
	
	//@Test
	public void testUpdateCode() {
		Purchase p = new Purchase();
		p.setTranNo(10023);
		p.setTranCode("2");
		
		sqlSession.update("PurchaseMapper.updateTranCode", p);
		p = sqlSession.selectOne("PurchaseMapper.getPurchase", 10023);
		System.out.println("\n\n\n");
		System.out.println(p);
		System.out.println("\n\n\n");
	}
	
	@Test
	public void testGetTranNo() {
		Purchase p = new Purchase();
		User user = new User();
		Product product = new Product();
		user.setUserId("user09");
		product.setProdNo(10007);
		p.setBuyer(user);
		p.setPurchaseProd(product);
		
		int i = sqlSession.selectOne("PurchaseMapper.getTranNo", p);
		System.out.println("\n\n\n");
		System.out.println(i);
		System.out.println("\n\n\n");
	}
	
	//@Test
	public void testGet() {
		Purchase p = sqlSession.selectOne("PurchaseMapper.getPurchase", 10023);
		
		System.out.println(p);

		if(p.getTranCode().trim().equals("1")) {
			System.out.println("\n\n\n");
			System.out.println("자른거");
			System.out.println("\n\n\n");
		}
		if(p.getTranCode().equals("1")) {
			System.out.println("\n\n\n");
			System.out.println("안자른거");
			System.out.println("\n\n\n");
		}
	}

}
