package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.VO;

public interface TipDAO {

	List<VO> getTipBoardList(PagingBean pb);

	int getTotalTipCount();

	List<VO> tipBoardCategoryList(Map<String, Object> map);

	int getTotalTipCategoryCount(String category);

	TipBoardVO getTipBoardDetailContent(int no);

	void tipBoardDelete(Map<String, Object> map);

	void tipWrite(TipBoardVO tvo);

	void tipHitsCount(int no);

	int getTotalTipCommentCount(int no);

	List<VO> getTipCommentList(Map<String, Object> map);

	void tipCommentWrite(CommentVO cvo);

	void tipCommentDelete(int no);

	void tipUpdate(TipBoardVO tvo);


}
