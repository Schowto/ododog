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
				
				AdminOrder o = new AdminOrderService().selectProduct(ordNo);
				ArrayList<OrdPro> list = new AdminOrderService().selectOrdPro(ordNo); 
				
				
				// Gson 사용 가능
				JSONObject jObj = new JSONObject();
				jObj.put("ordNo", o.getOrdNo());
				jObj.put("userNo", o.getOrdNo());
				jObj.put("delAdd", o.getDelAdd());
				jObj.put("phone", o.getPhone());
				jObj.put("email", o.getEmail());
				jObj.put("address", o.getAddress());
				jObj.put("require", o.getRequire());
				jObj.put("orderDate", o.getOrderDate());
				jObj.put("listSize", list.size());
				
				for(int i = 0; i < list.size() ; i++) {
					jObj.put("ordPro" + (i+1), list.get(i).getProNo());
					jObj.put("amout" + (i+1), list.get(i).getAmount());
					}
				
				response.setContentType("application/json; charset=utf-8");
				response.getWriter().print(jObj);
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
