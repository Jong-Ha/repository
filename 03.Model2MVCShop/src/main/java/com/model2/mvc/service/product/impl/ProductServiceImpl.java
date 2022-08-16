package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.UploadFile;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.uploadFile.UploadFileDao;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	///Field
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;

	@Autowired
	@Qualifier("uploadFileDaoImpl")
	private UploadFileDao uploadFileDao;

	///Constructor
	public ProductServiceImpl() {
	}

	///Method
	@Override
	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
		UploadFile mainFile = product.getMainFile();
		List<UploadFile> extraFileList = product.getExtraFileList();
		if(mainFile!=null) {
			uploadFileDao.addFile(mainFile);
		}
		if(extraFileList!=null) {
			for(UploadFile file : extraFileList) {
				uploadFileDao.addFile(file);
			}
		}
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", productDao.getTotalCount(search));
		map.put("list", productDao.getProductList(search));
		return map;
	}

	@Override
	public void updateProduct(Map<String, Object> map) throws Exception {
		if(map.get("deteleFileList")!=null) {
			uploadFileDao.deleteFile((List<String>)map.get("deteleFileList"));
		}
		Product product = (Product)map.get("product");
		UploadFile mainFile = product.getMainFile();
		List<UploadFile> extraFileList = product.getExtraFileList();
		if(mainFile!=null) {
			uploadFileDao.addFile(mainFile);
		}
		if(extraFileList!=null) {
			for(UploadFile file : extraFileList) {
				uploadFileDao.addFile(file);
			}
		}
		productDao.updateProduct(product);
	}

}
