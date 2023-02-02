package com.odd.product.model.vo;

import java.sql.Date;

public class ProAtt {

	private int fileNo;
	private int proNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private int fileLevel;
	
	public ProAtt() {}

	public ProAtt(int fileNo, int proNo, String filePath, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.proNo = proNo;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}

	public ProAtt(int fileNo, int proNo, String changeName, String filePath, Date uploadDate, String status,
			int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.proNo = proNo;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileLevel = fileLevel;
	}


	public ProAtt(int fileNo, int proNo, String originName, String changeName, String filePath, Date uploadDate,
			String status, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.proNo = proNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileLevel = fileLevel;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "ProAtt [fileNo=" + fileNo + ", proNo=" + proNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status
				+ ", fileLevel=" + fileLevel + "]";
	}

	public ProAtt(int proNo, String filePath, int fileLevel) {
		super();
		this.proNo = proNo;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}
	
	
	
}
