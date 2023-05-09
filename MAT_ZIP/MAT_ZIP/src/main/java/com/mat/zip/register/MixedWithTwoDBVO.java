package com.mat.zip.register;

public class MixedWithTwoDBVO {
	private String storeAddress;
	private String name;
	
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAdress) {
		this.storeAddress = storeAdress;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "MixedWithTwoDBVO [storeAdress=" + storeAddress + ", name=" + name + "]";
	}
	
	
}
