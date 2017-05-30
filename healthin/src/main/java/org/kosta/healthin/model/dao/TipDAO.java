package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.VO;

public interface TipDAO {

	List<VO> getTipBoardList(PagingBean pb);

	int getTotalTipCount();

	List<VO> tipBoardCategoryList(Map<String, Object> map);

	int getTotalTipCategoryCount(String category);

	TipBoardVO getTipBoardDetailContent(int no);


}
