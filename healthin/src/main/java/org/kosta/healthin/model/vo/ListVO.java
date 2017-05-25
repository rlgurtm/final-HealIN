package org.kosta.healthin.model.vo;

public class ListVO {
	private VO vo;
	private PagingBean pb;
	private CalendarBean cb;
	public ListVO() {
		super();
	}
	public ListVO(VO vo, PagingBean pb, CalendarBean cb) {
		super();
		this.vo = vo;
		this.pb = pb;
		this.cb = cb;
	}
	public VO getVo() {
		return vo;
	}
	public void setVo(VO vo) {
		this.vo = vo;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}
	public CalendarBean getCb() {
		return cb;
	}
	public void setCb(CalendarBean cb) {
		this.cb = cb;
	}
	@Override
	public String toString() {
		return "ListVO [vo=" + vo + ", pb=" + pb + ", cb=" + cb + "]";
	}
	
}
