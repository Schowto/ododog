package com.odd.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.order.model.service.AdminOrderService;
import com.odd.order.model.vo.AdminOrder;
import com.odd.order.model.vo.OrdPro;

/**
 * Servlet implementation class MyOrderDetailController
 */
@WebServlet("/myOrderDetail.me")
public class MyOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int userNo = Integer.parseInt(request.getParameter(userNo));
		//int proNo = Integer.parseInt(request.getParameter(proNo));
		
		//Member m = new MemberService().selectMember(userNo);
		//Product p = new AdminProductService().selectProduct(proNo);
		
		//request.setAttribute("m", m);
		//request.sestAttribute("p", p);
		
		int ordNo = Integer.parseInt(request.getParameter("no"));
		AdminOrder o = new AdminOrderService().selectOrder(ordNo);
		ArrayList<OrdPro> list = new AdminOrderService().selectOrdPro(ordNo);
		
		request.setAttribute("o", o);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/member/myOrderDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
