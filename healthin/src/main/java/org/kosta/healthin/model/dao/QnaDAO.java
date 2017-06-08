package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.VO;

public interface QnaDAO {

	List<VO> getPtQnaList(PagingBean pb);

	int getTotalPtQnaCount();
	
	List<VO> getptQnaCategoryList(Map<String, Object> map);

	int getTotalPtQnaCategoryCount(String category);

	void tipQnaBoardHitsCount(int no);

	TipBoardVO getptQnaDetailContent(int no);

	void ptQnaWrite(TipBoardVO tvo);

	void tipQnaBoardDelete(Map<String, Object> map);

	void tipQnaBoardUpdate(TipBoardVO tvo);

	int getTotalTipQnaCommentCount(int no);

	List<VO> getTipQnaCommentList(Map<String, Object> map);

	void tipQnaCommentWrite(CommentVO cvo);

	void tipQnaCommentDelete(int no);

	String getIsTrainer(String id);

	List<VO> getptQnaSearchList(Map<String, Object> map);

}
