package com.model2.mvc.service.impl.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class ProductSqlTest {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//@Test
	public void testlist() {
		Search search = new Search();
		
		search.setCheckSoldOut("soldOut");
		search.setCurrentPage(1);
		search.setPageSize(100);
		search.setPageUnit(5);
		search.setMaxPrice(0);
		search.setMinPrice(0);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		search.setProdListCondition("");
		
		int i= sqlSession.selectOne("ProductMapper.getTotalCount",search);
		
		System.out.println(i);
	}
	
	//@Test
	public void testget() {
		Product p = new Product();
		
		p = sqlSession.selectOne("ProductMapper.getProduct",10000);
		
		System.out.println(p);
	}
	
	//@Test
	public void updateProductAmount() {
		
		System.out.println("\n\nΩ√¿€\n\n");
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		
		product.setProdNo(10020);
		user.setUserId("user09");
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("SCOTT");
		purchase.setReceiverPhone("");
		purchase.setDivyAddr("");
		purchase.setDivyRequest("");
		purchase.setDivyDate("");
		purchase.setAmount(5);
		
		sqlSession.update("ProductMapper.updateProductAmount", purchase);
		
		System.out.println("\n\n≥°\n\n");
	}

}
