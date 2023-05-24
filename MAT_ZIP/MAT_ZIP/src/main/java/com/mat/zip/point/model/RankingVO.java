package com.mat.zip.point.model;

public class RankingVO {

	private String name;
	private String img;
	private int total;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "RankingVO [name=" + name + ", img=" + img + ", total=" + total + "]";
	}

}
