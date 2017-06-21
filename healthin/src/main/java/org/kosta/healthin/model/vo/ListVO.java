package org.kosta.healthin.model.vo;

import java.util.List;

public class ListVO<T> {
	private List<T> LVO;
	private PagingBean pb;
	
	public ListVO() {
		super();
	}
	public ListVO(List<T> lVO, PagingBean pb) {
		super();
		LVO = lVO;
		this.pb = pb;
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

	@Override
	public String toString() {
		return "ListVO [LVO=" + LVO + ", pb=" + pb + "]";
	}
}
