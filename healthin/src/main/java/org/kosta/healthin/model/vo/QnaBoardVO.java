package org.kosta.healthin.model.vo;

public class QnaBoardVO implements VO {
	private int	boardNo;
	private String title;
	private String content;
	private String attachedFile;
	private int hits;
	private String date;
	private String category;
	private String id;
	private String tipqna;
	public QnaBoardVO() {
		super();
	}
	public QnaBoardVO(int boardNo, String title, String content, String attachedFile, int hits, String date,
			String category, String id, String tipqna) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.attachedFile = attachedFile;
		this.hits = hits;
		this.date = date;
		this.category = category;
		this.id = id;
		this.tipqna = tipqna;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getAttachedFile() {
		return attachedFile;
	}
	public void setAttachedFile(String attachedFile) {
		this.attachedFile = attachedFile;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTipqna() {
		return tipqna;
	}
	public void setTipqna(String tipqna) {
		this.tipqna = tipqna;
	}
	@Override
	public String toString() {
		return "QnaBoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", attachedFile="
				+ attachedFile + ", hits=" + hits + ", date=" + date + ", category=" + category + ", id=" + id
				+ ", tipqna=" + tipqna + "]";
	}
	
}
