package com.odd.board.model.vo;

public class Board {
	
	private int boardNo;
	private int boardType;			// 공지사항1 | 자유게시판2
	private String boardTitle;
	private String boardContent;	// 나중에 CLOB -> String 구문 추가해야함
	private String boardWriter;
	private int count;
	private String createDate;
	private String status;
	
	private int prevNo;
	private String prevTitle;
	private int nextNo;
	private String nextTitle;
	
	public Board() {};
	public Board(int boardNo, int boardType, String boardTitle, String boardContent, String boardWriter, int count,
			String createDate, String status, int prevNo, String prevTitle, int nextNo, String nextTitle) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.prevNo = prevNo;
		this.prevTitle = prevTitle;
		this.nextNo = nextNo;
		this.nextTitle = nextTitle;
	}
	
	// selectList
	public Board(int boardNo, String boardTitle, String boardWriter, int count, String createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}
	
	// detail
	public Board(int boardNo, int boardType, String boardTitle, String boardContent, String boardWriter, int count,
			String createDate, int prevNo, String prevTitle, int nextNo, String nextTitle) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.prevNo = prevNo;
		this.prevTitle = prevTitle;
		this.nextNo = nextNo;
		this.nextTitle = nextTitle;
	}
	
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	
	public int getPrevNo() {
		return prevNo;
	}
	public void setPrevBoardNo(int prevNo) {
		this.prevNo = prevNo;
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevBoardTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public int getNextNo() {
		return nextNo;
	}
	public void setNextBoardNo(int nextNo) {
		this.nextNo = nextNo;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextBoardTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardWriter=" + boardWriter + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
}
