package org.kosta.healthin.model.vo;

import java.util.List;

public class ListVO<T> {
	private List<T> LVO;
	private PagingBean pb;
	private CalendarBean cb;
	public ListVO() {
		super();
	}
	
	public ListVO(List<T> lVO, PagingBean pb) {
		super();
		LVO = lVO;
		this.pb = pb;
	}

	public ListVO(List<T> lVO, PagingBean pb, CalendarBean cb) {
		super();
		LVO = lVO;
		this.pb = pb;
		this.cb = cb;
	}
	public List<T> getLVO() {
		return LVO;
	}
	public void setLVO(List<T> lVO) {
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
