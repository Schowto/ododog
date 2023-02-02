package com.odd.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.board.model.service.ConsultService;
import com.odd.board.model.vo.Consult;
import com.odd.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyConsultUpdateController
 */
@WebServlet("/update.co")
public class MyConsultUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyConsultUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/consult_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int consultNo = Integer.parseInt(multiRequest.getParameter("consultNo"));
			String consultTitle = multiRequest.getParameter("consultTitle");
			String consultCategory = multiRequest.getParameter("consultCategory");
			String consultContent = multiRequest.getParameter("consultContent");
			
			Consult c = new Consult();
			c.setConsultNo(consultNo);
			c.setConsultTitle(consultTitle);
			c.setConsultCategory(consultCategory);
			c.setConsultContent(consultContent);
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				c.setOriginName(multiRequest.getOriginalFileName("upfile"));
				c.setFilePath(multiRequest.getFilesystemName("resources/consult_upfiles/" + "upfile"));
			}
			
			int result = new ConsultService().updateConsult(consultNo, c);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.co?no=?" + consultNo);
			}else {
				request.setAttribute("errorMsg", "수정에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
