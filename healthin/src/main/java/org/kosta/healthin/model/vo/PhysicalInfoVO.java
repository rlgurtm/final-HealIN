package org.kosta.healthin.model.vo;

public class PhysicalInfoVO {
	private String height;
	private String weight;
	private String date;
	private String user_Id;
	public PhysicalInfoVO() {
		super();
	}
	public PhysicalInfoVO(String height, String weight, String date, String user_Id) {
		super();
		this.height = height;
		this.weight = weight;
		this.date = date;
		this.user_Id = user_Id;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	@Override
	public String toString() {
		return "PhysicalInfoVO [height=" + height + ", weight=" + weight + ", date=" + date + ", user_Id=" + user_Id
				+ "]";
	}
	
}
