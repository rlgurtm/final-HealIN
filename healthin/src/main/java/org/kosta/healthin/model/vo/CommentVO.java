package org.kosta.healthin.model.vo;

public class CommentVO{
	private int commentNo;
	private int boardNo;
	private String comment;
	private String date;
	private String id;
	public CommentVO() {
		super();
	}
	public CommentVO(int commentNo, int boardNo, String comment, String date, String id) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.comment = comment;
		this.date = date;
		this.id = id;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", boardNo=" + boardNo + ", comment=" + comment + ", date=" + date
				+ ", id=" + id + "]";
	}
	
}
