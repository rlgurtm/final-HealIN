package org.kosta.healthin.model.vo;

public class TipBoardVO implements VO {
	private int no;
	private String title;
	private	String content;
	private	String attachedFile;
	private	int hits;
	private	String postedDate;
	private	String category;
	private	String tipqna;
	private MemberVO memberVO;
	public TipBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TipBoardVO(int no, String title, int hits, String postedDate, String category, MemberVO memberVO) {
		super();
		this.no = no;
		this.title = title;
		this.hits = hits;
		this.postedDate = postedDate;
		this.category = category;
		this.memberVO = memberVO;
	}

	public TipBoardVO(int no, String title, String content, String attachedFile, int hits, String postedDate,
			String category, String tipqna, MemberVO memberVO) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.attachedFile = attachedFile;
		this.hits = hits;
		this.postedDate = postedDate;
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
	public String getattachedFile() {
		return attachedFile;
	}
	public void setattachedFile(String attachedFile) {
		this.attachedFile = attachedFile;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getpostedDate() {
		return postedDate;
	}
	public void setpostedDate(String postedDate) {
		this.postedDate = postedDate;
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
		return "TipBoardVO [no=" + no + ", title=" + title + ", content=" + content + ", attachedFile=" + attachedFile
				+ ", hits=" + hits + ", postedDate=" + postedDate + ", category=" + category + ", tipqna=" + tipqna
				+ ", memberVO=" + memberVO + "]";
	}
}
