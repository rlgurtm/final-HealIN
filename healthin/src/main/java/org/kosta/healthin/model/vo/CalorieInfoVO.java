package org.kosta.healthin.model.vo;

public class CalorieInfoVO {
	private String date;
	private int totalIntakeCalorie;
	private int totalConsumptionCalorie;
	public CalorieInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalorieInfoVO(String date, int totalIntakeCalorie, int totalConsumptionCalorie) {
		super();
		this.date = date;
		this.totalIntakeCalorie = totalIntakeCalorie;
		this.totalConsumptionCalorie = totalConsumptionCalorie;
	}
	public CalorieInfoVO(String date, int totalCalorie, boolean flag) {
		this.date = date;
		if (flag == true) {
			this.totalConsumptionCalorie = totalCalorie;
		} else {
			this.totalIntakeCalorie = totalCalorie;
		}
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTotalIntakeCalorie() {
		return totalIntakeCalorie;
	}
	public void setTotalIntakeCalorie(int totalIntakeCalorie) {
		this.totalIntakeCalorie = totalIntakeCalorie;
	}
	public int getTotalConsumptionCalorie() {
		return totalConsumptionCalorie;
	}
	public void setTotalConsumptionCalorie(int totalConsumptionCalorie) {
		this.totalConsumptionCalorie = totalConsumptionCalorie;
	}
	@Override
	public String toString() {
		return "CalorieInfoVO [date=" + date + ", totalIntakeCalorie=" + totalIntakeCalorie
				+ ", totalConsumptionCalorie=" + totalConsumptionCalorie + "]";
	}
}
