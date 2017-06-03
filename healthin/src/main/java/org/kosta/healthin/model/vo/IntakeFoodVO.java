package org.kosta.healthin.model.vo;

public class IntakeFoodVO {
	private int intakeNo;
	private String foodName;
	private int calorie;
	private int count;
	private int totalCalorie;
	public IntakeFoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IntakeFoodVO(int intakeNo, String foodName, int calorie, int count, int totalCalorie) {
		super();
		this.intakeNo = intakeNo;
		this.foodName = foodName;
		this.calorie = calorie;
		this.count = count;
		this.totalCalorie = totalCalorie;
	}
	public int getIntakeNo() {
		return intakeNo;
	}
	public void setIntakeNo(int intakeNo) {
		this.intakeNo = intakeNo;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotalCalorie() {
		return totalCalorie;
	}
	public void setTotalCalorie(int totalCalorie) {
		this.totalCalorie = totalCalorie;
	}
	@Override
	public String toString() {
		return "IntakeFoodVO [intakeNo=" + intakeNo + ", foodName=" + foodName + ", calorie=" + calorie + ", count="
				+ count + ", totalCalorie=" + totalCalorie + "]";
	}
}
