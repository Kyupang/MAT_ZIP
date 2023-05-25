package com.mat.zip.point;

public class PointSaveHistoryVO {

	private String user_id;
	private String type;
	private int point;
	private int sumpoint;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getSumpoint() {
		return sumpoint;
	}

	public void setSumpoint(int sumpoint) {
		this.sumpoint = sumpoint;
	}

	@Override
	public String toString() {
		return "PointSaveHistoryVO [user_id=" + user_id + ", type=" + type + ", point=" + point + ", sumpoint="
				+ sumpoint + "]";
	}

}
