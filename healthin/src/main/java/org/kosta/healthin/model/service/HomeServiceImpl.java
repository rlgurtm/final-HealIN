package org.kosta.healthin.model.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.HomeDAO;
import org.kosta.healthin.model.dao.QnaDAO;
import org.kosta.healthin.model.dao.TipDAO;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Resource
	private HomeDAO homeDAO;		// 인기순으로 강사리스트 및 동영상 출력
	@Resource
	private TipDAO tipDAO;
	@Resource
	private QnaDAO qnaDAO;
	
	@Override
	public HashMap<String, Object> getAllContentsList() {
		HashMap<String, Object> allContentsList = new HashMap<String, Object>();
		/*int totalContents = tipDAO.getTotalTipCount();
		int nowPage = Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);*/
		allContentsList.put("videoList", homeDAO.getVideoListOnMainpage());
//		allContentsList.put("trainerList", homeDAO.trainerInfoListOnMainpage());
//		allContentsList.put("tip", tipDAO.getTipBoardList(pb));
//		allContentsList.put("qna", qnaDAO).
		return allContentsList;
	}
}
