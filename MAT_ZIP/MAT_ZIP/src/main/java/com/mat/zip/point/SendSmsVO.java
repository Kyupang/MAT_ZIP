package com.mat.zip.point;

public class SendSmsVO {

	private String user_id;
	private String tel;
	private String img;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "SendSmsVO [user_id=" + user_id + ", tel=" + tel + ", img=" + img + "]";
	}

}
