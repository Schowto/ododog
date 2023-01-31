package com.odd.member.model.vo;

public class Admin {

	private int Admin_No;
	private String Admin_Id;
	private String Password;
	
	public Admin() {}

	public Admin(int admin_No, String admin_Id, String password) {
		super();
		Admin_No = admin_No;
		Admin_Id = admin_Id;
		Password = password;
	}

	public int getAdmin_No() {
		return Admin_No;
	}

	public void setAdmin_No(int admin_No) {
		Admin_No = admin_No;
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

	@Override
	public String toString() {
		return "Admin [Admin_No=" + Admin_No + ", Admin_Id=" + Admin_Id + ", Password=" + Password + "]";
	}

}
