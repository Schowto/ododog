package com.odd.recipe.model.vo;

public class Recipe {
	private int recipeNo;
	private String recipeTitle;
	private String recipeContent;
	private String recipeThumbImg;	// 썸네일 파일경로 + 수정명
	private String effect;			// 효과들 (10,20,30,40,50)
	private String time;			// 소요시간 (10,20,30,40)
	private String ingredient;		// 재료들
	private int processCount;		// 요리순서 개수 (2~10)
	private int count;
	private String createDate;
	private String status;
	
	private int replyCount;
	private int heartCount;
	private int myHeartStatus;		// 0,1
	
	public Recipe() {}
	public Recipe(int recipeNo, String recipeTitle, String recipeContent, String recipeThumbImg, String effect,
			String time, String ingredient, int processCount, int count, String createDate, String status) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeContent = recipeContent;
		this.recipeThumbImg = recipeThumbImg;
		this.effect = effect;
		this.time = time;
		this.ingredient = ingredient;
		this.processCount = processCount;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}
	
	// selectRecipe
	public Recipe(int recipeNo, String recipeTitle, String recipeContent, String recipeThumbImg, String effect,
			String time, String ingredient, int processCount) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeContent = recipeContent;
		this.recipeThumbImg = recipeThumbImg;
		this.effect = effect;
		this.time = time;
		this.ingredient = ingredient;
		this.processCount = processCount;
	}
	// selectList
	public Recipe(int recipeNo, String recipeTitle, String recipeThumbImg, int replyCount, int heartCount, int myHeartStatus) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeThumbImg = recipeThumbImg;
		this.replyCount = replyCount;
		this.heartCount = heartCount;
		this.myHeartStatus = myHeartStatus;
	}
	// adminSelectList
	public Recipe(int recipeNo, String recipeTitle, int count, String createDate, String status) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public String getRecipeThumbImg() {
		return recipeThumbImg;
	}
	public void setRecipeThumbImg(String recipeThumbImg) {
		this.recipeThumbImg = recipeThumbImg;
	}
	public String getEffect() {
		return effect;
	}
	public void setEffect(String effect) {
		this.effect = effect;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public int getProcessCount() {
		return processCount;
	}
	public void setProcessCount(int processCount) {
		this.processCount = processCount;
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
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getHeartCount() {
		return heartCount;
	}
	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}
	public int getMyHeartStatus() {
		return myHeartStatus;
	}
	public void setMyHeartStatus(int myHeartStatus) {
		this.myHeartStatus = myHeartStatus;
	}
	
	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", recipeContent=" + recipeContent
				+ ", recipeThumbImg=" + recipeThumbImg + ", effect=" + effect + ", time=" + time + ", ingredient="
				+ ingredient + ", processCount=" + processCount + ", count=" + count + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}
}
