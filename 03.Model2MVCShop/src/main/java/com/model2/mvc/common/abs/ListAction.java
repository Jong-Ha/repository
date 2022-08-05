package com.model2.mvc.common.abs;

import javax.servlet.http.HttpServletRequest;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.CommonUtil;
import com.model2.mvc.framework.Action;

public abstract class ListAction extends Action {

	public ListAction() {
	}
	
	public Search getSearchInfo(HttpServletRequest request) {
		Search search = new Search();

		int currentPage = 1;
		int minPrice = 0;
		int maxPrice = 0;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		if(!CommonUtil.null2str(request.getParameter("minPrice")).equals("")) {
			minPrice = Integer.parseInt(request.getParameter("minPrice"));
		}
		if(!CommonUtil.null2str(request.getParameter("maxPrice")).equals("")) {
			maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
		}

		int pageSize = Integer.parseInt(getServletContext().getInitParameter("pageSize"));
		int pageUnit = Integer.parseInt(getServletContext().getInitParameter("pageUnit"));

		search.setCurrentPage(currentPage);
		search.setSearchCondition(CommonUtil.null2str(request.getParameter("searchCondition")));
		search.setSearchKeyword(CommonUtil.null2str(request.getParameter("searchKeyword")));
		search.setTranCondition(CommonUtil.null2str(request.getParameter("tranCondition")));
		search.setProdListCondition(CommonUtil.null2str(request.getParameter("prodListCondition")));
		search.setCheckSoldOut(CommonUtil.null2str(request.getParameter("checkSoldOut")));
		search.setMaxPrice(maxPrice);
		search.setMinPrice(minPrice);
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		return search;
	}

}
