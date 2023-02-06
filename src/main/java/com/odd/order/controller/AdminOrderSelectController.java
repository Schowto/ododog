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
				
				// 상품 전체 소수점 평균 구하기
				double save = 0; 
				
				for(OrdPro op : list) {
					
					save += op.getSave();
					
				}
				
				// 소수점 한자리 수 반올림
				save = Math.round(save / list.size() * 10) / 10.0;
				
				// 적립금 구하기
				int savePoint = (int)(Math.round(o.getTotalPrice() * save)); 
				
				
				request.setAttribute("o", o);
				request.setAttribute("list", list);
				request.setAttribute("savePoint", savePoint);
				
				System.out.println(o.getDiscount());
				
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
