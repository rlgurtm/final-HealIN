package org.kosta.healthin.model.vo;

import java.util.List;

public class ListVO {
	private List<VO> LVO;
	private PagingBean pb;
	private CalendarBean cb;
	public ListVO() {
		super();
	}
	public ListVO(List<VO> lVO, PagingBean pb, CalendarBean cb) {
		super();
		LVO = lVO;
		this.pb = pb;
		this.cb = cb;
	}
	public List<VO> getLVO() {
		return LVO;
	}
	public void setLVO(List<VO> lVO) {
		LVO = lVO;
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
