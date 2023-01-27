package com.odd.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int User_No;
	private String User_Id;
	private String User_Pwd;
	private String User_Name;
	private String Email;
	private String Phone;
	private int Post_Code;
	private String Address;
	private String Detailed_Address;
	private Date Enroll_Date;
	private Date Modify_Date;
	private String Status;
	private int Point;
	


 public Member() {}



public Member(String user_Id, String user_Pwd, String user_Name, String email, String phone, int post_Code,
		String address, String detailed_Address) {
	super();
	User_Id = user_Id;
	User_Pwd = user_Pwd;
	User_Name = user_Name;
	Email = email;
	Phone = phone;
	Post_Code = post_Code;
	Address = address;
	Detailed_Address = detailed_Address;
}



public Member(int user_No, String user_Name, String user_Id, String email, String phone, String address, int point) {
	super();
	User_No = user_No;
	User_Name = user_Name;
	User_Id = user_Id;
	Email = email;
	Phone = phone;
	Address = address;
	Point = point;
}



public Member(int user_No, String user_Id, String user_Pwd, String user_Name, String email, String phone, int post_Code,
		String address, String detailed_Address, Date enroll_Date, Date modify_Date, String status, int point) {
	super();
	User_No = user_No;
	User_Id = user_Id;
	User_Pwd = user_Pwd;
	User_Name = user_Name;
	Email = email;
	Phone = phone;
	Post_Code = post_Code;
	Address = address;
	Detailed_Address = detailed_Address;
	Enroll_Date = enroll_Date;
	Modify_Date = modify_Date;
	Status = status;
	Point = point;
}



public int getUser_No() {
	return User_No;
}



public void setUser_No(int user_No) {
	User_No = user_No;
}



public String getUser_Id() {
	return User_Id;
}



public void setUser_Id(String user_Id) {
	User_Id = user_Id;
}



public String getUser_Pwd() {
	return User_Pwd;
}



public void setUser_Pwd(String user_Pwd) {
	User_Pwd = user_Pwd;
}



public String getUser_Name() {
	return User_Name;
}



public void setUser_Name(String user_Name) {
	User_Name = user_Name;
}



public String getEmail() {
	return Email;
}



public void setEmail(String email) {
	Email = email;
}



public String getPhone() {
	return Phone;
}



public void setPhone(String phone) {
	Phone = phone;
}



public int getPost_Code() {
	return Post_Code;
}



public void setPost_Code(int post_Code) {
	Post_Code = post_Code;
}



public String getAddress() {
	return Address;
}



public void setAddress(String address) {
	Address = address;
}



public String getDetailed_Address() {
	return Detailed_Address;
}



public void setDetailed_Address(String detailed_Address) {
	Detailed_Address = detailed_Address;
}



public Date getEnroll_Date() {
	return Enroll_Date;
}



public void setEnroll_Date(Date enroll_Date) {
	Enroll_Date = enroll_Date;
}



public Date getModify_Date() {
	return Modify_Date;
}



public void setModify_Date(Date modify_Date) {
	Modify_Date = modify_Date;
}



public String getStatus() {
	return Status;
}



public void setStatus(String status) {
	Status = status;
}



public int getPoint() {
	return Point;
}



public void setPoint(int point) {
	Point = point;
}



@Override
public String toString() {
	return "Member [User_No=" + User_No + ", User_Id=" + User_Id + ", User_Pwd=" + User_Pwd + ", User_Name=" + User_Name
			+ ", Email=" + Email + ", Phone=" + Phone + ", Post_Code=" + Post_Code + ", Address=" + Address
			+ ", Detailed_Address=" + Detailed_Address + ", Enroll_Date=" + Enroll_Date + ", Modify_Date=" + Modify_Date
			+ ", Status=" + Status + ", Point=" + Point + "]";
}
 
 
}