package com.mat.zip.mzMember.model;

public class CategoryVO {
	private String user_id;
	private int korean;
	private int western;
	private int japanese;
	private int chinese;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getKorean() {
		return korean;
	}
	public void setKorean(int korean) {
		this.korean = korean;
	}
	public int getWestern() {
		return western;
	}
	public void setWestern(int western) {
		this.western = western;
	}
	public int getJapanese() {
		return japanese;
	}
	public void setJapanese(int japanese) {
		this.japanese = japanese;
	}
	public int getChinese() {
		return chinese;
	}
	public void setChinese(int chinese) {
		this.chinese = chinese;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [user_id=" + user_id + ", korean=" + korean + ", western=" + western + ", japanese="
				+ japanese + ", chinese=" + chinese + "]";
	}
	
}
