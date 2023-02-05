package com.odd.board.model.vo;

public class Reply {
	
	private int replyNo;
	private int boardType;
	private int boardNo;
	private String replyWriter;
	private String replyContent;
	private String createDate;
	private String status;
	private int count;
	
	public Reply() {}
	public Reply(int replyNo, int boardType, int boardNo, String replyWriter, String replyContent, String createDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.boardType = boardType;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
	}
	// selectReplyList
	public Reply(int replyNo, String replyWriter, String replyContent, String createDate, int count) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.count = count;
	}
	
	// selectReplyList(관리자)
	public Reply(int replyNo, int boardNo, String replyWriter, String replyContent, String createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
	}
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardType=" + boardType + ", boardNo=" + boardNo + ", replyWriter="
				+ replyWriter + ", replyContent=" + replyContent + ", createDate=" + createDate + ", status=" + status
				+ "]";
	}
}
