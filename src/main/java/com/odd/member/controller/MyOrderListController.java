package com.odd.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.service.MyOrderService;
import com.odd.member.model.vo.Member;
import com.odd.member.model.vo.MyOrder;

/**
 * Servlet implementation class myOrderListController
 */
@WebServlet("/myOrder.me")
public class MyOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			HttpSession session = request.getSession();
	      if(session.getAttribute("loginUser") == null) {
	         
	         session.setAttribute("alertMsg", "로그인후에 다시 이용해주세요.");
	         response.sendRedirect(request.getContextPath());
	         
	         
	      }else {
	         
	         int userNo = ((Member)session.getAttribute("loginUser")).getUser_No();
	         
	         ArrayList<MyOrder> list = new MyOrderService().selectAllMyOrder(userNo);
	         
	         request.setAttribute("list", list);
	         
	         request.getRequestDispatcher("views/member/myOrderList.jsp").forward(request, response);
	         
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
