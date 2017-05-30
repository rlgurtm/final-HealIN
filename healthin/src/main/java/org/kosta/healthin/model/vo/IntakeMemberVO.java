package org.kosta.healthin.model.vo;

public class IntakeMemberVO {
	private int intakeNo;
	private String foodName;
	private int count;
	private String date;
	private MemberVO memberVO;
	public IntakeMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IntakeMemberVO(int intakeNo, String foodName, int count, String date, MemberVO memberVO) {
		super();
		this.intakeNo = intakeNo;
		this.foodName = foodName;
		this.count = count;
		this.date = date;
		this.memberVO = memberVO;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "IntakeMemberVO [intakeNo=" + intakeNo + ", foodName=" + foodName + ", count=" + count + ", date=" + date
				+ ", memberVO=" + memberVO + "]";
	}
}
