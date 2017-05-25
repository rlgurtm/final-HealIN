package org.kosta.healthin.model.vo;

public class MentoringVO implements VO {
	private int mentoringNo;
	private String userId;
	private String trainerId;
	private String content;
	private String date;
	private int hits;
	public MentoringVO() {
		super();
	}
	public MentoringVO(int mentoringNo, String userId, String trainerId, String content, String date, int hits) {
		super();
		this.mentoringNo = mentoringNo;
		this.userId = userId;
		this.trainerId = trainerId;
		this.content = content;
		this.date = date;
		this.hits = hits;
	}
	public int getMentoringNo() {
		return mentoringNo;
	}
	public void setMentoringNo(int mentoringNo) {
		this.mentoringNo = mentoringNo;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return "MentoringVO [mentoringNo=" + mentoringNo + ", userId=" + userId + ", trainerId=" + trainerId
				+ ", content=" + content + ", date=" + date + ", hits=" + hits + "]";
	}
	
}
