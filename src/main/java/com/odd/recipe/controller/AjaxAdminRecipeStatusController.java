package com.odd.recipe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.recipe.model.service.AdminRecipeService;


/**
 * Servlet implementation class AjaxAdminRecipeStatusController
 */
@WebServlet("/status.adRe")
public class AjaxAdminRecipeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminRecipeStatusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from = request.getParameter("from");
		int no = Integer.parseInt(request.getParameter("no"));
		String status = request.getParameter("status");
		int result=0;
		if(from.equals("recipe")) {
			result = new AdminRecipeService().updateStatus(no, status);			
		} else {
			result = new AdminRecipeService().updateStatusR(no, status);		
		}
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
