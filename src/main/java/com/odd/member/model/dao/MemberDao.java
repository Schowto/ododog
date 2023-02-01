package com.odd.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.odd.common.JDBCTemplate.*;

import com.odd.board.model.vo.FAQ;
import com.odd.member.model.vo.Member;
import com.odd.member.model.vo.Point;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
							   rset.getString("USER_ID"),
							   rset.getString("USER_PWD"),
							   rset.getString("USER_NAME"),
							   rset.getString("EMAIL"),
							   rset.getString("PHONE"),
							   rset.getInt("POST_CODE"),
							   rset.getString("ADDRESS"),
							   rset.getString("DETAILED_ADDRESS"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getDate("MODIFY_DATE"),
							   rset.getString("STATUS"),
							   rset.getInt("POINT")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUser_Id());
			pstmt.setString(2, m.getUser_Pwd());
			pstmt.setString(3, m.getUser_Name());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setInt(6, m.getPost_Code());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getDetailed_Address());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		

	}
	
	public ArrayList<Member> selectMemberList(Connection conn){
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setUser_No(rset.getInt("User_No"));
				m.setUser_Id(rset.getString("User_Id"));
				m.setUser_Name(rset.getString("User_Name"));
				m.setEmail(rset.getString("Email"));
				m.setPhone(rset.getString("Phone"));
				m.setPost_Code(rset.getInt("Post_Code"));
				m.setAddress(rset.getString("Address"));
				m.setDetailed_Address(rset.getString("Detailed_Address"));
				m.setPoint(rset.getInt("Point"));
				list.add(m);
								 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	
	}
	
	/**
	 * 회원정보수정 정은
	 * @param conn
	 * @param m
	 * @return
	 */
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUser_Name());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setInt(4, m.getPost_Code());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getDetailed_Address());
			pstmt.setString(7, m.getUser_Id());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 비밀번호변경 (정은)
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @param updatePwd
	 * @return
	 */
	public int updatePwdMember(Connection conn, String userId, String userPwd, String updatePwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 회원탈퇴시 비밀번호확인 (정은)
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public int memberPwdCheck(Connection conn, String userId, String userPwd) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberPwdCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	/**
	 * 아이디 중복체크 (소민)
	 * @param conn
	 * @param checkId
	 * @return
	 */
	public int idcheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idcheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return count;
		
	}
	

	/**
	 * 회원탈퇴 (정은)
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public int memberDelete(Connection conn, String userId, String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 정보수정후 객체조회 (정은)
	 * @param conn
	 * @param userId
	 * @return
	 */
	public Member selectLoginMember(Connection conn, String userId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
						       rset.getString("user_id"),
						       rset.getString("user_pwd"),
						       rset.getString("user_name"),
						       rset.getString("email"),
						       rset.getString("phone"),
						       rset.getInt("post_code"),
						       rset.getString("address"),
						       rset.getString("detailed_address"),
						       rset.getDate("enroll_date"),
						       rset.getDate("modify_Date"),
						       rset.getString("status"),
						       rset.getInt("point"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
		
		
	/**
	 * 관리자가 회원삭제 (소민)
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int admindeleteMember(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("admindeleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		 return result;
		
		
	}
	
	public ArrayList<Point> selectPointList(Connection conn, int userNo){
		ArrayList<Point> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPointList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				plist.add(new Point(rset.getInt("user_No"),
								   rset.getDate("point_Date"),
								   rset.getString("point_Use"),
								   rset.getInt("point_Price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		 return plist;
	}
	
	
		

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
