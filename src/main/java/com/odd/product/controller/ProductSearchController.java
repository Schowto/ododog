package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.product.model.service.ProductService;
import com.odd.product.model.vo.ProSearch;
import com.odd.product.model.vo.Product;

/**
 * Servlet implementation class ProductSearchController
 */
@WebServlet("/search.pro")
public class ProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String proName = request.getParameter("proName");
		String category = request.getParameter("category");
		String soldout = request.getParameter("soldout");
		String expDateRemain = request.getParameter("expDateRemain");
		int lowPrice = Integer.parseInt(request.getParameter("lowPrice"));
		int highPrice = Integer.parseInt(request.getParameter("highPrice"));
		String firstDate = request.getParameter("firstDate");
		String secondDate = request.getParameter("secondDate");
		
		ProSearch proSearch = new ProSearch(
												proName
											  ,	category
											  , soldout
											  , expDateRemain
											  , lowPrice
											  , highPrice
											  , firstDate
											  , secondDate
											);
				
		
		
		ArrayList<Product> list = new ProductService().searchList(proSearch);
		
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("views/product/productSearchView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
