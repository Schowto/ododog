package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.common.MyFileRenamePolicy;
import com.odd.product.model.service.AdminProductService;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminProductInsertController
 */
@WebServlet("/insert.adPro")
public class AdminProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductInsertController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/product_img/");
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			Product p = new Product();
			p.setCategory(multipartRequest.getParameter("category"));
			p.setProName(multipartRequest.getParameter("proName"));
			p.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
			p.setExpiredDate(multipartRequest.getParameter("expiredDate"));
			p.setSave(Double.parseDouble(multipartRequest.getParameter("save")));
			
			ArrayList<ProAtt> list = new ArrayList<>();
			
			for(int i=1; i<=13; i++) {
				String key = "file" + i;
				if(multipartRequest.getOriginalFileName(key) != null) {
					
					ProAtt at = new ProAtt();
					at.setFilePath("resources/product_img/" + multipartRequest.getFilesystemName(key));
				
					if(i == 1) {// 섬네일 이미지일경우
						at.setFileLevel(1);
						p.setThumbImg("resources/product_img/" + multipartRequest.getFilesystemName(key));
					} else { // 상세 이미지일 경우
						at.setFileLevel(2);
					}
				
					list.add(at);
				}
			}
			
			int result = new AdminProductService().insertProduct(p, list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "상품 등록 성공");
				response.sendRedirect(request.getContextPath() + "/enroll.adPro");
			} else {
				request.getSession().setAttribute("alertMsg", "상품 등록 실패");
				response.sendRedirect(request.getContextPath() + "/enroll.adPro");
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
