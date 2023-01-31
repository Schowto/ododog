package com.odd.member.model.vo;

public class Admin {

	private int Admin_no;
	private String Admin_Id;
	private String Password;
	
	public Admin() {}

	public int getAdmin_no() {
		return Admin_no;
	}

	public void setAdmin_no(int admin_no) {
		Admin_no = admin_no;
	}

	public String getAdmin_Id() {
		return Admin_Id;
	}

	public void setAdmin_Id(String admin_Id) {
		Admin_Id = admin_Id;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public Admin(int admin_no, String admin_Id, String password) {
		super();
		Admin_no = admin_no;
		Admin_Id = admin_Id;
		Password = password;
	}

	@Override
	public String toString() {
		return "Admin [Admin_no=" + Admin_no + ", Admin_Id=" + Admin_Id + ", Password=" + Password + "]";
	}

	
	
}
