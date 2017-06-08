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

	List<VO> getTipBoardCategoryList(Map<String, Object> map);
	List<VO> getSearchtipAllList(Map<String, Object> map);

	int getTotalTipCategoryCount(String category);

	void tipQnaBoardHitsCount(int no);

	TipBoardVO getTipBoardDetailContent(int no);

	void tipQnaBoardDelete(Map<String, Object> map);

	void tipWrite(TipBoardVO tvo);

	List<VO> getTipQnaCommentList(Map<String, Object> map);
	
	int getTotalTipQnaCommentCount(int no);

	void tipQnaCommentWrite(CommentVO cvo);

	void tipQnaCommentDelete(int no);

	void tipQnaBoardUpdate(TipBoardVO tvo);

	int getTotalTipCategorySearchCount(String searchWord);

}
