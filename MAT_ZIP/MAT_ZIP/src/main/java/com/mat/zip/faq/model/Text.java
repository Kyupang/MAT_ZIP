package com.mat.zip.faq.model;

public class Text {
	private String type = "text"; //고정값
	private TextData data;
	
	public Text(String description) {
		this.data = new TextData(description);
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public TextData getData() {
		return data;
	}

	public void setData(TextData data) {
		this.data = data;
	}

	public class TextData { // 사용자에게 보여줄 데이터 담아서 리턴
		private String description;
		
		public TextData(String description) {
			super();
			this.description = description;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}
		
	}
}
