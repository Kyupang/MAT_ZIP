package com.mat.zip.registerAndSearch.model;

public class MZRegisterInfoVO {
	private int no;
	private String userId;
	private String storeAddress;
	private String storePhoneNumber;
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
	public String getStorePhoneNumber() {
		return storePhoneNumber;
	}
	public void setStorePhoneNumber(String storePhoneNumber) {
		this.storePhoneNumber = storePhoneNumber;
	}
	public String getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(String buyTime) {
		this.buyTime = buyTime;
	}
	@Override
	public String toString() {
		return "MZRegisterInfoVO [no=" + no + ", userId=" + userId + ", storeAddress=" + storeAddress
				+ ", storePhoneNumber=" + storePhoneNumber + ", buyTime=" + buyTime + "]";
	}
}
