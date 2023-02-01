package com.odd.board.model.vo;

public class Cooking {
	private int cookingNo;
	private int	recipeNo;
	private int	cookingOrder;
	private String cookingContent;
	private String filePath;
	public Cooking() {}
	public Cooking(int cookingNo, int recipeNo, int cookingOrder, String cookingContent, String filePath) {
		super();
		this.cookingNo = cookingNo;
		this.recipeNo = recipeNo;
		this.cookingOrder = cookingOrder;
		this.cookingContent = cookingContent;
		this.filePath = filePath;
	}
	public int getCookingNo() {
		return cookingNo;
	}
	public void setCookingNo(int cookingNo) {
		this.cookingNo = cookingNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getCookingOrder() {
		return cookingOrder;
	}
	public void setCookingOrder(int cookingOrder) {
		this.cookingOrder = cookingOrder;
	}
	public String getCookingContent() {
		return cookingContent;
	}
	public void setCookingContent(String cookingContent) {
		this.cookingContent = cookingContent;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "Cooking [cookingNo=" + cookingNo + ", recipeNo=" + recipeNo + ", cookingOrder=" + cookingOrder
				+ ", cookingContent=" + cookingContent + ", filePath=" + filePath + "]";
	}
}
