package com.odd.order.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.odd.member.model.service.MemberService;
import com.odd.order.model.service.OrderSendService;
import com.odd.order.model.service.OrderService;
import com.odd.order.model.vo.Order;

/**
 * Servlet implementation class OrderInsertController
 */
@WebServlet("/insert.or")
public class OrderInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      StringBuffer jb = new StringBuffer();
	      String line = null;
	      try {
	         BufferedReader reader = request.getReader();
	         while ((line = reader.readLine()) != null)
	            jb.append(line);
	      } catch (Exception e) {/* report an error */ }
	                  
	      JsonParser parser = new JsonParser();
	      JsonElement element = parser.parse(jb.toString());
	      
	      // 주문 인설트
	      int userNo = element.getAsJsonObject().get("userNo").getAsInt();
	      String delAdd = element.getAsJsonObject().get("delAdd").getAsString();
	      String phone = element.getAsJsonObject().get("phone").getAsString();
	      String email = element.getAsJsonObject().get("email").getAsString();
	      String require = element.getAsJsonObject().get("require").getAsString();
	      int resNo = element.getAsJsonObject().get("resNo").getAsInt();
	      
	      // 결제 api로 주문정보 넘기기
	      Order o = new Order(userNo, delAdd, phone, email, require);
	      
	      int result = new OrderService().insertOrderList(o);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
