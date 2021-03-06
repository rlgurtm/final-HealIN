package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TipBoardVO;

public interface QnAService {

	ListVO getptQnaList(String nowpage);

	ListVO getptQnaCategoryList(String category, String nowpage);

	void ptQnaHitsCount(String no);

	Object getptQnaDetailContent(String no);

	void ptQnaWrite(TipBoardVO tvo);

	void ptQnaDelete(String no, String id);

	void ptQnaUpdate(TipBoardVO tvo);

	ListVO getPtQnaCommentList(String no, String nowpage);

	void ptQnaCommentWrite(CommentVO cvo);

	void ptQnaCommentDelete(String no);

	String getIsTrainer(String id);

	ListVO getptQnaSearchList(String category, String nowpage);


}
