package com.odd.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.order.model.service.AdminOrderService;
import com.odd.order.model.vo.AdminOrdSearch;
import com.odd.order.model.vo.AdminOrder;



/**
 * Servlet implementation class AdminOrderSearchController
 */
@WebServlet("/search.adOrd")
public class AdminOrderSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<AdminOrder> list = new ArrayList<>();
		
		AdminOrdSearch ordSearch = null;
		
		// 첫 화면이 아닐 경우
		if(!request.getParameter("cpage").equals("1")) {
			
			ordSearch = new AdminOrdSearch(
											request.getParameter("proName") ,
											request.getParameter("userName") ,
											request.getParameter("lowPrice") ,
											request.getParameter("highPrice")
										  );

					
		}else {
			
			ordSearch = new AdminOrdSearch(
											"" ,
											"" ,
											"" ,
											""
										  );

		}
		
		list = new AdminOrderService().searchList(ordSearch);
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("views/order/adminOrderSearchView.jsp").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
