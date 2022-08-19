package com.model2.mvc.web.review;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.UploadFile;
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
	
	@Value("#{commonProperties['reviewFilePath']}")
	String reviewFilePath;

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

	@RequestMapping(value = "addReview", method = RequestMethod.POST)
	public ModelAndView addReview(@ModelAttribute("review") Review review, @ModelAttribute("product") Product product, MultipartHttpServletRequest multi) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MultipartFile> files = multi.getFiles("file");
		if(files.size()>0 && !files.get(0).getOriginalFilename().equals("")) {
			List<UploadFile> fileList = new ArrayList<UploadFile>();
			for(MultipartFile file : files) {
				UploadFile reviewFile = new UploadFile(file);
				reviewFile.setPath(reviewFilePath);
				reviewFile.setRefKey(review.getTranNo());
				reviewFile.setTarget("review");
				File uploadFile = new File(reviewFilePath, reviewFile.getFileName());
				file.transferTo(uploadFile);
				fileList.add(reviewFile);
			}
			review.setFileList(fileList);
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

	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
	public ModelAndView updateReview(@ModelAttribute("review") Review review, MultipartHttpServletRequest multi, @RequestParam(value = "deleteFileList", required = false) List<String> deleteFileList) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("deleteFileList", deleteFileList);
		List<MultipartFile> files = multi.getFiles("file");
		if(files.size()>0&&!files.get(0).getOriginalFilename().equals("")) {
			List<UploadFile> fileList = new ArrayList<UploadFile>();
			for(MultipartFile file : files) {
				UploadFile reviewFile = new UploadFile(file);
				reviewFile.setPath(reviewFilePath);
				reviewFile.setRefKey(review.getTranNo());
				reviewFile.setTarget("review");
				File uploadFile = new File(reviewFilePath, reviewFile.getFileName());
				file.transferTo(uploadFile);
				fileList.add(reviewFile);
			}
			review.setFileList(fileList);
		}
		map.put("review", review);
		
		service.updateReview(map);
		
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
