package com.mat.zip.point;

public class ProductPointVO {

	private int id;
	private int point;
	private String name;
	private String img;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

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

	@Override
	public String toString() {
		return "ProductPointVO [id=" + id + ", point=" + point + ", name=" + name + ", img=" + img + "]";
	}

}
