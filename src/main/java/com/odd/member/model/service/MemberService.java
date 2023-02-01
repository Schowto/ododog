package com.odd.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.odd.common.JDBCTemplate.*;

import com.odd.board.model.dao.FAQDao;
import com.odd.board.model.vo.FAQ;
import com.odd.member.model.dao.MemberDao;
import com.odd.member.model.vo.Member;
import com.odd.member.model.vo.Point;

public class MemberService {
	
	/**
	 * 로그인 요청 (소민)
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
		
	}
	
	/**
	 * 회원가입요청 서비스 (소민)
	 * @param m
	 * @return
	 */
	public int insertMember(Member m) {
		 Connection conn = getConnection();
		 int result = new MemberDao().insertMember(conn, m);
		 
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
	}
	/**
	 * 회원조회 (소민)
	 * @return
	 */
	public ArrayList<Member> selectMemberList(){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		close(conn);
		return list;
	}
	
	/**
	 * 회원정보수정 (정은)
	 * @param m
	 * @return
	 */
	public Member updateMember(Member m, String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectLoginMember(conn, userId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateMem;
		
	}
	
	/**
	 * 비밀번호변경 (정은)
	 * @param userId
	 * @param userPwd
	 * @param updatePwd
	 * @return
	 */
	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectLoginMember(conn, userId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateMem;		
		
	}
	
	/**
	 * 회원탈퇴시 비밀번호확인 (정은)
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public int memberPwdCheck(String userId, String userPwd) {
		Connection conn = getConnection();
		int count = new MemberDao().memberPwdCheck(conn, userId, userPwd);
		
		close(conn);
		return count;
	}
	
	/**
	 * 아이디 중복체크 (소민)
	 * @param checkId
	 * @return
	 */
	public int idcheck(String checkId) {
		Connection conn = getConnection();
		int count = new MemberDao().idcheck(conn, checkId);
		close(conn);
		return count;
	}
	

	/**
	 * 회원탈퇴 (정은)
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		int result = new MemberDao().memberDelete(conn, userId, userPwd);
		
		close(conn);
		return result;
	}
	
	/**
	 * 관리자가 회원삭제 (소민)
	 * @param userNo
	 * @return
	 */
	public int admindeleteMember(int userNo) {
		Connection conn = getConnection();
		int result = new MemberDao().admindeleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Point> selectPointList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Point> plist = new MemberDao().selectPointList(conn, userNo);
		close(conn);
		return plist;
	}
		
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


		
	}
