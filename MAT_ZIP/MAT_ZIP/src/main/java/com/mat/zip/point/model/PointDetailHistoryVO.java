package com.mat.zip.point.model;

public class PointDetailHistoryVO {

	private int no;
	private String user_id;
	private String type;
	private int point;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

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

	@Override
	public String toString() {
		return "PointDetailHistoryVO [no=" + no + ", user_id=" + user_id + ", type=" + type + ", point=" + point + "]";
	}

}
