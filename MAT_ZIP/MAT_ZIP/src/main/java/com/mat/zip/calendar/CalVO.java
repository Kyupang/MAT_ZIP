package com.mat.zip.calendar;

//RAM에 만드는 저장공간을 만든다.
public class CalVO {
	
	private int schedule_idx;
	private int schedule_num;
	private String schedule_subject;
	private String schedule_desc;
	private String schedule_date;
	private String schedule_share;
	private String schedule_mycolor;
	
	// 하나의 변수당 set/get 하나씩 만들어줌
	// 가방에 하나씩 값을 넣어주어야 함. ==> setter
	public int getSchedule_idx() {
		return schedule_idx;
	}
	
	// 가방에 하나씩 값을 꺼내주어야 ㅎ ㅏㅁ. ==> getter
	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
	}
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	public String getSchedule_subject() {
		return schedule_subject;
	}
	public void setSchedule_subject(String schedule_subject) {
		this.schedule_subject = schedule_subject;
	}
	public String getSchedule_desc() {
		return schedule_desc;
	}
	public void setSchedule_desc(String schedule_desc) {
		this.schedule_desc = schedule_desc;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getSchedule_share() {
		return schedule_share;
	}
	public void setSchedule_share(String schedule_share) {
		this.schedule_share = schedule_share;
	}
	public String getSchedule_mycolor() {
		return schedule_mycolor;
	}
	public void setSchedule_mycolor(String schedule_mycolor) {
		this.schedule_mycolor = schedule_mycolor;
	}

	@Override
	public String toString() {
		return "CalVO [schedule_idx=" + schedule_idx + ", schedule_num=" + schedule_num + ", schedule_subject="
				+ schedule_subject + ", schedule_desc=" + schedule_desc + ", schedule_date=" + schedule_date
				+ ", schedule_share=" + schedule_share + ", schedule_mycolor=" + schedule_mycolor + "]";
	}
	
	
}
