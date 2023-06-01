package com.mat.zip.faq.model;

import java.util.ArrayList;
import java.util.List;

public class ChatSendReq {
	private String version = "v2"; //챗봇 버전, v2로 고정값
	private String userId;
	private long timestamp;
	private List<Text> bubbles = new ArrayList<Text>();
	private String event;
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	public List<Text> getBubbles() {
		return bubbles;
	}
	public void setBubbles(List<Text> bubbles) {
		this.bubbles = bubbles;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	
	@Override
	public String toString() {
		return "ChatSendReq [version=" + version + ", userId=" + userId + ", timestamp=" + timestamp + ", bubbles="
				+ bubbles + ", event=" + event + "]";
	}
	
	public void addText(String description) {
		this.bubbles.add(new Text(description));
	}
	
}
