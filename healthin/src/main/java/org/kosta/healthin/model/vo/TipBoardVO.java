package org.kosta.healthin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class TipBoardVO implements VO {
	private int no;
	private String title;
	private	String content;
	private	MultipartFile attached_file;
	private	int hits;
	private	String posted_date;
	private	String category;
	private	String id;
	private	String tipqna;
	public TipBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TipBoardVO(int no, String title, String content, MultipartFile attached_file, int hits, String posted_date,
			String category, String id, String tipqna) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.attached_file = attached_file;
		this.hits = hits;
		this.posted_date = posted_date;
		this.category = category;
		this.id = id;
		this.tipqna = tipqna;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public MultipartFile getAttached_file() {
		return attached_file;
	}
	public void setAttached_file(MultipartFile attached_file) {
		this.attached_file = attached_file;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getPosted_date() {
		return posted_date;
	}
	public void setPosted_date(String posted_date) {
		this.posted_date = posted_date;
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
		return "TipBoardVO [no=" + no + ", title=" + title + ", content=" + content + ", attached_file=" + attached_file
				+ ", hits=" + hits + ", posted_date=" + posted_date + ", category=" + category + ", id=" + id
				+ ", tipqna=" + tipqna + "]";
	}
	
	
	

}
