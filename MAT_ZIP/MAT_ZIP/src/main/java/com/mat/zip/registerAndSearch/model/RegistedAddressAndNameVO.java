package com.mat.zip.registerAndSearch.model;

public class RegistedAddressAndNameVO {
	private String landNumAddress;
	private String name;
	private int count;
	private String food;
	
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getLandNumAddress() {
		return landNumAddress;
	}
	public void setLandNumAddress(String landNumAddress) {
		this.landNumAddress = landNumAddress;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "RegistedAddressAndNameVO [landNumAddress=" + landNumAddress + ", name=" + name + ", count=" + count
				+ ", food=" + food + "]";
	}
	
	
}
