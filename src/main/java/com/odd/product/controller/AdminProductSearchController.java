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
		AdminProSearch proSearch = null;
		
		// 첫 화면이 아닐 경우
		if(!request.getParameter("cpage").equals("1")) {
			
			proSearch = new AdminProSearch(
													request.getParameter("proName")
												  ,	request.getParameter("category")
												  , request.getParameter("soldout")
												  , request.getParameter("expDateRemain")
												  , request.getParameter("lowPrice")
												  , request.getParameter("highPrice")
												  , request.getParameter("firstDate")
												  , request.getParameter("secondDate")
												);
			
		} else {
			
			proSearch = new AdminProSearch(
												""
											  , "전체"
											  , "all"
											  , "1"
											  , ""
											  , ""
											  , ""
											  , ""
											);

		}
		
		list = new AdminProductService().searchList(proSearch);
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
