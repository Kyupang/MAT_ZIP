package com.mat.zip.register;

public class MZInfoVO {
	private int no;
	private String userId;
	private String storeAddress;
	private int resiCount;
	private String buyTime;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public int getResiCount() {
		return resiCount;
	}
	public void setResiCount(int resiCount) {
		this.resiCount = resiCount;
	}
	public String getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(String buyTime) {
		this.buyTime = buyTime;
	}
	@Override
	public String toString() {
		return "MapVO [no=" + no + ", userId=" + userId + ", storeAddress=" + storeAddress + ", resiCount=" + resiCount
				+ ", buyTime=" + buyTime + "]";
	}
}
