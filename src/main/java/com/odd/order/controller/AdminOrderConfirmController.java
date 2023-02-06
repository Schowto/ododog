package com.odd.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int savePoint =Integer.parseInt(request.getParameter("savePoint"));
		int discount =Integer.parseInt(request.getParameter("discount"));
		
	    int result = new AdminOrderService().confirmOrder(ordNo, userNo, savePoint, discount); 
	    HttpSession session = request.getSession();
	    
		if(result > 0) {
			session.setAttribute("alertMsg", "주문 승인 성공");
			response.sendRedirect(request.getContextPath()+"/search.adOrd?cpage=1");
			
		}else {
			request.setAttribute("errorMsg", "주문 승인 실패");
			response.sendRedirect(request.getContextPath()+"/search.adOrd?cpage=1");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
