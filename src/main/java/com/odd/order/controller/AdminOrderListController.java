package com.odd.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.common.model.vo.PageInfo;
import com.odd.order.model.service.AdminOrderService;
import com.odd.order.model.vo.AdminOrder;
import com.odd.product.model.service.AdminProductService;

/**
 * Servlet implementation class AdminOrderListController
 */
@WebServlet("/list.adOrd")
public class AdminOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;	 // 현재 게시글 총 개수	
		int currentPage; // 사용자가 요청한 페이지(==현재 페이지)
		int pageLimit;	 // 페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩)
		int boardLimit;	 // 한 페이지당 보여질 게시글의 개수 (몇개 단위씩)
		// 위의 4개를 가지고 아래의 3개 값을 구할 예정
		int maxPage; 	 // 가장 마지막페이지(총 페이지 수)
		int startPage;	 // 사용자가 요청한 페이지 하단의 페이징 바의 시작
		int endPage;	 // 사용자가 요청한 페이지 하단의 페이징 바의 끝 수	
		
		// * listCount : 총 게시글 개수
		listCount = new AdminProductService().selectListCount();
		
		// * currentPage :사용자가 요청한 페이지(==현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// * pageLimit : 페이징바의 페이지 최대 개수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지당 보여질 게시글의 개수 (몇개 단위씩)
		boardLimit = 10;
		
		// * maxPage : 총 페이지 수 
		maxPage = (int) Math.ceil( (double)listCount/boardLimit );
						// 올림 처리
		
		// * startPage : 페이징 바 시작
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이징 바 끝
		endPage = startPage + pageLimit-1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// common에 만드는 이유 : 다른 페이지에서도 공통으로 사용할 것
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,boardLimit
									,maxPage, startPage, endPage);
		
		// 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit수만큼 조회
		
		String order = request.getParameter("order");
		
		ArrayList<AdminOrder> list = new AdminOrderService().selectList(pi, order);
		
		request.setAttribute("pi",pi);
		request.setAttribute("list",list);
		request.setAttribute("order",order);
		
		request.getRequestDispatcher("views/product/adminOrderListView.jsp").forward(request, response);
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
