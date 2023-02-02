package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.product.model.service.ProductDetailService;
import com.odd.product.model.service.ProductFoodService;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.UserProduct;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/detail.pro")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 응답페이지
		request.setCharacterEncoding("UTF-8");
		
		
		int productNo = Integer.parseInt(request.getParameter("no")); //넘어오는 자손값
		
		ArrayList<ProAtt> list = new ProductDetailService().productDetail(productNo);  //상품상세테이블값
		ArrayList<UserProduct> list2 = new ProductDetailService().productDetailFood(productNo); // 상품테이블값
		
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
