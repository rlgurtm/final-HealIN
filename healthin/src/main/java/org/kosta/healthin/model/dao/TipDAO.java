package org.kosta.healthin.model.dao;

import java.util.List;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.VO;

public interface TipDAO {

	List<VO> getTipBoardList(PagingBean pb);

	int getTotalTipCount();


}
