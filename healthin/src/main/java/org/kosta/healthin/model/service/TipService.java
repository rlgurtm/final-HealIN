package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TipBoardVO;

public interface TipService {

	ListVO getTipBoardList(String nowpage);

	ListVO tipBoardCategoryList(String category, String nowpage);

	TipBoardVO getTipBoardDetailContent(String no);

	void tipBoardDelete(String no, String id);

	void tipWrite(TipBoardVO tvo);

	void tipHitsCount(String no);

	ListVO getTipCommentList(String no, String nowpage);

	void tipCommentWrite(CommentVO cvo);

	void tipCommentDelete(String no);

}
