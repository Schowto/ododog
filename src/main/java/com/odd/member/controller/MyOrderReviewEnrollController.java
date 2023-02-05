package com.odd.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.common.MyFileRenamePolicy;
import com.odd.member.model.service.ReviewService;
import com.odd.member.model.vo.Member;
import com.odd.member.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyOrderReviewEnrollController
 */
@WebServlet("/reviewInsert.me")
public class MyOrderReviewEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderReviewEnrollController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/review_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginUser")).getUser_No();
			int proNo = Integer.parseInt(multiRequest.getParameter("proNo"));
			String proName = multiRequest.getParameter("proName");
			String userId = multiRequest.getParameter("userId");
			double star = Double.parseDouble(multiRequest.getParameter("star"));
			String reviewTitle = multiRequest.getParameter("reviewTitle");
			String reviewContent = multiRequest.getParameter("reviewContent");
			
			Review r = new Review();
			r.setProName(proName);
			r.setUserId(userId);
			r.setStar(star);
			r.setReviewTitle(reviewTitle);
			r.setReviewContent(reviewContent);
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				r.setReviewPhoto(multiRequest.getOriginalFileName("upfile"));
				r.setFilePath("resources/review_upfiles" + multiRequest.getFilesystemName("upfile"));
			}
			
			int result = new ReviewService().insertReview(proNo, userNo, r);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "리뷰가 등록되었습니다.");
				
				
			}else {
				if(r.getReviewPhoto() != null) {
					new File(savePath + r.getFilePath()).delete();
				}
				
				request.setAttribute("errorMsg", "리뷰등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			response.sendRedirect(request.getContextPath() + "/order.me");
			
			
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
