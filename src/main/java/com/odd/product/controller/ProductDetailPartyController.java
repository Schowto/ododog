package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.product.model.service.ProductDetailService;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.UserProduct;

/**
 * Servlet implementation class ProductDetailPartyController
 */
@WebServlet("/ProductDetailPartyController")
public class ProductDetailPartyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailPartyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 응답페이지
		int productNo = Integer.parseInt(request.getParameter("no")); //넘어오는 자손값
		
		ArrayList<ProAtt> list = new ProductDetailService().productDetail(productNo);  //상품상세테이블값
		UserProduct p = new ProductDetailService().productDetailFood(productNo);

		
		request.setAttribute("list", list);
		request.setAttribute("p", p);
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
