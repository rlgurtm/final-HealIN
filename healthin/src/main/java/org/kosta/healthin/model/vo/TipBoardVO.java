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
	private	String tipqna;
	private MemberVO memberVO;
	public TipBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TipBoardVO(int no, String title, int hits, String posted_date, String category, MemberVO memberVO) {
		super();
		this.no = no;
		this.title = title;
		this.hits = hits;
		this.posted_date = posted_date;
		this.category = category;
		this.memberVO = memberVO;
	}

	public TipBoardVO(int no, String title, String content, MultipartFile attached_file, int hits, String posted_date,
			String category, String tipqna, MemberVO memberVO) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.attached_file = attached_file;
		this.hits = hits;
		this.posted_date = posted_date;
		this.category = category;
		this.tipqna = tipqna;
		this.memberVO = memberVO;
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
	public String getTipqna() {
		return tipqna;
	}
	public void setTipqna(String tipqna) {
		this.tipqna = tipqna;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "TipBoardVO [no=" + no + ", title=" + title + ", content=" + content + ", attached_file=" + attached_file
				+ ", hits=" + hits + ", posted_date=" + posted_date + ", category=" + category + ", tipqna=" + tipqna
				+ ", memberVO=" + memberVO + "]";
	}
	
	
	

}
