package org.kosta.healthin.model.vo;

public class RateVO implements VO {
	private String userId;
	private String trainerId;
	private String content;
	private Double rate;
	private String rateDate;
	public RateVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RateVO(String userId, String trainerId, String content, Double rate, String rateDate) {
		super();
		this.userId = userId;
		this.trainerId = trainerId;
		this.content = content;
		this.rate = rate;
		this.rateDate = rateDate;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getRateDate() {
		return rateDate;
	}
	public void setRateDate(String rateDate) {
		this.rateDate = rateDate;
	}
	@Override
	public String toString() {
		return "RateVO [userId=" + userId + ", trainerId=" + trainerId + ", content=" + content + ", rate=" + rate
				+ ", rateDate=" + rateDate + "]";
	}
}
