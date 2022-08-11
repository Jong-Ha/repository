package com.model2.mvc.web.review;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService service;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public ReviewController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "addReview", method = RequestMethod.GET)
	public ModelAndView addReview(@RequestParam("tranNo") int tranNo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		mv.addObject("purchase",purchase);
		
		mv.setViewName("forward:/review/addReviewView.jsp");
		return mv;
	}

//	@RequestMapping(value = "addReview", method = RequestMethod.POST)
//	public ModelAndView addReview(HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		if(FileUpload.isMultipartContent(request)) {
//			String temDir = "C:\\Users\\bitcamp\\git\\repository\\03.Model2MVCShop\\src\\main\\webapp\\images\\reviewImg\\";
//			
//			DiskFileUpload fileUpload = new DiskFileUpload();
//			fileUpload.setRepositoryPath(temDir);
//			fileUpload.setSizeMax(1024*1024*10);
//			fileUpload.setSizeThreshold(1024*100);
//			
//			if(request.getContentLength() < fileUpload.getSizeMax()) {
//				Product product = new Product();
//				Review review = new Review();
//				
//				List<FileItem> fileItemList = fileUpload.parseRequest(request);
//				int size = fileItemList.size();
//				for(FileItem fileItem : fileItemList) {
//					if(fileItem.isFormField()) {
//						if(fileItem.getFieldName().equals("prodNo")) {
//							product.setProdNo(Integer.parseInt(fileItem.getString("euc-kr")));
//						}
//						if(fileItem.getFieldName().equals("userId")) {
//							review.setUserId(fileItem.getString("euc-kr"));
//						}
//						if(fileItem.getFieldName().equals("tranNo")) {
//							review.setTranNo(Integer.parseInt(fileItem.getString("euc-kr")));
//						}
//						if(fileItem.getFieldName().equals("grade")) {
//							review.setGrade(Float.parseFloat(fileItem.getString("euc-kr")));
//						}
//						if(fileItem.getFieldName().equals("detail")) {
//							review.setDetail(fileItem.getString("euc-kr"));
//						}
//					}else {
//						if(fileItem.getSize()>0) {
//							int idx = fileItem.getName().lastIndexOf("\\");
//							if(idx==-1) {
//								idx = fileItem.getName().lastIndexOf("/");
//							}
//							String fileName = fileItem.getName().substring(idx+1);
//							review.setFileName(fileName);
//							try {
//								File uploadedFile = new File(temDir, fileName);
//								fileItem.write(uploadedFile);
//							}catch (Exception e) {
//								e.printStackTrace();
//							}
//						}else {
//							product.setFileName("../empty.GIF");
//						}
//					}
//				}//for
//				review.setProd(product);
//				service.addReview(review);
//				request.setAttribute("review", review);
//			}else {
//				int overSize = (request.getContentLength()/1000000);
//				System.out.println("<script>alert('파일의 크기는 1MB까지 입니다. 올리신 파일 용량은 "+overSize+"MB입니다');");
//			}
//		}else {
//			System.out.println("인코딩 타입이 multipart/form-data가 아닙니다.");
//		}
//		
//		
//		mv.setViewName("forward:/review/resultReview.jsp");
//		return mv;
//	}

//	@RequestMapping(value = "addReview", method = RequestMethod.POST)
//	public ModelAndView addReview(@ModelAttribute("review") Review review, @ModelAttribute("product") Product product) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		review.setProd(product);
//		service.addReview(review);
//		
//		mv.setViewName("forward:/review/resultReview.jsp");
//		return mv;
//	}

	@RequestMapping(value = "addReview", method = RequestMethod.POST)
	public ModelAndView addReview(@ModelAttribute("review") Review review, @ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		String fileName = file.getOriginalFilename();
		if(!fileName.equals("")) {
			File uploadFile = new File("reviewImg",fileName);
			file.transferTo(uploadFile);
			review.setFileName(fileName);
		}else {
			review.setFileName("../empty.GIF");
		}
		
		review.setProd(product);
		service.addReview(review);
		
		mv.setViewName("forward:/review/resultReview.jsp");
		return mv;
	}

	@RequestMapping(value = "updateReview", method = RequestMethod.GET)
	public ModelAndView updateReview(@RequestParam("tranNo") int tranNo) throws Exception {
		ModelAndView mv = new ModelAndView();
		Review review = service.getReview(tranNo);
		mv.addObject("review", review);
		mv.setViewName("forward:/review/updateReviewView.jsp");
		return mv;
	}

//	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
//	public ModelAndView updateReview(@ModelAttribute("review") Review review) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		service.updateReview(review);
//		
//		mv.setViewName("forward:/review/resultReview.jsp");
//		return mv;
//	}

//	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
//	public ModelAndView updateReview(HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView();
//
//		if(FileUpload.isMultipartContent(request)) {
//			String temDir = "C:\\Users\\bitcamp\\git\\repository\\03.Model2MVCShop\\src\\main\\webapp\\images\\reviewImg\\";
//			
//			DiskFileUpload fileUpload = new DiskFileUpload();
//			fileUpload.setRepositoryPath(temDir);
//			fileUpload.setSizeMax(1024*1024*10);
//			fileUpload.setSizeThreshold(1024*100);
//			
//			if(request.getContentLength() < fileUpload.getSizeMax()) {
//				Product product = new Product();
//				Review review = new Review();
//				
//				List<FileItem> fileItemList = fileUpload.parseRequest(request);
//				int size = fileItemList.size();
//				String existFileName = null;
//				for(FileItem fileItem : fileItemList) {
//					if(fileItem.isFormField()) {
//						if(fileItem.getFieldName().equals("tranNo")) {
//							review.setTranNo(Integer.parseInt(fileItem.getString("euc-kr")));
//						}
//						if(fileItem.getFieldName().equals("grade")) {
//							review.setGrade(Float.parseFloat(fileItem.getString("euc-kr")));
//						}
//						if(fileItem.getFieldName().equals("detail")) {
//							review.setDetail(fileItem.getString("euc-kr"));
//						}
//						if(fileItem.getFieldName().equals("existFileName")) {
//							existFileName = fileItem.getString("euc-kr");
//						}
//					}else {
//						if(fileItem.getSize()>0) {
//							int idx = fileItem.getName().lastIndexOf("\\");
//							if(idx==-1) {
//								idx = fileItem.getName().lastIndexOf("/");
//							}
//							String fileName = fileItem.getName().substring(idx+1);
//							review.setFileName(fileName);
//							try {
//								File uploadedFile = new File(temDir, fileName);
//								fileItem.write(uploadedFile);
//							}catch (Exception e) {
//								e.printStackTrace();
//							}
//						}else {
//							if(existFileName.equals("")) {
//								review.setFileName("../empty.GIF");
//							}else {
//								review.setFileName(existFileName);
//							}
//						}
//					}
//				}//for
//				review.setProd(product);
//				service.updateReview(review);
//				request.setAttribute("review", review);
//			}else {
//				int overSize = (request.getContentLength()/1000000);
//				System.out.println("<script>alert('파일의 크기는 1MB까지 입니다. 올리신 파일 용량은 "+overSize+"MB입니다');");
//			}
//		}else {
//			System.out.println("인코딩 타입이 multipart/form-data가 아닙니다.");
//		}
//	
//		mv.setViewName("forward:/review/resultReview.jsp");
//		return mv;
//	}

	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
	public ModelAndView updateReview(@ModelAttribute("review") Review review, @RequestParam("file") MultipartFile file, @RequestParam("existFileName") String existFileName) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String fileName = file.getOriginalFilename();
		if(!fileName.equals("")) {
			File uploadFile = new File("reviewImg",fileName);
			file.transferTo(uploadFile);
			review.setFileName(fileName);
		}else if(!existFileName.equals("")){
			review.setFileName(existFileName);
		}else {
			review.setFileName("../empty.GIF");
		}
		
		service.updateReview(review);
		
		mv.setViewName("forward:/review/resultReview.jsp");
		return mv;
	}

	@RequestMapping(value = "deleteReview", method = RequestMethod.POST)
	public ModelAndView deleteReview(@RequestParam("tranNo") int tranNo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		service.deleteReview(tranNo);
		
		mv.setViewName("forward:/review/resultReview.jsp");
		return mv;
	}
	
	@RequestMapping("listReview")
	public ModelAndView listReview(@RequestParam("prodNo") int prodNo, @ModelAttribute("search") Search search) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("prodNo", prodNo);
		
		map = service.getReviewList(map);
		
		List<Review> list = (List<Review>)map.get("list");
		for(Review review : list) {
			String userId = review.getUserId();
			StringBuffer newUserId = new StringBuffer(userId.substring(0, 3));
			for(int i = 3; i<userId.length(); i++) {
				newUserId.append("*");
			}
			review.setUserId(newUserId.toString());
		}
		
		Page resultPage = new Page(search, (Integer)map.get("totalCount"));
		
		mv.addAllObjects(map);
		mv.addObject("resultPage", resultPage);
		mv.addObject("product", productService.getProduct(prodNo));
		
		mv.setViewName("forward:/review/listReview.jsp");
		return mv;
	}
	
	@RequestMapping("myReview")
	public ModelAndView myReview(HttpSession session, @ModelAttribute("search") Search search) throws Exception {
		ModelAndView mv = new ModelAndView();

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", ((User)session.getAttribute("user")).getUserId());
		
		map = service.getReviewList(map);
		
		Page resultPage = new Page(search, (Integer)map.get("totalCount"));
		
		mv.addAllObjects(map);
		mv.addObject("resultPage", resultPage);
		
		mv.setViewName("forward:/review/myReview.jsp");
		return mv;
	}

}
