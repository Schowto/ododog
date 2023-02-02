package com.odd.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.recipe.model.vo.Cooking;
import com.odd.recipe.model.service.RecipeService;
import com.odd.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeDetailViewController
 */
@WebServlet("/detail.re")
public class RecipeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recipeNo = Integer.parseInt(request.getParameter("no"));
		
		RecipeService rService = new RecipeService();
		
		// 조회수 증가
		int result = rService.increaseCount(recipeNo);
		
		if(result > 0) {
			Recipe r = rService.selectRecipe(recipeNo);
			ArrayList<Cooking> list = rService.selectCooking(recipeNo);
			request.setAttribute("r", r);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/recipe/recipeDetailView.jsp").forward(request, response);	
		} else {
			request.setAttribute("errorMsg", "상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
