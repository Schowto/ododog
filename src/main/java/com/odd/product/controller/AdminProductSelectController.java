package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.odd.product.model.service.AdminProductService;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.Product;

/**
 * Servlet implementation class AdminProductSelectController
 */
@WebServlet("/select.adPro")
public class AdminProductSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		
		Product p = new AdminProductService().selectProduct(proNo);
		ArrayList<ProAtt> list = new AdminProductService().selectProAtt(proNo); 
		
		String pro = p.getProName();
		
		
		JSONObject jObj = new JSONObject();
		jObj.put("proName", p.getProName());
		jObj.put("proNo", p.getProNo());
		jObj.put("category", p.getCategory());
		jObj.put("price", p.getPrice());
		jObj.put("expiredDate", p.getExpiredDate());
		jObj.put("save", p.getSave());
		jObj.put("thumbImg", p.getThumbImg());
		
		for(int i = 0; i < list.size() ; i++) {
			jObj.put("proAtt" + (i+1), list.get(i).getFilePath());
			jObj.put("proAttNo" + (i+1), list.get(i).getFileNo());
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
