package org.kosta.healthin.model.vo;

public class TrainerVideoVO{
	private int videoNo;
	private String title;
	private String content;
	private String videoFile;
	private String postedDate;
	private int hits;
	private String category;
	private String trainerId;
	private int openrank;
	private int likeState;
	public TrainerVideoVO() {
		super();
	}
	
	public TrainerVideoVO(int videoNo, String title, String content, String videoFile, String postedDate, int hits,
			String category, String trainerId, int openrank, int likeState) {
		super();
		this.videoNo = videoNo;
		this.title = title;
		this.content = content;
		this.videoFile = videoFile;
		this.postedDate = postedDate;
		this.hits = hits;
		this.category = category;
		this.trainerId = trainerId;
		this.openrank = openrank;
		this.likeState = likeState;
	}

	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVideoFile() {
		return videoFile;
	}
	public void setVideoFile(String videoFile) {
		this.videoFile = videoFile;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	public int getOpenrank() {
		return openrank;
	}
	public void setOpenrank(int openrank) {
		this.openrank = openrank;
	}
	
	public int getLikeState() {
		return likeState;
	}

	public void setLikeState(int likeState) {
		this.likeState = likeState;
	}

	@Override
	public String toString() {
		return "TrainerVideoVO [videoNo=" + videoNo + ", title=" + title + ", content=" + content + ", videoFile="
				+ videoFile + ", postedDate=" + postedDate + ", hits=" + hits + ", category=" + category
				+ ", trainerId=" + trainerId + ", openrank=" + openrank + ", likeState=" + likeState + "]";
	}
	
	
}
