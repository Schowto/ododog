package com.odd.recipe.model.vo;

public class Heart {
	private int	recipeNo;
	private int	usertNo;
	private String heartDate;
	
	private int count;

	public Heart(int recipeNo, int usertNo, String heartDate, int count) {
		super();
		this.recipeNo = recipeNo;
		this.usertNo = usertNo;
		this.heartDate = heartDate;
		this.count = count;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getUsertNo() {
		return usertNo;
	}

	public void setUsertNo(int usertNo) {
		this.usertNo = usertNo;
	}

	public String getHeartDate() {
		return heartDate;
	}

	public void setHeartDate(String heartDate) {
		this.heartDate = heartDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Heart [recipeNo=" + recipeNo + ", usertNo=" + usertNo + ", heartDate=" + heartDate + ", count=" + count
				+ "]";
	}
	
	

}
