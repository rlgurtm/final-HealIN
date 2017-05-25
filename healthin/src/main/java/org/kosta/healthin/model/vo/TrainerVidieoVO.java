package org.kosta.healthin.model.vo;

public class TrainerVidieoVO implements VO {
	private int videoNo;
	private String title;
	private String content;
	private String videoFile;
	private String date;
	private int hits;
	private String category;
	private String trainerId;
	private String openrank;
	public TrainerVidieoVO() {
		super();
	}
	public TrainerVidieoVO(int videoNo, String title, String content, String videoFile, String date, int hits,
			String category, String trainerId, String openrank) {
		super();
		this.videoNo = videoNo;
		this.title = title;
		this.content = content;
		this.videoFile = videoFile;
		this.date = date;
		this.hits = hits;
		this.category = category;
		this.trainerId = trainerId;
		this.openrank = openrank;
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
	public String getOpenrank() {
		return openrank;
	}
	public void setOpenrank(String openrank) {
		this.openrank = openrank;
	}
	@Override
	public String toString() {
		return "TrainerVidieoVO [videoNo=" + videoNo + ", title=" + title + ", content=" + content + ", videoFile="
				+ videoFile + ", date=" + date + ", hits=" + hits + ", category=" + category + ", trainerId="
				+ trainerId + ", openrank=" + openrank + "]";
	}
	
}
