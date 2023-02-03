package com.odd.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.order.model.service.AdminOrderService;

/**
 * Servlet implementation class AdminOrderConfirmController
 */
@WebServlet("/confirm.adOrd")
public class AdminOrderConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ordNo = Integer.parseInt(request.getParameter("ordNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
			
		System.out.println(ordNo);
		/*
		 * int result1 = new AdminOrderService().confirmOrder(ordNo); int result2 = new
		 * AdminOrderService().confirmMember(userNo); int result3 = new
		 * AdminOrderService().confirmPoint(ordNo, userNo);
		 */
		
		response.getWriter().print(ordNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
