package com.mat.zip.point;

public class PointSaveHistoryVO {

	private int no;
	private String user_id;
	private int point;
	private String store;

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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	@Override
	public String toString() {
		return "PointSaveHistory [no=" + no + ", user_id=" + user_id + ", point=" + point + ", store=" + store + "]";
	}

}
