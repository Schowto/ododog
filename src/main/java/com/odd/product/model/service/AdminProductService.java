package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.common.model.vo.PageInfo;
import com.odd.product.model.dao.AdminProductDao;
import com.odd.product.model.vo.AdminProSearch;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.Product;

public class AdminProductService {
	

	/** >> 전체 상품 개수 조회 
	 *     (AdminProductListController에서 페이징 처리를 위해 필요)
	 *     
	 * @return listCount >> 전체 상품 개수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int result = new AdminProductDao().selectListCount(conn);
		close(conn);
		
		return result;
	}
	
	/** >> 상품 목록 조회
	 * @param pi >> 페이지 처리 정보 (AdminProductListController에서 지정해줌)
	 * @param order >> 정렬 기준 ("PRO_NO", "CATEGORY" ...)
	 * @param by >>  오름차순/내림차순 ("ASC", "DESC")
	 * @return list >> 현재 페이지에 들어갈 상품 리스트
	 */
	public ArrayList<Product> selectList(PageInfo pi, String order, String by){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new AdminProductDao().selectList(conn, pi, order, by);
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> searchList(AdminProSearch proSearch){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new AdminProductDao().searchList(conn, proSearch);
		close(conn);
		
		return list;
	}
	
	public int insertProduct (Product p, ArrayList<ProAtt> list) {
		
		Connection conn = getConnection();

		int result1 = new AdminProductDao().insertProduct(conn, p);
		int result2 = new AdminProductDao().insertAttachList(conn, list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
	public int deleteProduct(String[] deleteList) {
		Connection conn = getConnection();
		
		int result1 = new AdminProductDao().deleteProduct(conn, deleteList);
		int result2 = new AdminProductDao().deleteProAtt(conn, deleteList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	/** >> 상품 상세 정보 조회
	 * @param proNo >> 클릭한 상품 번호
	 * @return p >> 번호로 조회한 상품 정보
	 */
	public Product selectProduct(int proNo) {
		Connection conn = getConnection();
		
		Product p = new AdminProductDao().selectProduct(conn, proNo);
		close(conn);
		
		return p;
	}
	
	/** >> 상품 이미지 조회
	 * @param proNo >> 클릭한 상품 번호
	 * @return list >> 번호로 조회한 상품 이미지 리스트
	 */
	public ArrayList<ProAtt> selectProAtt(int proNo){
		Connection conn = getConnection();
		
		ArrayList<ProAtt> list = new AdminProductDao().selectProAtt(conn, proNo);
		close(conn);
		
		return list;
	}
	
	public int updateProduct(Product p, ArrayList<ProAtt> list) {
		
		Connection conn = getConnection();

		int result1 = new AdminProductDao().updateProduct(conn, p);
		int result2 = new AdminProductDao().updateAttachList(conn, list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
}
