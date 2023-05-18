package com.mat.zip.registerAndSearch.model;

public class RegistedAddressAndNameVO {
	private String landNumAddress;
	private String name;
	
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
		return "RegistedAddressAndNameVO [landNumAddress=" + landNumAddress + ", name=" + name + "]";
	}
}
