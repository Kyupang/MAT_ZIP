package com.mat.zip.point.model;

public class PointInquiryVO {

	private String user_id;
	private int point;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "PointInquiryVO [user_id=" + user_id + ", point=" + point + "]";
	}

}
