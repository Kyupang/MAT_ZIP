package com.mat.zip.point;

public class gifticonVO {

	private int id;
	private String name;
	private String description;
	private int point;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "gifticonVO [id=" + id + ", name=" + name + ", description=" + description + ", point=" + point + "]";
	}

}
