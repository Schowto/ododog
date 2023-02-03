package com.odd.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.board.model.service.ConsultService;
import com.odd.board.model.vo.Consult;
import com.odd.common.MyFileRenamePolicy;
import com.odd.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyConsultInsertController
 */
@WebServlet("/insert.co")
public class MyConsultInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyConsultInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전달되는 파일을 처리할 작업 내용
			int maxSize = 10 * 1024 * 1024;
			
			// 전달될 파일을 저장시킬 폴더의 물리적인 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/consult_upfiles/");
			
			// 전달할 파일의 파일명 수정 및 서버에 업로드 작업
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB에 기록할데이터 담기
			
			String consultTitle = multiRequest.getParameter("consultTitle");
			String consultCategory = multiRequest.getParameter("consultCategory");
			String consultContent = multiRequest.getParameter("consultContent");
			
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginUser")).getUser_No();
			
			Consult c = new Consult();
			c.setConsultTitle(consultTitle);
			c.setConsultCategory(consultCategory);
			c.setConsultContent(consultContent);
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				c.setOriginName(multiRequest.getOriginalFileName("upfile"));
				c.setFilePath("resources/consult_upfiles/" + multiRequest.getFilesystemName("upfile"));
			}
			
			
			// 서비스요청처리
			int result = new ConsultService().insertConsult(userNo, c);
			
			// 응답페이지
			if(result > 0) {
				session.setAttribute("alertMsg", "1:1상담이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.co");
			}else {
				if(c.getOriginName() != null) {
					new File(savePath + c.getFilePath()).delete();
				}
				
				request.setAttribute("errorPage", "1:1상담 작성 실패.");
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
