package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TipBoardVO;

public interface TipService {

	ListVO getTipBoardList(String nowpage);

	ListVO tipBoardCategoryList(String category, String nowpage);

	TipBoardVO getTipBoardDetailContent(String no);

}
