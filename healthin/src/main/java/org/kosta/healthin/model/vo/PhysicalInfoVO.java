package org.kosta.healthin.model.vo;

public class PhysicalInfoVO{
	private String height;
	private String weight;
	private String today;
	private String user_Id;
	private int physical_no;
	private double bmiValue;
	public PhysicalInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PhysicalInfoVO(String height, String weight, String today, String user_Id, int physical_no,
			double bmiValue) {
		super();
		this.height = height;
		this.weight = weight;
		this.today = today;
		this.user_Id = user_Id;
		this.physical_no = physical_no;
		this.bmiValue = bmiValue;
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
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public int getPhysical_no() {
		return physical_no;
	}
	public void setPhysical_no(int physical_no) {
		this.physical_no = physical_no;
	}
	public double getBmiValue() {
		return bmiValue;
	}
	public void setBmiValue(double bmiValue) {
		this.bmiValue = bmiValue;
	}
	@Override
	public String toString() {
		return "PhysicalInfoVO [height=" + height + ", weight=" + weight + ", today=" + today + ", user_Id=" + user_Id
				+ ", physical_no=" + physical_no + ", bmiValue=" + bmiValue + "]";
	}
	
	
}