package org.kosta.healthin.model.vo;

public class DoneExerciseVO {
	private int consumptionNo;
	private String exName;
	private double calorie;
	private int exHour;
	private int totalCalorie;
	public DoneExerciseVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DoneExerciseVO(int consumptionNo, String exName, double calorie, int exHour, int totalCalorie) {
		super();
		this.consumptionNo = consumptionNo;
		this.exName = exName;
		this.calorie = calorie;
		this.exHour = exHour;
		this.totalCalorie = totalCalorie;
	}
	public int getConsumptionNo() {
		return consumptionNo;
	}
	public void setConsumptionNo(int consumptionNo) {
		this.consumptionNo = consumptionNo;
	}
	public String getExName() {
		return exName;
	}
	public void setExName(String exName) {
		this.exName = exName;
	}
	public double getCalorie() {
		return calorie;
	}
	public void setCalorie(double calorie) {
		this.calorie = calorie;
	}
	public int getExHour() {
		return exHour;
	}
	public void setExHour(int exHour) {
		this.exHour = exHour;
	}
	public int getTotalCalorie() {
		return totalCalorie;
	}
	public void setTotalCalorie(int totalCalorie) {
		this.totalCalorie = totalCalorie;
	}
	@Override
	public String toString() {
		return "DoneExerciseVO [consumptionNo=" + consumptionNo + ", exName=" + exName + ", calorie=" + calorie
				+ ", exHour=" + exHour + ", totalCalorie=" + totalCalorie + "]";
	}
	
}
