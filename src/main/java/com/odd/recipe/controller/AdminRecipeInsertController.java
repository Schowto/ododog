package com.odd.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.recipe.model.vo.Cooking;
import com.odd.common.MyFileRenamePolicy;
import com.odd.recipe.model.service.RecipeService;
import com.odd.recipe.model.vo.Recipe;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminRecipeInsertController
 */
@WebServlet("/insert.re")
public class AdminRecipeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRecipeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {	// 멀티파트형식으로 잘 전송이 됐을 때 true 반환
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/recipe_img/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Recipe r = new Recipe();
			r.setRecipeTitle(multiRequest.getParameter("title"));
			r.setRecipeContent(multiRequest.getParameter("content"));
			
			String[] effectArr = multiRequest.getParameterValues("effect");
			String effect = "";
			if(effectArr != null) {
				effect = String.join(",", effectArr);
			}
			r.setEffect(effect);
			r.setTime(multiRequest.getParameter("time"));
			r.setIngredient(multiRequest.getParameter("ingredient"));
			r.setProcessCount(Integer.parseInt(multiRequest.getParameter("process-count")));
			
			if(multiRequest.getOriginalFileName("thumbImg") != null) {
				r.setRecipeThumbImg("resources/recipe_img/" + multiRequest.getFilesystemName("thumbImg"));
			}
			
			// Cooking에 여러번 insert할 데이터 담기
			ArrayList<Cooking> list = new ArrayList<>();
			
			for(int i=1; i<=10; i++) {
				String imgName = "input-img" + i;
				String content = "cooking-content" + i;
				if(multiRequest.getOriginalFileName(imgName) != null) {	// 원본명넘어왔는지 == 넘어온첨부파일이 있는지
					// 첨부파일이 있을 경우
					Cooking cook = new Cooking();
					cook.setCookingOrder(i);
					cook.setCookingContent(multiRequest.getParameter(content));
					cook.setFilePath("resources/recipe_img/" + multiRequest.getFilesystemName(imgName));
					list.add(cook);
				}
			}
			int result = new RecipeService().insertRecipe(r, list);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.re?cpage=1");		// 수정해야됨!!!!!!!!!!!
			} else {
				// 실패 => 에러페이지
			}
			
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
