package org.kosta.healthin.model.vo;

public class PayVO implements VO {
	private int payNo;
	private int price;
	private String payDate;
	private String payState;
	private String userId;
	private String trainerId;
	private int period;
	public PayVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PayVO(int payNo, int price, String payDate, String payState, String userId, String trainerId, int period) {
		super();
		this.payNo = payNo;
		this.price = price;
		this.payDate = payDate;
		this.payState = payState;
		this.userId = userId;
		this.trainerId = trainerId;
		this.period = period;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	@Override
	public String toString() {
		return "PayVO [payNo=" + payNo + ", price=" + price + ", payDate=" + payDate + ", payState=" + payState
				+ ", userId=" + userId + ", trainerId=" + trainerId + ", period=" + period + "]";
	}
}
