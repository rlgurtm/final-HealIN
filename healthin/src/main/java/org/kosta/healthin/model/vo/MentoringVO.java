package org.kosta.healthin.model.vo;

public class MentoringVO implements VO {
	private int mentoringNo;
	private String sendId;
	private String receiveId;
	private String content;
	private String postedDate;
	private int hits;
	public MentoringVO() {
		super();
	}
	public MentoringVO(int mentoringNo, String sendId, String receiveId, String content, String postedDate, int hits) {
		super();
		this.mentoringNo = mentoringNo;
		this.sendId = sendId;
		this.receiveId = receiveId;
		this.content = content;
		this.postedDate = postedDate;
		this.hits = hits;
	}
	public int getMentoringNo() {
		return mentoringNo;
	}
	public void setMentoringNo(int mentoringNo) {
		this.mentoringNo = mentoringNo;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return "MentoringVO [mentoringNo=" + mentoringNo + ", sendId=" + sendId + ", receiveId=" + receiveId
				+ ", content=" + content + ", postedDate=" + postedDate + ", hits=" + hits + "]";
	}
	
}
