package com.model2.mvc.service.impl.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml", "classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class ProductServiceImplTest {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	///Constructor
	public ProductServiceImplTest() {
	}

	///Method
	//@Test
	public void addProduct() throws Exception {
		Product product = new Product();
		product.setProdName("testProdName");
		product.setProdDetail("prodDetail");
		product.setManuDate("20220803");
		product.setPrice(10000);
		product.setAmount(5);
		productService.addProduct(product);
	}

	//@Test
	public void getProduct() throws Exception {
		int prodNo = 10000;
		Product product = productService.getProduct(prodNo);
		System.out.println("\n\n");
		System.out.println(product);
		System.out.println("\n\n");
	}

	//@Test
	public void getProductList() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Search search = new Search();

		search.setCurrentPage(1);
//		search.setSearchCondition(CommonUtil.null2str(request.getParameter("searchCondition")));
		search.setSearchKeyword("");
//		search.setTranCondition(CommonUtil.null2str(request.getParameter("tranCondition")));
//		search.setProdListCondition(CommonUtil.null2str(request.getParameter("prodListCondition")));
//		search.setCheckSoldOut(CommonUtil.null2str(request.getParameter("checkSoldOut")));
		search.setMaxPrice(0);
		search.setMinPrice(0);
		search.setPageSize(3);
		search.setPageUnit(5);
		
		map = productService.getProductList(search);
		
		System.out.println("\n\n");
		System.out.println(map.get("totalCount"));
		System.out.println("\n\n");
		System.out.println(map.get("list"));
		System.out.println("\n\n");
	}

	//@Test
	public void updateProduct(Product product) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		productService.updateProduct(map);
	}

}
