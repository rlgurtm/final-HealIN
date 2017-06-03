package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.VO;

public interface QnaDAO {

	List<VO> getPtQnaList(PagingBean pb);

	List<VO> getptQnaCategoryList(Map<String, Object> map);

	int getTotalPtQnaCount();

	int getTotalPtQnaCategoryCount(String category);

	void ptQnaHitsCount(int nO);

	Object getptQnaDetailContent(int nO);

	void ptQnaWrite(TipBoardVO tvo);

	void ptQnaDelete(Map<String, Object> map);

	void ptQnaUpdate(TipBoardVO tvo);

}
