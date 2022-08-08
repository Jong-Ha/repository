package com.model2.mvc.web.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.review.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/addReviewView.do")
	public ModelAndView addReviewView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("forward:/review/addReviewView.jsp");
		return mv;
	}
	
	@RequestMapping("/addReview.do")
	public ModelAndView addReview() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("forward:/myReview.do");
		return mv;
	}
	
	@RequestMapping("/updateReviewView.do")
	public ModelAndView updateReviewView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("forward:/review/updateReviewView.jsp");
		return mv;
	}
	
	@RequestMapping("/updateReview.do")
	public ModelAndView updateReview() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/myReview.do");
		return mv;
	}
	
	@RequestMapping("/listReview.do")
	public ModelAndView listReview() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("forward:/review/listReview.jsp");
		return mv;
	}
	
	@RequestMapping("/myReview.do")
	public ModelAndView myReview() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("forward:/review/myReview.jsp");
		return mv;
	}

}
