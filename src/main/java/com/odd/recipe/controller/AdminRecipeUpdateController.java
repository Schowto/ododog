package com.odd.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.common.MyFileRenamePolicy;
import com.odd.recipe.model.service.AdminRecipeService;
import com.odd.recipe.model.vo.Cooking;
import com.odd.recipe.model.vo.Recipe;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminRecipeUpdateController
 */
@WebServlet("/update.re")
public class AdminRecipeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRecipeUpdateController() {
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
			r.setRecipeNo(Integer.parseInt(multiRequest.getParameter("recipe-no")));
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
			
			if(multiRequest.getOriginalFileName("thumbImg") != null) {	// 이미지를 수정하지 않았을 경우 : input file데이터 안넘어옴 *(input file은 value 안먹힘)
				r.setRecipeThumbImg("resources/recipe_img/" + multiRequest.getFilesystemName("thumbImg"));
			}
			
			// Cooking에 여러번 insert할 데이터 담기
			ArrayList<Cooking> list = new ArrayList<>();
			
			for(int i=1; i<=10; i++) {
				if(i <= r.getProcessCount()) {
					String cookingNo = "cooking-no" + i;
					String imgName = "input-img" + i;
					String content = "cooking-content" + i;
					Cooking cook = new Cooking();
					cook.setCookingNo(Integer.parseInt(multiRequest.getParameter(cookingNo)));
					cook.setCookingOrder(i);
					cook.setCookingContent(multiRequest.getParameter(content));
					if(multiRequest.getOriginalFileName(imgName) != null) {	// 넘어온첨부파일이 있는지
						cook.setFilePath("resources/recipe_img/" + multiRequest.getFilesystemName(imgName));
					}
					list.add(cook);
				}
			}
			int result = new AdminRecipeService().updateRecipe(r, list);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.adRe?cpage=1&rpage=1");
			} else {
				// 실패 => 에러페이지
				request.getSession().setAttribute("alertMsg", "레시피 수정 실패");
				response.sendRedirect(request.getContextPath() + "/list.adRe?cpage=1&rpage=1");
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
