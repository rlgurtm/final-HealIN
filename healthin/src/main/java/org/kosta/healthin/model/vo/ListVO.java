package org.kosta.healthin.model.vo;

import java.util.List;

public class ListVO {
	private List<VO> LVO;
	private PagingBean pb;
	private CalendarBean cb;
	public ListVO() {
		super();
	}
	public ListVO(List<VO> LVO, PagingBean pb, CalendarBean cb) {
		super();
		this.LVO = LVO;
		this.pb = pb;
		this.cb = cb;
	}
	public List<VO> getListVO() {
		return LVO;
	}
	public void setListVO(List<VO> LVO) {
		this.LVO = LVO;
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
		return "ListVO [LVO=" + LVO + ", pb=" + pb + ", cb=" + cb + "]";
	}
	
	
}
