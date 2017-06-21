package org.kosta.healthin.model.vo;

public class TrainerVideoCommentVO{
	private int videoCommentNo;
	private int videoNo;
	private String videoComment;
	private String videoCommentDate;
	private String videoCommentId;
	public TrainerVideoCommentVO() {
		super();
	}
	public TrainerVideoCommentVO(int videoCommentNo, int videoNo, String videoComment, String videoCommentDate,
			String videoCommentId) {
		super();
		this.videoCommentNo = videoCommentNo;
		this.videoNo = videoNo;
		this.videoComment = videoComment;
		this.videoCommentDate = videoCommentDate;
		this.videoCommentId = videoCommentId;
	}
	public int getVideoCommentNo() {
		return videoCommentNo;
	}
	public void setVideoCommentNo(int videoCommentNo) {
		this.videoCommentNo = videoCommentNo;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	public String getVideoComment() {
		return videoComment;
	}
	public void setVideoComment(String videoComment) {
		this.videoComment = videoComment;
	}
	public String getVideoCommentDate() {
		return videoCommentDate;
	}
	public void setVideoCommentDate(String videoCommentDate) {
		this.videoCommentDate = videoCommentDate;
	}
	public String getVideoCommentId() {
		return videoCommentId;
	}
	public void setVideoCommentId(String videoCommentId) {
		this.videoCommentId = videoCommentId;
	}
	@Override
	public String toString() {
		return "TrainerVideoCommentVO [videoCommentNo=" + videoCommentNo + ", videoNo=" + videoNo + ", videoComment="
				+ videoComment + ", videoCommentDate=" + videoCommentDate + ", videoCommentId=" + videoCommentId + "]";
	}
	
}
