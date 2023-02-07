package com.odd.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.odd.order.model.service.AdminOrderService;
import com.odd.order.model.vo.AdminOrder;
import com.odd.order.model.vo.OrdPro;

/**
 * Servlet implementation class AdminOrderSelectController
 */
@WebServlet("/select.adOrd")
public class AdminOrderSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ordNo = Integer.parseInt(request.getParameter("ordNo"));
				
				AdminOrder o = new AdminOrderService().selectOrder(ordNo);
				ArrayList<OrdPro> list = new AdminOrderService().selectOrdPro(ordNo); 
				
				request.setAttribute("o", o);
				request.setAttribute("list", list);
				
				// 상품 전체 적립금
				int savePoint = 0;
				
				for(OrdPro op : list) {
					
					savePoint += op.getPrice() * op.getSave() * op.getAmount();
					
				}
				
				request.setAttribute("o", o);
				request.setAttribute("list", list);
				request.setAttribute("savePoint", savePoint);
				
				
				request.getRequestDispatcher("views/order/adminOrderDetailView.jsp").forward(request, response);
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
