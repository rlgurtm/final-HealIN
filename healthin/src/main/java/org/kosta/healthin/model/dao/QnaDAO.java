package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;

public interface QnaDAO {

	List<TipBoardVO> getPtQnaList(PagingBean pb);

	int getTotalPtQnaCount();
	
	List<TipBoardVO> getptQnaCategoryList(Map<String, Object> map);

	int getTotalPtQnaCategoryCount(String category);

	void tipQnaBoardHitsCount(int no);

	TipBoardVO getptQnaDetailContent(int no);

	void ptQnaWrite(TipBoardVO tvo);

	void tipQnaBoardDelete(Map<String, Object> map);

	void tipQnaBoardUpdate(TipBoardVO tvo);

	int getTotalTipQnaCommentCount(int no);

	List<CommentVO> getTipQnaCommentList(Map<String, Object> map);

	void tipQnaCommentWrite(CommentVO cvo);

	void tipQnaCommentDelete(int no);

	String getIsTrainer(String id);

	List<TipBoardVO> getptQnaSearchList(Map<String, Object> map);

}
