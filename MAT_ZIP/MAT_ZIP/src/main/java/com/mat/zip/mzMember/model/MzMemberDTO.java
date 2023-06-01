package com.mat.zip.mzMember.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class MzMemberDTO {
	
	private int uniqueNumber; //고유번호
	
	@Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9]+[.][A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")
	@NotBlank(message = "필수 입력 항목입니다.")
	private String user_id;
	
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[a-z\\d@!%*#?&]{6,15}$", message = "6~15자의 영문 대소문자, 숫자, 특수문자를 사용하여 입력해 주세요.")
	@NotBlank(message = "필수 입력 항목입니다.")
	private String password;
	
	private String pwCheck;
	
	@Pattern(regexp = "^[가-힣]{2,}$", message = "이름은 한글만 입력 가능합니다.")
	@NotBlank(message = "필수 입력 항목입니다.")
	private String name;
	
	@NotBlank(message = "필수 입력 항목입니다.")
	private String gender; //옵션 체크
	
	@Pattern(regexp = "^[0-9]{4}-?(0[1-9]|1[0-2])-?(0[1-9]|[12][0-9]|3[01])$", message = "yyyy-mm-dd의 형식으로 입력해 주세요.")
	private String birthDate;
	
	private String ageGroup; //연령대 
	
	@Pattern(regexp = "^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$", message = "휴대전화 형식이 올바르지 않습니다.")
	@NotBlank(message = "필수 입력 항목입니다.")
	private String phNum;
	
	private String nickName; //닉네임
	
	private String user; //사장 or 일반
	
	private String mark; //등급
	
	private String profile;
		
	private int point; //보유 포인트
	
	private String accountDate; //가입 날짜 
	
	public int getUniqueNumber() {
		return uniqueNumber;
	}

	public void setUniqueNumber(int uniqueNumber) {
		this.uniqueNumber = uniqueNumber;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPwCheck() {
		return pwCheck;
	}

	public void setPwCheck(String pwCheck) {
		this.pwCheck = pwCheck;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthDate() {
		return birthDate;
	}
	
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
	public String getAgeGroup() {
		return ageGroup;
	}

	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}
	
	public String getPhNum() {
		return phNum;
	}
	
	public void setPhNum(String phNum) {
		this.phNum = phNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAccountDate() {
//		LocalDate now = LocalDate.now();
//		String date = now.toString().replace("-", "");
//		accountDate = date;
		return accountDate;
	}

	public void setAccountDate(String accountDate) {
		this.accountDate = accountDate;
	}

	@Override
	public String toString() {
		return "mzMemberDTO [uniqueNumber=" + uniqueNumber + ", user_id=" + user_id + ", password=" + password
				+ ", pwCheck=" + pwCheck + ", name=" + name + ", gender=" + gender + ", birthDate=" + birthDate
				+ ", ageGroup=" + ageGroup + ", phNum=" + phNum + ", nickName=" + nickName + ", user=" + user
				+ ", mark=" + mark + ", profile=" + profile + ", point=" + point + ", accountDate=" + accountDate + "]";
	}

	

}

