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
 * Servlet implementation class AdminProductUpdateController
 */
@WebServlet("/update.adPro")
public class AdminProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductUpdateController() {
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
			
			int proNo = Integer.parseInt(multipartRequest.getParameter("proNo"));
			
			Product p = new Product();
			p.setProNo(Integer.parseInt(multipartRequest.getParameter("proNo")));
			p.setCategory(multipartRequest.getParameter("category"));
			p.setProName(multipartRequest.getParameter("proName"));
			p.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
			p.setExpiredDate(multipartRequest.getParameter("expiredDate"));
			p.setSave(Double.parseDouble(multipartRequest.getParameter("save")));
			p.setSoldout(multipartRequest.getParameter("soldout"));
			p.setThumbImg(multipartRequest.getParameter("thumbImg"));
			
			ArrayList<ProAtt> updateList = new ArrayList<>();
			ArrayList<ProAtt> insertList = new ArrayList<>();
			
			
			for(int i=1; i<=10; i++) {
				String key = "file" + i;
				if(multipartRequest.getOriginalFileName(key) != null) {
					
					ProAtt at = new ProAtt();
					at.setFilePath("resources/product_img/" + multipartRequest.getFilesystemName(key));
					
					// 기존에 이미지가 존재 했다면  
					if(multipartRequest.getParameter("file" + i + "No") != null && !(multipartRequest.getParameter("file" + i + "No").equals(""))) {
						
						at.setFileNo(Integer.parseInt(multipartRequest.getParameter("file" + i + "No")));
				
						if(i == 1) {
							p.setThumbImg("resources/product_img/" + multipartRequest.getFilesystemName(key));
						}
					
						updateList.add(at);
					}
					
					// 기존에 이미지가 존재 하지 않았다면 (보완 필요)
					else {
						
						at.setFileLevel(2);
						
						insertList.add(at);
					}
						
				}
			}
			
			int result = new AdminProductService().updateProduct(p, updateList);
			int result2 = new AdminProductService().upsertProAtt(proNo, insertList);
			
			if(result*result2>0) {
				request.getSession().setAttribute("alertMsg", "상품 수정 성공");
				response.sendRedirect(request.getContextPath() + "/search.adPro?cpage=1");
			} else {
				request.getSession().setAttribute("alertMsg", "상품 수정 실패");
				response.sendRedirect(request.getContextPath() + "/search.adPro?cpage=1");
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
