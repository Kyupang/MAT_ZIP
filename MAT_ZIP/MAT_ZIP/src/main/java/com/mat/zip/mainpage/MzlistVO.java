package com.mat.zip.mainpage;


public class MzlistVO {

	//MemberVO가방에 넣은 데이터는 member테이블에 들어갈 예정
	
	private int no;
	private String landNumAddress;
	private String roadNumAddress;
	private String name;
	private String status;
	private String tel;
	private String food;
	private String star;
	private String img;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getLandNumAddress() {
		return landNumAddress;
	}
	public void setLandNumAddress(String landNumAddress) {
		this.landNumAddress = landNumAddress;
	}
	public String getRoadNumAddress() {
		return roadNumAddress;
	}
	public void setRoadNumAddress(String roadNumAddress) {
		this.roadNumAddress = roadNumAddress;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	@Override
	public String toString() {
		return "MzlistVO [no=" + no + ", landNumAddress=" + landNumAddress + ", roadNumAddress=" + roadNumAddress
				+ ", name=" + name + ", status=" + status + ", tel=" + tel + ", food=" + food + ", star=" + star
				+ ", img=" + img + "]";
	}
	

	
	
}
