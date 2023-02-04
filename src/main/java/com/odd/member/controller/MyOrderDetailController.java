package com.odd.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.member.model.service.MyOrderService;
import com.odd.member.model.vo.MyOrder;

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
		
		MyOrder m = new MyOrderService().selectMyOrder(ordNo);
		
		if(m != null) {
			request.setAttribute("m", m);
			request.getRequestDispatcher("views/member/myOrderDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("alertMsg", "상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/myOrder.me");
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
