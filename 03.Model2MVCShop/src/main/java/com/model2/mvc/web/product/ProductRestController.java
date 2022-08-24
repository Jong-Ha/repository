package com.model2.mvc.web.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['productFilePath']}")
	String productFilePath;

	public ProductRestController() {
		System.out.println(this.getClass());
	}


	@RequestMapping(value = "/json/addProduct", method = RequestMethod.POST)
//	public Product addProduct(@RequestBody Product product, MultipartHttpServletRequest multi) throws Exception {
	public Product addProduct(@RequestBody Product product) throws Exception {
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		service.addProduct(product);
		
		return product;
	}
	
	@RequestMapping(value = "/json/updateProduct", method = RequestMethod.POST)
//	public String updateProduct(@ModelAttribute("product") Product product, MultipartHttpServletRequest multi, @RequestParam(value = "deteleFileList", required = false) List<String> deleteFileList, Map<String, Object> map) throws Exception{
	public Product updateProduct(@RequestBody Product product, @RequestParam(value = "deteleFileList", required = false) List<String> deleteFileList, Map<String, Object> map) throws Exception{
		map.put("deleteFileList", deleteFileList);
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		map.put("product", product);
		service.updateProduct(map);
		
		return service.getProduct(product.getProdNo());
	}

	@RequestMapping(value = "/json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception{
		return service.getProduct(prodNo);
	}
	
	@RequestMapping("/json/listProduct")
	public Map<String, Object> listProduct(@RequestBody(required = false) Search search) throws Exception{

		if(search==null) {
			search = new Search();
		}
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
			search.setSearchKeyword("");
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);

		Map<String, Object> map = service.getProductList(search);
		
		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
		
		map.put("search", search);
		map.put("resultPage", resultPage);
		
		return map;
	}

}
