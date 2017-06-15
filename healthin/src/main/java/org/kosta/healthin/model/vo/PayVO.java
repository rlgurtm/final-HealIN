package org.kosta.healthin.model.vo;

public class PayVO implements VO {
	private int payNo;
	private int price;
	private String payDate;
	private String payState;
	private String userId;
	private TrainerVO trainerId;
	private int period;
	private RateVO rateVO;
	public PayVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PayVO(int payNo, int price, String payDate, String payState, String userId, TrainerVO trainerId, int period,
			RateVO rateVO) {
		super();
		this.payNo = payNo;
		this.price = price;
		this.payDate = payDate;
		this.payState = payState;
		this.userId = userId;
		this.trainerId = trainerId;
		this.period = period;
		this.rateVO = rateVO;
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
	public TrainerVO getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(TrainerVO trainerId) {
		this.trainerId = trainerId;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public RateVO getRateVO() {
		return rateVO;
	}
	public void setRateVO(RateVO rateVO) {
		this.rateVO = rateVO;
	}
	@Override
	public String toString() {
		return "PayVO [payNo=" + payNo + ", price=" + price + ", payDate=" + payDate + ", payState=" + payState
				+ ", userId=" + userId + ", trainerId=" + trainerId + ", period=" + period + ", rateVO=" + rateVO + "]";
	}
}
