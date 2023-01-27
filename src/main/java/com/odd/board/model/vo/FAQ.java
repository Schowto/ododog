package com.odd.board.model.vo;

public class FAQ {
	
	 private int contactNo;
	 private String contactTitle;
	 private String contactAnswer;
	 private String category;
	 private int faqWriter;
	 private String Status;
	 
	 public FAQ() {}

	 
	 
	public FAQ(int contactNo, String contactTitle, String contactAnswer, String category) {
		super();
		this.contactTitle = contactTitle;
		this.contactAnswer = contactAnswer;
		this.category = category;
		this.contactNo = contactNo;
	}

	public FAQ(int contactNo, String contactTitle, String contactAnswer, String category, int faqWriter,
			String status) {
		super();
		this.contactNo = contactNo;
		this.contactTitle = contactTitle;
		this.contactAnswer = contactAnswer;
		this.category = category;
		this.faqWriter = faqWriter;
		Status = status;
	}

	public int getContactNo() {
		return contactNo;
	}

	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}

	public String getContactTitle() {
		return contactTitle;
	}

	public void setContactTitle(String contactTitle) {
		this.contactTitle = contactTitle;
	}

	public String getContactAnswer() {
		return contactAnswer;
	}

	public void setContactAnswer(String contactAnswer) {
		this.contactAnswer = contactAnswer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(int faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "FAQ [contactNo=" + contactNo + ", contactTitle=" + contactTitle + ", contactAnswer=" + contactAnswer
				+ ", category=" + category + "]";
	}

	

	
	
	 
}
