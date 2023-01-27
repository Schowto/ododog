package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.product.model.service.AdminProductService;
import com.odd.product.model.vo.AdminProSearch;
import com.odd.product.model.vo.Product;

/**
 * Servlet implementation class ProductSearchController
 */
@WebServlet("/search.adPro")
public class AdminProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<Product> list = new ArrayList<>();
		
		
		if(!request.getParameter("cpage").equals("1")) {
			
			String proName = request.getParameter("proName");
			String category = request.getParameter("category");
			String soldout = request.getParameter("soldout");
			String expDateRemain = request.getParameter("expDateRemain");
			String lowPrice = request.getParameter("lowPrice");
			String highPrice = request.getParameter("highPrice");
			String firstDate = request.getParameter("firstDate");
			String secondDate = request.getParameter("secondDate");
			
			AdminProSearch proSearch = new AdminProSearch(
													proName
												  ,	category
												  , soldout
												  , expDateRemain
												  , lowPrice
												  , highPrice
												  , firstDate
												  , secondDate
												);
			
			list = new AdminProductService().searchList(proSearch);
		}
		
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("views/product/adminProductSearchView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
